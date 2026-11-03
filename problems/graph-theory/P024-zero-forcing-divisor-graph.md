# P024 — Zero forcing on the integer divisibility graph

<!-- DOSSIER-SUMMARY -->
> **Research question:** What is the asymptotic zero-forcing number of the divisibility comparability graph on integers 1,...,N?  
> **Formulation:** candidate. **Novelty:** not certified (targeted audit).  
> **Verified/known progress:** The primes above N/2 are twin leaves, yielding Z(D_N) >= pi(N)-pi(N/2)-1.  
> **Finite evidence:** Elementary rigorous lower bound; exact finite zero-forcing computations pending.  
> **Symbolic prize:** One kilogram of bacon — The first-order asymptotics of the zero-forcing number of the divisor comparability graph.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

**Area:** spectral graph theory, integer arithmetic, graph propagation. **Status:** candidate.

## Definition and central question

Let $D_N$ be the simple graph on $[N]$, with an edge $a\sim b$ for $a\ne b$ precisely if $a\mid b$ or $b\mid a$. From an initially blue subset $B$, apply the standard zero-forcing rule: a blue vertex with exactly one white neighbor forces that neighbor blue. Let $Z(D_N)$ be the minimum size of $B$ that eventually colors all vertices.

**P024.** Determine the asymptotic order of $Z(D_N)$, and in particular decide whether the limit $Z(D_N)/N$ exists; if it is zero, determine the correct prime-counting or other arithmetic normalization and possible limiting constant.

This is the *divisor comparability graph*, not the common-factor graph $H_N$ of P010 and not the random induced divisibility poset of P017.

## An exact arithmetic lower bound

Every prime $q\in(N/2,N]$ is adjacent **only to 1** in $D_N$: it has no proper integer multiple $\le N$ and no proper positive divisor other than 1. There are $r=\pi(N)-\pi(N/2)$ such leaves all sharing the same center 1.

For $r\ge2$, all but at most one of these leaves must initially be blue: otherwise at least two remain white and no blue vertex other than 1 can force either, while 1 cannot force one when both are white. Hence

$$
\boxed{Z(D_N)\ge \pi(N)-\pi(N/2)-1.}
$$

In particular $Z(D_N)=\Omega(N/\log N)$. This lower bound does **not** rule out linear-order zero forcing; no upper asymptotic matching it is claimed.

## Closest sources and overlap risk

- [AIM minimum-rank / zero-forcing programme](https://aimath.org/pastworkshops/linearalgebra.html): general zero forcing and maximum-nullity framework.
- [MathWorld, *Zero Forcing Number*](https://mathworld.wolfram.com/ZeroForcingNumber.html): classical invariant and examples (secondary orientation source).
- [Lewis–Souza, *The order dimension of divisibility* (2021)](https://www.sciencedirect.com/science/article/pii/S0097316520301837): **same integer partial order**, different invariant.
- [Melotti–Saias, *On path partitions of the divisor graph* (2020)](https://doi.org/10.4064/aa180711-26-4): different graph-theoretic path-cover objective; relevant comparison.

**Novelty:** the specific $Z(D_N)$ sequence was not found in this limited search. Known graph-zero-forcing criteria or earlier work specifically on divisibility graphs may settle its asymptotics; do not call this certified open.

## Falsification next step

Independently compute exact minimum forcing sets for $N\le20$ via exhaustive subset search and forcing closure. Test candidate asymptotic bounds and look for twin-vertex reductions based on common quotient patterns. Any upper bound should come with a valid chronology, not merely a set that dominates the graph.

