#!/usr/bin/env python3
"""Exact exhaustive support-family certificate for P040 on {3,5,7,11}.

This is finite, deterministic integer arithmetic constituting the enumerated
part of the accompanying computer-assisted mathematical proof. No third-party
dependencies, optimization solver, or floating-point tolerances are used.
"""
from fractions import Fraction


PRIMES = (3, 5, 7, 11)
WEIGHTS = (480, 240, 120, 60, 80, 40, 20, 10,
           48, 24, 12, 6, 8, 4, 2, 1)
DEN = 1155
T_NUM, T_DEN = 5, 12
ALL_MASKS = range(16)
EXPECTED_EXCEPTIONS = [
    (65262, 65278, Fraction(1163, 1155)),
    (65262, 65534, Fraction(331, 330)),
    (65278, 65262, Fraction(1163, 1155)),
    (65534, 65262, Fraction(331, 330)),
]


def weight_check():
    assert sum(WEIGHTS) == DEN
    for mask in ALL_MASKS:
        numerator = DEN
        denominator = 1
        for i, p in enumerate(PRIMES):
            numerator *= 1 if (mask & (1 << i)) else p - 1
            denominator *= p
        assert Fraction(WEIGHTS[mask], DEN) == Fraction(numerator, denominator)


def is_upset(bits):
    for s in ALL_MASKS:
        if not (bits & (1 << s)):
            continue
        for i in range(4):
            if not (s & (1 << i)) and not (bits & (1 << (s | (1 << i)))):
                return False
    return True


def nonempty_upsets():
    return [bits for bits in range(1, 1 << 16) if is_upset(bits)]


def support_bounds(bits):
    """Mass upper bounds on a profile supported on a prescribed upset.

    Return (12 * DEN * mu(A), 12 * DEN * min_{S in A} u(S)).
    With t=5/12, u(S)=1-7/12 * Pr(T disjoint S).
    """
    support = [s for s in ALL_MASKS if bits & (1 << s)]
    m12 = 12 * sum(WEIGHTS[s] for s in support)
    u12 = min(
        12 * DEN - 7 * sum(WEIGHTS[t] for t in ALL_MASKS if (s & t) == 0)
        for s in support
    )
    return m12, u12


def enumerate_exceptions():
    families = nonempty_upsets()
    assert len(families) == 167
    bounds = {bits: support_bounds(bits) for bits in families}
    exceptions = []
    for A in families:
        am, au = bounds[A]
        for B in families:
            bm, bu = bounds[B]
            numerator = min(am, bu) + min(bm, au)
            if numerator > 12 * DEN:
                exceptions.append((A, B, Fraction(numerator, 12 * DEN)))
    assert exceptions == EXPECTED_EXCEPTIONS, exceptions
    assert len(families) ** 2 == 27889
    return exceptions


def exceptional_case_closure():
    A, B1, B2 = 65262, 65278, 65534
    assert all(is_upset(x) for x in (A, B1, B2))
    assert A & (1 << 2)  # support {5} in A
    assert B1 & (1 << 4) and B2 & (1 << 4)  # support {7} in B

    mu_A = sum((Fraction(WEIGHTS[s], DEN) for s in ALL_MASKS if A & (1 << s)),
               Fraction(0))
    assert mu_A == Fraction(547, 1155)

    conditional_numerator = sum(
        WEIGHTS[s] for s in ALL_MASKS if A & (1 << s) and not (s & 4)
    )
    conditional_denominator = sum(
        WEIGHTS[s] for s in ALL_MASKS if not (s & 4)
    )
    assert Fraction(conditional_denominator, DEN) == Fraction(6, 7)
    assert Fraction(conditional_numerator, conditional_denominator) == Fraction(7, 15)

    lost_mass = Fraction(conditional_denominator, DEN) * (
        Fraction(7, 15) - Fraction(5, 12)
    )
    assert lost_mass == Fraction(3, 70)
    u_five = 1 - Fraction(7, 12) * Fraction(4, 5)
    assert u_five == Fraction(8, 15)

    final_bound = mu_A - lost_mass + u_five
    assert final_bound == Fraction(2227, 2310) < 1
    return final_bound


def verify():
    weight_check()
    exceptions = enumerate_exceptions()
    bound = exceptional_case_closure()
    print("PASS: 16 exact product-measure weights")
    print("PASS: 168 upward-closed families (including empty)")
    print("PASS: all 27,889 pairs of nonempty upward-closed families")
    for A, B, cap in exceptions:
        print(f"  exceptional family masks ({A}, {B}): upper bound {cap}")
    print(f"PASS: conditional constraints exclude all four exceptions ({bound} < 1)")
    print("Four-prime fractional Hall-cut infimum equals 5/12 by exact certificate.")


if __name__ == "__main__":
    verify()
