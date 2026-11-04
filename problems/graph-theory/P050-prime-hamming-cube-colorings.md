# P050 — Coloring the Boolean cube at prime distances

<!-- DOSSIER-SUMMARY -->
> **Research question:** If H_n joins binary n-vectors at prime Hamming distance, is chi(H_{2^k})=2^{k+1} for every k>=2?  
> **Formulation:** candidate. **Novelty:** high overlap risk: hypercube distance colorings; first-order asymptotics already follow from established coding theory.  
> **Verified/known progress:** Proved 2n-3<=chi(H_n)<=2^(1+ceil(log2 n)) for n>=5, with chi(H_4)=8 and chi(H_8)=16; the first-order asymptotic is known.  
> **Finite evidence:** Algebraic coloring and clique construction, independent-set/sphere-packing proof at n=8; finite verifier supplied.  
> **Symbolic prize:** A Coffee (symbolic) — A proof or counterexample to the exact dyadic prime-Hamming cube coloring formula.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

**Area:** graph theory and coding theory.

## Problem

Let $H_n$ be the graph on $\{0,1\}^n$ in which two vertices are adjacent if their Hamming distance is prime.

For every integer $k\ge2$, is it true that

$$
\chi(H_{2^k})=2^{k+1}?
$$

Here $\chi$ is the ordinary vertex chromatic number. The question is the **exact** value at dyadic dimensions, not the first-order asymptotic.

## Established bounds

**Proposition.** For every $n\ge5$,

$$
2n-3\le\chi(H_n)\le2^{1+\lceil\log_2 n\rceil}.
$$

In particular, for each $n=2^k$ with $k\ge3$,

$$
2n-3\le\chi(H_n)\le2n.
$$

**Proof (lower bound).** Let $e_1,\ldots,e_n$ be the unit vectors, which form an $n$-clique since distinct unit vectors have distance two. Fix a three-element coordinate set $B\subset[n]$ and consider the $n-3$ vectors $\mathbf1_{B\cup\{j\}}$ for $j\notin B$. Their mutual distances are two, and their distances to any unit vector are either three or five. Thus the two families together form a clique of size $2n-3$. The argument requires $n\ge5$ so that both three and five are available prime distances.

**Proof (upper bound).** Set $m=\lceil\log_2n\rceil$ and label the coordinates by $n$ different elements $v_1,\ldots,v_n$ of $\mathbb F_2^m$. Color $x=(x_i)$ by

$$
c(x)=\left(\sum_{i=1}^n x_i\pmod2,\quad\sum_{i=1}^n x_iv_i\right)
\in\mathbb F_2\times\mathbb F_2^m.
$$

Vectors differing in an odd prime number of coordinates have opposite first coordinates. Vectors differing in two coordinates have different second coordinates because $v_i\ne v_j$. Since two is the only even prime, this is a proper coloring using at most $2^{m+1}$ colors. $\square$

**Small case.** $\chi(H_4)=8$. The upper bound is eight. For the lower bound, an independent set in $H_4$ has size at most two: after translating one of its vertices to $0$, any other independent vertex must have Hamming weight one or four; two distinct weight-one vertices have distance two, and a weight-one vertex and the unique weight-four vertex have distance three. Thus $16/2=8$ colors are required.

The identity also holds for $k=3$.

**Proposition.** The prime-distance graph of the eight-dimensional binary cube satisfies

$$
\chi(H_8)=16.
$$

**Proof.** The syndrome coloring above gives $\chi(H_8)\le16$. To prove the reverse inequality, consider an independent set $A\subseteq\{0,1\}^8$.

If $A$ meets both parity classes, the distance between any opposite-parity pair in $A$ must be one, since the other possible odd distances $3,5,7$ are prime. Two distinct same-parity vertices cannot both lie at distance one from the same opposite-parity vertex: their mutual distance would then be two, which is also prime. Consequently $|A|\le2$ in this case.

Otherwise $A$ is contained in one parity class. Distinct elements of $A$ have even Hamming distance different from two, hence distance at least four. Their radius-one Hamming neighborhoods are pairwise disjoint. Each such neighborhood consists of eight elements of the other parity class, which contains $2^7=128$ vertices. Therefore $8|A|\le128$, so $|A|\le16$.

Thus $\alpha(H_8)\le16$, and $\chi(H_8)\ge2^8/16=16$. $\square$

The equality $\chi(H_{2^k})=2^{k+1}$ has consequently been proved here for $k=2,3$. No claim of historical priority for either small-case calculation is made. The first unresolved case in the proposed family is $k=4$, corresponding to $H_{16}$.

The first-order asymptotic $\chi(H_n)\sim2n$ is already a consequence of existing hypercube coloring theory. Indeed, the chromatic number of the distance-at-most-two hypercube graph is $(1+o(1))n$ (Östergård, 2004). Color each of the two parity classes independently using disjoint palettes of this size. The only prime distance within a parity class is two, so the resulting $(2+o(1))n$-coloring is proper for $H_n$. The clique bound gives the matching lower-order term. The present question concerns **the exact additive constant at dyadic dimensions**, not this known asymptotic.

## Prior art

1. P. R. J. Östergård, *On a hypercube coloring problem*, **Journal of Combinatorial Theory, Series A** 108 (2004), 199–204, [doi:10.1016/j.jcta.2004.06.010](https://doi.org/10.1016/j.jcta.2004.06.010). Establishes asymptotic formulas for two- and three-distance hypercube colorings.
2. J. I. Kokkala and P. R. J. Östergård, *A coloring of the square of the 8-cube with 13 colors*, [arXiv:1509.06913](https://arxiv.org/abs/1509.06913). Demonstrates that small additive improvements over algebraic upper bounds are significant in related hypercube problems.
3. R. B. Eggleton, P. Erdős and D. K. Skilton, work on prime-distance graphs of the integers; a subsequent analysis appears in *Chromatic number of prime distance graphs*, **Discrete Applied Mathematics** 51 (1994), 197–209, [doi:10.1016/0166-218X(94)90109-0](https://doi.org/10.1016/0166-218X(94)90109-0). The underlying integer-distance graph is distinct from the Hamming-distance graph.

This exact dyadic question has not been certified historically novel or open. Its proximity to established coding-theoretic coloring questions is substantial.
