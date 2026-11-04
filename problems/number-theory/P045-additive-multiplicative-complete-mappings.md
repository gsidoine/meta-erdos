# P045 — Additive complete mappings with almost distinct products

<!-- DOSSIER-SUMMARY -->
> **Research question:** For every prime p>=5, is there a permutation f of F_p such that x+f(x) permutes F_p and xf(x) has exactly p-2 distinct values?  
> **Formulation:** candidate. **Novelty:** unverified; additive and multiplicative complete mappings have extensive literature.  
> **Verified/known progress:** Internally proved that at least two multiplicative image defects are unavoidable for p>=5; the bound is attained at p=5,7,11,13.  
> **Finite evidence:** Explicit complete-mapping permutation witnesses and independent exact checks.  
> **Symbolic prize:** A Coffee (symbolic) — A complete construction of almost-distinct-product additive complete mappings for all primes at least five, or a counterexample.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

For a prime $p$, call a permutation $f:\mathbb F_p\to\mathbb F_p$ *additively complete* if $x\mapsto x+f(x)$ also permutes $\mathbb F_p$. Put

$$
D(p)=\max_f |\{xf(x):x\in\mathbb F_p\}|,
$$

where the maximum is restricted to additively complete $f$.

**Question.** Is $D(p)=p-2$ for every prime $p\ge5$?

## Proved result

The [sum–product obstruction theorem](../../theorems/P045-additive-multiplicative-permutation-defect.md) gives $D(p)\le p-2$ for every $p\ge5$. It combines the identity $\sum_xxf(x)=0$ with the nonzero-product identity when $f(0)=0$. Exact permutations attain equality at $p=5,7,11,13$. General attainability is not established.

## Sources

Additive complete mappings and multiplicative orthomorphisms are established objects: [Bors–Wang (2023)](https://doi.org/10.1016/j.jcta.2022.105723), [Muratović-Ribić–Surdulli (2020)](https://doi.org/10.5644/SJM.16.01.10), and [Zieve's complete permutation polynomial constructions](https://websites.umich.edu/~zieve/papers/pp-complete.html). The exact near-injective product objective requires further historical review. The [finite verifier](../../experiments/P045_additive_multiplicative_permutations.py) certifies only the listed small-prime witnesses.
