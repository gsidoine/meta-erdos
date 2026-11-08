#!/usr/bin/env python3
"""Exact integer-sieve certificates for the P030 modular-3 obstruction."""

from math import isqrt


def sieve(limit):
    prime = bytearray(b"\x01") * (limit + 1)
    prime[:2] = b"\x00\x00"
    for p in range(2, isqrt(limit) + 1):
        if prime[p]:
            prime[p * p :: p] = b"\x00" * ((limit - p * p) // p + 1)
    return prime


def hall_bound(n, prime):
    """Cardinalities of S and the explicit superset T of its neighbors."""
    s = sum(a % 3 != 0 for a in range(1, n + 1, 2))
    t = sum(
        b % 3 == 0
        or (b >= 4 and prime[2 * b - 3])
        or (b + 3 <= n and prime[2 * b + 3])
        for b in range(2, n + 1, 2)
    )
    return s, t


def main():
    n, m = 51872, 240158
    prime = sieve(2 * m)
    s, t = hall_bound(n, prime)
    prime_count = sum(prime[: 2 * m - 2])  # pi(2*m-3)
    upper = m // 3 + prime_count - 2

    assert (s, t) == (17291, 17290)
    assert (prime_count, upper, m // 2) == (40028, 120078, 120079)
    assert t < s
    assert upper < m // 2
    print(f"n={n}: |S|={s}, neighbor upper bound={t}, deficit={s-t}")
    print(
        f"n={m}: pi(2n-3)={prime_count}, "
        f"matching upper bound={upper}, perfect-matching size={m//2}"
    )


if __name__ == "__main__":
    main()
