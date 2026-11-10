#!/usr/bin/env python3
"""Exact P043 distance-two Farey layer vs shifted-prime-factor formula.

Constructs the actual Farey determinant edges through central
neighbors and compares them with a separately computed arithmetic sum.
Finite verification does not prove the asymptotic result.
"""
from math import isqrt, log

def primes_up_to(n):
    sieve = bytearray(b"\1") * (n + 1)
    sieve[:2] = b"\0\0"
    for p in range(2, isqrt(n) + 1):
        if sieve[p]:
            for j in range(p * p, n + 1, p):
                sieve[j] = 0
    return [p for p in range(2, n + 1) if sieve[p]]

def omega_table(n, primes):
    out = [0] * (n + 1)
    for p in primes:
        for j in range(p, n + 1, p):
            out[j] += 1
    return out

def verify(n):
    assert n >= 3
    all_primes = primes_up_to(n + 2)
    host_primes = [p for p in all_primes if p <= n]
    prime_set = set(all_primes)
    omega = omega_table(n + 2, all_primes)
    direct = {
        (a, q) for q in host_primes if q > 2
        for a in ((q - 1) // 2, (q + 1) // 2)
    }
    layer = {}
    for p in host_primes:
        if p == 2:
            continue
        for q in host_primes:
            if q == 2 or q == p:
                continue
            if q % p not in {2 % p, (-2) % p}:
                continue
            a = (p + 1) // 2 if q % p == 2 % p else (p - 1) // 2
            assert (a * q - 1) % p == 0
            b = (a * q - 1) // p
            for numerator, parent_numerator in ((b, a), (q-b, p-a)):
                assert 0 < numerator < q
                assert abs(parent_numerator * q - numerator * p) == 1
                assert abs(p - 2*parent_numerator) == 1
                if (numerator, q) in direct:
                    continue
                assert (numerator, q) not in layer, (
                    n, (numerator, q), p, layer.get((numerator, q)))
                layer[(numerator, q)] = p

    expected_by_q = {
        q: 2 * (omega[q - 2] + omega[q + 2]
                - (q - 2 in prime_set) - (q + 2 in prime_set))
        for q in host_primes if q > 2
    }
    actual_by_q = {q: 0 for q in expected_by_q}
    for _, q in layer:
        actual_by_q[q] += 1
    assert actual_by_q == expected_by_q, [
        (q, actual_by_q[q], expected_by_q[q])
        for q in expected_by_q if actual_by_q[q] != expected_by_q[q]
    ]
    answer = len(layer)
    assert answer == sum(expected_by_q.values())
    print(f"N={n}: primes={len(host_primes)} distance-two={answer}")
    return answer

def main():
    for n in (5, 11, 29, 101, 500, 2000, 5000):
        verify(n)
    print("All exact distance-two arithmetic identities passed.")

if __name__ == "__main__":
    main()
