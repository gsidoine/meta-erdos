#!/usr/bin/env python3
"""Exact finite corroboration of the two-prime sieve classification.

The infinite/fractional-profile statements require the mathematical proof
in the accompanying theorem, not the finite binary-profile enumeration.
"""
from fractions import Fraction
from itertools import product


def weights(primes):
    return [
        __import__("math").prod(
            Fraction(1, p) if mask & (1 << j) else Fraction(p - 1, p)
            for j, p in enumerate(primes)
        )
        for mask in range(1 << len(primes))
    ]


def mass(profile, ws):
    return sum((profile[i] * ws[i] for i in range(len(ws))), Fraction(0))


def conditional(profile, ws, mask):
    den = sum((ws[i] for i in range(len(ws)) if not (i & mask)), Fraction(0))
    num = sum(
        (ws[i] * profile[i] for i in range(len(ws)) if not (i & mask)),
        Fraction(0),
    )
    return num / den


def cost(f, g, ws):
    costs = [
        conditional(g, ws, mask)
        for mask in range(len(ws)) if f[mask] > 0
    ] + [
        conditional(f, ws, mask)
        for mask in range(len(ws)) if g[mask] > 0
    ]
    return max(costs) if costs else Fraction(0)


def check_fractional_exception():
    ws = weights((3, 5))
    assert ws == [Fraction(8, 15), Fraction(4, 15),
                  Fraction(2, 15), Fraction(1, 15)]
    f = [Fraction(0), Fraction(1), Fraction(5, 6), Fraction(1)]
    g = [Fraction(1, 6), Fraction(1), Fraction(1), Fraction(1)]
    assert mass(f, ws) == Fraction(4, 9)
    assert mass(g, ws) == Fraction(5, 9)
    assert cost(f, g, ws) == Fraction(4, 9)
    delta = Fraction(1, 1000)
    g[0] += delta
    assert mass(f, ws) + mass(g, ws) == 1 + Fraction(8, 15) * delta
    assert cost(f, g, ws) <= Fraction(4, 9) + delta


def check_all_binary_profiles(primes, threshold):
    ws = weights(primes)
    n = len(ws)
    profiles = list(product((Fraction(0), Fraction(1)), repeat=n))
    total = 0
    for f in profiles:
        for g in profiles:
            if mass(f, ws) + mass(g, ws) <= 1:
                continue
            assert cost(f, g, ws) > threshold, (primes, f, g)
            total += 1
    return total


def check_constant_approximation(primes):
    ws = weights(primes)
    h = [Fraction(501, 1000)] * len(ws)
    assert mass(h, ws) + mass(h, ws) > 1
    assert cost(h, h, ws) == Fraction(501, 1000)


def verify():
    check_fractional_exception()
    cases = [
        ((3,), Fraction(1, 2)),
        ((5,), Fraction(1, 2)),
        ((3, 5), Fraction(4, 9)),
        ((3, 7), Fraction(1, 2)),
        ((3, 11), Fraction(1, 2)),
        ((5, 7), Fraction(1, 2)),
        ((7, 11), Fraction(1, 2)),
    ]
    for primes, threshold in cases:
        total = check_all_binary_profiles(primes, threshold)
        check_constant_approximation(primes)
        print(f"P={primes}: {total} admissible indicator pairs passed")
    print("PASS: exceptional rational fractional witness and perturbation")


if __name__ == "__main__":
    verify()
