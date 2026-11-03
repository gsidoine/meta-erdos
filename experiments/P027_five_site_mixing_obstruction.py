#!/usr/bin/env python3
"""P027 exact 5-site gadget / spectral Rayleigh certificate, stdlib only.

All global mathematical assertions appear in the accompanying proof note.
This program checks exact states, exact fractions, and finite samples of
arithmetic isolation; finite samples are not a proof for all n.
"""
from collections import defaultdict
from fractions import Fraction
from itertools import product
from math import gcd, isqrt


GADGET_MULTIPLIERS = (1, 3, 5, 9, 27)
GADGET_LIMITS = ((3, 5), (2, 4), (2, 3), (1, 2), (0, 1))
GADGET_EDGES = {(0, 1), (0, 2), (1, 3), (3, 4)}
WITNESS = (-8, -5, -4, -2, 1, 3, -2, 1, 3,
           -4, -3, -1, 2, 4, -1, 2, 4, -1, 2, 4, -1, 2, 4)
WITNESS_SHARP = (-102, -65, -53, -25, 17, 45, -21, 19, 45,
                 -56, -44, -16, 21, 47, -13, 22, 48, -11, 25, 50, -9, 26, 50)


def cap(N, u, base):
    value = 0
    while base * u <= N:
        value += 1
        u *= base
    return value


def states():
    ranges = [range(a, b + 1) for a, b in GADGET_LIMITS]
    return [tuple(x) for x in product(*ranges)
            if all(x[a] > x[b] for a, b in GADGET_EDGES)]


def exact_rayleigh(witness=WITNESS):
    """Compute exact uniform variance and heat-bath Dirichlet energy."""
    space = states()
    assert len(space) == 23
    assert len(witness) == len(space)
    position = {state: j for j, state in enumerate(space)}
    mean = Fraction(sum(witness), 23)
    variance = sum((Fraction(y) - mean) ** 2 for y in witness) / 23
    energy = Fraction(0)
    for i, state in enumerate(space):
        for coordinate in range(5):
            matches = [position[t] for t in space
                       if all(t[k] == state[k] for k in range(5)
                              if k != coordinate)]
            for j in matches:
                energy += Fraction((witness[i] - witness[j]) ** 2,
                                   2 * 23 * len(matches))
    ratio = energy / variance
    if witness == WITNESS:
        assert energy == Fraction(202, 69)
        assert variance == Fraction(242, 23)
        assert ratio == Fraction(101, 363)
    elif witness == WITNESS_SHARP:
        assert sum(witness) == 0
        assert variance == Fraction(40642, 23)
        assert energy == Fraction(66083, 138)
        assert ratio == Fraction(66083, 243852)
    return ratio

def five_roots(N):
    return [u for u in range(1, N + 1, 2)
            if 54 * u <= N < 56 * u and gcd(u, 30030) == 1 and u > 1]


def three_roots(N):
    return [u for u in range(1, N + 1, 2)
            if 6 * u <= N < 8 * u and gcd(u, 6) == 1]


def active_incident_edges(N, vertices):
    """Discover all potentially non-automatic divisibility constraints."""
    chosen = set(vertices)
    relevant = set()
    external = []
    for a in vertices:
        pairs = set()
        # Strict odd divisors of a.
        for d in range(1, isqrt(a) + 1, 2):
            if a % d:
                continue
            pairs.add(d)
            pairs.add(a // d)
        for d in pairs:
            if d >= a or d % 2 == 0:
                continue
            if cap(N, d, 3) <= cap(N, a, 2):
                edge = (d, a)
                if d in chosen:
                    relevant.add(edge)
                else:
                    external.append(edge)
        for b in range(3 * a, N + 1, 2 * a):
            if cap(N, a, 3) <= cap(N, b, 2):
                if b in chosen:
                    relevant.add((a, b))
                else:
                    external.append((a, b))
    return relevant, external


def check_five_isolation(N):
    roots = five_roots(N)
    seen = set()
    for u in roots:
        verts = tuple(u * x for x in GADGET_MULTIPLIERS)
        assert set(verts).isdisjoint(seen)
        seen.update(verts)
        levels = tuple((cap(N, v, 3), cap(N, v, 2)) for v in verts)
        assert levels == GADGET_LIMITS, (N, u, levels)
        actual, external = active_incident_edges(N, verts)
        expected = {(verts[i], verts[j]) for i, j in GADGET_EDGES}
        assert actual == expected, (N, u, actual, expected)
        assert not external, (N, u, external)
    return len(roots), seen


def check_three_isolation(N, forbidden):
    roots = three_roots(N)
    seen = set(forbidden)
    for u in roots:
        verts = (u, 3 * u)
        assert set(verts).isdisjoint(seen), (N, u, verts)
        seen.update(verts)
        levels = tuple((cap(N, v, 3), cap(N, v, 2)) for v in verts)
        assert levels == ((1, 2), (0, 1)), (N, u, levels)
        actual, external = active_incident_edges(N, verts)
        assert actual == {(u, 3*u)}, (N, u, actual)
        assert not external, (N, u, external)
    return len(roots)


def main():
    ratio = exact_rayleigh()
    print("Exact five-site state count: 23")
    print(f"Exact Rayleigh certificate: {ratio}; mixing coefficient >= {1/(2*ratio)}")
    assert Fraction(1, 2*ratio) == Fraction(363, 202)
    improved = exact_rayleigh(WITNESS_SHARP)
    print(f"Improved exact Rayleigh bound: {improved}; "
          f"mixing coefficient >= {1/(2*improved)}")
    assert improved < ratio
    assert Fraction(1, 2*improved) == Fraction(121926, 66083)

    # Periodicity gives the limiting density exactly, independently of this
    # finite sample. The samples test classification and non-interaction.
    assert Fraction(2, 1) * (Fraction(1, 54)-Fraction(1, 56)) \
        * Fraction(192, 1001) == Fraction(16, 63063)
    assert Fraction(2, 1) * (Fraction(1, 6)-Fraction(1, 8)) \
        * Fraction(1, 3) == Fraction(1, 36)
    for N in (2000, 6000, 20000, 60000):
        five, selected = check_five_isolation(N)
        three = check_three_isolation(N, selected)
        print(f"N={N}: {five} independent 23-state motifs, "
              f"{three} independent 3-state pairs")
    print("PASS: exact spectrum witness, finite isolation, densities and disjointness")


if __name__ == "__main__":
    main()
