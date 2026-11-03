# Fractional prime-support cuts and the sieve variational principle

**Status:** internally proved. This note does not establish convergence of the arithmetic matching resilience or optimality of the sieve variational constant. Historical priority of the reduction has not been established.

Let $P$ be a finite set of odd primes, and let $\mu_P$ be the independent product measure on $2^P$ in which a prime $p$ belongs to the random support with probability $1/p$. For $h:2^P\to[0,1]$ put

$$
m_P(h)=\sum_{T\subseteq P}\mu_P(T)h(T),\qquad
Q_P(h\mid S)=
\frac{\sum_{T\cap S=\varnothing}\mu_P(T)h(T)}
{\sum_{T\cap S=\varnothing}\mu_P(T)}.
$$

For $f,g:2^P\to[0,1]$ with $m_P(f)+m_P(g)>1$, define

$$
R_P(f,g)=\max\left\{
\max_{S:f(S)>0}Q_P(g\mid S),\
\max_{T:g(T)>0}Q_P(f\mid T)
\right\}.
$$

The *fractional-sieve infimum* is

$$
\alpha_{\mathrm{frac}}=
\inf_{\substack{P\text{ finite set of odd primes}\\
f,g:2^P\to[0,1]\\m_P(f)+m_P(g)>1}}R_P(f,g).
$$

The *finite-prime Hall infimum* $\alpha_{\mathrm{sieve}}$ is the same expression restricted to indicator functions $f=\mathbf1_{\mathcal A}$ and $g=\mathbf1_{\mathcal B}$, as defined in [the Hall obstruction theorem](P040-finite-prime-hall-obstructions.md).

## Theorem 1 — Fractional and integral sieve infima coincide

$$
\boxed{\alpha_{\mathrm{frac}}=\alpha_{\mathrm{sieve}}.}
$$

More precisely, for every finite $P$, admissible $f,g$, and $\varepsilon>0$, there are a finite set $Q$ of odd primes disjoint from $P$ and families $\mathcal A,\mathcal B\subseteq2^{P\cup Q}$ such that

$$
\mu_{P\cup Q}(\mathcal A)+\mu_{P\cup Q}(\mathcal B)>1
$$

and

$$
\max\left\{
\max_{S\in\mathcal A}Q_{P\cup Q}(\mathcal B\mid S),
\max_{T\in\mathcal B}Q_{P\cup Q}(\mathcal A\mid T)
\right\}\le R_P(f,g)+\varepsilon.
$$

### Proof

The inequality $\alpha_{\mathrm{frac}}\le\alpha_{\mathrm{sieve}}$ follows by taking indicator functions. For the reverse inequality fix $P,f,g$, and write $\sigma=m_P(f)+m_P(g)-1>0$.

The following elementary approximation uses only the divergence of the sum of reciprocal primes. Given finitely many values $z_1,\ldots,z_k\in[0,1]$ and any sufficiently large real $R$, there exist pairwise disjoint finite blocks $Q_1,\ldots,Q_k$ of primes larger than $R$ such that for $0<z_i<1$,

$$
\left|1-\prod_{q\in Q_i}\left(1-\frac1q\right)-z_i\right|<\eta.
$$

Indeed, multiply factors $1-1/q$, with $q>R$, until the product first passes $1-z_i$; the final change is at most $1/R$. The sum $\sum_{q\in Q_i}1/q$ remains bounded by a constant depending only on $z_i$, for all sufficiently large $R$. For $z_i=0$ or $1$, use the empty or full event below and no block.

Apply this construction separately to all the finitely many values $f(S)$ and $g(T)$, using disjoint prime blocks, and let $Q$ be their union. Under $\mu_Q$, define events $H_S$ and $K_T$: for a value in $(0,1)$, the event is that the random support intersects its assigned prime block; for value $0$ it is empty, and for value $1$ it is all of $2^Q$. Thus

$$
|\mu_Q(H_S)-f(S)|<\eta,\qquad
|\mu_Q(K_T)-g(T)|<\eta.
$$

The expected number of primes in a random $Q$-support is

$$
\Lambda=\sum_{q\in Q}\frac1q.
$$

For fixed $f,g$ the blocks can be chosen with $\Lambda\le C$, where $C$ does not depend on the lower cutoff $R$. Choose an integer $L$ so large that $C/L<\eta$, then take $R$ so large that $L/R<\eta$ and all block approximations hold.

Truncate every event by $D=\{U\subseteq Q:|U|\le L\}$, and define

$$
\begin{aligned}
\mathcal A&=\{S\cup U:S\subseteq P,\ U\in H_S\cap D\},\\
\mathcal B&=\{T\cup V:T\subseteq P,\ V\in K_T\cap D\}.
\end{aligned}
$$

Markov's inequality gives $\mu_Q(D^c)\le C/L<\eta$. Hence

$$
\mu_{P\cup Q}(\mathcal A)\ge m_P(f)-2\eta,\qquad
\mu_{P\cup Q}(\mathcal B)\ge m_P(g)-2\eta.
$$

In particular, the sum exceeds $1$ if $4\eta<\sigma$.

Let $S\cup U\in\mathcal A$. Necessarily $f(S)>0$ and $|U|\le L$. In the conditional product measure on $Q$-supports $V$ disjoint from $U$, every coordinate indexed by $q\in U$ is forced to be absent, while all other coordinates keep their original distributions. Coupling these two measures by changing only the coordinates in $U$ yields, for any event $H\subseteq2^Q$,

$$
\left|\Pr(V\in H\mid V\cap U=\varnothing)-\mu_Q(H)\right|
\le\sum_{q\in U}\frac1q\le\frac LR<\eta.
$$

Apply this with $H=K_T\cap D$. The product decomposition between $P$ and $Q$ now gives

