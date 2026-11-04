# P030 — Perfect matchings with prime sums and prime differences

<!-- DOSSIER-SUMMARY -->
> **Research question:** Does a perfect matching exist for every even n≥8 in the graph of integer pairs whose sum and absolute difference are both prime?  
> **Formulation:** candidate. **Novelty:** not certified; prime sum/difference cycles have explicit earlier study.  
> **Verified/known progress:** Every odd n is impossible by parity; exact finite matchings exist for every even n in [8,400], while n=2,4,6 fail.  
> **Finite evidence:** Dependency-free exact bipartite matching checker for every even n≤400 and parity obstruction.  
> **Symbolic prize:** A Coffee (symbolic) — A perfect double-prime matching for every even order at least eight, or an exceptional order.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

**Area:** additive number theory, combinatorial matchings, prime patterns. **Status:** candidate requiring historical review.

## Precise graph

Let D_n be the simple graph on vertices [n], where i≠j is an edge iff **both** i+j and |i−j| are prime. Let ν(D_n) denote its maximum matching number.

**P030.** Is ν(D_n)=n/2 for every even n≥8? More strongly, can one prove a uniform lower bound on the number of such perfect matchings, or characterize edge expansion and robust perfect matching after deletion?

This is **an undirected pairing of the integers**, not a bipartite permutation between two copies (the latter is an easier/different constraint) and not a Hamiltonian ordering.

## Exact parity obstruction

If i+j is prime, it could be 2 only for i=j=1, but distinct vertices are required; thus i+j is odd and i,j have opposite parity. The absolute difference is then automatically odd, though it still must be prime. Therefore D_n is bipartite between odd and even integers and **has no perfect matching for odd n**. For even n, the two parts have equal size.

Exact maximum matchings show n=2,4,6 lack a perfect matching; every even n from 8 to 400 admits one. The [standard-library verifier](../../experiments/P030_double_prime_matchings.py) records the finite certificate; this is **not an infinite theorem**.

## Closest previously published mathematics

- [OEIS A227050](https://oeis.org/A227050): counts **Hamiltonian circular orderings** of [2n] with both adjacent sums and differences prime. This is a **strong direct thematic predecessor**, but a Hamiltonian cycle is not the same as a perfect matching (it does, however, imply one by taking alternate edges). **Important consequence:** every n for which A227050(n)>0 is automatically a proved *finite positive instance* of the present pairing question. Do not claim such finite examples as new.
- [OEIS A073364](https://oeis.org/A073364): permutations with prime sums alone; a different, much less constrained host.
- [Prime Sum Graphs and the Induced Trees They Contain (2025)](https://doi.org/10.1007/s00373-025-02999-2): prime-sum graph structure without prime-difference constraint.

**Priority hazard:** related Hamiltonicity results might imply matching existence for all sufficiently large even n. Review the literature behind A227050 before claiming this is an unresolved problem.

## First theoretical targets

Try a Hall-type expansion argument for the odd/even bipartition, accounting for primality of two correlated linear forms. Conversely look for an arithmetic congruence obstruction at some even n. Do not infer an asymptotic theorem from computed matchings.
