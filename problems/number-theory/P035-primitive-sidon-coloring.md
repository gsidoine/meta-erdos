# P035 — Sidon coloring by divisibility antichains

<!-- DOSSIER-SUMMARY -->
> **Research question:** Can [N] be partitioned into (1+o(1))sqrt(N) sets, each Sidon and a divisibility antichain?  
> **Formulation:** candidate. **Novelty:** high overlap risk: Sidon–Ramsey coloring and primitive sets.  
> **Verified/known progress:** (1-o(1))sqrt(N) <= chi_PS(N) <= (1+sqrt(2)+o(1))sqrt(N), using dyadic bands.  
> **Finite evidence:** Elementary proof from classical Sidon coloring; no finite exhaustive claim.  
> **Symbolic prize:** One hundred grams of caviar — An asymptotically optimal Sidon and divisibility-antichain coloring, or a larger lower bound.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

**Status:** candidate; historical novelty and open status are not independently certified.

## Question

Color all integers in $[N]$, requiring every color class $A$ to satisfy both:

1. **Sidon:** $a+b=c+d$ with $a\le b$, $c\le d$, and all four elements in $A$ forces $\{a,b\}=\{c,d\}$.
2. **Primitive:** for distinct $a,b\in A$, neither $a\mid b$ nor $b\mid a$.

Let $\chi_{\mathrm{PS}}(N)$ be the minimum number of colors.

**P035.** Is $\chi_{\mathrm{PS}}(N)=(1+o(1))\sqrt N$?

This is a coloring question, **not** the P031 question about a single pairwise-coprime Sidon set. Incomparability under divisibility is much weaker than pairwise coprimality.

## Rigorous baseline

**Theorem (elementary reduction).**

$$
(1-o(1))\sqrt N\le \chi_{\mathrm{PS}}(N)\le
(1+\sqrt 2+o(1))\sqrt N.
$$

**Lower bound.** Every color class is Sidon in $[N]$, and the classical Erdős–Turán bound makes its size at most $(1+o(1))\sqrt N$. Thus at least $(1-o(1))\sqrt N$ classes are required.

**Upper bound.** For $j\ge0$, let

$$
B_j=\{m\in[N]:N/2^{j+1}<m\le N/2^j\}.
$$

Every $B_j$ is primitive: if distinct $a<b$ in the same band had $a\mid b$, then $b\ge2a>N/2^j$, impossible. The length of $B_j$ is at most $N/2^{j+1}+1$. The classical Sidon-coloring theorem partitions any interval of $M$ consecutive integers into $(1+o(1))\sqrt M$ Sidon classes as $M\to\infty$; translating a Sidon partition preserves the Sidon property. Use **disjoint color palettes for different bands**, making every resulting class simultaneously Sidon and primitive.

The leading color count is therefore bounded by

$$
\sum_{j\ge0}\sqrt{\frac N{2^{j+1}}}
=\frac{1}{\sqrt2-1}\sqrt N
=(1+\sqrt2)\sqrt N.
$$

To justify summing the asymptotic error terms, split the bands where the band length is at least $(\\log N)^4$ from the remaining tail. For the long bands, the asymptotic Sidon-coloring bound is uniform because their lengths all tend to infinity. The short bands contain altogether $O((\\log N)^4)$ integers and may be colored with singleton classes, which contribute $o(\\sqrt N)$. This proves the stated $1+\\sqrt2$ upper constant.

## Why the question is not settled by the baseline

A classical optimal Sidon partition need not respect divisibility. Conversely, using separate colors for each dyadic multiplicative antichain loses a geometric factor $1+\sqrt2$. To obtain constant one, one must coordinate additive and multiplicative conflicts across bands. An arbitrary-Sidon-set result or a primitive-set result alone cannot provide that coordination.

## Literature and originality gate

