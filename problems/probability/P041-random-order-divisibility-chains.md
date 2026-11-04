# P041 — Random-order divisibility chains

<!-- DOSSIER-SUMMARY -->
> **Research question:** Does the second-order gap between unrestricted and squarefree divisibility subsequences in a random permutation have a limiting constant?  
> **Formulation:** candidate. **Novelty:** unverified; related arithmetic-subsequence and hypercube accessibility results are established.  
> **Verified/known progress:** Internally proved D_N and S_N have common leading scale log N/log log N; their difference is between (1-o(1)) and (2+o(1)) times log N log log log N/(log log N)^2 with high probability.  
> **Finite evidence:** Exact finite dynamic-programming checks and seeded samples; asymptotic bounds proved using divisor-chain counting, prime asymptotics, and the Hegarty–Martinsson accessible-cube theorem.  
> **Symbolic prize:** A Book (symbolic) — A limiting constant for the second-order gap between unrestricted and squarefree random divisibility chains.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

## Problem

Let $\sigma_N$ be a uniformly random permutation of $[N]$. Denote by $D_N$ the greatest $r$ for which there are indices $i_1<\cdots<i_r$ with

$$
\sigma_N(i_1)\mid\sigma_N(i_2)\mid\cdots\mid\sigma_N(i_r).
$$

Let $S_N$ be the corresponding maximum when all selected entries are squarefree. Define

$$
Z_N=\frac{(D_N-S_N)(\log\log N)^2}
{\log N\,\log\log\log N}.
$$

**Question.** Does $Z_N$ converge in probability to a constant?

## Known results

The [supporting theorem](../../theorems/P041-random-order-divisibility-gap.md) proves that $D_N$ and $S_N$ have the same first-order asymptotic $\log N/\log\log N$. Nevertheless, for every $\varepsilon>0$,

$$
\Pr(1-\varepsilon\le Z_N\le2+\varepsilon)\longrightarrow1.
$$

Thus the difference is of order $\log N\log\log\log N/(\log\log N)^2$ in probability. The theorem is proved internally, with the squarefree lower bound depending on the established Hegarty–Martinsson accessibility theorem for directed Boolean cubes. No limit for $Z_N$ is established.

## Reproducible finite cases

The [exact dynamic program](../../experiments/P041_random_divisibility_order.py) computes both chain lengths for any supplied permutation and checks its implementation against an independent exhaustive subsequence search on small cases. Finite random samples concern numerical behavior only and do not establish concentration or asymptotic laws.

## Relation to earlier work

Random arithmetic-progression subsequences were analyzed by Goh and Zhao, *Arithmetic subsequences in a random ordering of an additive set*, *Integers* **21** (2021), #A89 ([arXiv](https://arxiv.org/abs/2012.12339)). They involve a different relation and have leading constant $2$.

Squarefree divisor intervals are Boolean lattices. The squarefree proof uses Hegarty and Martinsson, *On the existence of accessible paths in various models of fitness landscapes*, *Annals of Applied Probability* **24** (2014), 1375–1395 ([DOI](https://doi.org/10.1214/13-AAP949)). The dimension of the divisibility poset is studied by Lewis and Souza, *Journal of Combinatorial Theory, Series A* **179** (2021), 105391 ([DOI](https://doi.org/10.1016/j.jcta.2020.105391)); it is not the random-order statistic here.

The [related P017 problem](P017-random-divisibility-chain-height.md) instead thins the integer divisibility order by independent vertex retention; its longest-chain statistic is not the random-order subsequence length considered here.

Historical novelty of the precise gap question has not been certified.