$$
Q_{P\cup Q}(\mathcal B\mid S\cup U)
\le Q_P(g\mid S)+3\eta.
$$

The same calculation, exchanging $f$ and $g$, gives

$$
Q_{P\cup Q}(\mathcal A\mid T\cup V)
\le Q_P(f\mid T)+3\eta
\quad(T\cup V\in\mathcal B).
$$

Choose $\eta$ so that $4\eta<\sigma$ and $3\eta<\varepsilon$. This constructs the required integral support families. Taking infima proves the theorem. $\square$

## Proposition 2 — A three-prime fractional certificate

For the even–odd coprime graph $B_n$, with degree-relative perfect-matching resilience $\rho_n$ as defined in [P040](../problems/graph-theory/P040-coprime-matching-local-resilience.md),

$$
\boxed{\limsup_{n\to\infty}\rho_n\le\alpha_{\mathrm{sieve}}
=\alpha_{\mathrm{frac}}\le\frac5{12}.}
$$

### Proof

Take $P=\{3,5,7\}$, using masks $1,2,4$ for divisibility by $3,5,7$, respectively. Define the same fractional function on both sides:

| Support mask $S$ | $0$ | $1$ | $2$ | $3$ | $4$ | $5$ | $6$ | $7$ |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| $f(S)$ | $0$ | $23/24$ | $1$ | $5/12$ | $1$ | $1$ | $1$ | $1$ |

Direct evaluation of the product measure yields

$$
m_P(f)=\frac12
$$

and, for the seven support masks with $f(S)>0$, the conditional values

| $S$ | $1$ | $2$ | $3$ | $4$ | $5$ | $6$ | $7$ |
|---|---:|---:|---:|---:|---:|---:|---:|
| $Q_P(f\mid S)$ | $11/35$ | $5/12$ | $1/7$ | $5/12$ | $1/5$ | $23/72$ | $0$ |

Consequently $\max_{S:f(S)>0}Q_P(f\mid S)=5/12$. To meet the strict mass inequality, replace $f(1)$ by $23/24+\delta$ for any $0<\delta<1/24$, leaving the other entries unchanged; call the resulting function $f_\delta$. Then

$$
m_P(f_\delta)=\frac12+\frac8{35}\delta>\frac12,
\qquad
\max_{S:f_\delta(S)>0}Q_P(f_\delta\mid S)
\le\frac5{12}+\delta.
$$

Thus $\alpha_{\mathrm{frac}}\le5/12$ by letting $\delta\downarrow0$. Theorem 1 gives the same bound for $\alpha_{\mathrm{sieve}}$, and the [finite-prime Hall obstruction theorem](P040-finite-prime-hall-obstructions.md) establishes $\limsup_n\rho_n\le\alpha_{\mathrm{sieve}}$. All displayed fractions are checked independently by the [exact rational certificate](../experiments/P040_fractional_sieve_certificate.py). $\square$

## Proposition 3 — Exact optimality of the symmetric three-prime profile

Fix $P=\{3,5,7\}$. Consider **symmetric** fractional Hall cuts, meaning $f=g:2^P\to[0,1]$ with $m_P(f)>1/2$. Then

$$
\boxed{\inf_{f:m_P(f)>1/2}
\max_{S:f(S)>0}Q_P(f\mid S)=\frac5{12}.}
$$

**Proof.** If $f(\varnothing)>0$, the maximum is at least

$$
Q_P(f\mid\varnothing)=m_P(f)>\frac12.
$$

Suppose $f(\varnothing)=0$. The $\mu_P$-measure of all nonempty supports is $19/35$, and the single support $S_7=\{7\}$ has weight $8/105$. If $f(S_7)=0$, the selected mass is at most

$$
\frac{19}{35}-\frac8{105}=\frac7{15}<\frac12,
$$

a contradiction. Hence $f(S_7)>0$ and $Q_P(f\mid S_7)$ is among the values in the maximum.

Under the prime-support product measure, the chance of divisibility by $7$ is $1/7$. The contribution of all support types divisible by $7$ to $m_P(f)$ is at most $1/7$; on the complementary event, the selected mass is $(6/7)Q_P(f\mid S_7)$. Therefore

$$
\frac12<m_P(f)\le\frac17+\frac67Q_P(f\mid S_7),
$$

which forces $Q_P(f\mid S_7)>5/12$. This proves the lower bound on the infimum. The fractional profile in Proposition 2 has $m_P(f_\delta)>1/2$ and maximum at most $5/12+\delta$ for arbitrarily small $\delta>0$, giving the matching upper bound. $\square$

The proposition establishes **sharpness only for symmetric profiles supported on these three primes**. Neither asymmetric pairs $f\ne g$ nor additional prime supports nor arbitrary arithmetic Hall cuts are covered. In particular, it is not a lower bound for the full graph resilience $\rho_n$. The optimization is an elementary refinement of the existing certificate, without a historical priority claim.

## Scope and references

The equality in Theorem 1 concerns two infima of **finite-prime conditional-density Hall parameters**. It does not assert that these infima equal $\liminf_n\rho_n$ or $\limsup_n\rho_n$, nor that $\rho_n$ converges. The upper constant $5/12$ is not asserted to be optimal.

The argument uses elementary product-measure coupling and large-prime auxiliary coordinates. Such purification and mixed-colouring principles have general precedents; compare the graphon-partition framework of [Janson, Lo, McDiarmid, Skeja and Skerman (2026)](https://arxiv.org/abs/2610.38599). The finite-prime disjointness measure is closely related to nonuniform biased intersecting-family problems; see [Wu and Feng (2026)](https://arxiv.org/abs/2607.26871). The particular arithmetic resilience inequality has not been independently checked for historical priority.
