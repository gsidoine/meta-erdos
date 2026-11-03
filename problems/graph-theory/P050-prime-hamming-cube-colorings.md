# P050 — Coloring the Boolean cube at prime distances

<!-- DOSSIER-SUMMARY -->
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

In particular, the proposed equality holds for $k=2$. No assertion is made for $k\ge3$.

The first-order asymptotic $\chi(H_n)\sim2n$ already follows from the clique lower bound and the established asymptotic chromatic number $(2+o(1))n$ for the graph joining all pairs at Hamming distance at most three: the latter has proper colorings that can be chosen with distinct parity palettes, thereby avoiding all odd prime distances as well. The contribution of the present question, if any, lies at **additive constant scale**.

## Prior art

1. P. R. J. Östergård, *On a hypercube coloring problem*, **Journal of Combinatorial Theory, Series A** 108 (2004), 199–204, [doi:10.1016/j.jcta.2004.06.010](https://doi.org/10.1016/j.jcta.2004.06.010). Establishes asymptotic formulas for two- and three-distance hypercube colorings.
2. J. I. Kokkala and P. R. J. Östergård, *A coloring of the square of the 8-cube with 13 colors*, [arXiv:1509.06913](https://arxiv.org/abs/1509.06913). Demonstrates that small additive improvements over algebraic upper bounds are significant in related hypercube problems.
3. R. B. Eggleton, P. Erdős and D. K. Skilton, work on prime-distance graphs of the integers; a subsequent analysis appears in *Chromatic number of prime distance graphs*, **Discrete Applied Mathematics** 51 (1994), 197–209, [doi:10.1016/0166-218X(94)90109-0](https://doi.org/10.1016/0166-218X(94)90109-0). The underlying integer-distance graph is distinct from the Hamming-distance graph.

This exact dyadic question has not been certified historically novel or open. Its proximity to established coding-theoretic coloring questions is substantial.
