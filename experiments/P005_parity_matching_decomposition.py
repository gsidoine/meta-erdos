#!/usr/bin/env python3
"""Check P005 even Cartesian-square and odd marked-pair counting identities."""
from functools import lru_cache
from math import gcd


def count_bijections(rows, columns):
    rows, columns = tuple(rows), tuple(columns)
    assert len(rows) == len(columns)
    n = len(rows)
    allowed = [
        sum(1 << j for j, b in enumerate(columns) if gcd(a, b) == 1)
        for a in rows
    ]

    @lru_cache(maxsize=None)
    def ways(i, used):
        if i == n:
            return 1
        available = allowed[i] & ~used
        result = 0
        while available:
            bit = available & -available
            available -= bit
            result += ways(i + 1, used | bit)
        return result

    return ways(0, 0)


def parity_formula(n):
    evens = tuple(range(2, n + 1, 2))
    odds = tuple(range(1, n + 1, 2))
    if n % 2 == 0:
        m = count_bijections(evens, odds)
        return m * m
    t = {
        u: count_bijections(evens, (v for v in odds if v != u))
        for u in odds
    }
    return sum(t[u] * t[v] for u in odds for v in odds if gcd(u, v) == 1)


def direct_count(n):
    numbers = range(1, n + 1)
    return count_bijections(numbers, numbers)


def main():
    for n in range(2, 16):
        direct, formula = direct_count(n), parity_formula(n)
        assert direct == formula, (n, direct, formula)
        print(f"n={n}: coprime permutations={direct}, parity formula={formula}")
    assert direct_count(14) == 3459600
    assert direct_count(15) == 60891840


if __name__ == "__main__":
    main()
