# Necessary approximate collisions above dimension one-half

Let $R=\mathbb F_4[[T]]$. For $S\subset R$, denote by $N_n(S)$ the number of distinct residue classes modulo $T^n$ meeting $S$.

**Proposition.** If $N_n(S)(N_n(S)-1)>2\cdot4^{n+h}$ for integers $n\ge1$ and $h\ge0$, there are four elements $a,b,c,d\in S$, pairwise distinct modulo $T^n$, such that

$$
a+b\equiv c+d\pmod{T^{n+h}}.
$$

If $S\subset R^\times$, there are (possibly different) four elements, again pairwise distinct modulo $T^n$, such that

$$
ab\equiv cd\pmod{T^{n+h}}.
$$

**Proof.** Choose one representative from each of the $N=N_n(S)$ residue classes. There are $\binom N2$ unordered pairs of distinct representatives but only $4^{n+h}$ possible sums modulo $T^{n+h}$. Thus two different unordered pairs have congruent sums. They cannot have a common element: cancellation would make the remaining two representatives congruent modulo $T^{n+h}$, hence modulo $T^n$. The two pairs are therefore disjoint.

For products, use the same argument, observing that a common representative is a unit and can be cancelled modulo $T^{n+h}$. $\square$

**Corollary.** If $\dim_H S>1/2$, then for every fixed $h\ge0$ and every sufficiently large $n$, the additive congruence in the proposition has a four-point solution with pairwise distinct residues modulo $T^n$. If $S\subset R^\times$, the multiplicative congruence does as well.

**Proof.** The Hausdorff dimension does not exceed the lower box dimension, so for any $s$ with $1/2<s<\dim_H S$ and all sufficiently large $n$,

$$
N_n(S)\ge4^{sn}.
$$

Consequently $\binom{N_n(S)}2>4^{n+h}$ for all sufficiently large $n$. Apply the proposition. $\square$

**Finite-delay obstruction.** Suppose that for some fixed $h$, all sufficiently fine residue representatives of a set $S$ have different unordered pair sums modulo $T^{n+h}$. Then $\binom{N_n(S)}2\le4^{n+h}$ for all sufficiently large $n$, and therefore the upper box dimension of $S$ is at most $1/2$. The same conclusion holds for products when $S$ consists of units.

These assertions concern congruences, not exact equations in $R$. In particular, the four points can depend on $n$; passing to a limit can cause their residues to coalesce. This obstruction does not establish an upper bound of $1/2$ for P047. It shows that a construction of larger Hausdorff dimension necessarily permits approximate collisions at arbitrary fixed additional precision.
