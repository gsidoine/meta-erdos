#!/usr/bin/env python3
"""Exact rational verification of P040's fractional 3-prime certificate.

The variational purification theorem and its proof are in the corresponding
theorem note; a finite computation does not replace that proof.
"""
from fractions import Fraction


PRIMES = (3, 5, 7)
F = (
    Fraction(0), Fraction(23, 24), Fraction(1), Fraction(5, 12),
    Fraction(1), Fraction(1), Fraction(1), Fraction(1),
)
EXPECTED = {
    1: Fraction(11, 35),
    2: Fraction(5, 12),
    3: Fraction(1, 7),
    4: Fraction(5, 12),
    5: Fraction(1, 5),
    6: Fraction(23, 72),
    7: Fraction(0),
}


def weights():
    out = []
    for mask in range(1 << len(PRIMES)):
        weight = Fraction(1)
        for i, p in enumerate(PRIMES):
            weight *= Fraction(1, p) if (mask & (1 << i)) else Fraction(p - 1, p)
        out.append(weight)
    assert sum(out) == 1
    return out


def mass(f, w):
    return sum((f[s] * w[s] for s in range(len(f))), Fraction(0))


def conditional(f, w, s):
    den = sum((w[t] for t in range(len(f)) if not (t & s)), Fraction(0))
    num = sum((w[t] * f[t] for t in range(len(f)) if not (t & s)), Fraction(0))
    return num / den


def verify():
    w = weights()
    assert mass(F, w) == Fraction(1, 2)
    values = {s: conditional(F, w, s) for s in range(8) if F[s] > 0}
    assert values == EXPECTED, (values, EXPECTED)
    assert max(values.values()) == Fraction(5, 12)
    # Structural optimality within symmetric fractional profiles for {3,5,7}.
    assert 1 - w[0] == Fraction(19, 35)
    assert w[4] == Fraction(8, 105)   # exact support {7}
    assert 1 - w[0] - w[4] == Fraction(7, 15) < Fraction(1, 2)
    assert sum(w[t] for t in range(8) if t & 4) == Fraction(1, 7)
    assert conditional(F, w, 4) == Fraction(5, 12)

    delta = Fraction(1, 1000)
    perturbed = list(F)
    perturbed[1] += delta
    assert 0 < perturbed[1] < 1
    assert mass(perturbed, w) == Fraction(1, 2) + Fraction(8, 35) * delta
    assert max(conditional(perturbed, w, s) for s in values) <= Fraction(5, 12) + delta
    print("P040 fractional sieve: mass=1/2, max conditional cost=5/12.")
    print("Strict Hall mass after perturbation:", mass(perturbed, w))
    print("All rational certificates passed.")


if __name__ == "__main__":
    verify()
