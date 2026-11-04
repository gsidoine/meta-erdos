# P023 — Full rank of random prime-divisibility incidence matrices

<!-- DOSSIER-SUMMARY -->
> **Research question:** When do independently retained prime-incidence vectors of integers up to N span all small-prime coordinates over F2?  
> **Formulation:** candidate. **Novelty:** not certified (targeted audit).  
> **Verified/known progress:** Full rank iff no nonzero prime-parity functional annihilates all retained columns; exact zero-row probability.  
> **Finite evidence:** Deterministic parity characterization proved; probabilistic threshold unproved.  
> **Symbolic prize:** A Coffee (symbolic) — A sharp threshold for full rank of the random prime-incidence matrix.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

**Area:** probabilistic number theory, random matrices, finite-field linear algebra. **Status:** candidate.

## Definition

Fix $0<\alpha<1$. Let $r_N=\lfloor N^\alpha\rfloor$ and $d_N=\pi(r_N)$. For each integer $m\in[N]$, form a column

$$
v_m=\bigl(\mathbf1_{p\mid m}\bigr)_{p\le r_N,\ p\ {\rm prime}}\in\mathbb F_2^{d_N}.
$$

Independently retain each column with probability $\theta_N$. Denote the resulting random matrix by $A_N(\theta_N)$.

**P023.** Determine the threshold scale (if one exists) for $\mathrm{rank}_{\mathbb F_2}A_N=d_N$ as $N\to\infty$, and decide whether its location and limiting window are determined by the absence of zero rows (i.e. by every small prime occurring in at least one retained integer). Compare the regimes $\alpha<1/2$, $\alpha=1/2$, and $\alpha>1/2$.

## Exact characterization and basic obstruction

For $T\subseteq\{p:p\le r_N\}$, set

$$
\chi_T(m)=\sum_{p\in T}\mathbf1_{p\mid m}\pmod2.
$$

Then full row rank holds **if and only if**, for every nonempty $T$, at least one retained $m$ has $\chi_T(m)=1$. Indeed, these $\chi_T$ are precisely all nonzero linear functionals on the row space. In particular, if a prime $p\le r_N$ has no retained multiple, the rank is deficient.

A fixed prime $p$ has exactly $\lfloor N/p\rfloor$ possible columns carrying a 1 in that row; hence its zero-row probability is exactly

$$
(1-\theta_N)^{\lfloor N/p\rfloor}.
$$

This is necessary evidence for a scale of order $N^{\alpha-1}\log N$, **not proof** of either a threshold or that higher-order parity dependencies are negligible.

## Closest literature, not equivalence

- [Linial–Rothschild, *Incidence Matrices of Subsets—A Rank Formula* (1981)](https://doi.org/10.1137/0602037): exact ranks of **uniform subset-incidence** matrices, not integer prime-factor vectors with highly nonuniform row frequencies.
- [Wang–Stanley, *The Smith Normal Form Distribution of a Random Integer Matrix* (2017)](https://doi.org/10.1137/16M1098140): independent integer matrix entries, not sampled arithmetic columns.
- [Pomerance, *Coprime permutations* (2022)](https://arxiv.org/abs/2203.03085): arithmetic incidence context only, not this binary rank law.

**Novelty warning:** random multiplicative-incidence matrices, sparse integer parity characters, random number-theoretic linear systems, and random hypergraph incidence rank require a specialist citation chain. The exact model was not identified in this bounded search.

## Research and falsification programme

Start with the deterministic full-column rank (the prime columns $m=p$ give the standard basis). Enumerate small $N$ distributions exactly or with certified modular row reduction; distinguish zero-row obstruction from a nonzero left-kernel vector. Search for a parity obstruction that persists after every row is covered. Do not assert the proposed threshold scale without a matching upper bound.

