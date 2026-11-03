# P038 — How large can an induced matching in the coprime graph be?

<!-- DOSSIER-SUMMARY -->
> **Research question:** How close to the Bollobás set-pair upper bound can an induced matching of the coprime graph on [N] be?  
> **Formulation:** candidate. **Novelty:** unverified; classical Bollobás set-pair extremality is the main predecessor.  
> **Verified/known progress:** Internally proved log M(N)=T(N) log 2 + O(sqrt(T(N) log T(N))), where T is the inverse N² primorial cutoff.  
> **Finite evidence:** Explicit complementary-prime induced matching construction checked for finite prime blocks.  
> **Symbolic prize:** One small beer — A sharpened asymptotic error term for the logarithm of the coprime-graph induced-matching number.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

Let $M(N)$ be the maximum number of disjoint pairs $(a_i,b_i)$ of distinct integers in $[N]$ with $\gcd(a_i,b_i)=1$ but with **all four cross-gcds greater than one** for every $i\ne j$.

## Research question

Determine the subexponential factor in $M(N)$ and classify its near-extremal prime-factor configurations. More sharply, is the logarithm of $M(N)$ within $O(\log T(N))$ of the best Bollobás set-pair upper bound, where

$$
T(N)=\max\left\{t:\prod_{i=1}^t p_i\le N^2\right\}?
$$

## Proved baseline

The [prime-support set-pair argument](../../theorems/P038-coprime-induced-matching-bollobas.md) establishes

$$
T(N)\log2-O(\sqrt{T(N)\log T(N)})\le
\log M(N)\le T(N)\log2.
$$

In particular,

$$
\log M(N)\sim 2\log2\,\frac{\log N}{\log\log N}.
$$

The proof combines the classical Bollobás inequality with an explicit blockwise-balanced partition of the first $t$ primes. These are internally proved statements, **not** certified new literature results. The proposed logarithmic-error improvement and extremal stability are not proved.

## Literature and editorial status

- Bollobás (1965) set-pair inequality, with extremal complementary-set constructions. A modern entry point is Füredi–Gyárfás–Király (2023): https://doi.org/10.1017/S0963548323000044.
- *Variations on the Bollobás set-pair theorem* (2024): https://doi.org/10.1016/j.ejc.2024.103983.
- Erdős–Sárközy (1997), *On cycles in the coprime graph of integers*: https://www.combinatorics.org/ojs/index.php/eljc/article/download/v4i2r8/pdf/.

The exact arithmetic induced-matching asymptotic was not found in a targeted literature search, but the general set-pair mechanism is classical. The main remaining research issue concerns the fine cost of representing complementary set systems by integer prime products. The finer extremal problem has not been identified in the cited sources.
