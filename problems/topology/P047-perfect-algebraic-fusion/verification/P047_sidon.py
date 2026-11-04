#!/usr/bin/env python3
"""Finite exact check of the P047 polynomial pair maps.

Elements x=T+sum_{j=2}^{m-1} b_j T^j are encoded by integer bitmasks.
All arithmetic is in F_2[T], without truncation; a pair in F_4[T] is stored
as its two F_2[T] coefficients. The mathematical proof does not rely on this.
"""
from itertools import combinations


def multiply(a: int, b: int) -> int:
    out = 0
    while b:
        if b & 1:
            out ^= a
        a <<= 1
        b >>= 1
    return out


def cube(a: int) -> int:
    return multiply(multiply(a, a), a)


def check(m: int) -> tuple[int, int]:
    if m < 3:
        raise ValueError("Use m at least 3")
    domain = [2 | (tail << 2) for tail in range(1 << (m - 2))]
    sums, products = set(), set()
    for x, y in combinations(domain, 2):
        s = x ^ y
        u = multiply(x, y)
        u3 = cube(u)
        additive = (s, cube(x) ^ cube(y))
        multiplicative = (u ^ u3, multiply(u, multiply(s, s)) ^ u3)
        if additive in sums:
            raise AssertionError(f"Additive collision for m={m}")
        if multiplicative in products:
            raise AssertionError(f"Multiplicative collision for m={m}")
        sums.add(additive)
        products.add(multiplicative)
    count = len(domain) * (len(domain) - 1) // 2
    assert len(sums) == len(products) == count
    return len(domain), count


if __name__ == "__main__":
    for m in range(3, 9):
        n, count = check(m)
        print(f"m={m}: {n} elements, {count} unique sums and products")
