#!/usr/bin/env python3
"""Verify the exact P043 two-step prime-denominator Farey identity.

No asymptotic result is inferred from the finite computation.
Only Python's standard library is required.
"""

def primes_upto(n):
    sieve = bytearray(b"\1") * (n + 1)
    sieve[:2] = b"\0\0"
    for p in range(2, int(n ** .5) + 1):
        if sieve[p]:
            for k in range(p*p, n+1, p):
                sieve[k] = 0
    return [p for p in range(2, n+1) if sieve[p]]


def cube_root_floor(n):
    y = int(n ** (1/3))
    while (y+1)**3 <= n:
        y += 1
    while y**3 > n:
        y -= 1
    return y


def verify(n):
    y = cube_root_floor(n)
    assert 2*y < n/2, (n, y)
    primes = primes_upto(n)
    small = [p for p in primes if 3 <= p <= y]
    large = [q for q in primes if n/2 < q <= n]
    layer = {}
    number_of_expected_vertices = 0

    for p in small:
        for q in large:
            if q % p not in (2 % p, (-2) % p):
                continue
            number_of_expected_vertices += 2
            # If q ≡ 2, the larger central neighbor has positive determinant.
            if q % p == 2 % p:
                a = (p+1)//2
            else:
                a = (p-1)//2
            b, remainder = divmod(a*q-1, p)
            assert remainder == 0, (n,p,q,a,b)
            assert 0 < b < q and 2*a in (p-1,p+1)
            assert a*q-b*p == 1
            assert (p-a)*q - (q-b)*p == -1
            for vertex, neighbor in [((b,q),(a,p)), ((q-b,q),(p-a,p))]:
                assert vertex not in layer, (n,p,q,vertex,layer.get(vertex))
                assert abs(neighbor[0]*q - vertex[0]*p) == 1
                assert abs(p-2*neighbor[0]) == 1
                # The endpoint is at graph distance two rather than one.
                assert abs(q-2*vertex[0]) != 1
                layer[vertex] = neighbor

    assert len(layer) == number_of_expected_vertices
    # A second enumeration, independent of fraction construction.
    expected = 2*sum(
        1 for p in small for q in large
        if q % p in (2 % p, (-2) % p)
    )
    assert len(layer) == expected
    print(f"N={n}: Y={y}, small primes={len(small)},"
          f" large primes={len(large)}, layer={len(layer)}")
    return len(layer)


def main():
    for n in (100, 199, 499, 1000, 2000, 5000, 10000):
        verify(n)
    print("P043 finite exact two-step layer identity passed.")


if __name__ == "__main__":
    main()
