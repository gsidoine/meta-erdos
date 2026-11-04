# P027 — Convergence of the normalized spectral gaps

Let $\Omega_N$ be the set of maximum primitive subsets of $[N]$, and put
$m_N=\lceil N/2\rceil$. For each odd $u\le N$, let $H_u$ be the conditional
uniform heat-bath operator that resamples the choice on the dyadic chain
indexed by $u$. Define

$$
Q_N=\sum_{\substack{u\le N\\u\ {\rm odd}}}(H_u-I),
\qquad P_N=I+\frac{Q_N}{m_N}.
$$

When $|\Omega_N|>1$, let $\lambda_N$ be the smallest positive eigenvalue of
$-Q_N$ under the uniform measure on $\Omega_N$. The coordinate heat-bath chain
is irreducible, so $\lambda_N>0$. Put $\lambda_N=+\infty$ for a singleton
state space.

## Theorem — Existence of the finite-volume spectral-gap limit

$$
\boxed{\lim_{N\to\infty}\lambda_N=
\inf_{\substack{C\ge2\\|\Omega_C|>1}}\lambda_C
=:\lambda_*\in[0,\infty).}
$$

In particular, if $\gamma_n$ denotes the spectral gap of the P027
**discrete-time** heat-bath chain on maximum primitive subsets of $[2n]$, then

$$
\boxed{\lim_{n\to\infty}n\gamma_n=\lambda_*.}
$$

The number $\lambda_*$ is not determined by this theorem. In particular, it
is not established whether it is positive.

### Proof

Fix $C\ge2$ with $|\Omega_C|>1$. The [universal finite-pattern
factorization](P027-universal-finite-pattern-factorization.md) asserts that
for all sufficiently large even $N$ the state space contains an independent
factor isomorphic to $\Omega_C$. The same arithmetic argument works for
**every** sufficiently large integer $N$:

Choose $K=\lfloor\log_2 C\rfloor$, $B=3^{K+1}$ and the product $M_C$ of
all primes not exceeding $B$. For each odd integer $u$ satisfying

$$
\frac{N}{C+1}<u<\frac NC,
\qquad\gcd(u,M_C)=1,
$$

the coordinates indexed by $uq$ for odd $q\le C$ have the same exponent
intervals and internal divisibility constraints as the coordinates for
$[C]$. They have no external odd multiples at most $N$, and all inequalities
involving external proper odd divisors are automatic. These facts depend
only on the ratio $N/u\in(C,C+1)$, not on the parity of $N$.

The number of such roots is

$$
k_{N,C}=
\frac{\varphi(M_C)}{M_C C(C+1)}N+O_C(1),
$$

so at least one exists whenever $N$ is sufficiently large. Consequently,
for such $N$ there is a product decomposition

$$
\Omega_N\cong\Omega_C\times\mathcal R_{N,C}
$$

in which every single-coordinate heat-bath update preserves the factor
structure. In operator notation,

$$
Q_N=Q_C\otimes I+I\otimes Q_{\mathcal R_{N,C}}.
$$

Let $\psi$ be a nonconstant eigenfunction with
$-Q_C\psi=\lambda_C\psi$. The function
$\widetilde\psi(x,y)=\psi(x)$ is a nonconstant eigenfunction of $-Q_N$
with the same eigenvalue. Therefore

$$
\lambda_N\le\lambda_C
$$

for all sufficiently large $N$. Since $C$ is arbitrary,

$$
\limsup_{N\to\infty}\lambda_N
\le\inf_{\substack{C\ge2\\|\Omega_C|>1}}\lambda_C
=\lambda_*.
$$

The opposite inequality $\lambda_N\ge\lambda_*$ is immediate from the
definition whenever $|\Omega_N|>1$. The factorization with $C=2$ also
ensures that these state spaces are nontrivial for all sufficiently large
$N$. Thus the asserted limit exists.

Finally, $P_{2n}=I+Q_{2n}/n$. Since every $H_u$ is a self-adjoint
conditional-expectation projection, $P_{2n}$ is positive semidefinite
and its discrete-time spectral gap is exactly $\gamma_n=\lambda_{2n}/n$.
The second assertion follows. $\square$

## Consequences and limitations

The exact Rayleigh certificate for the isolated 23-state factor in
[the five-site theorem](P027-five-site-arithmetic-blocks-and-mixing-lower-bound.md)
implies the explicit bound

$$
0\le\lambda_*\le\frac{66083}{243852}.
$$

The theorem proves convergence of an **unnormalized generator gap** (or
equivalently the rescaled discrete-time gap); it does not prove a mixing-time
limit, a full-chain cutoff, or a positive uniform lower bound for
$\lambda_N$.

The construction is a finite-component inheritance argument. The underlying
dyadic-chain decomposition and arithmetic counting viewpoint have established
predecessors in H. Liu, P. P. Pach and R. Palincza,
[*The number of maximum primitive sets of integers*](https://doi.org/10.1017/S0963548321000018),
*Combinatorics, Probability and Computing* **30** (2021), 781–795, and
N. McNew, [*Counting primitive subsets and other statistics of the divisor graph
of* $\{1,\ldots,n\}$](https://doi.org/10.1016/j.ejc.2020.103237),
*European Journal of Combinatorics* **92** (2021), 103237.

No claim of historical originality is made for the spectral-gap limit.
