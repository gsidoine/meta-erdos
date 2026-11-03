#!/usr/bin/env python3
"""Exact finite corroboration of P040 asymmetric and compression theorems.

Theorems and universal quantification are proved in the accompanying note,
not by the finite tests in this file. No third-party dependencies.
"""
from fractions import Fraction
from random import Random


PRIMES = (3, 5, 7)
WEIGHTS_105 = (48, 24, 12, 6, 8, 4, 2, 1)


def exact_weights(primes):
    result = []
    for mask in range(1 << len(primes)):
        weight = Fraction(1)
        for j, p in enumerate(primes):
            weight *= Fraction(1, p) if mask & (1 << j) else Fraction(p - 1, p)
        result.append(weight)
    return result


def mass(h, weights):
    return sum((h[i] * weights[i] for i in range(len(h))), Fraction(0))


def conditional(h, weights, mask):
    numerator = sum(
        (weights[i] * h[i] for i in range(len(h)) if (i & mask) == 0),
        Fraction(0),
    )
    denominator = sum(
        (weights[i] for i in range(len(h)) if (i & mask) == 0),
        Fraction(0),
    )
    return numerator / denominator


def cost(f, g, weights):
    values = [
        conditional(g, weights, i)
        for i in range(len(f)) if f[i] > 0
    ] + [
        conditional(f, weights, i)
        for i in range(len(g)) if g[i] > 0
    ]
    return max(values) if values else Fraction(0)


def compress_coordinate(h, primes, coordinate):
    p = primes[coordinate]
    q = Fraction(1, p)
    output = list(h)
    for i in range(len(h)):
        if i & (1 << coordinate):
            continue
        j = i | (1 << coordinate)
        average = (1 - q) * h[i] + q * h[j]
        output[j] = min(Fraction(1), average / q)
        output[i] = (average - q * output[j]) / (1 - q)
        assert 0 <= output[i] <= output[j] <= 1
    return output


def check_three_prime_weights():
    assert exact_weights(PRIMES) == [Fraction(n, 105) for n in WEIGHTS_105]
    w = exact_weights(PRIMES)
    assert 1 - w[0] == Fraction(19, 35)
    assert 1 - w[0] - w[4] == Fraction(7, 15)
    assert 1 - w[0] - w[4] - w[2] == Fraction(37, 105)
    assert sum(w[i] for i in (3, 5, 6, 7)) == Fraction(13, 105)
    t = Fraction(5, 12)
    upper = lambda mask: 1 - (1 - t) * sum(
        w[j] for j in range(8) if (j & mask) == 0
    )
    assert [upper(j) for j in (0, 1, 2, 4, 7)] == [
        Fraction(5, 12), Fraction(11, 18), Fraction(8, 15),
        Fraction(1, 2), Fraction(11, 15),
    ]


def check_integer_profile_pairs():
    # This checks all 2^8 x 2^8 pairs of *indicator* profiles.
    # Fractional profiles are covered by the mathematical proof.
    w = WEIGHTS_105
    nprofiles = 1 << 8
    masses = [sum(w[i] for i in range(8) if (h >> i) & 1)
              for h in range(nprofiles)]
    denominators = [sum(w[j] for j in range(8) if (i & j) == 0)
                    for i in range(8)]
    bad = []
    for h in range(nprofiles):
        profile_bad = 0
        for support in range(8):
            numerator = sum(
                w[j] for j in range(8)
                if ((h >> j) & 1) and (support & j) == 0
            )
            if 12 * numerator > 5 * denominators[support]:
                profile_bad |= 1 << support
        bad.append(profile_bad)

    checked = 0
    for f in range(nprofiles):
        for g in range(nprofiles):
            if masses[f] + masses[g] <= 105:
                continue
            checked += 1
            assert f & bad[g] or g & bad[f], (f, g)
    assert checked == 32434
    return checked


def check_compression():
    rng = Random(20261103)
    primes = (3, 5, 7, 11)
    w = exact_weights(primes)
    for _ in range(128):
        f = [Fraction(rng.randrange(9), 8) for _ in w]
        g = [Fraction(rng.randrange(9), 8) for _ in w]
        original_masses = (mass(f, w), mass(g, w))
        previous_cost = cost(f, g, w)
        for coordinate in range(len(primes)):
            f_new = compress_coordinate(f, primes, coordinate)
            g_new = compress_coordinate(g, primes, coordinate)
            assert (mass(f_new, w), mass(g_new, w)) == original_masses
            new_cost = cost(f_new, g_new, w)
            assert new_cost <= previous_cost
            f, g, previous_cost = f_new, g_new, new_cost

        for i in range(len(w)):
            for bit in range(len(primes)):
                if not (i & (1 << bit)):
                    j = i | (1 << bit)
                    assert f[i] <= f[j] and g[i] <= g[j]


def main():
    check_three_prime_weights()
    count = check_integer_profile_pairs()
    check_compression()
    print("PASS: three-prime rational mass and conditional inequalities")
    print(f"PASS: {count} qualifying pairs of integral profiles checked exactly")
    print("PASS: 128 seeded rational profile pairs monotonized, mass and cost verified")


if __name__ == "__main__":
    main()
