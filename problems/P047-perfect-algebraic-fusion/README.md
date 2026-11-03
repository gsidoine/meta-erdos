# P047 — Full-dimensional simultaneous Sidon sets

<!-- DOSSIER-SUMMARY -->
> **Research question:** Does F_4[[T]] contain a compact perfect set of Hausdorff dimension one with no four distinct elements satisfying either a+b=c+d or ab=cd?  
> **Formulation:** candidate. **Novelty:** unverified; close to Mycielski perfect-set fusion and quantitative pattern avoidance in local fields.  
> **Verified/known progress:** An explicit compact perfect, 1/2-Ahlfors-regular simultaneous additive/multiplicative four-point Sidon set is proved below. Fraser's local-field theorem already supplies the dimension-1/2 existence bound.  
> **Finite evidence:** Exact symbolic argument and finite polynomial checks of up to 64 elements; dimension-one existence is not established.  
> **Symbolic prize:** A bottle of wine — A full-dimensional compact perfect simultaneous four-point Sidon set, or a proof that none exists.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

**Area:** topological combinatorics  
**Formal verification:** none.

## Problem

Let $R=\mathbb F_4[[T]]$, equipped with $d(x,y)=4^{-v_T(x-y)}$ for $x\ne y$. Does there exist a compact perfect set $P\subset R$ of Hausdorff dimension $1$ such that, whenever $a,b,c,d\in P$ are pairwise distinct,

$$
a+b\ne c+d,\qquad ab\ne cd?
$$

The requirement concerns **four distinct elements**; it is not the usual additive $B_2$ condition with repeated entries, which degenerates in characteristic two.

The weaker quantitative question is whether the dimension can exceed $1/2$. This does not logically imply the existence of a set attaining dimension $1$.

## Established result

There exists such a compact perfect set of Hausdorff dimension $1/2$, which is also $1/2$-Ahlfors regular (and has positive finite $1/2$-dimensional Hausdorff measure). A direct construction takes $\alpha\in\mathbb F_4\setminus\mathbb F_2$ with $\alpha^2+\alpha+1=0$, and

$$
P=\{x+\alpha x^3:x\in T+T^2\mathbb F_2[[T]]\}.
$$

The additive and multiplicative two-point maps are injective on unordered pairs from this set. The complete argument is in [the proof](proofs/half-dimensional-construction.md).

Fraser's local-field polynomial-avoidance theorem (Theorem 1.1 of *Large Subsets of Local Fields Not Containing Configurations*) already proves the existence of sets of Hausdorff dimension $1/2$ avoiding both displayed equations, since their degrees are at most two. Applied only to the additive equation, the same theorem yields a set of Hausdorff dimension $1$. Thus the quantitative $1/2$ existence bound is **known**; the construction above is a self-contained explicit and regular example, not an improvement of that bound.

## Context

The Banach–Mazur and Choquet games motivate the category-theoretic setting. Mycielski's theorem already gives perfect sets simultaneously avoiding countably many nowhere-dense finite-arity relations, and Mátrai introduced fusion games for infinite-dimensional perfect-set theorems. Requiring a prescribed Hausdorff dimension is a metric strengthening of the avoidance problem; **no novelty is claimed for perfect-set fusion games themselves**.

Closely related work on algebraically pattern-free sets with large Hausdorff dimension means **neither novelty nor the open status of this exact dimension-one question has been certified**.

## Supporting material

- [Explicit construction and proof](proofs/half-dimensional-construction.md)
- [Baire-category formulation and a disproved initial cardinal question](exploration/README.md)
- [Comparison with relevant literature](references/prior-art.md)
- [Reproducible finite polynomial checks](verification/P047_sidon.py)
