#!/usr/bin/env python3
"""Construct an optimal minimum-coprime-adjacency permutation of [1,n].

Standard library only. Implements the proof in theorems/P010-exact-coprime-adjacencies.md.
Validates the permutation and its gcd-one count against the closed formula.

Examples:
 python experiments/P010_construct_optimal_permutation.py --n 200 --show
 python experiments/P010_construct_optimal_permutation.py --max-n 500
"""
import argparse
from math import gcd


def largest_prime_factors(n):
    lpf = [0] * (n + 1)
    for p in range(2, n + 1):
        if not lpf[p]:
            for j in range(p, n + 1, p):
                lpf[j] = p
    return lpf


def pi_table(n, lpf):
    p = [0] * (n + 1)
    for j in range(1, n + 1):
        p[j] = p[j-1] + int(j >= 2 and lpf[j] == j)
    return p


SMALL = {
    1: [1],
    2: [1, 2],
    3: [1, 2, 3],
    4: [1, 2, 4, 3],
    5: [1, 2, 4, 3, 5],
    6: [1, 2, 4, 6, 3, 5],
    7: [1, 2, 4, 6, 3, 5, 7],
    8: [1, 2, 4, 8, 6, 3, 5, 7],
    9: [1, 2, 4, 8, 6, 3, 9, 5, 7],
    10: [1, 3, 9, 6, 2, 4, 8, 10, 5, 7],
    11: [1, 3, 9, 6, 2, 4, 8, 10, 5, 7, 11],
}


def expected(n, prime_counts):
    if n <= 3:
        return n-1
    a = prime_counts[n] - prime_counts[n//2]
    b = prime_counts[n//2] - prime_counts[n//3]
    return a + max(1, (b+1)//2)


def path_cover(n, lpf):
    """Return optimal vertex-disjoint noncoprime paths; n must be >=12."""
    if n < 12:
        raise ValueError("path_cover construction requires n>=12")
    blocks = {}
    for v in range(2, n + 1):
        blocks.setdefault(lpf[v], []).append(v)

    small  = [p for p in blocks if 4*p <= n]
    middle = [p for p in blocks if 3*p <= n < 4*p]
    leaves = [p for p in blocks if 2*p <= n < 3*p]
    singletons = [p for p in blocks if 2*p > n]

    def with_ends(block, a, b):
        if a == b or a not in block or b not in block:
            raise AssertionError("Missing prescribed path endpoints")
        return [a] + [x for x in block if x not in (a, b)] + [b]

    spare = middle.pop() if len(middle) % 2 else None
    units = []
    for p in small:
        if p == 3 and spare is not None:
            # Bridge 9 -- 3*spare using their common factor 3.
            units.append(with_ends(blocks[3], 6, 9)
                         + with_ends(blocks[spare], 3*spare, 2*spare))
        else:
            units.append(with_ends(blocks[p], 2*p, 4*p))

    for p, q in zip(middle[::2], middle[1::2]):
        # Bridge 3*p -- 3*q using factor 3.
        units.append(with_ends(blocks[p], 2*p, 3*p)
                     + with_ends(blocks[q], 3*q, 2*q))

    # Join all even-ended units into one core, then pair leaves directly.
    # The original capacity comparison with prime counts is unnecessary.
    core = [v for unit in units for v in unit]
    assert core and core[0] % 2 == 0 and core[-1] % 2 == 0
    paired = list(zip(leaves[::2], leaves[1::2]))
    if len(leaves) % 2:
        p = leaves[-1]
        chains = [[p, 2*p] + core] + [
            [u, 2*u, 2*v, v] for u, v in paired
        ]
    elif paired:
        p, q = paired.pop()
        chains = [[p, 2*p] + core + [2*q, q]] + [
            [u, 2*u, 2*v, v] for u, v in paired
        ]
    else:
        chains = [core]
    return [[1]] + [[p] for p in singletons] + chains


def construct(n, lpf):
    if n <= 11:
        return list(SMALL[n])
    return [x for path in path_cover(n, lpf) for x in path]


def verify(n, lpf, prime_counts):
    permutation = construct(n, lpf)
    assert sorted(permutation) == list(range(1, n+1))
    count = sum(gcd(a,b) == 1 for a,b in zip(permutation,permutation[1:]))
    goal = expected(n, prime_counts)
    if count != goal:
        raise AssertionError(f"n={n}: got {count}, theorem predicts {goal}")
    return permutation, count


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument("--n", type=int)
    mode.add_argument("--max-n", type=int)
    parser.add_argument("--show", action="store_true")
    args = parser.parse_args()
    upper = args.n or args.max_n or 200
    if upper < 1:
        parser.error("n must be >=1")
    lpf = largest_prime_factors(upper)
    prime_counts = pi_table(upper, lpf)
    cases = [args.n] if args.n else list(range(1, upper+1))
    for n in cases:
        permutation, count = verify(n, lpf, prime_counts)
        if args.n or args.show or n in {4,9,21,50,100,200,500,1000,10000}:
            print(f"n={n} minimum_coprime_adjacencies={count}")
            if args.show or args.n:
                print("permutation:", permutation)
    print(f"Verified {len(cases)} explicit optimal witnesses.")
