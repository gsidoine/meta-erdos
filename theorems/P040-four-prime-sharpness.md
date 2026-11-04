# P040 — Exact four-prime fractional Hall threshold

Let $P=\{3,5,7,11\}$ and let $\mu_P,m_P,Q_P,R_P$ be as in
[the fractional sieve theorem](P040-fractional-sieve-variational.md).
Define

$$
\alpha(P)=\inf_{\substack{f,g:2^P\to[0,1]\\m_P(f)+m_P(g)>1}}R_P(f,g).
$$

## Theorem

$$
\boxed{\alpha(\{3,5,7,11\})=\frac5{12}.}
$$

The proof is **finite and computer-assisted**: it uses the
already proved monotone-compression theorem, exact rational inequalities,
and an exhaustive enumeration of all $168$ upward-closed families
in a four-element Boolean lattice. The enumeration is part of the proof,
not statistical evidence or a floating-point optimization.

### Proof

Write $t=5/12$. The three-prime certificate gives $\alpha(P)\le t$:
extend the profiles on $\{3,5,7\}$ independently of the coordinate $11$.

It suffices to rule out admissible fractional profiles $f,g$ with
$R_P(f,g)\le t$. By [monotone compression](P040-fractional-sieve-variational.md)
the profiles may be taken increasing, without changing either mass or
increasing $R_P$. Hence their **strictly positive supports**
$\mathcal A=\{S:f(S)>0\}$ and
$\mathcal B=\{S:g(S)>0\}$ are nonempty upward-closed families in $2^P$.

For $S\subseteq P$ put

$$
d(S)=\mu_P(\{T:T\cap S=\varnothing\})
=\prod_{p\in S}(1-1/p),
\qquad
u(S)=1-(1-t)d(S).
$$

For any profile $h$ satisfying $Q_P(h\mid S)\le t$, the decomposition
into supports disjoint from and meeting $S$ gives

$$
m_P(h)\le u(S).
$$

Consequently, if $R_P(f,g)\le t$, then

$$
\begin{aligned}
m_P(f)&\le\min\{\mu_P(\mathcal A),\min_{S\in\mathcal B}u(S)\},\\
m_P(g)&\le\min\{\mu_P(\mathcal B),\min_{S\in\mathcal A}u(S)\}.
\end{aligned}
$$

Define the sum of the two right-hand sides to be
$U(\mathcal A,\mathcal B)$. For every pair of nonempty
upward-closed families with $U(\mathcal A,\mathcal B)\le1$,
the strict requirement $m_P(f)+m_P(g)>1$ is impossible.

**Exact finite classification.** Number the coordinates by masks
$1,2,4,8$ for the primes $3,5,7,11$, and identify each support family
with its 16-bit characteristic mask. The integer numerators of
$1155\mu_P(T)$ in mask order $T=0,\ldots,15$ are

$$
(480,240,120,60,80,40,20,10,48,24,12,6,8,4,2,1).
$$

The [exact verifier](../experiments/P040_four_prime_sharpness.py)
enumerates the $167$ nonempty upward-closed families, computes
$U(\mathcal A,\mathcal B)$ using integer arithmetic with the
common denominator $12\cdot1155$, and checks all $167^2=27\,889$
ordered pairs. Exactly **four** pairs have $U>1$:

| $\mathcal A$ mask | $\mathcal B$ mask | $U(\mathcal A,\mathcal B)$ |
|---:|---:|---:|
| 65262 | 65278 | $1163/1155$ |
| 65262 | 65534 | $331/330$ |
| 65278 | 65262 | $1163/1155$ |
| 65534 | 65262 | $331/330$ |

This is a finite certificate with a fully specified exhaustive
algorithm; no solver, sampling, or numerical tolerance enters.

By exchanging $f$ and $g$, it remains to rule out the two rows with
$\mathcal A$ mask $65262$. In both cases,

$$
\mathcal A=\uparrow\{\{3\},\{5\},\{7,11\}\},
\qquad
\mathcal B\supseteq\{\{7\}\}.
$$

Thus $\mu_P(\mathcal A)=547/1155$. The set
$\{5\}\in\mathcal A$ gives $Q_P(g\mid\{5\})\le t$, so

$$
m_P(g)\le u(\{5\})=\frac8{15}.
$$

The set $\{7\}\in\mathcal B$ gives
$Q_P(f\mid\{7\})\le t$. But the indicator of $\mathcal A$
has conditional density

$$
Q_P(\mathbf1_{\mathcal A}\mid\{7\})=\frac7{15},
\qquad d(\{7\})=\frac67.
$$

Because $0\le f\le\mathbf1_{\mathcal A}$, at least

$$
d(\{7\})\left(\frac7{15}-\frac5{12}\right)
=\frac3{70}
$$

of its total mass must be removed from $\mathbf1_{\mathcal A}$.
Therefore

$$
m_P(f)+m_P(g)
\le\frac{547}{1155}-\frac3{70}+\frac8{15}
=\frac{2227}{2310}<1,
$$

contradicting admissibility. Hence all possible supports are
excluded and $\alpha(P)\ge5/12$. The reverse inequality was already
proved. $\square$

## Consequence and limitations

Combined with the exact two- and three-prime classifications,

$$
\alpha(\{3\})=\frac12,\quad
\alpha(\{3,5\})=\frac49,\quad
\alpha(\{3,5,7\})=\alpha(\{3,5,7,11\})=\frac5{12}.
$$

The [prime-prefix reduction](P040-prime-prefix-reduction.md) shows
that this settles the support-specific infimum for **every**
set of at most four odd primes: the first four minimize the
cost among four-prime supports.

It does **not** prove that the full finite-prime infimum is $5/12$;
supports of five or more primes and arbitrary arithmetic Hall cuts
remain unresolved. The construction uses established shifting,
product-measure and finite-extremal tools; historical novelty of
the particular optimization is unverified.
