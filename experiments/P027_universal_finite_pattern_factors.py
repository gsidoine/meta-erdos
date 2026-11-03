#!/usr/bin/env python3
"""Exact finite verification for P027 universal arithmetic block factors.

Tests finite base-state counts and external-divisor isolation. The asymptotic
factorization and positive density require the accompanying mathematical proof.
Standard library only.
"""
from itertools import combinations
from math import gcd, isqrt


def exponent_cap(N, root, base):
    exponent = 0
    while root * base <= N:
        root *= base
        exponent += 1
    return exponent


def maximum_primitive_count(C):
    odds = tuple(range(1, C + 1, 2))
    index = {q: i for i, q in enumerate(odds)}
    bounds = [(exponent_cap(C, q, 3), exponent_cap(C, q, 2))
              for q in odds]
    divisors = [[index[d] for d in odds[:i] if q % d == 0]
                for i, q in enumerate(odds)]
    chosen = [0] * len(odds)

    def count(i):
        if i == len(odds):
            return 1
        low, high = bounds[i]
        if divisors[i]:
            high = min(high, min(chosen[j] for j in divisors[i]) - 1)
        result = 0
        for e in range(low, high + 1):
            chosen[i] = e
            result += count(i + 1)
        return result

    return count(0)


def count_by_primitive_subsets(C):
    target_size = (C + 1) // 2
    return sum(
        1 for selected in combinations(range(1, C + 1), target_size)
        if all(b % a != 0 for i, a in enumerate(selected)
               for b in selected[i + 1:])
    )


def primes_up_to(B):
    return [p for p in range(2, B + 1)
            if all(p % j != 0 for j in range(2, isqrt(p) + 1))]


def check_isolated_block(C, u, N):
    assert N % 2 == 0
    assert C * u < N < (C + 1) * u
    K = exponent_cap(C, 1, 2)
    B = 3 ** (K + 1)
    assert gcd(u, 2) == 1
    assert all(u % p for p in primes_up_to(B))
    block = set(u * q for q in range(1, C + 1, 2))
    assert all(v <= N and v % 2 for v in block)
    for q in range(1, C + 1, 2):
        v = u * q
        assert exponent_cap(N, v, 2) == exponent_cap(C, q, 2)
        assert exponent_cap(N, v, 3) == exponent_cap(C, q, 3)

        for h in range(3, N // v + 1, 2):
            assert v * h in block, (C, u, v, h)

        # All odd proper divisors outside the block give automatic inequalities.
        odd_divisors = set()
        for d in range(1, isqrt(v) + 1, 2):
            if v % d:
                continue
            odd_divisors.add(d)
            odd_divisors.add(v // d)
        for d in odd_divisors - block:
            if d < v:
                assert exponent_cap(N, d, 3) > exponent_cap(N, v, 2)
    return len(block)


def main():
    known = {8: 5, 12: 6, 16: 10, 20: 26, 24: 34,
             36: 168, 54: 2208, 56: 3616, 60: 5056}
    for C, expected in known.items():
        got = maximum_primitive_count(C)
        assert got == expected, (C, got, expected)
        if C <= 16:
            assert count_by_primitive_subsets(C) == expected
    for C, u in ((20, 251), (24, 251), (54, 733), (56, 733), (60, 733)):
        N = C * u + 100
        block_size = check_isolated_block(C, u, N)
        assert block_size == (C + 1) // 2
    assert maximum_primitive_count(20) == 2 * 13
    print("PASS: exact primitive counts and independent subset checks")
    print("PASS: rough-root finite blocks reproduce all exponent intervals")
    print("PASS: all external divisibility constraints are automatic")
    print("PASS: F(20)=26 supports the 13-adic divisibility corollary")


if __name__ == "__main__":
    main()
