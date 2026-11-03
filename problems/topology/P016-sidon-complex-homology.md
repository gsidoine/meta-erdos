# P016 — Topological connectivity of the Sidon simplicial complex

<!-- DOSSIER-SUMMARY -->
> **Research question:** Does each fixed-dimensional reduced homology group of the simplicial complex of all Sidon subsets of [N] vanish for all sufficiently large N?  
> **Formulation:** candidate. **Novelty:** not certified; targeted literature comparison only.  
> **Verified/known progress:** Minimal nonfaces have size 3 or 4; exact F2 Betti numbers exhibit migration from lower to higher dimensions.  
> **Finite evidence:** Exact augmented boundary-rank computations through N=23; no asymptotic vanishing claim.  
> **Symbolic prize:** One kilogram of bacon — A proof of eventual vanishing for each fixed homological degree, or an infinite nonvanishing family.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

**Fields:** additive combinatorics, topological combinatorics, simplicial complexes  
**Research status:** candidate; *not* certified new or unresolved.

## Definition and central question

For $N\ge1$, define the **Sidon complex** $K_N$ on vertices $1,\ldots,N$. A subset $A\subseteq[N]$ is a face precisely when all its positive pairwise differences are distinct:

$$
K_N=\left\{A\subseteq[N]:
\left|\bigl\{b-a:a,b\in A,\ a<b\bigr\}\right|
=\binom{|A|}{2}\right\}.
$$

This is a simplicial complex because every subset of a Sidon set is Sidon. Its dimension is $\max\{|A|-1:A\in K_N\}$, governed by classical extremal Sidon-set theory.

**P016.** For every fixed $k\ge1$, does there exist $N_k$ such that

$$
\widetilde H_k(K_N;\mathbb F_2)=0
\quad\text{for every }N\ge N_k?
$$

If so, determine the smallest eventual-vanishing thresholds $N_k$, and describe the **dimensions and scales of persistent nonzero homology** as $N$ increases. Do analogous claims hold over $\mathbb Z$, possibly with torsion?

The word *eventual* is essential: the inclusion $K_N\hookrightarrow K_{N+1}$ does **not** make individual Betti numbers monotone. The question does not assert that the vanishing observed at a small $N$ continues indefinitely.

## Elementary structure: a non-flag independence complex

**Proposition.** Every two-element subset of $[N]$ is a face. A three-element subset fails the Sidon condition if and only if it forms a three-term arithmetic progression. More generally, all **minimal nonfaces** have cardinality $3$ or $4$.

**Proof.** Two distinct unordered pairs of elements have the same positive difference exactly when they make a nontrivial equality of the form $b-a=d-c$. If the pairs share a vertex, equality forces a three-term arithmetic progression. Otherwise the four endpoints are distinct and form a four-element additive collision. Any larger non-Sidon set therefore contains a non-Sidon three- or four-subset. Conversely, these collisions are minimal when they contain no smaller collision. $\square$

This complex is **not** a flag complex. For example, $\{1,2,4,5\}$ has all three-element subsets Sidon, but is not itself Sidon: $2-1=5-4$. The natural representation is the independence complex of a **mixed 3/4-uniform hypergraph of additive collisions**, not the independence complex of an ordinary graph.

This creates a bridge between 3-term progression avoidance, Sidon restrictions, hypergraph independence complexes, and homology of discrete constraint spaces.

## Exact persistence constraint: factor-two nullity

**Proposition (elementary; historical priority unverified).** For every integer $M\ge1$, every $k\ge0$, and any coefficient ring $R$, the inclusion $K_M\hookrightarrow K_{2M}$ induces the zero homomorphism on reduced homology:

$$
\widetilde H_k(K_M;R)\longrightarrow\widetilde H_k(K_{2M};R).
$$

**Proof.** Let $A\subseteq[M]$ be any Sidon set, and append $x=2M$. Its old positive differences are at most $M-1$. Each new difference $x-a$ is at least $M$, and the new differences are pairwise distinct. Therefore $A\cup\{2M\}$ is Sidon. Consequently every face of $K_M$ is a face of the closed star of vertex $2M$ in $K_{2M}$, and the inclusion factors through that star, which is a cone. Its map on reduced homology is zero. $\square$

**Interpretation.** Under the standard inclusion filtration, a homology class born at $M$ dies by $2M$; equivalently, there are no persistent bars spanning the full interval from $M$ to $2M$. This does **not** imply eventual fixed-dimensional vanishing: new classes may be born at arbitrarily large indices. The coning property was additionally checked by exact finite face enumeration for $1\le M\le12$, but the proof works for all $M$. This is recorded as an elementary observation, **not** a priority or publication claim. See the [flagship source-comparison gate](../../audits/2026-10-29-flagship-source-comparison-and-shortlist.md).

## Exact initial topological experiments

