# Positive-density distinct-gap Goldbach matchings from prime additive energy

**Status:** proved consequence of an established dyadic prime-energy bound. Historical originality of the matching formulation and its general combinatorial inequality is unverified.

## Statement

For an integer $X\ge4$, let $R_X$ be the bipartite graph with left vertices $m\in\{X+1,\ldots,2X\}$ and right vertices $d\in\{1,\ldots,2X-1\}$, where $(m,d)$ is an edge precisely when $m-d$ and $m+d$ are both prime. Let $\mu(X)$ be its maximum matching size.

**Theorem 1.**

$$
\boxed{\liminf_{X\to\infty}\frac{\mu(X)}X\ge\frac5{24}.}
$$

In particular, an absolute positive proportion of the even integers in every sufficiently large dyadic interval admits a simultaneous system of prime-pair representations with *distinct* positive half-differences.

The assertion $\mu(X)=X$ is not established. Its all-$X$ version is recorded as an [unnumbered research proposal](https://github.com/gsidoine/the-scottish-book/issues/102), without an historical novelty claim.

## An additive-energy matching inequality

Let $A\subset\mathbb Z$ be a finite set of size $k\ge2$ and put $N=\binom{k}{2}$. Its *additive energy* is

$$
E(A)=\#\{(a,b,c,d)\in A^4:a+b=c+d\}.
$$

Let $M(A)$ denote the maximum cardinality of a collection of pairs $(a,b)\in A^2$, $a<b$, in which all sums $a+b$ are distinct and all positive differences $b-a$ are distinct.

**Theorem 2.**

$$
\boxed{M(A)\ge\frac{4\binom{k}{2}^2}{3E(A)}.}
$$

**Proof.** Let $\mathcal P=\{(a,b)\in A^2:a<b\}$. Construct a simple *conflict graph* $H$ on $\mathcal P$, where distinct vertices $(a,b),(c,d)$ are joined if either $a+b=c+d$ or $b-a=d-c$. An independent set in $H$ is a collection counted by $M(A)$.

Write $u_s$ for the number of pairs in $\mathcal P$ with sum $s$, and $v_t$ for the number with difference $t>0$. Two distinct pairs cannot have both equal sums and equal differences. Consequently,

$$
D:=\sum_{v\in V(H)}(\deg_H(v)+1)
=\sum_su_s^2+\sum_{t>0}v_t^2-N.
$$

Each pair $(a,b)$ with $a<b$ contributes both ordered representations $(a,b)$ and $(b,a)$ of its sum. Thus the full ordered representation counts give

$$
\sum_su_s^2\le\frac{E(A)}4.
$$

The number of ordered representations of a positive difference $t$ is $v_t$, the number for $-t$ is also $v_t$, and the number for difference $0$ is $k$. The sum-energy and difference-energy quadruple counts coincide. Therefore

$$
E(A)=k^2+2\sum_{t>0}v_t^2,
\qquad
D\le\frac{3E(A)}4.
$$

For any finite graph, a uniformly random ordering of its vertices selects an independent set by retaining vertices preceding all their neighbors. The expected size of this set is $\sum_v1/(\deg(v)+1)$; Cauchy–Schwarz therefore gives

$$
\alpha(H)\ge\sum_v\frac1{\deg_H(v)+1}
\ge\frac{N^2}{D}.
$$

Combining the inequalities yields the stated bound. $\square$

## Proof of Theorem 1

Take $A=P_X=\{p\text{ prime}:X<p\le2X\}$. For sufficiently large $X$ every member of $P_X$ is odd, and the prime number theorem gives

$$
k=|P_X|\sim\frac{X}{\log X},
\qquad
N=\binom{k}{2}\sim\frac{X^2}{2(\log X)^2}.
$$

A published circle-method bound for the additive energy of the primes in $(N_0/2,N_0]$ states that, for all sufficiently large $N_0$,

$$
E(\{p\text{ prime}:N_0/2<p\le N_0\})
\le\frac{N_0^3}{5(\log N_0)^4}.
$$

This estimate is quoted and attributed to earlier circle-method work in Ramana–Ramaré [1, pp. 2–3]. Substituting $N_0=2X$ gives

$$
E(P_X)\le\left(\frac85+o(1)\right)
\frac{X^3}{(\log X)^4}.
$$

A pair $p<q$ from $P_X$ determines a midpoint and positive half-difference

$$
m=\frac{p+q}{2},\qquad d=\frac{q-p}{2},
$$

satisfying $X<m\le2X$, $0<d<2X-1$, and $m-d=p$, $m+d=q$. Because $p,q$ are odd, both $m,d$ are integers. Distinct sums and differences produce distinct left and right vertices of $R_X$. Hence $\mu(X)\ge M(P_X)$, and Theorem 2 gives

$$
\mu(X)\ge\frac{4N^2}{3E(P_X)}
\ge\left(\frac5{24}-o(1)\right)X.
$$

This proves Theorem 1. $\square$

## Scope

The result proves **linear-order** matchability, not an asymptotically complete or perfect matching. It does not imply the binary Goldbach conjecture. The proof is a combination of a standard graph independent-set bound, additive-energy identities, the prime number theorem, and a previously established prime-energy estimate. It is not asserted to be historically original without specialist comparison to partial Sidon configurations, additive rainbow matchings, and sums-and-differences transversals.

The [independent finite checker](../experiments/prime_energy_sum_difference_matching.py) verifies the combinatorial inequality on finite subsets of a short integer interval; the asymptotic prime-energy estimate is an imported established theorem, not established by that experiment.

## References

1. D. S. Ramana and O. Ramaré, *Additive energy of dense sets of primes and monochromatic sums*, Israel Journal of Mathematics **199** (2014), 955–974. [DOI: 10.1007/s11856-013-0075-y](https://doi.org/10.1007/s11856-013-0075-y); [author manuscript](https://ramare-olivier.github.io/Maths/dense_primes_israel.pdf). Section 1, p. 2, records the dyadic circle-method bound used here, with attribution to the work of Hegyvári–Hennecart.
2. N. Hegyvári and F. Hennecart, *On monochromatic sums of squares and primes*, Journal of Number Theory **124** (2007), 314–324. [DOI: 10.1016/j.jnt.2006.11.004](https://doi.org/10.1016/j.jnt.2006.11.004). The citation provides historical context for the additive-energy estimate; the original paper's theorem-level priority has not been separately rechecked.
