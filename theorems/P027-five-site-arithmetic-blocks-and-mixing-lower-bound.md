# P027 — Isolated 23-state arithmetic blocks and a stronger mixing lower bound

**Status:** internally proved, with an exact rational spectral certificate. This does not settle the full-chain upper mixing bound or cutoff. The primitive-set counting theory has established predecessors, so historical novelty is unverified.

## Set-up

Let $N=2n$, and let $f(n)$ denote the number of maximum (size-$n$) primitive subsets of $[N]$. By the [dyadic-chain exponent representation](P027-primitive-set-exchange-diameter.md), these sets are precisely integer vectors indexed by odd $u\le N$, satisfying

$$
m_u=\lfloor\log_3(N/u)\rfloor\le e_u
\le L_u=\lfloor\log_2(N/u)\rfloor,\qquad
e_u>e_v\text{ whenever }v/u\ge3\text{ is odd}.
$$

For comparable odd indices $a<b$, the strict inequality is automatically satisfied for *every* feasible choice when $m_a>L_b$; call an edge *potentially active* otherwise. The P027 discrete-time heat bath selects one of the $n$ coordinates uniformly and resamples it uniformly from its conditional allowed interval.

## Theorem A — An isolated five-coordinate component

For sufficiently large $n$, let $u$ satisfy

$$
N/56<u\le N/54,\qquad \gcd(u,30030)=1.
$$

The five indices $u,3u,5u,9u,27u$ form an **independent factor** of the state space and dynamics, with exponent intervals, in this order,

$$
[3,5],\quad[2,4],\quad[2,3],\quad[1,2],\quad[0,1].
$$

Their only potentially active inequalities are

$$
e_u>e_{3u},\quad e_u>e_{5u},\quad
e_{3u}>e_{9u},\quad e_{9u}>e_{27u}.
$$

These conditions admit **exactly 23** integer assignments. Different qualifying roots yield disjoint factors. Their number is

$$
\boxed{k_n=\frac{16}{63063}n+O(1).}
$$

### Proof

Write $t=N/u\in[54,56)$. Direct powers of 2 and 3 yield the displayed exponent intervals and the four active internal comparisons. All other internal comparisons are automatically strict.

Every prime factor of $u$ is at least 17. A proper divisor $d$ of $cu$, $c\in\{1,3,5,9,27\}$, not already represented by an earlier member of the five-index block satisfies $d\le cu/17$. Therefore

$$
m_d\ge\lfloor\log_3(17t/c)\rfloor>L_{cu}.
$$

For the five multipliers $c$, the bounds on the left are respectively at least $6,5,4,4,3$, exceeding $L_{cu}=5,4,3,2,1$. Hence all constraints with *external divisors* are automatically strict.

For proper *external multiples*, the smallest missing odd multiple of $u$ is $7u$, and $L_{7u}\le2<m_u=3$. For $3u$ or $5u$, the smallest missing multiple is $15u$, with $L_{15u}\le1<m_{3u}=m_{5u}=2$. For $9u$, it is $45u$, where $L_{45u}=0<m_{9u}=1$. Finally, $81u>N$. Thus all external multiple comparisons are automatically strict. The blocks factor exactly, and exhaustive enumeration of the five finite intervals subject to the four inequalities gives 23 assignments.

The root interval contains

$$
N(1/54-1/56)\frac{\varphi(30030)}{30030}+O(1)
=2n(1/54-1/56)\frac{192}{1001}+O(1)
=\frac{16}{63063}n+O(1)
$$

integers coprime to 30030, by periodic residue counting. The blocks are disjoint because their possible ratios are fixed small odd multipliers while each root is coprime to $3$ and $5$. □

## Theorem B — Exact spectral certificate

Let $\Omega_*$ be these 23 states in **lexicographic order** of the five exponents. For $j=1,\dots,5$, let $H_j$ uniformly resample only coordinate $j$, conditional on the other four. Define the self-adjoint local generator

$$
Q=\sum_{j=1}^5(H_j-I)
$$

