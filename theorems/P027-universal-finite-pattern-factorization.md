# P027 — Universal finite-pattern factors of maximum primitive sets

Let $F(N)$ be the number of primitive subsets of $[N]$ of maximum cardinality $\lceil N/2\rceil$. Thus the notation in the P027 dossier is $f(n)=F(2n)$.

## Theorem 1 — Every fixed finite pattern occurs at positive density

Fix an integer $C\ge2$, and put

$$
K=\lfloor\log_2 C\rfloor,\qquad B=3^{K+1},
\qquad M_C=\prod_{\substack{p\le B\\p\ \mathrm{prime}}}p.
$$

For $N=2n$, define

$$
\mathcal U_{n,C}
=\left\{u\in\mathbb N:
\frac{N}{C+1}<u<\frac NC,\quad\gcd(u,M_C)=1\right\}.
$$

Then the space of maximum primitive subsets of $[2n]$ contains **one independent factor isomorphic to the entire space of maximum primitive subsets of $[C]$ for each** $u\in\mathcal U_{n,C}$. More precisely, its state space is a Cartesian product

$$
\boxed{\mathcal M_{2n}\cong
\mathcal M_C^{\,k_{n,C}}\times\mathcal R_{n,C},}
$$

where $\mathcal M_N$ denotes the family of maximum primitive subsets of $[N]$, $k_{n,C}=|\mathcal U_{n,C}|$, and $\mathcal R_{n,C}$ is a finite residual space. Moreover,

$$
\boxed{k_{n,C}=
\frac{2\varphi(M_C)}{M_C C(C+1)}\,n+O_C(1).}
$$

Consequently,

$$
\boxed{F(C)^{k_{n,C}}\mid F(2n)}
$$

for every $n$. For any prime $\ell$ dividing $F(C)$, this gives

$$
\nu_\ell(F(2n))\ge
\frac{2\varphi(M_C)}{M_C C(C+1)}
\,\nu_\ell(F(C))\,n+O_C(1).
$$

### Proof

Every maximum primitive set chooses exactly one element from each dyadic chain indexed by an odd number $v\le N$. Write the chosen element as $v2^{e_v}$. The established dyadic-chain representation states that the feasible exponent vectors have

$$
\lfloor\log_3(N/v)\rfloor\le e_v\le
\lfloor\log_2(N/v)\rfloor,
$$

and satisfy $e_v>e_w$ whenever $v<w$ are odd and $v\mid w$.

For each $u\in\mathcal U_{n,C}$ take the block

$$
B_u=\{uq:1\le q\le C,\ q\ \mathrm{odd}\}.
$$

Because $N/u\in(C,C+1)$, these are exactly the **odd multiples of $u$ not exceeding $N$**. For each odd $q\le C$ and either $b\in\{2,3\}$, every threshold $qb^j$ is an integer. Consequently,

$$
\lfloor\log_b(N/(uq))\rfloor
=\lfloor\log_b(C/q)\rfloor.
$$

Thus the exponent intervals of the block agree exactly with those for $[C]$.

Any constraint between two coordinates in $B_u$ is a divisibility constraint between the corresponding odd indices $q\le C$, so the internal feasible configurations coincide with $\mathcal M_C$.

There are no external multiples: if $uq\mid v\le N$ and $v$ is odd, then $v=uqh$ for an odd $h$ with $qh\le N/u<C+1$, hence $qh\le C$ and $v\in B_u$.

Consider an odd **external divisor** $d\mid uq$ with $d\notin B_u$. The integer $q$ has prime factors at most $C\le B$, whereas $\gcd(u,M_C)=1$. Since $d$ is not divisible by $u$, some prime factor greater than $B$ of $u$ is absent from $d$. Thus $d<uq/B$ and

$$
\lfloor\log_3(N/d)\rfloor
\ge K+1
>
\lfloor\log_2(N/(uq))\rfloor.
$$

The strict inequality uses $N/d>B=3^{K+1}$ and $N/u<C+1\le2^{K+1}$. Hence every external-divisor inequality $e_d>e_{uq}$ is automatic for all feasible exponents.

The blocks are pairwise disjoint. Indeed, if $uq=u'q'$ with both $u,u'$ coprime to $M_C$ and $q,q'\le C$ odd, uniqueness of the prime factors at most $B$ forces $q=q'$ and $u=u'$. All constraints crossing a block boundary are automatic or absent. Therefore the feasible exponent space factors exactly as asserted.

The count of integers coprime to the fixed modulus $M_C$ in the interval $(N/(C+1),N/C)$ is

$$
\frac{\varphi(M_C)}{M_C}
\left(\frac NC-\frac N{C+1}\right)+O_C(1),
$$

which gives the formula for $k_{n,C}$. Taking cardinalities proves the divisibility statement and its valuation consequence. $\square$

## Example — Linear divisibility by 13

For $C=20$ there are ten odd dyadic chains. The only nonconstant exponent coordinates are

$$
e_1\in\{2,3,4\},\qquad
e_3,e_5\in\{1,2\},\qquad
e_7,e_9\in\{0,1\}.
$$

