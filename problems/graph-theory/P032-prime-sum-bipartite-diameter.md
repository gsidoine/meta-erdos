# P032 — Is the prime-sum bipartite diameter eventually seven?

<!-- DOSSIER-SUMMARY -->
> **Research question:** Does the bipartite graph on two copies of [n], joined when i+j is prime, have diameter exactly seven for all sufficiently large n?  
> **Formulation:** candidate. **Novelty:** high overlap risk: prime-difference conjectures.  
> **Verified/known progress:** Only prime-sum-two edge is a bridge; diameter seven is equivalent to uniformly finding prime pairs with prescribed even differences in bounded intervals.  
> **Finite evidence:** Exact bridge-based diameters for 2≤n≤250; independent all-pairs BFS for n≤35.  
> **Symbolic prize:** One kilogram of bacon — A proof of eventual diameter seven in prime-sum bipartite graphs, or infinitely many failures.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

**Area:** prime number theory and graph metric geometry. **Status:** candidate with a strong predecessor/source gate.

## The question

Let B_n have vertices L_1,…,L_n and R_1,…,R_n, with L_iR_j an edge when i+j is prime.

**P032.** Does

$$
\boxed{\mathrm{diam}(B_n)=7}
$$

hold for every sufficiently large n? Is it already true for n≥8?

This is the **two-copy bipartite graph**, not the ordinary n-vertex prime-sum graph studied in Filz's Hamiltonicity conjecture.

## Rigorous structural reduction

Every prime sum is odd except 2, and the only edge of sum 2 is L_1R_1. Deleting this edge separates B_n into parity subgraphs:

- H_0: left odd indices and right even indices;
- H_1: left even indices and right odd indices.

These two graphs are isomorphic by swapping left and right. When each is connected, the bridge implies

$$
\mathrm{diam}(B_n)=2\,\mathrm{ecc}_{H_0}(L_1)+1.
$$

For n≥8, the vertex R_8 has distance at least 3 from L_1 because 1+8=9 is composite. All right-even vertices have a prime-sum neighbor by Bertrand's postulate. Consequently eccentricity 3 is equivalent to:

> For every odd a≤n, some even j≤n has both j+1 and j+a prime.

Equivalently, **every even gap d≤n−1 is realized as a difference of two primes** p and p+d with p−1 even and 2≤p−1≤n, plus the existing connectivity of the parity component. This is an interval-constrained prime-difference problem. It is not proved by Bertrand's postulate alone.

The [exact graph verifier](../../experiments/P032_prime_sum_diameter.py) checks finite instances, not the uniform prime-difference conjecture.

## Direct predecessors

- [Erdős Problems #17](https://www.erdosproblems.com/17): prime-difference coverage with all primes bounded by another prime; closely related and a strong possible subsumption.
- [Croot–Jin, *Prime Sum Graphs and the Induced Trees They Contain*](https://doi.org/10.1007/s00373-025-02999-2): modern prime-sum graph theory.
- [Chen–Fu–Guo, *Hamiltonicity in Prime Sum Graphs*](https://doi.org/10.1007/s00373-020-02241-1): older graph uses one vertex copy and a distinct invariant.

**Priority warning:** this question may be an elementary reformulation of already-studied prime-difference coverage. Establish independent mathematical significance before presenting it as a novel conjecture.


## Relation to existing results

The diameter-seven assertion imposes uniformly constrained differences of primes. Its relation to Erdős Problem 17 and existing prime-difference results remains unresolved. The enumerated cases are finite evidence only.


