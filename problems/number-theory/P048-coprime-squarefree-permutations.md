# P048 — Coprime permutations with squarefree sums

<!-- DOSSIER-SUMMARY -->
<!-- /DOSSIER-SUMMARY -->

**Area:** arithmetic combinatorics.

## Problem

For every positive integer $n$, does there exist a permutation $\sigma$ of $\{1,\ldots,n\}$ such that

$$
\gcd(i,\sigma(i))=1,\qquad
\mu^2(i+\sigma(i))=1
\quad (1\le i\le n)?
$$

Here $\mu$ denotes the Möbius function, so $\mu^2(m)=1$ precisely when $m$ is squarefree.

Equivalently, does the bipartite graph with two vertex classes $[n]$ and edges $(i,j)$ whenever $\gcd(i,j)=1$ and $i+j$ is squarefree always have a perfect matching?

## Known facts and finite verification

The coprimality-only condition is classical; the squarefree-sum-only condition is a separate permanent/matching problem. A positive answer to either problem alone does not imply a matching for their intersection.

A deterministic Hopcroft–Karp implementation confirms the combined perfect matching condition for every $1\le n\le750$, and separately at $n=1000$ and $n=1100$. The result is **finite evidence only**, not an existence proof for arbitrary $n$. The [verification program](../../experiments/P048_coprime_squarefree_permutations.py) can repeat this check.

There are no diagonal edges except $(1,1)$, since $\gcd(i,i)=i$. For $n\ge2$, the evident involutive matching construction is obstructed by square divisors of the prescribed pair sums, which is why the intersection condition requires separate treatment.

## Prior art

1. A. Sah, *Enumerating coprime permutations*, **Mathematika** 68 (2022), [doi:10.1112/mtk.12159](https://doi.org/10.1112/mtk.12159). Enumerates permutations under the coprimality condition.
2. [OEIS A398305](https://oeis.org/A398305), permutations satisfying the squarefree-sum condition alone.
3. S. Hathi and D. R. Johnston, *On the sum of a prime and a square-free number with divisibility conditions*, **Journal of Number Theory** 256 (2024), 354–372, [doi:10.1016/j.jnt.2023.10.002](https://doi.org/10.1016/j.jnt.2023.10.002). Related additive-squarefree sieve constraints.
4. [Hall's marriage theorem](https://doi.org/10.1112/jlms/s1-10.37.26) gives the exact graph-theoretic criterion in terms of neighbor-set inequalities, but does not by itself establish them for this graph.

The exact simultaneous condition has not been established as historically new or open. A specialist comparison with arithmetic-permutation and sieve matching results remains necessary.

## Verification

[Exact bipartite matching search](../../experiments/P048_coprime_squarefree_permutations.py).
