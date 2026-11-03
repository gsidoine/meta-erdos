#!/usr/bin/env python3
"""Exhaustive parity-valid triangulation flip graph checks for convex n-gons.

A parity-area-valid triangle uses three distinct residues in F_2^2, so
vertex colors may be represented by any four abstract symbols.

Uses restricted-growth strings to eliminate global permutations of
the four colors. No external dependencies.

Usage:
    python experiments/P015_odd_area_flip_graph.py --max-n 9
    python experiments/P015_odd_area_flip_graph.py --max-n 8
"""
import argparse
from functools import lru_cache


@lru_cache(None)
def triangulations(i, j):
    if j <= i + 1:
        return (frozenset(),)
    return tuple(
        left | right | {(i, k, j)}
        for k in range(i + 1, j)
        for left in triangulations(i, k)
        for right in triangulations(k, j)
    )


def diagonals(t, n):
    result = set()
    for a, b, c in t:
        for x, y in ((a, b), (b, c), (a, c)):
            if y != x + 1 and (x, y) != (0, n - 1):
                result.add((x, y))
    return frozenset(result)


def rgs(n, num_colors=4):
    """All color partitions of [n] using exactly num_colors, once each."""
    def extend(seq, k):
        if len(seq) == n:
            if k == num_colors:
                yield tuple(seq)
            return
        for c in range(min(k, num_colors-1) + 1):
            yield from extend(seq + [c], max(k, c+1))
    yield from extend([0], 1)


def structure(n):
    tris = triangulations(0, n-1)
    ds = [diagonals(t, n) for t in tris]
    assert len(ds) == len(set(ds))
    # Two triangulations differ by one flip exactly when their diagonal
    # sets differ in one removed and one added diagonal.
    graph = [set() for _ in tris]
    for i in range(len(tris)):
        for j in range(i):
            if len(ds[i] ^ ds[j]) == 2:
                graph[i].add(j)
                graph[j].add(i)
    return tris, graph


def component_sizes(valid, graph):
    remaining = set(valid)
    sizes = []
    while remaining:
        node = remaining.pop()
        stack = [node]
        size = 0
        while stack:
            v = stack.pop()
            size += 1
            newly_found = graph[v] & remaining
            remaining.difference_update(newly_found)
            stack.extend(newly_found)
        sizes.append(size)
    return sorted(sizes)


def run(max_n):
    assert 4 <= max_n <= 10
    for n in range(4, max_n+1):
        tris, graph = structure(n)
        checked_patterns = viable = disconnected = 0
        for col in rgs(n, 4):
            checked_patterns += 1
            good_tri = [
                idx for idx, t in enumerate(tris)
                if all(len({col[a], col[b], col[c]}) == 3
                       for a, b, c in t)
            ]
            if len(good_tri) < 2:
                continue
            viable += 1
            comps = component_sizes(good_tri, graph)
            if len(comps) != 1:
                disconnected += 1
                print(f"COUNTEREXAMPLE n={n}, colors={col}, component_sizes={comps}")
                return 1
        print(f"n={n}, Catalan states={len(tris)}, "
              f"four-color patterns={checked_patterns}, "
              f"multi-state patterns={viable}, "
              f"disconnected={disconnected}")
    # Demonstrate the three-color obstruction explicitly at n=6.
    tri, graph = structure(6)
    col = (0,1,0,2,1,2)
    valid = [i for i,t in enumerate(tri)
             if all(len({col[a],col[b],col[c]})==3 for a,b,c in t)]
    assert len(valid) == 2
    assert component_sizes(valid,graph) == [1,1]
    print("Three-color six-vertex obstruction: 2 isolated valid triangulations.")
    return 0


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--max-n",type=int,default=9)
    args = parser.parse_args()
    raise SystemExit(run(args.max_n))