The nonautomatic constraints are $e_1>e_3$, $e_1>e_5$ and $e_3>e_9$. When $e_1=2$, there are two choices. When $e_1=3$ or $4$, there are twelve choices each. Thus

$$
\boxed{F(20)=2+12+12=26=2\cdot13.}
$$

Theorem 1 yields a constant $c_{13}>0$ for which

$$
\boxed{13^{\lfloor c_{13}n\rfloor}\mid F(2n)}
$$

for every sufficiently large $n$. An explicit admissible value is any fixed positive number smaller than $2\varphi(M_{20})/(420M_{20})$.

This is a general arithmetic divisibility consequence; it does not imply that **every** prime divides some $F(C)$.

## Theorem 2 — Transfer of finite-factor spectral gaps

For each $C$ with $F(C)>1$, let $H_q$ be the conditional uniform heat-bath operator acting on the exponent coordinate indexed by the odd integer $q\le C$ in $\mathcal M_C$. Set

$$
Q_C=\sum_{\substack{1\le q\le C\\q\ \mathrm{odd}}}(H_q-I),
$$

and let $\lambda_C>0$ be the spectral gap of $-Q_C$ under the uniform distribution on $\mathcal M_C$. Then the full P027 single-dyadic-chain heat bath satisfies, for every fixed $\varepsilon\in(0,1)$,

$$
\boxed{t_{\mathrm{mix}}(n,\varepsilon)\ge
\frac{n}{2\lambda_C}\log n-O_{C,\varepsilon}(n).}
$$

In particular,

$$
\boxed{\liminf_{n\to\infty}
\frac{t_{\mathrm{mix}}(n,\varepsilon)}{n\log n}
\ge\sup_{\substack{C\ge2\\F(C)>1}}\frac{1}{2\lambda_C}.}
$$

**Proof.** Single-coordinate heat-bath moves connect $\mathcal M_C$: its feasible exponent vectors form a coordinatewise lattice, and one can move from any configuration to its coordinatewise meet with another by lowering coordinates in descending odd-index order, then raise coordinates in ascending order. Thus $\lambda_C>0$.

Theorem 1 provides $k=k_{n,C}=\Theta_C(n)$ independent factors. Their projected discrete-time transition operator is exactly

$$
I+\frac1n\sum_{i=1}^k Q_C^{(i)},
$$

since each of the $n$ odd-index coordinates is selected with probability $1/n$ by the full heat bath.

Choose a mean-zero, unit-variance eigenfunction $\psi$ of $-Q_C$ with eigenvalue $\lambda_C$ and a state $x_0$ with $a=\psi(x_0)\ne0$. Start all $k$ factors at $x_0$ and put $S_t=\sum_i\psi(X_t^{(i)})$. Then

$$
\mathbb E S_t=ka(1-\lambda_C/n)^t.
$$

For distinct factors, the function $\psi(X^{(i)})\psi(X^{(j)})$ is an eigenfunction with eigenvalue $1-2\lambda_C/n$, so

$$
\mathrm{Cov}(\psi(X_t^{(i)}),\psi(X_t^{(j)}))
=a^2\left[(1-2\lambda_C/n)^t-(1-\lambda_C/n)^{2t}\right]\le0
$$

for all sufficiently large $n$. As $\mathcal M_C$ is fixed and finite, $\mathrm{Var}(S_t)=O_C(k)$; in stationarity $S_t$ has mean zero and variance $k$. At $t=(n/(2\lambda_C))(\log k-A)$, the squared mean is of order $k e^A$, while both variances are $O_C(k)$. Choosing $A=A(C,\varepsilon)$ sufficiently large separates the two distributions by Chebyshev's inequality and yields the mixing lower bound. Since $\log k=\log n+O_C(1)$, the displayed form follows. Taking the supremum over fixed $C$ gives the second inequality. $\square$

**Dichotomy.** If the local gaps $\lambda_C$ have infimum zero along a sequence of nontrivial finite patterns, then the full heat-bath walk has $t_{\mathrm{mix}}(n,\varepsilon)/(n\log n)\to\infty$. No such decay of $\lambda_C$ is established here.

## Context and priority

The dyadic-chain decomposition and counting problem are established work: H. Liu, P. P. Pach and R. Palincza, [*The number of maximum primitive sets of integers*](https://doi.org/10.1017/S0963548321000018), *Combinatorics, Probability and Computing* **30** (2021), 781–795. See also N. McNew, [*Counting primitive subsets and other statistics of the divisor graph of* $\{1,\ldots,n\}$](https://doi.org/10.1016/j.ejc.2020.103237), *European Journal of Combinatorics* **92** (2021), 103237, for component-based divisor-graph enumeration.

The precise finite-pattern factorization, its valuation corollary and spectral transfer are proved above, but **historical originality is not established**. Counting decomposition methods in the cited papers may already imply some or all of the factorization. The spectral bound does not prove an improved universal coefficient or resolve full-chain mixing.
