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

## Theorem 4 — Unrestricted asymmetry on three primes

Let $P=\{3,5,7\}$. Then

$$
\boxed{
\inf_{\substack{f,g:2^P\to[0,1]\\m_P(f)+m_P(g)>1}}
R_P(f,g)=\frac5{12}.
}
$$

In fact, every admissible pair has $R_P(f,g)>5/12$. No symmetry assumption $f=g$ is required.

**Proof.** Write $m(h)=m_P(h)$, $Q(h\mid S)=Q_P(h\mid S)$ and $t=5/12$. Let

$$
D(S)=\prod_{p\in S}\left(1-\frac1p\right).
$$

For any $h:2^P\to[0,1]$,

$$
m(h)\le 1-D(S)+D(S)Q(h\mid S).
$$

Consequently, $Q(h\mid S)\le t$ implies

$$
m(h)\le u(S):=1-(1-t)D(S).
$$

In particular,

$$
\begin{aligned}
u(\varnothing)&=\frac5{12},&
u(\{3\})&=\frac{11}{18},&
u(\{5\})&=\frac8{15},\\
u(\{7\})&=\frac12,&
u(P)&=\frac{11}{15}.
\end{aligned}
$$

Since $D(S)\ge D(P)$, one also has $u(S)\le u(P)$ for all $S\subseteq P$. The exact weights relevant to the argument are

$$
\begin{aligned}
\mu_P(\varnothing)&=\frac{48}{105},&
\mu_P(\{3\})&=\frac{24}{105},&
\mu_P(\{5\})&=\frac{12}{105},\\
\mu_P(\{7\})&=\frac8{105},&
\mu_P(2^P\setminus\{\varnothing,\{3\},\{5\},\{7\}\})&=\frac{13}{105}.
\end{aligned}
$$

Suppose for a contradiction that $m(f)+m(g)>1$ but $R_P(f,g)\le t$.

**Case 1: at least one empty support is selected.** By exchanging the two profiles, assume $f(\varnothing)>0$. Then $m(g)\le u(\varnothing)=t$ and hence $m(f)>7/12$. Since $u(\varnothing),u(\{7\}),u(\{5\})$ are all smaller than $7/12$, the support of $g$ contains none of $\varnothing,\{7\},\{5\}$. Thus

$$
m(g)\le\frac{37}{105},
\qquad m(f)>\frac{68}{105}>\frac{11}{18}.
$$

It follows that $g(\{3\})=0$ as well. Hence $m(g)\le13/105$ and $m(f)>92/105$. But $g$ is not identically zero, since $m(f)\le1$ and $m(f)+m(g)>1$. Choose $S$ with $g(S)>0$. The conditional inequality gives $m(f)\le u(S)\le u(P)=11/15<92/105$, a contradiction.

**Case 2: neither empty support is selected.** Here $m(f),m(g)\le57/105$. After exchanging the two profiles, $m(f)>1/2$. Since omitting the singleton $\{7\}$ would leave mass at most $49/105<1/2$, one has $f(\{7\})>0$. Thus $m(g)\le u(\{7\})=1/2$. Moreover $g(\{7\})=0$, since otherwise $m(f)\le1/2$. Therefore $m(g)\le49/105$, giving $m(f)>56/105=8/15$.

If $g(\{5\})=0$, then $m(g)\le(49-12)/105=37/105$ and $m(f)+m(g)\le(57+37)/105<1$, another contradiction. Hence $g(\{5\})>0$, which implies $m(f)\le u(\{5\})=8/15$, the final contradiction.

Every admissible $f,g$ therefore has $R_P(f,g)>5/12$. Proposition 2 supplies admissible symmetric profiles $f=g=f_\delta$ with $R_P(f_\delta,f_\delta)\le5/12+\delta$ for arbitrarily small $\delta>0$. Thus the infimum is $5/12$. $\square$

The theorem eliminates **asymmetric as well as symmetric improvements using only the three primes $3,5,7$**. It does not prove $\alpha_{\mathrm{frac}}\ge5/12$ when arbitrary additional primes are allowed, and it does not bound the unrestricted graph resilience from below by $5/12$.

## Theorem 5 — Monotone compression of fractional Hall profiles

