# P004 — Exchange connectivity of finite Sidon sets

<!-- DOSSIER-SUMMARY -->
> **Research question:** Are size-k Sidon sets connected by feasible one-mark exchanges below the square-root scale?  
> **Formulation:** candidate. **Novelty:** not certified; targeted literature comparison only.  
> **Verified/known progress:** Elementary connectivity theorem for N > 2(2k-1)^3.  
> **Finite evidence:** Small disconnected/connected cases enumerated.  
> **Symbolic prize:** One hundred grams of caviar — An asymptotic determination of the connectivity threshold for one-mark Sidon exchanges.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->


**Area:** additive combinatorics, graph reconfiguration  
**Status:** candidate question; novelty and unresolved status unverified  
**Proposed:** 28 October 2026

## Definitions

A subset $S\subseteq\{1,\ldots,N\}$ is *Sidon* if all positive differences $b-a$ for $a<b$ in $S$ are distinct (equivalently, the sums $a+b$ with $a\le b$ are distinct).

Define the *exchange graph* $\mathcal S_{N,k}$: its vertices are the $k$-element Sidon sets in $\{1,\ldots,N\}$, and two vertices are adjacent iff one element is replaced by another while preserving the Sidon condition.

## Main question

For every fixed $\varepsilon>0$, is $\mathcal S_{N,k}$ connected for all sufficiently large $N$ and every $1\le k\le(1-\varepsilon)\sqrt N$?

A weaker task is to determine the largest uniform-connectivity range $k=k(N)$.

## A rigorous sparse-regime theorem

**Theorem.** If $N>2(2k-1)^3$, then $\mathcal S_{N,k}$ is connected with diameter at most $2k$.

**Proof.** Suppose $S$ is Sidon of size $s$. To adjoin a point $x$, exclude the $s$ points already in $S$. Each old positive difference $d$ and each $a\in S$ exclude at most two solutions $x=a\pm d$, for at most $2s\binom{s}{2}$ additional forbidden choices. Finally, two new differences $|x-a|$ and $|x-b|$ collide only when $2x=a+b$, giving at most $\binom{s}{2}$ more exclusions. Altogether at most

$$
s+2s\binom{s}{2}+\binom{s}{2}\le s^3
$$

choices of $x$ are forbidden.

For any $k$-element Sidon sets $A,B$, greedily choose a $k$-element set $C$, disjoint from both, so that $A\cup C$ and $B\cup C$ are Sidon. At each step each union has size at most $2k-1$, so at most $2(2k-1)^3<N$ choices are forbidden across both. Thus a new element can always be selected.

Every $k$-subset of a Sidon set is Sidon. Exchange the elements of $A$ with those of $C$ one at a time (at most $k$ moves), then exchange those of $C$ with those of $B$ (at most $k$ more moves). This gives a path of length at most $2k$. $\square$

**Scope:** this theorem only covers a conservative $k=O(N^{1/3})$ range, well below the natural $N^{1/2}$ extremal scale.

## Open issues

- Find and verify smallest disconnected examples; dense small cases may fail connectivity.
- Improve the exponent $1/3$ toward $1/2$.
- Check the literature on Golomb-ruler exchanges, Sidon-set transformations, and combinatorial reconfiguration.

## Novelty audit

Not completed. The theorem has a complete elementary proof above but is **not claimed new**.

## Related literature

Golomb-ruler one-mark local searches are previously known; they often traverse invalid states and do not prove connectivity among Sidon-only states. This is **not a certification of novelty or of unresolved status**. Read the [full P001–P008 audit](../../literature-audits/2026-10-28-comprehensive-P001-P008.md) before citing this question in a mathematical publication.
