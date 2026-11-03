# Incubator resolution and research decision — interval-sum factor theorem

**Date:** 2026-10-29  
**Repository:** `gsidoine/the-scottish-book` (formerly `beyond-erdos`)  
**Category:** unnumbered theorem, derived from P003's factor-packing research. **No P011 was created.**

## What was proved

Let $G_{n;a,b}$ be bipartite on two copies of $\{0,\ldots,n-1\}$, joining $i,j$ iff $a\le i+j\le b$. Then for **every** $n\ge1$ and every integer interval $[a,b]$,

$$
\boxed{\lambda(G_{n;a,b})=\delta(G_{n;a,b})}.
$$

The complete **constructive** proof is in [theorems/interval-sum-factor-saturation.md](../theorems/interval-sum-factor-saturation.md). Its main move is an edge-exchange formula on a $k+r$ block:

$$
(t+s+1,r+s)\longmapsto(t+s+1,k+t),
\quad 0\le t<r,\ 0\le s<k-r.
$$

It corrects the overfull and underfull columns of two overlapping complete rectangles while preserving row degrees and staying inside a consecutive diagonal band. Block decomposition of $n$ completes the proof; bipartite regular-factor decomposition yields the matchings.

This resolves the incubator conjecture raised in the P010 publication assessment pass; **it does not resolve P003**, whose allowed sums are sparse primes instead of an interval.

## Independent verification

A first, independently coded factor constructor checked **every** $1\le k\le n\le69$ and tested all intervals through $n=25$. Independent integral max-flow verified matching-capacity equality for smaller $n$. The committed **standard-library verifier** [experiments/interval_sum_factor_construct.py](../experiments/interval_sum_factor_construct.py) implements the proof and is exercised by repository CI for all bands through $n=65$ and every interval through $n=20$. Check GitHub Actions status before asserting the committed implementation itself has passed.

## Adversarial proof checklist

- $\delta=0$ case: trivial, since no perfect matching can include an isolated vertex.
- Positive degree forces $n-1\in[a,b]$, and reversing the column labels gives a Toeplitz band.
- The symmetric band $|i-j|\le k-1$ sits inside the allowed asymmetric band and has minimum degree $k$.
- In a $k+r$ block, the initial two rectangles give every row degree $k$; only overlapping and trailing columns need repair.
- The exchanged edges are distinct and permitted, and they leave the total number of edges fixed at $k(k+r)$.
- The entire graph factors because a finite $k$-regular bipartite graph is the edge-disjoint union of $k$ perfect matchings.
- The proof uses only standard finite graph theory, no number-theoretic unproved hypothesis.

## Novelty assessment

**This is not certified original.** Consecutive-one/convex bipartite graph matchings, bounded-band Toeplitz matrices and $k$-factor theorems are mature subjects. Related source checks:

- [Fulkerson (1964), *The Maximum Number of Disjoint Permutations Contained in a Matrix of Zeros and Ones*](https://doi.org/10.4153/CJM-1964-069-0): a highly relevant earlier treatment of **exactly the disjoint permutation-matrix packing objective**, in arbitrary supports; our construction may be a known easy special case.
- [Liu (2008), *Bipartite Toughness and k-Factors in Bipartite Graphs*](https://doi.org/10.1155/2008/597408): gives the generic necessary/sufficient min-cut characterization.
- [A linear-time maximum-matching algorithm for convex bipartite graphs (1996)](https://doi.org/10.1016/0898-1221(96)00079-X): matching algorithms for a broad host class.
- [Bipartite finite Toeplitz graphs (2013)](https://doi.org/10.1016/j.dam.2013.05.020): structural results for Toeplitz-related graphs.
- [Hao–Li–Yu (2025), *Bipartite binding number, k-factor and spectral radius*](https://doi.org/10.1016/j.disc.2025.114511): general factor criteria.

Targeted searches using "interval-sum graph factor min degree", "consecutive diagonals Toeplitz perfect matching packing", "band matrix k-factor", and "convex bipartite graph spanning regular factor" did **not locate an exact theorem matching our statement**. A search miss is not evidence of novelty, and the result may follow immediately from a known regular-factor property of special interval matrices. The proof is worth preserving as a **methodological control theorem**, not yet as a standalone publication claim.

## Implications and next gate

**For P003:** identify a tractable *sparse-support replacement* for the contiguous band lemma—e.g. an arithmetic cut inequality for prime-sum support. The present theorem does not imply any positive packing number for arbitrary nonconsecutive sum sets; $n=3$, allowed sums $\{1,3\}$, already gives minimum degree 1 and zero perfect matchings.

**For P005:** continue with canonical reconfiguration and invariant searches; nothing here addresses the switch graph.

**For the catalogue:** keep P001–P010, including the now-internally-proved P010, unchanged. Publish the unnumbered interval theorem under `theorems/` and link the audit. Do not present the general interval conjecture as still open.
