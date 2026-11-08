#!/usr/bin/env python3
"""Constructively certify P005's universal-hub switch sequence.

The proof covers all orders; this script exhaustively validates the algorithm
for every coprime permutation of [n] for n <= 11. Python standard library only.
"""
from math import gcd


def canonical(n):
    """Reference coprime permutation: consecutive transpositions, plus fixed 1 if odd."""
    ans = {i: i for i in range(1, n + 1)}
    for i in range(2 if n % 2 else 1, n, 2):
        ans[i], ans[i + 1] = i + 1, i
    return ans


def universal_hub_sort(current, target, rows, hub_row, hub_value):
    """Return valid row-swap positions, mutating current to target on rows."""
    rows = tuple(rows)
    values = {target[i] for i in rows}
    assert {current[i] for i in rows} == values
    assert target[hub_row] == hub_value
    assert all(gcd(hub_row, v) == 1 for v in values)
    assert all(gcd(i, hub_value) == 1 for i in rows)
    inverse = {target[i]: i for i in rows}
    steps = []

    def switch(row):
        assert row != hub_row
        a, b = current[hub_row], current[row]
        assert gcd(hub_row, b) == 1 and gcd(row, a) == 1
        current[hub_row], current[row] = b, a
        steps.append((hub_row, row))

    # Settle the target-permutation cycle containing the universal row.
    while current[hub_row] != hub_value:
        row = inverse[current[hub_row]]
        switch(row)
        assert current[row] == target[row]

    # Each other nontrivial cycle uses the universal column as a buffer.
    while any(current[i] != target[i] for i in rows):
        first = next(i for i in rows if i != hub_row and current[i] != target[i])
        switch(first)
        while current[hub_row] != target[first]:
            row = inverse[current[hub_row]]
            assert row != hub_row and row != first
            switch(row)
            assert current[row] == target[row]
        switch(first)
        assert current[first] == target[first] and current[hub_row] == hub_value

    assert len(steps) <= len(rows) - 1 + (len(rows) - 1) // 2
    return steps


def solve(n, values):
    """Construct a list of valid two-position swaps from a given coprime permutation."""
    current = dict(enumerate(values, 1))
    target = canonical(n)
    assert sorted(values) == list(range(1, n + 1))
    assert all(gcd(i, current[i]) == 1 for i in current)
    steps = []
    if n % 2:
        steps += universal_hub_sort(current, target, range(1, n + 1), 1, 1)
    else:
        steps += universal_hub_sort(current, target, range(2, n + 1, 2), 2, 1)
        steps += universal_hub_sort(current, target, range(1, n + 1, 2), 1, 2)
    assert current == target
    assert len(steps) <= 3 * (n - 1) // 2
    return steps


def all_coprime_permutations(n):
    values = [0] * n

    def enumerate_from(i, unused):
        if i > n:
            yield tuple(values)
            return
        for v in range(1, n + 1):
            bit = 1 << (v - 1)
            if unused & bit and gcd(i, v) == 1:
                values[i - 1] = v
                yield from enumerate_from(i + 1, unused ^ bit)

    yield from enumerate_from(1, (1 << n) - 1)


def verify(max_n=11):
    assert max_n <= 11, "Exhaustive checks above 11 need extra resources"
    for n in range(1, max_n + 1):
        count = max_steps = 0
        for perm in all_coprime_permutations(n):
            steps = solve(n, perm)
            count += 1
            max_steps = max(max_steps, len(steps))
        print(f"n={n}: verified={count}, maximum switch steps={max_steps}")
    assert count == 129744 if max_n == 11 else count > 0


if __name__ == "__main__":
    verify()
