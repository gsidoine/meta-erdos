# P040 — Local resilience of coprime perfect matchings

<!-- DOSSIER-SUMMARY -->
> **Research question:** Does the local matching resilience of the even–odd coprime graph converge, and is its value determined by finite-prime Hall obstructions?  
> **Formulation:** candidate. **Novelty:** unverified; original half-resilience conjecture disproved by finite-prime Hall cuts; true sharp limit unknown.  
> **Verified/known progress:** Proved 16/π²−3/2 ≤ liminf rho_n ≤ limsup rho_n ≤ 5/12; exact small-prime sieve values are 1/2 for singleton sets, 4/9 for {3,5}, and 5/12 for {3,5,7}; arbitrary finite-prime infimum remains open.  
> **Finite evidence:** Exact two-prime theorem, three-prime asymmetric theorem, monotone compression, and rational finite-profile verifiers.  
> **Symbolic prize:** A Research Prize (symbolic) — Existence and exact value of the limiting coprime-matching local resilience.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

Let $B_n$ be the balanced bipartite graph between $E_n=\{2,4,\ldots,2n\}$ and $O_n=\{1,3,\ldots,2n-1\}$, joining $e\in E_n$ and $o\in O_n$ when $\gcd(e,o)=1$.

Define its degree-relative perfect-matching resilience by

$$
\rho_n=\min_{\substack{F\subseteq E(B_n)\\B_n-F\text{ has no perfect matching}}}
\max_{v\in V(B_n)}\frac{d_F(v)}{d_{B_n}(v)}.
$$

## Research question

**Does $\rho_n$ converge, and what determines its limiting value?** In particular, does it agree with the infimum of the finite-prime conditional-density Hall obstruction parameters developed in the [supporting theorem](../../theorems/P040-finite-prime-hall-obstructions.md)?

This is a quantitative arithmetic matching question about the exact degree-relative cost of an adversarial Hall violation. It is not merely the known existence of a coprime perfect matching.

## A disproved initial conjecture

An earlier formulation asked whether $\rho_n\to1/2$. A random nearly balanced Hall cut gives the general upper bound $\limsup\rho_n\le1/2$, but **that bound is not sharp for the coprime graph**.

**Theorem (finite-prime Hall cuts).** The [complete argument](../../theorems/P040-finite-prime-hall-obstructions.md) establishes

$$
\boxed{\limsup_{n\to\infty}\rho_n
\le\frac{5163}{12155}
=0.424763\ldots<\frac12.}
$$

For an especially transparent example, let $S\subseteq E_n$ and $U\subseteq O_n$ consist of integers divisible by at least one of $3,5,7$. Both have $(19/35+o(1))n$ vertices. Deleting all coprime edges from $S$ to $U$ destroys every perfect matching by Hall's theorem, while every vertex loses at most $(7/15+o(1))$ of its original incident edges. This gives the elementary bound $\limsup\rho_n\le7/15$.

Sharper constructions select specified exact small-prime-divisibility patterns. Four primes yield $71/165$; five primes yield $914/2145$; six primes yield $5163/12155$. The underlying theorem converts each finite-prime pattern into an exact rational upper bound using a nonuniform product measure on prime supports. The calculations are reproduced by [an exact certificate program](../../experiments/P040_sieve_hall_obstructions.py).

**Fractional refinement.** The [fractional-sieve theorem](../../theorems/P040-fractional-sieve-variational.md) proves that the infimum over finite-prime support families is unchanged when selection within each support class is allowed to be fractional. An exact three-prime fractional certificate, converted to finite-prime families by an auxiliary-prime approximation, improves the bound to

$$
\boxed{\limsup_{n\to\infty}\rho_n\le\frac5{12}=0.416666\ldots.}
$$

The certificate uses the primes $3,5,7$, an exact half-mass fractional profile, and a perturbation with strictly more than half the mass on each side. Its conditional coprime-neighbor fractions and the purification argument appear in the supporting theorem and [exact verifier](../../experiments/P040_fractional_sieve_certificate.py).

