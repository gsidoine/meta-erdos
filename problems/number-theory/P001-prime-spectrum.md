# P001 — Prime-spectrum saturation

<!-- DOSSIER-SUMMARY -->
> **Research question:** Does the maximum distinct-prime-sum deficit of a prime-sum perfect matching stay bounded?  
> **Formulation:** candidate. **Novelty:** not certified; targeted literature comparison only.  
> **Verified/known progress:** Interior prime sums realized by a partial matching; completion is open in this study.  
> **Finite evidence:** Exact small matching optimization.  
> **Symbolic prize:** A small black coffee — A proof of bounded prime-sum deficit, or an unbounded sequence of deficits.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->


**Area:** additive number theory, rainbow matchings  
**Status:** candidate question; novelty and unresolved status unverified  
**Proposed:** 28 October 2026

## Definition

Let $M$ range over perfect matchings of $\{1,\dots,2n\}$ for which every paired sum $a+b$ is prime. Such matchings exist, for example by a Bertrand-postulate induction. Put

$$
R(n)=\max_M |\{a+b:\{a,b\}\in M\}|,
\qquad
D(n)=\pi(4n-1)-1-R(n).
$$

Here $\pi$ is the prime-counting function. The $-1$ excludes the prime $2$, which cannot be the sum of two *distinct* positive integers.

## Main question

**Is $D(n)$ bounded as $n\to\infty$?**

A weaker question is whether $R(n)\sim\pi(4n)$.

### Immediate obstruction

The sum $3$ requires $\{1,2\}$. The sum $5$ requires $\{1,4\}$ or $\{2,3\}$. Both sums cannot occur in one perfect matching. Thus $D(n)\ge1$ for $n\ge2$.

## Rigorous partial result

**Proposition.** For any fixed $0<\varepsilon<2$ and all sufficiently large $n$, one can select pairwise vertex-disjoint pairs from $\{1,\ldots,2n\}$ whose sums realize **every prime** in
$[\varepsilon n,(4-\varepsilon)n]$.

**Proof.** Any odd prime $p$ in this interval has at least $\varepsilon n/2-O(1)$ representations $p=a+b$ with $1\le a<b\le 2n$, uniformly in $p$. For a fixed $p$, these representation pairs are vertex-disjoint. By the prime number theorem there are only $O(n/\log n)=o(n)$ target primes. Choose a representation for each target prime greedily. Previously chosen pairs use $o(n)$ vertices, and can therefore block only $o(n)$ of the $\Omega(n)$ candidate pairs for the next prime. A disjoint choice always remains. $\square$

**The gap:** A partial matching realizing many sums need not extend to a *prime-sum perfect matching*. The completion problem is substantial.

## Next attacks

- Prove or refute a uniform bound on $D(n)$.
- Search for small-prime incompatibilities and forced-pair obstructions.
- Investigate absorption, matching completion, or rainbow-matching techniques.
- Reproduce earlier exploratory optimization observations with published solver code before citing their numerical values.

## Novelty audit

Not completed. Check research on prime-sum partitions, rainbow perfect matchings, and arithmetic matchings. Do not present this as a certified new open problem.

## Related literature

Greenfield–Greenfield (1998) establishes the prime-pairing foundation; see exact rainbow-matching connections in the audit. This is **not a certification of novelty or of unresolved status**. Read the [full P001–P008 audit](../../literature-audits/2026-10-28-comprehensive-P001-P008.md) before citing this question in a mathematical publication.
