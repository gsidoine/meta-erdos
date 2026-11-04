# P025 — Bottleneck Hamiltonicity in least-common-multiple graphs

<!-- DOSSIER-SUMMARY -->
> **Research question:** Does closing the permutation into a cycle preserve the known N²/(4 log N) minimum adjacent-lcm bottleneck asymptotic?  
> **Formulation:** reframe. **Novelty:** confirmed collision for linear-path analogue.  
> **Verified/known progress:** Erdős–Freud–Hegyvári (1983) already prove the linear-path asymptotic; cyclic-only variation remains under review.  
> **Finite evidence:** Elementary lower bound recovered; no independent cyclic upper bound.  
> **Symbolic prize:** A Book (symbolic) — A proof or disproof of the cyclic analogue of the known adjacent-lcm bottleneck asymptotic.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

**Area:** multiplicative combinatorics, Hamiltonian graph theory, extremal permutations. **Status:** reframed candidate.

## Definition

For $T\ge1$, let $L_N(T)$ be the graph on $[N]$ with distinct $a,b$ adjacent exactly when $\mathrm{lcm}(a,b)\le T$. Define

$$
\Lambda(N)=\min_{\text{cyclic permutations }(a_1,\ldots,a_N)}
\ \max_{1\le i\le N}\mathrm{lcm}(a_i,a_{i+1}),
\qquad a_{N+1}=a_1.
$$

(For $N<3$, make no cycle claim.) Put $t_N=\Lambda(N)/N$.

**P025 (cyclic-only residual question).** Does the cyclic bottleneck satisfy $\Lambda(N)\sim N^2/(4\log N)$, matching the **already known 1983 linear-path optimum**? More generally, determine the cyclic-to-linear bottleneck ratio and its exact finite behaviour. **Do not state the corresponding path asymptotic as a conjecture.**

**Major close predecessor:** Erdős–Freud–Hegyvári (1983), Theorem 1, already proves that the *linear* analogue has exact asymptotic $(1+o(1))N^2/(4\log N)$. The corresponding sequence is [OEIS A064764](https://oeis.org/A064764). Whether requiring the closing edge is a genuinely independent asymptotic problem must be audited before flagship promotion.

## A rigorous nontrivial lower bound

Let $P_N$ be the primes in $(N/2,N]$, with $r=|P_N|=\pi(N)-\pi(N/2)$. Suppose a Hamiltonian cycle uses only edges of lcm at most $tN$, with $t<N/4$. No two distinct vertices in $P_N$ can be adjacent because their lcm is their product $>N^2/4>tN$.

For any $q\in P_N$ and neighbor $m\ne q$, $m$ cannot be a multiple of $q$ within $[N]$, hence $\mathrm{lcm}(q,m)=qm$ and $m\le tN/q<2t$. Therefore all $2r$ cycle edges incident with $P_N$ must meet the fewer than $2t$ vertices $m<2t$. Each such vertex has only two cycle edges, so $2r\le 4t$ and $t\ge r/2$.

If instead $t\ge N/4$, that bound is even stronger asymptotically. By the prime number theorem $r\sim N/(2\log N)$, so in all cases

$$
\boxed{t_N\ge(1+o(1))\frac{N}{4\log N}.}
$$

The trivial upper bound is $t_N\le N$, since $\mathrm{lcm}(a,b)\le ab\le N^2$. This is an *elementary rederivation* of the lower scale of the 1983 path theorem, **not a new lower bound**. The 1983 theorem gives the same first-order value for the path optimum; the remaining question is the cost of closing the cycle.

## Prior art and precise distinction

- [Melotti–Saias, *On path partitions of the divisor graph* (2020)](https://doi.org/10.4064/aa180711-26-4): divisibility and path partitions, not a Hamiltonian **lcm bottleneck**.
- [McNew, *Permutations and the divisor graph of [1,n]* (2023)](https://doi.org/10.1112/mtk.12177): arithmetic permutation/divisor graph results; check exact paper theorem before claiming independence.
- [Erdős–Freud–Hegyvári, *Arithmetical properties of permutations of integers* (1983)](https://users.renyi.hu/~p_erdos/1983-02.pdf): **high-risk predecessor** concerning adjacent gcd/lcm extremal functionals. **Direct confirmed predecessor:** Theorem 1 establishes the exact first-order optimal value for **linear paths**. It does not in its displayed statement include the closing edge of a cycle. This makes the cyclic distinction narrow and susceptible to easy reduction.
- [P010 submitted manuscript](../graph-theory/P010-minimum-coprime-adjacencies.md): counts coprime transitions, not the maximal adjacent lcm along a **cycle**.

**Established linear case.** Erdős–Freud–Hegyvári (1983) determined the leading path bottleneck asymptotic. The cyclic case additionally includes the closing edge; its asymptotic effect has not been determined in the cited results.

## Finite tests

Compute $\Lambda(N)$ exactly for small $N$ by sorting distinct lcm edge weights and testing Hamiltonian cycles, with integer exactness and solver certificates. Compare Hamiltonian paths versus cycles; test whether the lower-order answer can be read directly from a known adjacent-lcm extremal theorem. If known, preserve ID as a historical note rather than claim an original problem.


## Relation to existing results

The question is restricted to Hamiltonian cycles. The path version has an established asymptotic formula; the effect of cyclic closure is the remaining issue.


