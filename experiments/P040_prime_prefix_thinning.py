#!/usr/bin/env python3
"""Exact rational checks of the P040 thinning-transport identities.

Finite checks do not replace the universal argument in the theorem note.
No external dependencies.
"""
from fractions import Fraction
from itertools import product


def weights(q):
    return [__import__("math").prod(
        q[j] if mask & (1 << j) else (1 - q[j])
        for j in range(len(q))
    ) for mask in range(1 << len(q))]


def mass(f, q):
    return sum((f[s] * w for s, w in enumerate(weights(q))), Fraction(0))


def conditional(f, q, A):
    w = weights(q)
    den = sum((w[s] for s in range(len(w)) if not (s & A)), Fraction(0))
    num = sum((f[s] * w[s] for s in range(len(w)) if not (s & A)), Fraction(0))
    return num / den


def cost(f, g, q):
    n = len(f)
    return max(
        [conditional(g, q, s) for s in range(n) if f[s] > 0]
        + [conditional(f, q, s) for s in range(n) if g[s] > 0]
    )


def transport(f, q, qprime):
    """Push a profile forward under independent coordinate thinning."""
    assert len(q) == len(qprime)
    assert all(0 < a <= b < 1 for a, b in zip(q, qprime))
    n = len(q)
    ratio = [a / b for a, b in zip(q, qprime)]
    out = []
    for S in range(1 << n):
        expectation = Fraction(0)
        for T in range(1 << n):
            if T & ~S:
                continue
            chance = Fraction(1)
            for j in range(n):
                if S & (1 << j):
                    chance *= ratio[j] if T & (1 << j) else 1-ratio[j]
            expectation += chance * f[T]
        out.append(expectation)
    return out


def is_increasing(f):
    for S in range(len(f)):
        for j in range(len(f).bit_length()-1):
            if not S & (1 << j) and f[S] > f[S | (1 << j)]:
                return False
    return True


def check_thinning_identities():
    small = (Fraction(1, 5), Fraction(1, 7), Fraction(1, 11))
    large = (Fraction(1, 3), Fraction(1, 5), Fraction(1, 7))
    assert all(a <= b for a, b in zip(small, large))
    # Arbitrary nonconstant increasing rational profiles with admissible total mass.
    f = [Fraction(2, 5) + Fraction(S.bit_count(), 9) for S in range(8)]
    g = [Fraction(3, 5) + Fraction(S.bit_count(), 12) for S in range(8)]
    assert is_increasing(f) and is_increasing(g)
    assert all(0 <= x <= 1 for x in f + g)
    assert mass(f, small) + mass(g, small) > 1
    ff = transport(f, small, large)
    gg = transport(g, small, large)
    assert is_increasing(ff) and is_increasing(gg)
    assert mass(ff, large) == mass(f, small)
    assert mass(gg, large) == mass(g, small)
    assert [x > 0 for x in ff] == [x > 0 for x in f]
    assert [x > 0 for x in gg] == [x > 0 for x in g]
    for S in range(8):
        assert conditional(ff, large, S) == conditional(f, small, S)
        assert conditional(gg, large, S) == conditional(g, small, S)
    assert cost(ff, gg, large) == cost(f, g, small)

    # A nonempty monotone support, where positive support preservation is nontrivial.
    h = [Fraction(1) if S & 2 else Fraction(0) for S in range(8)]
    hh = transport(h, small, large)
    assert is_increasing(hh)
    assert [x > 0 for x in hh] == [x > 0 for x in h]
    for S in range(8):
        assert conditional(hh, large, S) == conditional(h, small, S)


def check_random_monotone_profiles():
    from random import Random
    rng = Random(27040)
    pairs = [
        ((Fraction(1, 7), Fraction(1, 11)),
         (Fraction(1, 3), Fraction(1, 5))),
        ((Fraction(1, 11), Fraction(1, 13), Fraction(1, 17)),
         (Fraction(1, 3), Fraction(1, 5), Fraction(1, 7))),
    ]
    for small, large in pairs:
        n = len(small)
        for _ in range(120):
            base = [Fraction(rng.randrange(11), 10) for _ in range(1 << n)]
            f = [max(base[T] for T in range(1 << n) if T & ~S == 0)
                 for S in range(1 << n)]
            assert is_increasing(f)
            ff = transport(f, small, large)
            assert mass(ff, large) == mass(f, small)
            assert [x > 0 for x in ff] == [x > 0 for x in f]
            for S in range(1 << n):
                assert conditional(ff, large, S) == conditional(f, small, S)


def verify():
    check_thinning_identities()
    check_random_monotone_profiles()
    print("PASS: exact rational mass, support and conditional-cost transport")
    print("PASS: random monotone profiles, including first-prime dominance")


if __name__ == "__main__":
    verify()
