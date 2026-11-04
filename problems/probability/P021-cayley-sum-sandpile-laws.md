# P021 — Sandpile groups of random Cayley-sum graphs

<!-- DOSSIER-SUMMARY -->
> **Research question:** Does the Sylow-ell sandpile group of a random prime-cyclic Cayley-sum graph converge to a law different from Erdős–Rényi?  
> **Formulation:** candidate. **Novelty:** not certified (targeted audit).  
> **Verified/known progress:** Precisely defined correlated graph-Laplacian cokernel; no limiting group law yet proved.  
> **Finite evidence:** Model and connectivity-conditioning requirements specified; exact Smith-form experiments pending.  
> **Symbolic prize:** A Dinner (symbolic) — An explicit limiting Sylow-group distribution for the correlated Cayley-sum sandpile model.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

**Area:** random graphs, arithmetic groups, algebraic probability. **Status:** candidate (not certified novel or open).

## Precise question

For odd prime $q$, include every $s\in\mathbb F_q$ independently with fixed probability $0<\theta<1$. Put an edge between distinct $x,y\in\mathbb F_q$ iff $x+y\in S$; exclude loops. Write $G_q^+(S)$ for this **Cayley-sum**, not Cayley-difference, graph. Conditional on connectedness, let $K_q$ be the finite sandpile (critical) group, i.e. cokernel of any reduced integral Laplacian.

Fix a prime $\ell$. Does the law of the $\ell$-Sylow subgroup $K_q[\ell^\infty]$ converge as $q\to\infty$ through primes $q\ne\ell$? If so, characterize its limiting moments or the probability of every finite abelian $\ell$-group, and decide whether it coincides with the Erdős–Rényi random-graph sandpile law.

The connectivity conditioning prevents defining a finite critical group on a disconnected graph without further conventions; proving that the conditioning is asymptotically redundant at fixed $\theta$ is a separate preliminary step.

## Why this is structurally interesting

Only $q$ independent Bernoulli labels generate $\Theta(q^2)$ edges. A Laplacian's diagonal entries depend on the same labels as its off-diagonals. Repeated sum labels thus create algebraic dependencies not covered by assuming independent graph edges. This asks about **torsion of a correlated Laplacian**, not the clique homology of P014 or the Hankel matrix ensemble of P020.

## Obvious bounds and sanity checks

The group is well-defined if the graph is connected; its cardinality equals the number of spanning trees (classical matrix-tree theorem). The total edge count and Laplacian spectrum alone do not determine its invariant factors. No claim about universality can be inferred merely from edge density or the model's prime-cyclic symmetry.

## Closest prior art (29 October 2026)

- [Wood, *The distribution of sandpile groups of random graphs* (JAMS 2017)](https://doi.org/10.1090/jams/866): Erdős–Rényi graph sandpile limit, **independent edges**, not the sum-label model.
- [Mészáros, *The distribution of sandpile groups of random regular graphs* (2020)](https://doi.org/10.1090/tran/8127): random regular ensemble.
- [*Sandpile groups of Cayley graphs of $\mathbb F_2^r$* (2024)](https://doi.org/10.1080/00927872.2024.2347582): Cayley **difference graph** structural Smith forms, not this random sum graph.
- [*On subgraphs of random Cayley sum graphs* (2018)](https://doi.org/10.1016/j.ejc.2017.11.009): establishes that the dependent edge-label model itself is **not new**.

**Priority warning:** the exact sum-graph sandpile law was not located in this bounded search; this does *not* certify originality. First check whether a signed character diagonalization reduces the entire Laplacian cokernel to a known Cayley-group-ring theorem.

## Next falsification gate

Compute exact Smith forms at small primes $q$ for each label subset $S$; compare the $\ell$-rank and elementary-divisor probabilities to equal-size Erdős–Rényi graphs. Test the connectivity-conditioned distribution and the special prime $\ell=2$ separately. Do not claim a threshold for a nonmonotone group-type event.