More generally, let $P$ be any finite coordinate set, with product measure $\mu_P$ whose coordinate inclusion probabilities $q_p$ satisfy $0<q_p<1$. Define $m_P$, $Q_P$ and $R_P$ as above, using this product measure.

**Theorem.** For any admissible $f,g:2^P\to[0,1]$, there are coordinatewise increasing functions $f^\uparrow,g^\uparrow:2^P\to[0,1]$ such that

$$
m_P(f^\uparrow)=m_P(f),\qquad
m_P(g^\uparrow)=m_P(g),\qquad
R_P(f^\uparrow,g^\uparrow)\le R_P(f,g).
$$

Consequently, the finite-prime infimum $\alpha_{\mathrm{frac}}$ can be taken over **increasing** fractional profiles on each finite prime set.

**Proof.** Fix $p\in P$, write $q=q_p$, and let $U\subseteq P\setminus\{p\}$. For a profile $h$, put

$$
a_U=(1-q)h(U)+q h(U\cup\{p\})
$$

and define a new profile $\widehat h$ by

$$
\widehat h(U\cup\{p\})=\min\{1,a_U/q\},\qquad
\widehat h(U)=\frac{a_U-q\widehat h(U\cup\{p\})}{1-q}.
$$

Then $0\le\widehat h(U)\le\widehat h(U\cup\{p\})\le1$; the weighted mean $a_U$ is unchanged; and $\widehat h(U)\le h(U)$.

Apply this operation simultaneously to $f$ and $g$. Their masses are preserved. For any $S$ not containing $p$, the conditional quantity $Q_P(\widehat h\mid S)$ equals $Q_P(h\mid S)$ because it averages over the unchanged $p$-coordinate mean. For $S$ containing $p$, conditioning forces the $p$-coordinate to be absent, so

$$
Q_P(\widehat h\mid S)\le Q_P(h\mid S).
$$

Consider a support $S$ for which $\widehat f(S)>0$. If $p\notin S$, then $f(S)>0$, and the conditional constraint for $g$ is unchanged. If $p\in S$, then either $f(S)>0$ or $f(S\setminus\{p\})>0$. In the former case the conditional cost does not increase. In the latter case, since $\widehat g(U)\le\widehat g(U\cup\{p\})$,

$$
Q_P(\widehat g\mid S)
\le Q_P(\widehat g\mid S\setminus\{p\})
=Q_P(g\mid S\setminus\{p\}).
$$

The right side was constrained by the original support of $f$. Thus the largest conditional cost from $f$ to $g$ does not increase. The same argument with the profiles exchanged proves the claim for the other direction.

Repeat this operation for every $p\in P$. Compression in a later coordinate preserves earlier monotonicity: both output values for a coordinate are nondecreasing functions of the weighted mean of its two input values. Thus the resulting profiles are coordinatewise increasing, have the original masses, and have no larger value of $R_P$. $\square$

This is a measure-preserving form of upward compression, related to classical shifting for biased intersecting families; compare Keevash, Lifshitz, Long and Minzer, [*Forbidden intersections for codes*](https://doi.org/10.1112/jlms.12801), *J. London Math. Soc.* **108** (2023), 2037–2083. That source is a methodological predecessor, not an assertion that it proves this precise conditional-deletion lemma. The compression reduces the **search space** of the unrestricted finite-prime variational problem; it does not evaluate its infimum. Historical priority for this formulation remains unverified.

## Scope and references

The equality in Theorem 1 concerns two infima of **finite-prime conditional-density Hall parameters**. It does not assert that these infima equal $\liminf_n\rho_n$ or $\limsup_n\rho_n$, nor that $\rho_n$ converges. The upper constant $5/12$ is optimal for all fractional profiles on the three-prime support $\{3,5,7\}$, but is not asserted optimal for larger finite prime sets or for the full graph resilience.

The argument uses elementary product-measure coupling and large-prime auxiliary coordinates. Such purification and mixed-colouring principles have general precedents; compare the graphon-partition framework of [Janson, Lo, McDiarmid, Skeja and Skerman (2026)](https://arxiv.org/abs/2610.38599). The finite-prime disjointness measure is closely related to nonuniform biased intersecting-family problems; see [Wu and Feng (2026)](https://arxiv.org/abs/2607.26871). The particular arithmetic resilience inequality has not been independently checked for historical priority.
