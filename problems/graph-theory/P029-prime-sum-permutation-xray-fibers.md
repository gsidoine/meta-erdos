# P029 — Reconfiguration of prime-supported permutation X-ray fibers

<!-- DOSSIER-SUMMARY -->
> **Research question:** Is there a universal bounded-size exchange connecting every fiber of prime-sum permutations with the same anti-diagonal X-ray?  
> **Formulation:** reframe. **Novelty:** known exact anti-diagonal X-ray invariant; novelty of prime-restricted bounded Markov moves unverified.  
> **Verified/known progress:** No two-position swap can preserve a nontrivial exact sum multiset; an explicit prime-supported fiber with two members differs at four positions.  
> **Finite evidence:** Exhaustive prime-sum matching fiber enumeration for n≤13; dependency-free script.  
> **Symbolic prize:** Five small beers — A universal bounded-size exchange theorem for nontrivial prime-sum X-ray fibers, or counterexamples with unbounded exchange size.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

**Area:** combinatorics, graph reconfiguration, discrete tomography. **Status:** reframe; the X-ray invariant is classical, while the prime-restricted move-size question requires a separate theorem and priority review.

## Exact fiber

Let S_n^prime={σ∈S_n: i+σ(i) is prime for every i∈[n]}. For σ∈S_n^prime define its full **prime anti-diagonal histogram**

$$
c_q(\sigma)=\#\{i\in[n]:i+\sigma(i)=q\}
$$

for every prime q≤2n. Given a realizable histogram c, let F_{n,c} consist of the permutations with that histogram. Let R_{n,c}^{(r)} have vertices F_{n,c}, with two states joined if they differ at at most r positions (a simultaneous reassignment of their values at those positions).

**P029.** Is there an absolute r such that every nonempty F_{n,c} is connected in R_{n,c}^{(r)}, uniformly for all n? If not, determine the growth of the smallest sufficient move size r(n).

## A rigorous obstruction and witness

A nontrivial two-position swap changes values a,b assigned to two distinct positions i,j. Its two sum labels change from {i+a,j+b} to {i+b,j+a}. Equality of these two **multisets** forces either a=b or i=j. Hence no such move preserves a fiber for distinct positions and values.

For n=4, the two different valid prime-sum permutations

$$
\sigma=(2,3,4,1),\qquad\tau=(4,1,2,3)
$$

both have histogram {3,5,5,7}; they differ in **all four positions**. The fiber has exactly these two states, so the universal move size, if any, must satisfy r≥4. All these claims are independently enumerable.

## Known nearest subject

- [Bebeacua–Mansour–Postnikov–Severini, *On the X-rays of permutations* (2005)](https://doi.org/10.1016/j.endm.2005.05.063): the **same anti-diagonal histogram object** in unrestricted permutations is classical. No novelty claim for X-rays.
- [Del Lungo, *Reconstructing permutation matrices from diagonal sums* (2002)](https://doi.org/10.1016/S0304-3975(02)00015-4): inverse problems for diagonal data.
- [OEIS A073364](https://oeis.org/A073364): counts prime-sum permutations, so existence/counts are **known**.
- [Heat-bath random walks with Markov bases (2018)](https://doi.org/10.1016/j.aam.2017.08.002): general fiber reconfiguration/sampling framework.

**High redundancy risk:** a known Markov basis for the anti-diagonal permutation matrix fibers may settle bounded connectivity, either with or without prime restriction. Check toric presentations and the exact swap support before flagship promotion. There is no assertion that the restricted question is independently open.

## Finite cases and open questions

Compute R_{n,c}^{(3)}, R_{n,c}^{(4)}, … for the small fibers and test whether prime support requires larger moves than unrestricted tomography. Distinguish (i) preserving the X-ray after every move from (ii) merely preserving it at the endpoints.


## Relation to existing results

Anti-diagonal X-ray invariants and fiber moves are established objects of discrete tomography. The distinction of interest is the restriction to prime-supported permutations and the move size required within those fibers.


