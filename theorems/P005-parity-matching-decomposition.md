# P005 — Parity decomposition of coprime permutation switches

**Status:** elementary exact structural theorem. Its perfect-square enumerative corollary is previously known; historical priority of the Cartesian-product switch-space formulation remains unverified. The P005 connectivity problem is not resolved.

## Setup

Let $\mathcal C_n$ be the graph whose vertices are permutations $\sigma$ of $[n]$ satisfying $\gcd(i,\sigma(i))=1$, with edges corresponding to swaps of two assigned values that preserve coprimality.

For $n=2m$, let $B_m$ be the bipartite graph with parts

$$
E_m=\{2,4,\ldots,2m\},\qquad
O_m=\{1,3,\ldots,2m-1\},
$$

joining $e\in E_m$ to $o\in O_m$ when $\gcd(e,o)=1$. Let $\mathcal R(B_m)$ be the four-cycle switch graph on the perfect matchings of $B_m$.

## Theorem 1 — Even-order Cartesian product

For every $m\ge1$,

$$
\boxed{\mathcal C_{2m}\cong
\mathcal R(B_m)\mathbin{\square}\mathcal R(B_m).}
$$

**Proof.** Every even row $i$ of a coprime permutation must be assigned an odd value, since $\gcd(i,\sigma(i))>1$ if both numbers are even. There are precisely $m$ even rows and $m$ odd values. Thus the even rows consume all odd values and the odd rows must be assigned exactly the even values.

The bijection from even rows to odd values is a perfect matching of $B_m$. The bijection from odd rows to even values, after reversing the two parts, is independently a second perfect matching of the same graph. Conversely, any pair of such matchings produces a coprime permutation.

A valid swap between positions of different parity is impossible: the even position would receive an even value. A swap between two positions of equal parity changes only the corresponding matching, and it is valid exactly when its alternating four-cycle belongs to $B_m$. This establishes precisely the Cartesian-product adjacency relation. $\square$

**Corollaries.** If $M_m$ is the number of perfect matchings of $B_m$, then

$$
\#\{\sigma\in S_{2m}:\gcd(i,\sigma(i))=1\ \forall i\}
=M_m^2.
$$

Moreover, $\mathcal C_{2m}$ is connected if and only if $\mathcal R(B_m)$ is connected. If $\mathcal R(B_m)$ has $c$ components, then $\mathcal C_{2m}$ has $c^2$; if it is connected with diameter $d$, then $\mathcal C_{2m}$ has diameter $2d$.

The bipartite host $B_m$ is exactly the coprime matching graph studied in [P040](../problems/graph-theory/P040-coprime-matching-local-resilience.md), although P040 studies adversarial edge deletion rather than the switch space of matchings.

## Theorem 2 — Odd-order marked-pair decomposition

Let $n=2m+1$, with

$$
E=\{2,4,\ldots,2m\},\qquad
O=\{1,3,\ldots,2m+1\}.
$$

For $u\in O$, let $t(u)$ be the number of coprime bijections from $E$ to $O\setminus\{u\}$. Then

$$
\boxed{
\#\{\sigma\in S_{2m+1}:\gcd(i,\sigma(i))=1\ \forall i\}
=\sum_{\substack{u,v\in O\\\gcd(u,v)=1}}t(u)t(v).
}
$$

**Proof.** Every even position maps to an odd value. As there are $m$ even positions and $m+1$ odd values, exactly one odd value remains to be assigned to an odd position; call this unique odd-to-odd assignment $u\mapsto v$. Necessarily $u,v\in O$ and $\gcd(u,v)=1$.

The even rows map bijectively to $O\setminus\{v\}$, in $t(v)$ possible ways. Independently, $O\setminus\{u\}$ maps bijectively to $E$, in $t(u)$ ways, by symmetry of gcd. All choices extend uniquely to a coprime permutation. Summing over admissible marked pairs gives the formula. $\square$

For fixed $(u,v)$, the switch subgraph induced by permutations whose unique odd-to-odd assignment is $u\mapsto v$ is the Cartesian product of the four-cycle switch graphs of the two balanced coprime bipartite graphs obtained by deleting odd vertex $u$ and odd vertex $v$, respectively. Switches involving the marked assignment may connect distinct fibers. Consequently the odd-order case is a family of matching-space products coupled by one distinguished odd-to-odd edge, not a direct Cartesian square.

## Exact finite verification

The [independent bitmask enumerator](../experiments/P005_parity_matching_decomposition.py) computes both sides of the formulas and compares them with direct coprime-permutation counts for every $2\le n\le15$. Selected values are

| $n$ | Direct number of coprime permutations | Product or marked-pair formula |
|---:|---:|---:|
| 8 | 324 | $18^2$ |
| 11 | 129744 | 129744 |
| 12 | 63504 | $252^2$ |
| 14 | 3459600 | $1860^2$ |
| 15 | 60891840 | 60891840 |

The identities are proved for all orders above; computation is an independent consistency check, not the proof.


### Extended finite connectivity certificate

The Cartesian-product reduction replaces enumeration of $C(2m)$ coprime permutations by enumeration of the $M_m$ perfect matchings of $B_m$. The [C++17 BFS certificate](../experiments/P005_even_bipartite_switch_bfs.cpp) starts at the adjacent-integer matching, enumerates all reachable four-cycle switches, and compares the reached count to an independently computed subset-DP permanent:

| $n=2m$ | $m$ | All perfect matchings | Reachable by switches |
|---:|---:|---:|---:|
| 14 | 7 | 1860 | 1860 |
| 16 | 8 | 9552 | 9552 |
| 18 | 9 | 59616 | 59616 |
| 20 | 10 | 565920 | 565920 |
| 22 | 11 | 4051872 | 4051872 |

The order $n=22$ computation explores **4,051,872** matching states, rather than their Cartesian square of coprime permutations. This verifies connectivity of $\mathcal C_{2m}$ for the displayed even orders by the proved factorization. It does not prove connectivity for any larger or odd order.

Reproduce the largest case:

```sh
g++ -std=c++17 -O3 experiments/P005_even_bipartite_switch_bfs.cpp -o p005_bfs
./p005_bfs 11
```


## Historical comparison

Coprime permutations and their enumeration are studied by [Pomerance (2022)](https://arxiv.org/abs/2203.03085) and [Sah–Sawhney (2022)](https://doi.org/10.1112/mtk.12159). Four-cycle matching reconfiguration is classical; see [Ito et al. (2019)](https://doi.org/10.4230/LIPIcs.MFCS.2019.80). **Known predecessor:** [OEIS A009679](https://oeis.org/A009679), with T. D. Noe's 2007 formula, explicitly records that $C(2n)$ is the square of the number of perfect matchings in the even–odd coprimality matrix. The perfect-square counting formula is therefore **not new**. The present graph isomorphism additionally identifies all four-cycle switches and the component/diameter relations, but historical novelty of that extension is unverified; the odd-order marked-pair formula likewise requires comparison with published permanent expansions.