Compute reduced simplicial homology with coefficients in $\mathbb F_2$. The standard-library program [`experiments/P016_sidon_complex_betti.py`](../../experiments/P016_sidon_complex_betti.py) builds the exact face set and boundary matrices, applies binary Gaussian elimination, and checks the Euler–Poincaré identity. No floating-point tolerance or random simulation is used.

| $N$ | $\widetilde\beta_1$ | $\widetilde\beta_2$ | $\widetilde\beta_3$ | $\widetilde\beta_4$ |
|---:|---:|---:|---:|---:|
| 3 | 1 | 0 | 0 | 0 |
| 4 | 1 | 0 | 0 | 0 |
| 5 | 1 | 1 | 0 | 0 |
| 6 | 0 | 4 | 0 | 0 |
| 9 | 0 | 15 | 1 | 0 |
| 11 | 0 | 5 | 20 | 0 |
| 12 | 0 | 0 | 51 | 0 |
| 16 | 0 | 0 | 239 | 0 |
| 17 | 0 | 0 | 237 | 5 |
| 20 | 0 | 0 | 81 | 416 |
| 22 | 0 | 0 | 10 | 1404 |
| 23 | 0 | 0 | 0 | 2153 |

**Interpretation:** Over this finite range, lower-dimensional homology disappears while high-dimensional classes appear. In particular, $\widetilde\beta_1$ first reaches zero at $N=6$ and $\widetilde\beta_2$ at $N=12$, while $\widetilde\beta_3$ reaches zero at $N=23$. **None of these finite observations proves eventual vanishing.**

The $k=0$ reduced homology vanishes trivially for $N\ge2$, because every pair of vertices forms an edge.

## Why this question could be consequential

A positive eventual-vanishing theorem would quantify how a simplicial complex generated by **arithmetic forbidden patterns** becomes topologically connected in each fixed dimension, even while its maximum face dimension scales like $\sqrt N$. A negative answer could reveal persistent classes forced by additive geometry rather than ordinary random-complex topology.

The construction also refines P004: P004 considers one-element exchanges among fixed-size Sidon sets, whereas $K_N$ packages *all sizes* and *all inclusion relations*. Their state-space graphs and homology are related constructions but **not equivalent invariants**. A theorem relating links or homology of $K_N$ to connectivity of its level-exchange graphs would be a substantial additional structural result.

## Literature and originality risk

- Sidon sets and Golomb rulers, including their extremal sizes, are classical: [MathWorld, Sidon Set](https://mathworld.wolfram.com/SidonSet.html).
- [Matt Superdock, *Simplicial complexes from finite projective planes and colored configurations*, Discrete Mathematics 346 (2023), 113117](https://doi.org/10.1016/j.disc.2022.113117) constructs **simplicial complexes related to Sidon sets**, but via colored configurations and projective-plane correspondences, **not obviously** the full family of Sidon subsets of $[N]$.
- [Marko Berghoff, *On the homology of independence complexes* (2022)](https://doi.org/10.5070/C62156880) exemplifies general independence-complex homology methods. This is general topological prior art, not a claimed proof for $K_N$.
- [Carter, O'Bryant and Tao, *On the diameter and distribution of Sidon sets* (October 2026)](https://arxiv.org/abs/2610.36207) gives very recent **extremal Sidon geometry**, not a result on the homology of the complex of all Sidon subsets.
- A 2026 work titled [*Persistent Homology of Additive Relations*](https://www.researchgate.net/publication/404901446_Persistent_Homology_of_Additive_Relations) also constructs topology from additive structures, using **additive fibers and weighted graph complexes**. Its constructions should be checked for possible equivalences before any strong novelty claim.

**Novelty status:** This is an apparently distinct **specific simplicial complex and homology question** after a targeted search, not an invention of topological additive combinatorics. Source-by-source review is incomplete and specialist originality certification is absent.

### Source-comparison clarification (29 October 2026)

Superdock's 2023 construction uses **colored incidence configurations / projective-plane structures** and obtains correspondences with individual Sidon sets in finite abelian groups. That is a serious established **Sidon/topology connection**, but it is not the same *stated complex* as our hereditary set system of **all Sidon subsets of $[N]$**. This comparison **does not certify originality**; see the [source-level audit](../../audits/2026-10-29-P015-P016-P018-P020-source-comparison-and-P010-snapshot.md).

## Falsification before any stronger conjecture

1. Independently reproduce the $\mathbb F_2$ boundary ranks, not just the face counts.
2. Test larger $N$, especially whether vanished homology reappears.
3. Compare with general high-connectivity theorems for hypergraph independence complexes and dense simplicial complexes.
4. Search for equivalent formulations under *Sidon hypergraph independence complex*, *Golomb ruler simplicial complex*, *additive-energy complex* and *arithmetic progression complex*.
5. Keep integer coefficients and torsion explicitly separate from the $\mathbb F_2$ computations.

There is **no proved asymptotic homological statement** in this dossier. The question is retained for its potential structural implications, subject to a rigorous novelty gate.