on functions under the uniform measure $\pi_*$ on $\Omega_*$. Let $\lambda_*>0$ be the smallest nonzero eigenvalue of $-Q$; the finite update chain is irreducible by the monotone-coordinate exchange argument.

**Certified bound:**

$$
\boxed{\lambda_*\le\frac{101}{363}.}
$$

### Exact integer certificate

Order all states lexicographically. Assign them in that order the values

$$
g=(-8,-5,-4,-2,1,3,-2,1,3,-4,-3,-1,2,4,-1,2,4,-1,2,4,-1,2,4).
$$

Direct rational summation over all single-coordinate conditional resamplings yields

$$
\mathrm{Var}_{\pi_*}(g)=\frac{242}{23},\qquad
\langle g,-Qg\rangle_{\pi_*}=\frac{202}{69}.
$$

The Rayleigh principle therefore gives

$$
\lambda_*\le
\frac{\langle g,-Qg\rangle_{\pi_*}}{\mathrm{Var}_{\pi_*}(g)}
=\frac{101}{363}.
$$

The accompanying [standard-library program](../experiments/P027_five_site_mixing_obstruction.py) computes the state enumeration, variance and energy with exact rational arithmetic. Exploratory floating-point diagonalization gives $\lambda_*\approx0.270868$, but this numerical approximation is **not needed** for the proved bound. □

## Theorem C — Projected cutoff and improved full-chain mixing bound

Let $\mathcal Y_{n,t}$ be the projection of the full P027 heat bath onto all $k_n$ five-site blocks. It has uniform product stationary measure and exact transition operator

$$
P_n^{\mathrm{proj}}=
I+\frac1n\sum_{i=1}^{k_n}Q^{(i)},
$$

where $Q^{(i)}$ acts on the $i$-th five-site block. The projected walk has total-variation **cutoff** at

$$
\frac{n}{2\lambda_*}\log k_n
$$

with an $O(n)$ window. Hence for every fixed $0<\varepsilon<1$, the **full chain** satisfies

$$
\boxed{
t_{\mathrm{mix}}(n,\varepsilon)
\ge\frac{363}{202}\,n\log n-O_\varepsilon(n).
}
$$

### Proof

Choose a stationary-orthonormal eigenbasis $1,\psi_1,\ldots,\psi_{22}$ for $-Q$, with eigenvalues $\lambda_j\ge\lambda_*$. On $k_n$ blocks, tensor products of these eigenfunctions are eigenfunctions of $P_n^{\mathrm{proj}}$ with eigenvalues $1-(\sum_i\lambda_{j_i})/n$. Each conditional heat-bath operator $H_j$ is an orthogonal projection, so the eigenvalues of $-Q$ lie in $[0,5]$; since $5k_n/n<1$ for all sufficiently large $n$, the product eigenvalues used below are nonnegative. This justifies their exponential upper bounds after squaring. There is a finite constant $C$ such that, from any fixed identical initial block state,

$$
\chi^2(\mathcal L(\mathcal Y_{n,t})\Vert\pi_*^{\otimes k_n})
\le(1+C e^{-2\lambda_* t/n})^{k_n}-1.
$$

Thus total variation tends to zero when $t=\frac{n}{2\lambda_*}(\log k_n+a_n)$, $a_n\to\infty$.

For the complementary lower window, take a unit-variance $\lambda_*$-eigenfunction $\psi$ and an initial state $s_0$ with $a=\psi(s_0)\ne0$. The test statistic $S_t=\sum_{i=1}^{k_n}\psi(\mathcal Y^{(i)}_{n,t})$ has mean $k_na(1-\lambda_*/n)^t$. For $i\ne j$, the pair eigenfunction gives

$$
\mathrm{Cov}(\psi_i(t),\psi_j(t))
=a^2\big[(1-2\lambda_*/n)^t-(1-\lambda_*/n)^{2t}\big]\le0.
$$

