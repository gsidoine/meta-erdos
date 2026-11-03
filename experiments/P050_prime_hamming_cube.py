#!/usr/bin/env python3
"""Finite check for P050 clique, algebraic coloring and the n=4 bound."""

import argparse
from math import isqrt, log2, ceil
from itertools import combinations


def primes_up_to(n):
    return {i for i in range(2, n + 1)
            if all(i % d for d in range(2, isqrt(i) + 1))}


def coloring(n):
    m = max(1, ceil(log2(n)))
    return [(x.bit_count() % 2,
             _xor_indices(x, n)) for x in range(1 << n)]


def _xor_indices(x, n):
    out = 0
    for i in range(n):
        if x >> i & 1:
            out ^= i
    return out


def check(n):
    colors = coloring(n)
    primes = primes_up_to(n)
    for a in range(1 << n):
        for b in range(a):
            if (a ^ b).bit_count() in primes:
                assert colors[a] != colors[b]
    assert len(set(colors)) <= 2 * (1 << ceil(log2(n)))
    if n >= 5:
        units = [1 << i for i in range(n)]
        star = [sum(1 << i for i in (0, 1, 2, j))
                for j in range(3, n)]
        clique = units + star
        assert len(clique) == 2 * n - 3
        assert all((a ^ b).bit_count() in primes
                   for a, b in combinations(clique, 2))
    if n == 4:
        # Independent sets have size <= 2: translate one vertex to 0.
        allowed = [a for a in range(1, 1 << n)
                   if a.bit_count() not in primes]
        assert all((a ^ b).bit_count() in primes
                   for a, b in combinations(allowed, 2))
    print(f"n={n}: algebraic coloring checked ({len(set(colors))} colors)"
          + (f", clique size={2*n-3}" if n >= 5 else ""))


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--max-n", type=int, default=8)
    args = parser.parse_args()
    if not 4 <= args.max_n <= 12:
        parser.error("Choose max-n between 4 and 12")
    for n in range(4, args.max_n + 1):
        check(n)
