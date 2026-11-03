# P020 — Cokernels of random $p$-adic Hankel matrices

<!-- DOSSIER-SUMMARY -->
> **Research question:** Does the cokernel of an n×n Haar-random p-adic Hankel matrix converge in distribution to a describable measure on finite abelian p-groups?  
> **Formulation:** candidate. **Novelty:** apparent novelty (targeted audit).  
> **Verified/known progress:** Classical Hankel corank law; internally proved cyclic/two-generator probabilities and all-k elementary-abelian cokernel probabilities.  
> **Finite evidence:** Exact modular group counts at p=2 (n≤4), p=3 (n≤3); kernel-product rank proved from Yiasemides (2024).  
> **Symbolic prize:** A live goose — An explicit limiting distribution for random p-adic Hankel cokernels, or a proof that it does not exist.; A small black coffee — An exact probability for a previously untreated three-generator higher-exponent cokernel class.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

**Subject:** algebraic probability  
**Formal proof:** not yet verified in Lean

## Problem

Fix a prime $p$. Let $H_n=(X_{i+j})_{0\le i,j<n}$ with independent Haar-uniform $p$-adic coefficients $X_0,\ldots,X_{2n-2}$, and let $C_n=\mathrm{coker}(H_n)$.

**Question.** Does the distribution of $C_n$, as $n\to\infty$, converge to an explicit probability measure on finite abelian $p$-groups?

## Established progress

The classical finite-field Hankel corank distribution is known. The repository contains internally proved formulas for cyclic, two-generator, and all elementary-abelian cokernel probabilities. The *complete* limiting distribution, including higher-exponent groups with at least three generators, remains unresolved. The kernel classification imported from Yiasemides is explicitly attributed.

## Supporting material

- [Known theorems and exact proof references](proofs/README.md)
- [Closest literature](references/prior-art.md)
- [Higher-exponent obstruction](exploration/README.md)
- [Finite-field rank verifier](verification/P020_hankel_finite_field_ranks.py)
- [Additional exact verification scripts](verification/README.md)
- [Lean formalization status](formal/README.md)
- [Historical full dossier](../number-theory/P020-random-hankel-padic-cokernels.md)

See [Contributing](../../CONTRIBUTING.md) for corrections, independently checked proofs, or formalizations.
