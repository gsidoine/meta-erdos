# P048 — Coprime permutations with squarefree sums

<!-- DOSSIER-SUMMARY -->
> **Research question:** For every n, is there a permutation sigma of [n] such that gcd(i,sigma(i))=1 and i+sigma(i) is squarefree for every i?  
> **Formulation:** known result. **Novelty:** resolved by the classical Bertrand prime-reflection construction; not an open problem.  
> **Verified/known progress:** For every n, a permutation with prime pair sums exists by recursive reflection; primality automatically implies coprimality and squarefree sums.  
> **Finite evidence:** Complete elementary proof; the prime-sum reflection construction is classical (Greenfield–Greenfield 1998).  
> **Symbolic prize:** —  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

**Area:** arithmetic combinatorics.

**Status:** known result. The original universal existence question has a complete elementary solution inherited from classical prime-sum pairing; it is not an open problem.

## Problem and resolution

Let $\mu$ denote the Möbius function. For every integer $n\ge1$, does there exist a permutation $\sigma$ of $[n]$ satisfying

$$
\gcd(i,\sigma(i))=1,\qquad
\mu^2(i+\sigma(i))=1
\quad(1\le i\le n)?
$$

**Theorem.** Such a permutation exists for every positive integer $n$. In fact, every sum $i+\sigma(i)$ can be prime.

**Proof.** For $n=1$, take $\sigma(1)=1$. Assume the assertion for all smaller positive integers. For $n\ge2$, Bertrand's postulate gives a prime $p$ with $n<p<2n$. Put $a=p-n$, so that $1\le a\le n-1$.

On the interval $[a,n]$ set

$$
\sigma(i)=p-i.
$$

This reflection permutes $[a,n]$ and satisfies

$$
i+\sigma(i)=p,\qquad
\gcd(i,\sigma(i))=\gcd(i,p)=1,
$$

because $1\le i<p$. On the shorter interval $[1,a-1]$, use the inductive permutation if the interval is nonempty. The two pieces form a permutation of $[n]$, with every index sum prime. Each prime is squarefree. $\square$

The prime-sum reflection argument is a standard application of Bertrand's postulate, closely related to the explicit construction of Greenfield and Greenfield (1998). The additional coprimality and squarefree-sum requirements are automatic; they impose **no additional obstruction** in this existence problem.

## Historical comparison

1. L. E. Greenfield and S. J. Greenfield, [*Some Problems of Combinatorial Number Theory Related to Bertrand's Postulate*](https://cs.uwaterloo.ca/journals/JIS/green.html), *Journal of Integer Sequences* **1** (1998), Article 98.1.2. Theorem 1 gives the classical prime-sum pairing of initial even intervals, using prime reflections.
2. A. Sah, [*Enumerating coprime permutations*](https://doi.org/10.1112/mtk.12159), *Mathematika* **68** (2022). Studies the enumeration of coprime permutations, a different question.
3. [OEIS A398305](https://oeis.org/A398305) records the squarefree-sum permutation permanent.

The original P048 formulation is therefore closed. Its former symbolic reward condition is already satisfied by known methods, and the reward has been withdrawn. The permanent identifier is retained for accurate historical accounting. No new open question is asserted in its place.

## Finite verification

[Exact bipartite matching search](../../experiments/P048_coprime_squarefree_permutations.py) independently checks finite instances, but is not needed for the universal theorem.