The [three-prime sharpness theorem](../../theorems/P040-fractional-sieve-variational.md) proves that $5/12$ is the **exact infimum for all fractional profile pairs $f,g$ on $P=\{3,5,7\}$**, including asymmetric pairs with $m_P(f)+m_P(g)>1$. The same theorem note gives a mass-preserving coordinate compression that reduces the general finite-prime variational search to increasing fractional profiles. Additional primes or non-finite-prime Hall cuts may still improve $5/12$; this is not an unrestricted resilience lower bound.

**Exact small-prime classification.** The [two-prime threshold theorem](../../theorems/P040-two-prime-thresholds.md) determines the fractional Hall-cut infimum for all sets of at most two odd primes:

$
\alpha(P)=
\begin{cases}
4/9,&P=\{3,5\},\\
1/2,&P\ne\{3,5\}.
\end{cases}
$

Together with the three-prime theorem, the successive supports
$\{3\}$, $\{3,5\}$, and $\{3,5,7\}$ have exact thresholds
$1/2$, $4/9$, and $5/12$. These are restricted variational values,
not universal lower bounds on graph resilience. The full
finite-prime infimum and the effect of further primes remain unresolved.
The rational certificate and finite indicator checks are
[reproducible](../../experiments/P040_two_prime_thresholds.py).

**These bounds are not claimed optimal.** The limit of $\rho_n$ may be smaller or may fail to exist. In particular, convergence to the finite-prime variational infimum has not been established.

## A proved universal lower bound

The [coprime-density and reciprocal-totient moment theorem](../../theorems/P040-positive-resilience-lower-bound.md) gives

$$
\boxed{
\frac{16}{\pi^2}-\frac32
\le\liminf_{n\to\infty}\rho_n
\le\limsup_{n\to\infty}\rho_n
\le\frac5{12}.
}
$$

The new lower constant is approximately $0.12114$. The proof considers every possible Hall obstruction: intermediate-sized cuts are controlled by the global coprime-edge density $8/\pi^2$, while small cuts are controlled by a uniform fourth reciprocal moment of the prime-factor degree density. Thus the resilience does **not** tend to zero along any subsequence.

This is a two-sided bound, **not** a convergence theorem or a sharp limit. In particular, it does not establish that finite-prime cuts are asymptotically exhaustive.

## Exact finite Hall search

Hall's criterion reduces $\rho_n$ to minimizing, over nonempty $S\subseteq E_n$ and $T\subseteq O_n$ with $|T|=|S|-1$, the largest degree-relative deletion fraction resulting from removing all edges between $S$ and $O_n\setminus T$. The [exhaustive verifier](../../experiments/P040_coprime_matching_resilience.py) yields:

| $n$ | $\rho_n$ |
|---:|---:|
| 2 | $1$ |
| 3 | $2/3$ |
| 4 | $3/4$ |
| 5 | $3/5$ |
| 6 | $3/5$ |
| 7 | $1/2$ |
| 8 | $4/7$ |
| 9 | $1/2$ |
| 10 | $1/2$ |

The finite small-$n$ values do not predict the asymptotic behavior: fixed-modulus Hall obstructions only manifest their limiting proportions once the sample interval is sufficiently long.

## Literature and mathematical significance

- Carl Pomerance, [*Coprime Matchings*](https://arxiv.org/abs/2111.07157) (2021), strengthens earlier work of Bohman–Peng on coprime interval matchings. Matching existence and certain Hall nonemptiness statements are established, but do not imply degree-relative resilience under arbitrary edge deletion.
- Sah and Sawhney, [*Enumerating coprime permutations*](https://doi.org/10.1112/mtk.12159) (2022), exploit small-prime signatures and robust matching/absorption methods for counting coprime permutations.
- The extremal theory of [nonuniform product-measure intersecting families](https://arxiv.org/abs/2606.26521) provides relevant disjointness-measure comparisons, but is not asserted to determine the present Hall-resilience constant.
- General local matching resilience and adversarial edge-failure problems are established research areas; the present question fixes a specific arithmetic host graph.

**Editorial scope.** The single numbered catalogue retains the sharpened quantitative arithmetic Hall-resilience problem as an unresolved candidate. The disproved $1/2$ conjecture is preserved as a mathematical negative result rather than presented as open. Historical originality of the sharper formulation and finite-prime bounds requires further specialist review.
