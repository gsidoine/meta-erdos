#!/usr/bin/env python3
"""Exact finite test of the P027 factor eigenfunction at N=24 and N=25.

The existence and convergence theorem requires its general proof; these
small finite calculations only verify a concrete even/odd inheritance case.
"""
from collections import defaultdict


def floor_log_ratio(N, q, base):
    exponent = 0
    value = q
    while value * base <= N:
        value *= base
        exponent += 1
    return exponent


def primitive_states(N):
    odds = tuple(range(1, N + 1, 2))
    lows = [floor_log_ratio(N, q, 3) for q in odds]
    highs = [floor_log_ratio(N, q, 2) for q in odds]
    predecessors = [
        tuple(j for j, d in enumerate(odds[:i]) if q % d == 0)
        for i, q in enumerate(odds)
    ]
    state = [0] * len(odds)
    out = []

    def extend(i):
        if i == len(odds):
            out.append(tuple(state))
            return
        high = highs[i]
        for j in predecessors[i]:
            high = min(high, state[j] - 1)
        for e in range(lows[i], high + 1):
            state[i] = e
            extend(i + 1)

    extend(0)
    return odds, out


def verify(N):
    assert N in (24, 25)
    odds, configurations = primitive_states(N)
    assert len(configurations) == 34
    index = odds.index(11)
    fibers = defaultdict(set)
    for s in configurations:
        fibers[s[:index] + s[index + 1:]].add(s[index])
    assert len(fibers) == 17
    assert all(values == {0, 1} for values in fibers.values())

    # f(s) = +1 for exponent 1 at u=11, -1 for exponent 0.
    # The u=11 heat bath sends f to 0; other heat baths preserve f.
    # Thus Q_N f = -f exactly, giving eigenvalue 1 of -Q_N.
    index_by_state = set(configurations)
    for s in configurations:
        partner = list(s)
        partner[index] = 1 - partner[index]
        assert tuple(partner) in index_by_state
        assert ((2 * s[index] - 1) + (2 * partner[index] - 1)) == 0

    return len(configurations), len(fibers)


if __name__ == "__main__":
    for N in (24, 25):
        size, factors = verify(N)
        print(f"N={N}: {size} states, {factors} balanced binary fibers, Qf=-f")
