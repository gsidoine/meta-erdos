#!/usr/bin/env python3
"""Exhaustive finite-field rank checks for uniform Hankel matrices.

All n*n entries are determined by 2*n-1 independent anti-diagonal labels.
Count coranks over F_p and check the classical theorem:
  Pr(corank >= k) == p**(-(2*k-1)), 1 <= k <= n.

This verifies known finite-field mathematics, NOT p-adic cokernel laws.
Standard library only. Usage:
  python experiments/P020_hankel_finite_field_ranks.py
"""
from itertools import product


def rank_mod_p(matrix, p):
    arr=[row[:] for row in matrix]
    n=len(arr)
    rank=0
    for col in range(n):
        pivot=next((r for r in range(rank,n) if arr[r][col]%p),None)
        if pivot is None:
            continue
        arr[rank],arr[pivot]=arr[pivot],arr[rank]
        inverse=pow(arr[rank][col],-1,p)
        arr[rank]=[(v*inverse)%p for v in arr[rank]]
        for i in range(rank+1,n):
            factor=arr[i][col]
            if factor:
                arr[i]=[(x-factor*y)%p for x,y in zip(arr[i],arr[rank])]
        rank+=1
    return rank


def verify(p,n):
    histogram=[0]*(n+1)
    for params in product(range(p),repeat=2*n-1):
        hankel=[[params[i+j] for j in range(n)] for i in range(n)]
        histogram[n-rank_mod_p(hankel,p)]+=1

    total=p**(2*n-1)
    assert sum(histogram)==total
    for k in range(1,n+1):
        expected=p**(2*(n-k))
        observed=sum(histogram[k:])
        assert observed==expected,(p,n,k,observed,expected)
    assert histogram[0]==total*(p-1)//p
    print(f"p={p}, n={n}, corank_counts={histogram}: PASS")
    return histogram


if __name__ == "__main__":
    for prime,n in [(2,2),(2,3),(2,4),(3,2),(3,3)]:
        verify(prime,n)
