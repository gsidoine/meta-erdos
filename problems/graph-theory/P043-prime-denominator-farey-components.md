# P043 — Components of the prime-denominator Farey graph

<!-- DOSSIER-SUMMARY -->
> **Research question:** What is the asymptotic size of the largest connected component of the Farey graph induced by fractions with prime denominators?  
> **Formulation:** candidate. **Novelty:** unverified; Farey graphs and prime-denominator fractions have established prior art.  
> **Verified/known progress:** Exact distance-two identity d₂(q)=2[ω(q²−4)−1_{q−2 prime}−1_{q+2 prime}]; D₂(N)~4N loglogN/logN and second moment O(N loglogN/logN), hence d₂(q)~4loglogq for almost all prime q; full C(N) asymptotic open.  
> **Finite evidence:** Independent Farey determinant construction and shifted-prime-factor counts agree by denominator for N=5,11,29,101,500,2000,5000; existing forest and component identities.  
> **Symbolic prize:** A Coffee (symbolic) — A sharp asymptotic for the largest component of the prime-denominator Farey graph.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

For $N\ge2$, form the graph on reduced fractions $a/p$ with $1\le a<p\le N$ and $p$ prime. Join $a/p$ to $b/q$ when $|aq-bp|=1$. Let $C(N)$ denote the largest connected-component size.

**Question.** Determine the asymptotic order of $C(N)$.

## Exact distance-two neighborhood theorem

The [exact prime-factor theorem](../../theorems/P043-exact-distance-two-prime-factors.md) determines the entire set of vertices at graph distance exactly two from $1/2$. With $\omega(k)$ denoting the number of distinct prime factors of $k$,

$$
D_2(N)=2\sum_{\substack{3\le q\le N\\q\text{ prime}}}
\bigl[\omega(q-2)+\omega(q+2)-\mathbf1_{\mathbb P}(q-2)-\mathbf1_{\mathbb P}(q+2)\bigr].
$$

Using the classical Bombieri–Vinogradov theorem and Mertens' prime harmonic-sum estimate,

$$
\boxed{D_2(N)=(4+o(1))\frac{N\log\log N}{\log N}}
$$

and consequently

$$
\boxed{\liminf_{N\to\infty}\frac{C(N)\log N}{N\log\log N}\ge4.}
$$

The [independent exact checker](../../experiments/P043_exact_distance_two.py) constructs all distance-two Farey incidences by determinants and matches the shifted-prime-factor count for each denominator. The finite computation is independent evidence for the **exact identity**, not for the asymptotic. The earlier restricted two-step theorem with coefficient $2$ remains correct but is superseded as a component lower bound.

The exact formula also yields a second-moment estimate, proved in the same theorem note, showing that for almost all prime denominators $q$ the number $d_2(q)$ of distance-two vertices with denominator $q$ satisfies $d_2(q)=(4+o(1))\log\log q$. The proof uses two-modulus Bombieri–Vinogradov and Chebyshev's inequality; it does not establish a Gaussian limit law.

The full asymptotic order of the largest component remains open. The novelty of the precise graph-theoretic formula has not been certified.

## Proven asymptotic growth of the two-step central layer

Let $Y=\lfloor N^{1/3}\rfloor$. Consider the fractions $b/q$, with $N/2<q\le N$ prime, that can be reached from $1/2$ in exactly two graph edges through an intermediate vertex of prime denominator $3\le p\le Y$. The [complete two-step theorem](../../theorems/P043-two-step-prime-denominator-growth.md) proves

$$
\left|\mathcal L_N\right|
=(2+o(1))\frac{N\log\log N}{\log N}.
$$

In particular the largest connected component satisfies

$$
\boxed{\liminf_{N\to\infty}
\frac{C(N)\log N}{N\log\log N}\ge2.}
$$

The proof first establishes an exact, collision-free count of the two-step vertices by congruences $q\equiv\pm2\pmod p$. The classical Bombieri–Vinogradov theorem and the prime harmonic-sum asymptotic then evaluate the count. The [independent finite verifier](../../experiments/P043_two_step_prime_layer.py) checks the exact formula and determinant incidences.

This strictly improves the elementary bound $C(N)\ge2\pi(N)-1$ by a factor tending to infinity. It does not establish the asymptotic order of $C(N)$ itself, nor the historical novelty of this layer. The strong arithmetic progression theorem is imported classical mathematics.

## Known results

The [supporting theorem](../../theorems/P043-prime-denominator-farey-structure.md) proves that deleting $1/2$ leaves a forest. If $c(N)$ is the number of components and $T_2(N)$ counts twin-prime pairs $p,p+2\le N$, then

$$
c(N)=\sum_{p\le N}(p-1)-\pi(N)(\pi(N)-1)+2T_2(N).
$$

Every triangle contains $1/2$, with exactly two triangles per twin-prime pair. This is an exact structural reformulation and proves nothing about the infinitude of twin primes. Elementary component-size bounds are also established in the theorem note.

## Computation

An [exact graph verifier](../../experiments/P043_prime_farey_components.py) checks the structural identities, component sizes and forest assertion for finite $N$. The component of $1/2$ is largest in the tested range, but that finite statement is not a proof for all $N$.

## Related literature

The ordinary Farey graph and Stern–Brocot parent relation are classical. See [Farey graph background](https://web.sas.upenn.edu/miguellopez/2021/07/11/farey/) and Welch, [*Farey fractions with prime denominators*](https://www.impan.pl/shop/en/publication/transaction/download/product/82971). Kushwaha–Sarma, [*Farey-subgraphs and Continued Fractions*](https://arxiv.org/abs/2106.14856), study a different Farey subgraph restriction.

Historical priority and the unresolved status of the precise maximum-component question require specialist comparison.
