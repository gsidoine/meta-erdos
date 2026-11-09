# P043 — Components of the prime-denominator Farey graph

<!-- DOSSIER-SUMMARY -->
> **Research question:** What is the asymptotic size of the largest connected component of the Farey graph induced by fractions with prime denominators?  
> **Formulation:** candidate. **Novelty:** unverified; Farey graphs and prime-denominator fractions have established prior art.  
> **Verified/known progress:** Proved exact two-step central-layer formula and |L_N| ~ 2N loglog N/log N via Bombieri–Vinogradov, hence liminf C(N) log N/(N loglog N) ≥ 2; full largest-component order open.  
> **Finite evidence:** Exact two-step vertex enumeration and residue-class formula checked for N≤10,000 at selected sizes; prior forest and component identities N≤101.  
> **Symbolic prize:** A Coffee (symbolic) — A sharp asymptotic for the largest component of the prime-denominator Farey graph.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

For $N\ge2$, form the graph on reduced fractions $a/p$ with $1\le a<p\le N$ and $p$ prime. Join $a/p$ to $b/q$ when $|aq-bp|=1$. Let $C(N)$ denote the largest connected-component size.

**Question.** Determine the asymptotic order of $C(N)$.

## Proven asymptotic growth of the two-step central layer

Let $Y=\lfloor N^{1/3}\rfloor$. Consider the fractions $b/q$, with $N/2<q\le N$ prime, that can be reached from $1/2$ in exactly two graph edges through an intermediate vertex of prime denominator $3\le p\le Y$. The [complete two-step theorem](../../theorems/P043-two-step-prime-denominator-growth.md) proves

$
\left|\mathcal L_N\right|
=(2+o(1))\frac{N\log\log N}{\log N}.
$

In particular the largest connected component satisfies

$
\boxed{\liminf_{N\to\infty}
\frac{C(N)\log N}{N\log\log N}\ge2.}
$

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
