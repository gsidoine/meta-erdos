# P036 — When does a random Schur hypergraph acquire a 2-core?

<!-- DOSSIER-SUMMARY -->
> **Research question:** What is the threshold and critical law for a nonempty 2-core in the Schur-triple hypergraph induced by a random subset of [N]?  
> **Formulation:** candidate. **Novelty:** unverified; Schur Ramsey thresholds are close but the peeling observable is different.  
> **Verified/known progress:** A six-vertex four-edge 2-core has three free parameters and expected count of order N^3 p^6.  
> **Finite evidence:** Explicit four-edge incidence witness and exact small-N enumerations.  
> **Symbolic prize:** A Dinner (symbolic) — The critical scale and limiting law for the first nonempty two-core in a random Schur hypergraph.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

Let A be a binomial random subset of [N] with vertex-retention probability p. Form the 3-uniform hypergraph with edges {a,b,a+b}, for distinct positive a<b with a+b≤N, whenever all three entries belong to A.

**Problem.** Determine the threshold and critical-window limiting probability for a nonempty 2-core (the maximal subhypergraph of minimum degree at least two). Separately determine the onset of a linear-size core. These are not assumed to coincide.

## Arithmetic witness

For positive a,b,d with six distinct labels a,b,d,a+b,a+d,a+b+d at most N, four Schur triples form a 2-regular subhypergraph:

- {a,b,a+b}
- {a,d,a+d}
- {b,a+d,a+b+d}
- {d,a+b,a+b+d}

There are Θ(N³) such instances, giving an expected count Θ(N³ p⁶). This identifies p~N^(-1/2) as a **first-moment scale for this witness**, not as a proven threshold for the appearance of any 2-core. Overlaps and other witnesses remain to be analyzed.

There is also a five-vertex four-edge core on {a,2a,3a,4a,5a}, using {a,2a,3a}, {a,3a,4a}, {a,4a,5a}, {2a,3a,5a}. It has Θ(N) realizations and expected count Θ(N p⁵), so its own first-moment scale is N^(-1/5).

## Related results

Graham, Rödl and Ruciński, *On Schur Properties of Random Subsets of Integers*, J. Number Theory 61 (1996), 388–408, https://doi.org/10.1006/jnth.1996.0155, prove an N^(-1/2) threshold for a Schur Ramsey property, not the stated peeling-core event. **Their Section 4 explicitly studies fairly simple hypergraph cycles, spoiled paths, and handles in the same Schur-triple hypergraph.** Those configurations are highly relevant structural predecessors; the present core problem must be compared at theorem level with their probabilistic lemma before any originality claim.

*Sharp thresholds for Ramsey properties* (Forum of Mathematics, Sigma, 2026), https://www.cambridge.org/core/journals/forum-of-mathematics-sigma/article/sharp-thresholds-for-ramsey-properties/37118888483709FB8C79D6FDB0F7F254, studies Schur hypergraphs and related Ramsey thresholds. Cooley, Kang and Zalla, *Loose Cores and Cycles in Random Hypergraphs*, Electron. J. Combin. 29 (2022), https://doi.org/10.37236/10794, study loose cores in independent-edge hypergraphs, a distinct model and core notion.

The exact vertex-sampled Schur 2-core critical law was not located in the targeted searches. Historical novelty is **unverified**. The nonempty-core threshold and the possible contribution of larger arithmetic cores remain open in this dossier. 


## Internally proved critical-scale witness theorem

A [Poisson approximation and second-moment calculation](../../theorems/P036-separated-pasch-poisson-law.md) establish the following for a separated three-parameter family of six-vertex four-edge Schur 2-cores:

- At $p=cN^{-1/2}$, the number of such configurations converges in distribution to $\mathrm{Poisson}(10^{-6}c^6)$.
- If $pN^{1/2}\to\infty$, the hypergraph has a nonempty 2-core with high probability.

These are **one-sided results**. Neither the absence of all cores when $p=o(N^{-1/2})$ nor the full limiting law for the 2-core event is established. The proof uses a finite rank audit of the six associated linear forms, and historical priority remains unverified.
