#!/usr/bin/env python3
"""Exact F_2 rank of finite random principal coprimality matrices for P049."""

import argparse
from math import gcd, isqrt
from random import Random


def binary_rank(rows):
    pivots = {}
    for value in rows:
        while value:
            lead = value.bit_length() - 1
            if lead not in pivots:
                pivots[lead] = value
                break
            value ^= pivots[lead]
    return len(pivots)


def sample_rank(n, p, seed):
    rng = Random(seed)
    selected = [a for a in range(1, n + 1) if rng.random() < p]
    rows = []
    for a in selected:
        row = 0
        for index, b in enumerate(selected):
            if gcd(a, b) == 1:
                row |= 1 << index
        rows.append(row)
    return len(selected), binary_rank(rows)


def squarefree_count(n):
    good = [True] * (n + 1)
    good[0] = False
    for p in range(2, isqrt(n) + 1):
        if any(p % d == 0 for d in range(2, isqrt(p) + 1)):
            continue
        for j in range(p * p, n + 1, p * p):
            good[j] = False
    return sum(good[1:])


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--n", type=int, default=160)
    parser.add_argument("--p", type=float, default=0.5)
    parser.add_argument("--seeds", type=int, default=4)
    args = parser.parse_args()
    if args.n < 1 or not 0 <= args.p <= 1 or args.seeds < 1:
        parser.error("Require n >= 1, 0 <= p <= 1, seeds >= 1")
    if args.p == 1:
        assert sample_rank(args.n, args.p, 0)[1] == squarefree_count(args.n)
    for seed in range(args.seeds):
        size, rank = sample_rank(args.n, args.p, seed)
        assert rank <= size
        print(f"n={args.n}, p={args.p}, seed={seed}, size={size},"
              f" rank_F2={rank}")
