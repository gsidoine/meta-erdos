# P017 — Longest chains in a randomly thinned divisibility poset

<!-- DOSSIER-SUMMARY -->
> **Research question:** Does the longest divisibility chain in a Bernoulli random subset of [N] have a deterministic limiting length after division by log₂ N?  
> **Formulation:** candidate. **Novelty:** not certified; targeted literature comparison only.  
> **Verified/known progress:** For fixed 0<p<1, the normalized height is asymptotically between p and 1 in probability; convergence to a constant is unproved.  
> **Finite evidence:** Exact dynamic program cross-checked against all subsets for N≤9; exploratory sampling at larger N.  
> **Symbolic prize:** A Coffee (symbolic) — Existence or nonexistence of the normalized longest-chain limit for a fixed site density strictly between zero and one.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

**Area:** probability, number theory, partially ordered sets  
**Proposed:** 29 October 2026  
**Status:** research candidate; unresolved and novel status not independently certified.

## The question

For $0<p<1$, include each integer $m\in[N]$ independently with probability $p$, giving a random set $R_N(p)$. Order its elements by divisibility. Let $L_N(p)$ be the maximum number of terms in a chain

$$
a_1\mid a_2\mid\cdots\mid a_k,\qquad
a_i\in R_N(p),\quad a_i<a_{i+1}.
$$

Set $L_N(p)=0$ if $R_N(p)$ is empty.

**P017.** For each fixed $p\in(0,1)$, does a deterministic function $c(p)$ exist such that

$$
\frac{L_N(p)}{\log_2 N}\xrightarrow{\mathbb P} c(p)
\qquad(N\to\infty)?
$$

If so, characterize $c(p)$, including its continuity, behavior as $p\downarrow0$ and $p\uparrow1$, and its relation to growth constants of oriented percolation on the integer-lattice coordinates of prime exponents.

The main question is existence of a **limit**, not an unqualified conjecture about an unverified explicit formula.

## A rigorous elementary sanity check

**Proposition.** For each fixed $0<p<1$ and $\varepsilon>0$,

$$
\mathbb P\left(
p-\varepsilon
\le\frac{L_N(p)}{\log_2 N}
\le1+\varepsilon
\right)\longrightarrow1.
$$

**Proof.** Every strict divisibility step at least doubles the current positive integer, giving $L_N(p)\le\lfloor\log_2 N\rfloor+1$. The powers $1,2,4,\dots,2^{\lfloor\log_2N\rfloor}$ form a deterministic chain. Their intersection with $R_N(p)$ is still a chain and has binomial size with parameters $\lfloor\log_2N\rfloor+1$ and $p$. The binomial law of large numbers yields the lower bound. $\square$

Consequently, if $c(p)$ exists then necessarily $p\le c(p)\le1$. The lower bound is not necessarily sharp: divisibility paths may switch between many prime directions.

## Finite screening

An exact dynamic program computes $L_N(p)$ without enumerating chains. Process integers in increasing order; if $v$ is retained, its best chain length is $1$ plus the largest previously computed chain length among its proper divisors. Update all multiples of each retained integer. This takes $O(N\log N)$ time and uses only integer operations.

The program [`experiments/P017_random_divisor_chains.py`](../../experiments/P017_random_divisor_chains.py) implements this algorithm. Preliminary independent experiments at $N=2^{16}$, twenty independent samples per density, gave approximate mean ratios:

| $p$ | Mean $L_N(p)/\log_2N$ at $N=2^{16}$ |
|---:|---:|
| 0.2 | 0.500 |
| 0.5 | 0.747 |
| 0.8 | 0.934 |

These are **small, finite observations**, not estimates with rigorous asymptotic error or evidence that a limit must exist. Strong dependence across available chains is the main technical obstacle.

## Why it could matter

Every integer corresponds to its vector of prime exponents; divisibility is coordinatewise order. However, the bound $\prod p_i^{e_i}\le N$ imposes a **weighted simplex truncation**, unlike the standard Boolean lattice or a rectangular product poset. If a time constant $c(p)$ exists, it would express a new universality or non-universality principle for longest chains in random arithmetic partial orders.

The problem connects multiplicative number theory, random-poset height, branching processes and directed percolation without assuming the answer resembles the standard random Boolean lattice.

The [random-order divisibility-chain problem P041](P041-random-order-divisibility-chains.md) studies a distinct model: all integers remain present and the temporal ordering is uniform, whereas the present problem retains each vertex independently and keeps the deterministic divisibility order.

## Closest literature and novelty limitations

- **Kohayakawa, Kreuter and Osthus**, [*The length of random subsets of Boolean lattices*, Random Structures & Algorithms (2000)](https://doi.org/10.1002/%28SICI%291098-2418%28200003%2916%3A2%3C177%3A%3AAID-RSA4%3E3.0.CO;2-9) study longest chains after random deletion from the **Boolean lattice**, not the weighted multiplicative order on $[N]$.
- **Lewis and Souza**, [*The order dimension of divisibility* (2021)](https://www.sciencedirect.com/science/article/pii/S0097316520301837), and follow-up [*Improved bounds for the dimension of divisibility*](https://doi.org/10.1016/j.ejc.2023.103912), study the **deterministic** divisibility poset, and a different invariant (order dimension).
- [OEIS A394685](https://oeis.org/A394685) concerns counts of order-convex subsets of the same deterministic divisibility poset, not longest chains under Bernoulli thinning.

Targeted searches did not identify the exact height-limit question for random restrictions of the integer divisibility order. This is **not** an originality certificate; the random arithmetic poset and percolation literature warrants a deeper bibliography search.

## Early falsification plan

1. Compute $L_N(p)$ exactly for many seeds and increasing $N$; investigate logarithmic normalization and fluctuations.
2. Search for already-published chain laws under the names *random divisibility graph*, *random divisor poset*, *multiplicative partial order*, and *random subposet of the integers*.
3. Try a recursive decomposition by prime factors. Avoid assuming subadditivity until the weighted truncation issue is resolved.
4. Check varying $p=p(N)$ separately from fixed $p$; the present problem **does not** assert one scaling law for both.