- [Classical Sidon coloring of integer intervals](https://mathoverflow.net/questions/461551/bounds-on-how-many-sidon-sets-required-to-cover-an-integer-range-from-0-n) gives the sharp $(1+o(1))\sqrt N$ coloring rate without divisibility constraints.
- [Erdős Problems: primitive sets](https://www.erdosproblems.com/tags/primitive%20sets) documents the older divisibility-antichain literature.
- [Erdős Problems: Sidon sets](https://www.erdosproblems.com/tags/sidon%20sets) documents closely related additive extremal questions.
- [Kohayakawa–Lee–Rödl–Samotij](https://www.math.tau.ac.il/~samotij/papers/Sidon.pdf) is relevant background on Sidon subsets and colorings.

The combination is a plausible **new formulation**, not a certified new or open research problem. Exact matches may occur in the literature under *rainbow*, *harmonious*, *Sidon chromatic*, or *divisibility antichain coloring*. A specialist bibliographic search is required before asserting originality.

## Falsification

Either prove $\liminf \chi_{\mathrm{PS}}(N)/\sqrt N>1$, or produce colorings with $(1+o(1))\sqrt N$ colors. More modestly, improve the elementary $1+\sqrt2$ upper constant without merely changing the dyadic cutoff.


## Relation to existing results

**Known comparison.** The Sidon partition theorem SR(k)=k²+o(k²) is established by Espinosa-García et al. (2024), Theorem 1, DOI 10.1007/s40590-024-00676-7. The dyadic bound is a combination of classical coloring and primitive-band observations, not an original foundational theorem. Originality of the simultaneous constraint remains unverified.


## Related resolved extremal question (distinct from the coloring problem)

The maximum size of a **single** Sidon set that is also a divisibility antichain is $(1+o(1))\sqrt N$. An elementary [translation-and-divisor-sum argument](../../theorems/P035-primitive-sidon-translation-lemma.md) establishes this sharp leading constant. This does **not** resolve the minimum number of primitive Sidon classes needed to partition $[N]$, and historical priority for the combined extremal observation remains unverified.


## Proved supporting corollary: a large primitive Sidon class

Let $F_{\mathrm{PS}}(N)$ be the maximum cardinality of a subset of $[N]$ that is both Sidon and primitive (an antichain under divisibility). Then

$$
\boxed{F_{\mathrm{PS}}(N)=(1+o(1))\sqrt N.}
$$

**Proof as a corollary of Sidon graph resilience.** Let $G_N$ have vertex set $[N]$ and edges $\{a,b\}$ precisely when $a\ne b$ and one of $a,b$ divides the other. Its edge count satisfies

$$
e(G_N)=\sum_{a=1}^{N}\bigl(\lfloor N/a\rfloor-1\bigr)
=O(N\log N)=o(N^{3/2}).
$$

By the [Singer–Turán Sidon resilience theorem](../../theorems/sidon-forbidden-graph-resilience.md), $G_N$ contains an independent Sidon set of size $(1-o(1))\sqrt N$. Its independence means exactly that no two distinct members divide one another. The classical Sidon bound provides the matching upper estimate. $\square$

The [direct translation-and-divisor-sum proof](../../theorems/P035-primitive-sidon-translation-lemma.md) gives the same conclusion without appealing to Singer's cyclic designs. The general resilience theorem also proves the worst-case order

$$
\min_{e(G)\le m}\max\{|A|:A\subseteq[N]\text{ is Sidon and }G\text{-independent}\}
=\Theta\left(\min\left\{\sqrt N,\frac{N^2}{m+N}\right\}\right).
$$

**Scope.** This corollary concerns the size of **one** primitive Sidon class; it does not determine the chromatic number of the graph of Sidon/divisibility constraints or settle the covering/partition conjecture posed in P035. The general resilience theorem is a supporting result, not a corollary *of the conjecture itself*. Its finite-design and extremal ingredients are classical, and historical originality of the combined formulation has not been established.
