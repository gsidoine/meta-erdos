# P040 — Monotonicity under thinning and the prime-prefix reduction

For a finite coordinate set $[k]$ and a vector
$\mathbf q=(q_1,\ldots,q_k)\in(0,1)^k$, let $\mu_{\mathbf q}$
be the product measure on $2^{[k]}$ with independent inclusion
probabilities $q_i$. For $h:2^{[k]}\to[0,1]$, define

$$
m_{\mathbf q}(h)=\mathbb E_{\mathbf q}h(X),
\qquad
Q_{\mathbf q}(h\mid S)
=\mathbb E_{\mathbf q}[h(X)\mid X\cap S=\varnothing].
$$

For $m_{\mathbf q}(f)+m_{\mathbf q}(g)>1$ put

$$
R_{\mathbf q}(f,g)=
\max\left\{
\max_{S:f(S)>0}Q_{\mathbf q}(g\mid S),
\max_{T:g(T)>0}Q_{\mathbf q}(f\mid T)
\right\},
$$

and denote its infimum over admissible pairs by
$\alpha(\mathbf q)$. This extends the finite-prime functional
of [P040](P040-fractional-sieve-variational.md), recovered by
$q_i=1/p_i$.

## Theorem 1 — Exact transport of conditional costs

Suppose $\mathbf q,\mathbf q'\in(0,1)^k$ satisfy
$q_i\le q'_i$ for every $i$. For any *increasing*
$f,g:2^{[k]}\to[0,1]$, there exist increasing profiles
$f',g'$ with

$$
\begin{aligned}
m_{\mathbf q'}(f')&=m_{\mathbf q}(f),&
m_{\mathbf q'}(g')&=m_{\mathbf q}(g),\\
\{S:f'(S)>0\}&=\{S:f(S)>0\},&
\{T:g'(T)>0\}&=\{T:g(T)>0\},
\end{aligned}
$$

and, for **every** support type $S$,

$$
Q_{\mathbf q'}(f'\mid S)=Q_{\mathbf q}(f\mid S),
\qquad
Q_{\mathbf q'}(g'\mid S)=Q_{\mathbf q}(g\mid S).
$$

In particular, the worst conditional deletion cost is
preserved:

$$
\boxed{R_{\mathbf q'}(f',g')=R_{\mathbf q}(f,g).}
$$

### Proof

Let $X$ have law $\mu_{\mathbf q'}$. Conditional on $X$,
independently retain each present coordinate $i\in X$
with probability $q_i/q'_i$, obtaining $Y\subseteq X$.
The marginal distribution of $Y$ is $\mu_{\mathbf q}$.
Define

$$
f'(S)=\mathbb E[f(Y)\mid X=S],
\qquad
g'(S)=\mathbb E[g(Y)\mid X=S].
$$

The mass identities follow by the tower property.

If $S\subseteq T$, the thinning procedure can be coupled
so that $Y_S\subseteq Y_T$. Therefore $f'$ and $g'$ are
increasing. Moreover, for an increasing profile $h$,

$$
\mathbb E[h(Y)\mid X=S]>0
\quad\Longleftrightarrow\quad h(S)>0.
$$

Indeed, every possible thinned subset is contained in $S$,
while $Y=S$ has positive conditional probability because
$q_i/q'_i>0$ for each $i$. This proves the support identities.

Fix $A\subseteq[k]$. Conditional on $X\cap A=\varnothing$,
the thinning procedure forces $Y\cap A=\varnothing$; on
coordinates outside $A$, the entries of $Y$ remain
independent Bernoulli variables with parameters $q_i$.
Consequently,

$$
\mathbb E[f'(X)\mid X\cap A=\varnothing]
=
\mathbb E[f(Y)\mid Y\cap A=\varnothing].
$$

The same identity holds for $g$. The two conditional
functions and the sets of support types at which their
maxima are taken are thus identical. $\square$

## Corollary 2 — Bias monotonicity

For arbitrary product-bias vectors with
$0<q_i\le q'_i<1$,

$$
\boxed{\alpha(\mathbf q')\le\alpha(\mathbf q).}
$$

**Proof.** The [coordinate-compression theorem](P040-fractional-sieve-variational.md)
allows the infimum defining $\alpha(\mathbf q)$ to be
taken over increasing fractional profiles without
changing their masses or increasing the value of $R$.
Theorem 1 transports each such admissible pair to
$\mathbf q'$ without increasing its cost. Taking
infima gives the inequality. $\square$

This comparison does not apply to an arbitrary individual
non-increasing profile without first performing monotone
compression.

## Corollary 3 — Only consecutive initial odd primes matter

Let $r_1=3<r_2=5<\cdots$ be the odd primes in increasing
order. For a finite set of distinct odd primes
$P=\{p_1<\cdots<p_k\}$, let $\alpha(P)$ be the
restricted fractional Hall-cut infimum from P040.
Then

$$
\boxed{\alpha(\{r_1,\ldots,r_k\})\le\alpha(P).}
$$

Consequently,

$$
\boxed{
\alpha_{\rm frac}
=
\lim_{k\to\infty}
\alpha(\{3,5,7,\ldots,r_k\}).
}
$$

The sequence on the right is non-increasing.

**Proof.** The $i$-th element $p_i$ of any $k$-element
set of odd primes satisfies $p_i\ge r_i$, whence
$1/p_i\le1/r_i$. Corollary 2 gives the first inequality.

Adding an independent prime coordinate cannot increase
$\alpha$: extend admissible profiles by ignoring that
coordinate. Their masses and conditional costs remain
unchanged, including when a selected support type
contains the new coordinate. Thus the prime-prefix
infima form a non-increasing sequence, and the first
inequality shows that its infimum equals the infimum
over all finite prime sets. Boundedness below by zero
gives the limit. $\square$

In particular, the exact thresholds already established
by the [two-prime classification](P040-two-prime-thresholds.md)
and the [three-prime theorem](P040-fractional-sieve-variational.md)
provide

$$
\alpha(\{3\})=\frac12,\qquad
\alpha(\{3,5\})=\frac49,\qquad
\alpha(\{3,5,7\})=\frac5{12}.
$$

The [four-prime classification](P040-four-prime-sharpness.md)
adds the exact finite computer-assisted result

$$
\alpha(\{3,5,7,11\})=\frac5{12}.
$$

All $168$ upward-closed support families are checked by a
self-contained integer-arithmetic certificate, and the four
remaining support pairs are excluded analytically. Thus the
prime-prefix sequence is constant at $5/12$ from its third
through its fourth term, but further terms are unknown.

This reduction does **not** prove that the limit equals
$5/12$, or that it equals the asymptotic resilience
of the even–odd coprimality graph. Additional primes
may still lower the cost.

## Historical context

Independent thinning and stochastic domination are
standard tools in biased-product-measure extremal
combinatorics. Closely related recent treatments include
Y. Wu and L. Feng, [*Rigidity and stability for biased
cross-intersecting families*](https://arxiv.org/abs/2607.26871)
(2026), and F. Chang, H. Liu and M. Liu,
[*A sharp p-biased product bound for r-cross-intersecting
families*](https://arxiv.org/abs/2606.15618) (2026).
Those papers address intersection extremals rather than
the present conditional Hall-deletion functional.
The specific reduction above is proved self-containedly,
but its historical novelty has not been certified.
