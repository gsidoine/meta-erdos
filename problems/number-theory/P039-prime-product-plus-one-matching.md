# P039 — Prime-plus-one product matchings

<!-- DOSSIER-SUMMARY -->
> **Research question:** Can [2n] always be paired so that the product of each pair plus one is prime?  
> **Formulation:** candidate. **Novelty:** high overlap: closely related 2020 MathOverflow bilinear prime pairing with two intervals and either sign.  
> **Verified/known progress:** Perfect matching verified for even N≤200 and N=250,300,400; general Hall condition unproved.  
> **Finite evidence:** Exact sieve-backed bipartite matching certificates.  
> **Symbolic prize:** A Book (symbolic) — A proof that prime-product-plus-one pairings exist for every n≥1, or a single explicit counterexample.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

For every even integer $N$, let $B_N$ be the bipartite graph between the odd and even integers in $[N]$, with an edge $ab$ when $ab+1$ is prime.

## Research question

**Does $B_N$ have a perfect matching for every even $N$?** Equivalently, can $[2n]$ be partitioned into pairs $\{a,b\}$ such that $ab+1$ is prime?

This is a bilinear-prime analogue of the prime-*sum* pairing theorem, but it does **not** follow from Bertrand's postulate: the prime values of $ab+1$ lie in arithmetic progressions whose moduli grow with $N$.

## Initial evidence and obstructions

When $a,b$ are both odd and distinct, $ab+1$ is even and greater than two, so it is composite. Thus any pairing of all $2n$ integers must pair every odd integer with an even integer. The bipartite formulation is exact.

A standard-library primality-sieve and bipartite matching computation finds a perfect matching for every even $N\le200$, and separately for $N=250,300,400$. This finite finding is not evidence of a theorem for all $N$.

A proof would require simultaneous Hall expansion for the bilinear prime relation. The average edge density is heuristically of order $1/\log N$, but pointwise estimates for progressions $ab+1$ with large modulus are considerably more difficult. No uniform degree or Hall lower bound is asserted here.

## Literature comparison

- A closely related **2020 MathOverflow question**, *Pairs of integers whose product is one more or less than a prime*, asks for a pairing between **two different intervals** $[N]$ and $(N,2N]$ allowing **either sign**. See https://mathoverflow.net/questions/361065/pairs-of-integers-whose-product-is-one-more-or-less-than-a-prime. That is an important direct predecessor, not equivalent to the present same-interval, $+1$-only problem.
- Greenfield and Greenfield, *Some Problems of Combinatorial Number Theory Related to Bertrand's Postulate* (1998), prove the **prime-sum** analogue: https://cs.uwaterloo.ca/journals/JIS/green.html.
- The recent paper *Coprime matchings of divisor sets* (Alekseyev, 2026), https://arxiv.org/abs/2610.37512, concerns relatively prime matched values, not primality of their product plus one.

**Status:** candidate with substantial prior-art overlap, no claimed general proof or historical priority. 
