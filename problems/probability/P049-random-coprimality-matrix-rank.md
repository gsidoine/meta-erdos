# P049 — Rank of a randomly thinned coprimality matrix

<!-- DOSSIER-SUMMARY -->
> **Research question:** When each integer of [n] is retained independently with probability p, does the F_2 rank of the induced coprimality matrix divided by n converge, for every fixed 0<p<1?  
> **Formulation:** candidate. **Novelty:** unverified; full-matrix rank classical, random principal-submatrix limit needs a targeted specialist comparison.  
> **Verified/known progress:** Known exact full rank equals the squarefree count; bounded-differences concentration and an expected-rank radical-occupancy upper bound are proved.  
> **Finite evidence:** Exact binary Gaussian elimination for finite Bernoulli subsets with fixed seeds; simulations do not prove convergence.  
> **Symbolic prize:** One hundred grams of caviar — A proved limit and explicit characterization of the rank density for every fixed retention probability.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

**Area:** probabilistic number theory and linear algebra.

## Problem

Fix $0<p<1$, and retain each integer of $[n]$ independently with probability $p$, obtaining $S_n$. Let $C(S_n)$ be the matrix over $\mathbb F_2$ indexed by $S_n$, with

$$
C(S_n)_{a,b}=\mathbf 1_{\gcd(a,b)=1}.
$$

Does the ratio

$$
\frac{\mathrm{rank}_{\mathbb F_2} C(S_n)}{n}
$$

converge in probability to a deterministic function $\rho(p)$? If so, determine $\rho(p)$.

The assertion of convergence is the question. No particular formula for $\rho(p)$ is assumed.

## Established identities

**Proposition 1 (full matrix).** For $S_n=[n]$,

$$
\mathrm{rank}_{\mathbb F_2}C([n])
=\sum_{d\le n}\mu^2(d)
=\left(\frac6{\pi^2}+o(1)\right)n.
$$

**Proof.** Set $E_{i,d}=\mathbf1_{d\mid i}$ for $1\le i,d\le n$. The identity

$$
\mathbf1_{\gcd(i,j)=1}
=\sum_{d\mid i,\ d\mid j}\mu(d)
$$

gives $C([n])=E\,\mathrm{diag}(\mu(1),\ldots,\mu(n))E^\mathsf T$ over $\mathbb F_2$. Since $E$ is lower triangular with diagonal ones, the rank is exactly the number of nonzero Möbius values. The asymptotic is the classical squarefree-density theorem. $\square$

**Proposition 2 (concentration).** For every $t>0$,

$$
\Pr\left(\left|\mathrm{rank} C(S_n)-\mathbb E\mathrm{rank} C(S_n)\right|\ge t\right)
\le2\exp\left(-\frac{t^2}{2n}\right).
$$

**Proof.** Adding or deleting a single index adds or deletes its row and column and changes the matrix rank by at most two. Apply the bounded-differences inequality to the $n$ independent Bernoulli indicators. $\square$

Consequently, existence of the proposed probabilistic limit is equivalent to convergence of the deterministic normalized expectations.

**Proposition 3 (arithmetic upper bound).** Let $\mathrm{rad}(m)$ denote the product of the distinct prime divisors of $m$, with $\mathrm{rad}(1)=1$. Put

$$
m_n(d)=\#\{a\le n:\mathrm{rad}(a)=d\}.
$$

Then

$$
\mathbb E\mathrm{rank}C(S_n)
\le \sum_{\substack{d\le n\\\mu^2(d)=1}}
\bigl(1-(1-p)^{m_n(d)}\bigr).
$$

**Proof.** Matrix rows corresponding to integers with the same radical are identical (for every chosen column set). The rank is at most the number of distinct radicals represented in $S_n$. A radical $d$ is represented with probability $1-(1-p)^{m_n(d)}$. Sum the probabilities. $\square$

These results establish a nontrivial arithmetic constraint and probabilistic concentration, but do not prove existence or determine the proposed limit.

## Prior art

1. [OEIS A013928](https://oeis.org/A013928), records the exact full coprimality-matrix rank as the number of squarefree integers.
2. T. Hilberdink, *The group of squarefree integers*, **Linear Algebra and its Applications** 457 (2014), 383–399, [doi:10.1016/j.laa.2014.05.037](https://doi.org/10.1016/j.laa.2014.05.037). Arithmetic matrix factorizations.
3. A. Coja-Oghlan et al., *The rank of sparse random matrices*, **Random Structures & Algorithms** (2023), [doi:10.1002/rsa.21085](https://doi.org/10.1002/rsa.21085). Random rank limits in a different, sparsely generated matrix model.

The rank of the full matrix is a known theorem, not an original discovery. The random principal-submatrix model has not been shown to be new or unresolved by the present literature comparison.

## Verification

[Deterministic finite-field rank sampler](../../experiments/P049_random_coprimality_rank.py).
