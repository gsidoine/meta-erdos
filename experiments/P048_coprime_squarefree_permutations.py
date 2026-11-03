#!/usr/bin/env python3
"""Exact bipartite matching search for P048; finite evidence, not a proof."""

import argparse
from collections import deque
from math import gcd, isqrt


def squarefree_mask(k):
    flag = [True] * (k + 1)
    flag[0] = False
    for p in range(2, isqrt(k) + 1):
        if any(p % d == 0 for d in range(2, isqrt(p) + 1)):
            continue
        for j in range(p * p, k + 1, p * p):
            flag[j] = False
    return flag


def matching(n, squarefree):
    """Return a matching as a permutation, or None if no perfect matching."""
    adj = [[]] + [[v for v in range(1, n + 1)
                   if gcd(u, v) == 1 and squarefree[u + v]]
                  for u in range(1, n + 1)]
    left = [0] * (n + 1)
    right = [0] * (n + 1)
    dist = [0] * (n + 1)

    def bfs():
        queue = deque()
        for u in range(1, n + 1):
            if left[u] == 0:
                dist[u] = 0
                queue.append(u)
            else:
                dist[u] = -1
        reachable = False
        while queue:
            u = queue.popleft()
            for v in adj[u]:
                w = right[v]
                if w == 0:
                    reachable = True
                elif dist[w] < 0:
                    dist[w] = dist[u] + 1
                    queue.append(w)
        return reachable

    def dfs(u):
        for v in adj[u]:
            w = right[v]
            if w == 0 or (dist[w] == dist[u] + 1 and dfs(w)):
                left[u] = v
                right[v] = u
                return True
        dist[u] = -1
        return False

    while bfs():
        for u in range(1, n + 1):
            if left[u] == 0:
                dfs(u)

    if any(left[u] == 0 for u in range(1, n + 1)):
        return None
    assert sorted(left[1:]) == list(range(1, n + 1))
    assert all(gcd(i, left[i]) == 1 and squarefree[i + left[i]]
               for i in range(1, n + 1))
    return left[1:]


def check(orders):
    orders = sorted(set(orders))
    mask = squarefree_mask(2 * max(orders))
    for n in orders:
        witness = matching(n, mask)
        if witness is None:
            print(f"NO PERFECT MATCHING: n={n}")
            return False
    print(f"Perfect matchings independently checked for {len(orders)} orders;"
          f" maximum n={max(orders)}")
    return True


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--max-n", type=int, default=80,
                    help="check every 1 <= n <= max-n")
    ap.add_argument("--spot", type=int, nargs="*", default=[100, 128, 150,
                    175, 200, 250, 300, 400, 500, 600, 750, 1000, 1100],
                    help="additional, independently checked orders")
    args = ap.parse_args()
    if args.max_n < 1 or any(x < 1 for x in args.spot):
        ap.error("All tested orders must be positive")
    raise SystemExit(0 if check(list(range(1, args.max_n + 1)) + args.spot)
                     else 1)
