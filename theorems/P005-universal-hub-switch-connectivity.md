# P005 — Connectedness and linear diameter of coprime permutation switches

**Status:** complete elementary proof and kernel-checked Lean 4.35.0 certificate for the all-order arithmetic connectivity and diameter theorem. Historical priority of the theorem and its universal-hub method remains unverified.

## Universal-hub matching lemma

Let $G=(L,R;E)$ be a bipartite graph with $|L|=|R|=s$. A *switch* replaces two edges $(x,a),(y,b)$ of a perfect matching with $(x,b),(y,a)$, provided the latter are edges of $G$.

**Lemma.** Suppose that $r\in L$ is adjacent to all of $R$, that $c\in R$ is adjacent to all of $L$, and that there exists a perfect matching $N$ containing $(r,c)$. Then every perfect matching $M$ can be transformed into $N$ by at most

$$
s-1+\left\lfloor\frac{s-1}{2}\right\rfloor
$$

switches. In particular the perfect-matching switch graph is connected and has diameter at most $2(s-1+\lfloor(s-1)/2\rfloor)$.

**Proof.** Regard perfect matchings as bijections $M,N:L\to R$. Set $f=N^{-1}\circ M$, a permutation of $L$, and decompose it into cycles.

First consider the cycle of $f$ containing $r$. If it is $(r,x_1,\ldots,x_{k-1})$, then initially $M(r)=N(x_1)$ and $M(x_i)=N(x_{i+1})$, with $x_k=r$. Switch $r$ successively with $x_1,\ldots,x_{k-1}$. Each $x_i$ receives its target $N(x_i)$, which is an allowed edge, and $r$ eventually receives $N(r)=c$. Every intermediate replacement edge incident with $r$ is allowed because $r$ is universal. This takes $k-1$ switches.

All remaining cycles of $f$ avoid $r$, while $r$ is now matched with $c$. Let $(x_1,\ldots,x_\ell)$ be a nontrivial such cycle. Switch $r$ with $x_1$, sending $c$ to $x_1$ (allowed because $c$ is universal). Now $r$ carries $N(x_2)$. Switch $r$ with $x_2,\ldots,x_\ell$ in succession. Each $x_i$, $i\ge2$, receives its required value $N(x_i)$. Finally $r$ carries $N(x_1)$; switch $r$ again with $x_1$. This fixes every row of the cycle and restores $r\mapsto c$. Every switch is legal, and the cycle takes $\ell+1$ switches.

Previously fixed rows are never disturbed. If the cycle containing $r$ has length $k$, and there are $t$ other nontrivial cycles of total length $u$, the total number of switches is $(k-1)+u+t$. As $u\le s-k$ and $t\le u/2$, it is at most $s-1+\lfloor(s-1)/2\rfloor$. The diameter bound follows by routing any two matchings through $N$. $\square$

The hypothesis that the universal edge $(r,c)$ extends to a perfect matching is essential for this argument. The mere existence of a universal vertex in each part does not guarantee switch connectivity, as noted in the historical P005 audit.

## Theorem — Coprime permutation switch connectivity

For each $n\ge1$, let $\mathcal C_n$ be the graph of all permutations $\sigma$ of $[n]$ such that $\gcd(i,\sigma(i))=1$ for every $i$. Two permutations are adjacent if a transposition of two assigned values preserves every coprimality condition.

**Theorem.** For all $n\ge1$,

$$
\boxed{
\mathcal C_n\text{ is connected},\qquad
\mathrm{diam}(\mathcal C_n)\le3(n-1).
}
$$

**Proof.** For odd $n=2m+1$, consider the bipartite graph between two copies of $[n]$, with edges $i\sim j$ when $\gcd(i,j)=1$. Row $1$ and column $1$ are universal. The permutation

$$
N=(1)(2\ 3)(4\ 5)\cdots(2m\ 2m+1)
$$

is a perfect matching containing $(1,1)$, since consecutive integers are coprime. The lemma gives a path from any coprime permutation to $N$ of length at most $n-1+\lfloor(n-1)/2\rfloor=3m$. Hence $\mathrm{diam}(\mathcal C_n)\le6m=3(n-1)$.

For even $n=2m$, every coprime permutation maps the even positions bijectively to the odd values, and the odd positions bijectively to the even values. By the [parity product theorem](P005-parity-matching-decomposition.md), $\mathcal C_{2m}$ is the Cartesian square of the perfect-matching switch graph of the balanced bipartite coprimality graph $B_m$, with even rows and odd columns.

In $B_m$, row $2$ is universal (every odd integer is coprime to $2$), and column $1$ is universal. The consecutive matching $2j\mapsto2j-1$ contains $(2,1)$. Applying the lemma to both factors gives a path from any vertex of $\mathcal C_{2m}$ to the pair of consecutive matchings of length at most

$$
2\left(m-1+\left\lfloor\frac{m-1}{2}\right\rfloor\right)\le3(m-1).
$$

The diameter is at most $6(m-1)=3n-6\le3(n-1)$. The case $n=1$ is immediate. $\square$

## Formal verification

The [Lean source P005All.lean](../formal/ArithmeticGraphs/P005All.lean) proves, for every positive integer $n$ and all valid coprime permutations $\sigma,\tau$ of $[n]$, the existence of a path of at most $3(n-1)$ legal switches from $\sigma$ to $\tau$. The formalization contains the explicit even-order parity decomposition and reconstruction, the lift of factor switches, and the quantitative path estimate. The accompanying [module index](../formal/ArithmeticGraphs/README.md) lists the complete dependency chain.

The principal certificate P005.coprime_switch_diameter was compiled with Lean 4.35.0 / Mathlib 4.35.0. The proof's only axioms are the standard propext, Classical.choice, and Quot.sound; no sorryAx occurs. This checks the stated arithmetic conclusion but does not establish its historical novelty, optimality of the diameter bound, or any publication status.

## Constructive algorithm and independent checks

The proof gives a deterministic switch algorithm: resolve the permutation cycle containing the universal row, then resolve each remaining cycle using the universal row and column as a temporary buffer. The [standard-library verifier](../experiments/P005_canonical_switch_certificate.py) constructs these switches explicitly and verifies every intermediate coprimality condition.

An exhaustive comparison over **every coprime permutation for $1\le n\le11$** finds a legal path to the reference permutation and checks the stated length bound in each case. In particular $129744$ permutations are covered at $n=11$. The proof above is independent of this finite computation.

## Priority and scope

The classical counting theory of coprime permutations is due in part to [Pomerance (2022)](https://arxiv.org/abs/2203.03085) and [Sah–Sawhney (2022)](https://doi.org/10.1112/mtk.12159). [Dyer–Jerrum–Müller (2017)](https://doi.org/10.1145/2822322) study switch-chain ergodicity in bipartite graph classes. The even-order perfect-square *counting formula* is known, see [OEIS A009679](https://oeis.org/A009679), rather than novel. The universal-hub lemma is elementary, and a direct predecessor or a general switch-ergodicity theorem may subsume the present result; no priority claim is made.

The theorem determines connectivity and gives a linear diameter bound; exact diameter, mixing time, and historical novelty are separate questions.