The finite state space bounds $\mathrm{Var}(S_t)\le C'k_n$; in stationarity, $S_t$ has mean zero and variance $k_n$. Chebyshev distinguishes the two laws in total variation at $t=\frac{n}{2\lambda_*}(\log k_n-a_n)$, $a_n\to\infty$. This proves cutoff with window $O(n)$.

Total variation cannot increase under projection. Since $\log k_n=\log n+O(1)$, the variational bound $\lambda_*\le101/363$ gives the displayed certified lower bound for the full chain. **No upper bound or cutoff for the full chain is asserted.** □

## Sharper exact spectral certificate

The preceding Rayleigh quotient is not optimal for this finite 23-state generator. The following improved integer-valued test function requires no floating-point or spectral approximation.

Enumerate the same 23 exponent vectors in lexicographic order and put

$
g_1=(-102,-65,-53,-25,17,45,-21,19,45,
-56,-44,-16,21,47,-13,22,48,-11,25,50,-9,26,50).
$

The entries sum to zero. Direct exact enumeration of the five conditional heat-bath updates gives

$
\mathrm{Var}_{\pi_*}(g_1)=\frac{40642}{23},
\qquad
\langle g_1,-Qg_1\rangle_{\pi_*}=\frac{66083}{138}.
$

Thus the Rayleigh principle improves the certified bound to

$
\boxed{\lambda_*\le\frac{66083}{243852}<\frac{101}{363}.}
$

The proof of Theorem C, which uses only an upper bound on $\lambda_*$ to obtain a full-chain **lower** mixing bound, now yields

$
\boxed{t_{\mathrm{mix}}(n,\varepsilon)\ge
\frac{121926}{66083}\,n\log n-O_\varepsilon(n).}
$

Here $121926/66083\approx1.84504335$, improving the earlier coefficient $363/202\approx1.79702970$. The proof of a cutoff for the projected 23-state product still uses the **true** eigenvalue $\lambda_*$ and is unchanged; no cutoff for the full chain follows. All arithmetic is independently reproducible in the updated exact-fraction verification program. The improvement is an explicit spectral certificate, not a claim that the spectral gap is exactly the displayed fraction.

## Corollary — Linear 23-adic and 3-adic divisibility

Because the state space contains $k_n$ completely independent 23-state factors,

$$
\boxed{23^{k_n}\mid f(n),\qquad
\nu_{23}(f(n))\ge\frac{16}{63063}n+O(1).}
$$

An additional, mutually disjoint **three-state factor** is formed by $(u,3u)$ whenever $N/8<u\le N/6$ and $\gcd(u,6)=1$. The allowed exponents are $\{1,2\},\{0,1\}$ and the sole active inequality is $e_u>e_{3u}$; hence its exact three assignments are $(1,0),(2,0),(2,1)$. All external comparisons are automatic because the smallest odd prime factor of $u$ is at least 5, while the first external odd multiple is at least $5u>N/2$. The number of such pairs is

$$
\ell_n=\frac n{36}+O(1).
$$

Therefore

$$
\boxed{3^{\ell_n}23^{k_n}\mid f(n).}
$$

Both families are disjoint from the earlier autonomous binary coordinates. This is an exact arithmetic divisibility result, not simply a lower bound on the size of $f(n)$.

## Historical source and next problem

The maximum primitive-set count $f(n)$, dyadic-chain decomposition and exponential counting constant were studied by [Liu–Pach–Palincza (2021)](https://doi.org/10.1017/S0963548321000018), who give a finite-configuration counting algorithm. They must receive credit for the underlying objects and approach. A targeted literature search did not find this exact **five-site heat-bath cutoff** or the displayed **Rayleigh certificate**, but this is not an exhaustive originality audit. Some multiplicative counting factors may already be implicit in the published algorithm.

The full P027 chain contains larger interacting blocks and its asymptotic mixing order remains unknown. The present result is a **strictly stronger lower bound** on full mixing, not a resolution. The next theoretical question is whether positive-density finite motifs have arbitrarily small intrinsic spectral gaps; if so the full mixing scale could exceed every fixed multiple of $n\log n$. No such claim is made without proof.
