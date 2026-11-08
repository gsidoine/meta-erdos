#!/usr/bin/env python3
"""Finite tests of the additive-energy sum-and-difference matching inequality.

Verifies 3*E(A)*matching(A) >= 4*choose(len(A),2)^2.
No asymptotic estimate or inference about all integer sets is obtained
from this finite computation.
"""
from collections import Counter
from itertools import combinations


def energy(A):
    r = Counter(a + b for a in A for b in A)
    return sum(v * v for v in r.values())


def matching(A):
    pairs = list(combinations(sorted(A), 2))
    adj = {}
    for a, b in pairs:
        adj.setdefault(a + b, []).append(b - a)
    seen_right = {}

    def augment(s, visited):
        for d in adj[s]:
            if d in visited:
                continue
            visited.add(d)
            if d not in seen_right or augment(seen_right[d], visited):
                seen_right[d] = s
                return True
        return False

    return sum(augment(s, set()) for s in adj)


def check(A):
    k = len(A)
    if k < 2:
        return
    N = k * (k - 1) // 2
    E = energy(A)
    m = matching(A)
    assert 3 * E * m >= 4 * N * N, (A, m, E, N)


def main():
    for mask in range(1 << 10):
        A = [i for i in range(10) if mask & (1 << i)]
        check(A)
    print("Verified all 1024 subsets of {0,...,9}")


if __name__ == "__main__":
    main()
