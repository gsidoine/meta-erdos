#!/usr/bin/env python3
"""Exact P040 five-prime fractional Hall-support optimality certificate.

Every comparison is over integers with common denominator
12*3*5*7*11*13; there are no floating point operations.
"""
from math import prod

PRIMES=(3,5,7,11,13)
K=len(PRIMES)
N=1<<K
DEN=prod(PRIMES)

def upper_sets(k):
    if k==0:
        return [0,1]
    a=upper_sets(k-1)
    shift=1<<(k-1)
    return [lo | (hi<<shift) for lo in a for hi in a if lo & ~hi == 0]

def verify():
    supports=upper_sets(K)
    assert len(supports)==7581==len(set(supports))
    assert supports[0]==0
    assert supports[-1]==(1<<N)-1
    weights=[prod(1 if s & (1<<i) else p-1
                  for i,p in enumerate(PRIMES)) for s in range(N)]
    assert sum(weights)==DEN
    disjoint=[sum(weights[s] for s in range(N) if s & t == 0)
              for t in range(N)]
    mass=[sum(weights[s] for s in range(N) if (u>>s)&1)
          for u in supports]
    cuts=[[sum(weights[s] for s in range(N)
               if ((u>>s)&1) and (s&t==0))
           for t in range(N)] for u in supports]

    def bound(i,j):
        return min([12*mass[i]]+
                   [12*(mass[i]-cuts[i][t])+5*disjoint[t]
                    for t in range(N) if (supports[j]>>t)&1])

    def coarse_bound(i,j):
        return min([12*mass[i]]+
                   [12*DEN-7*disjoint[t]
                    for t in range(N) if (supports[j]>>t)&1])

    checked=0
    hard=[]
    min_slack=None
    for i in range(len(supports)):
        for j in range(len(supports)):
            if mass[i]+mass[j]<=DEN:
                continue
            checked+=1
            if coarse_bound(i,j)+coarse_bound(j,i)>12*DEN:
                hard.append((i,j))
            slack=12*DEN-bound(i,j)-bound(j,i)
            assert slack>=0,(i,j,hex(supports[i]),hex(supports[j]),slack)
            min_slack=slack if min_slack is None else min(min_slack,slack)

    assert checked==15586,checked
    assert len(hard)==24,len(hard)
    assert len({tuple(sorted(t)) for t in hard})==12
    print("Five-prime upper sets:",len(supports))
    print("Ordered support pairs requiring a bound:",checked)
    print("Coarse-bound survivors:",len(hard),"ordered, 12 unordered")
    print("Every exact integer certificate inequality passed.")
    print("Minimum slack:",min_slack)
    return checked,len(hard),min_slack

if __name__=="__main__":
    verify()
