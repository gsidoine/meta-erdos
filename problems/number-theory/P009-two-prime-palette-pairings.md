# P009 — Can prime-sum pairings use only two prime values?

<!-- DOSSIER-SUMMARY -->
> **Research question:** Can 1,…,2n always be paired using at most two distinct prime sums?  
> **Formulation:** reframe. **Novelty:** high overlap: Maillet-type prime differences and OEIS A202472; distinct pairing statement not shown equivalent.  
> **Verified/known progress:** One-color iff 2n+1 prime; two-color certificate from short prime difference.  
> **Finite evidence:** Sieve certificates through n=1,000,000 (finite only).  
> **Symbolic prize:** A bottle of wine — A proof that two prime sums suffice for every positive integer n, or an explicit counterexample.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->


**Area:** additive number theory, extremal arithmetic matchings  
**Status:** reframe; the distinct pairing question remains unresolved, while its principal sufficient certificate belongs to the classical prime-difference literature.  
**Relationship:** quantitative dual to P001 (maximize the number of colors vs. minimize the number).

## Statement

For a perfect matching $M$ of $\{1,2,\ldots,2n\}$ in which every matched pair has a prime sum, define its **prime palette** as

$$
\mathcal P(M)=\{a+b:\{a,b\}\in M\}.
$$

Set

$$
\kappa(n)=\min_M|\mathcal P(M)|.
$$

Prime-sum perfect matchings exist by the classical Greenfield–Greenfield/Bertrand argument.

**Question.** Is

$$
\boxed{\kappa(n)\le2\quad\text{for every }n\ge1?}
$$

In fact, the computations support the sharper complete formula

$$
\kappa(n)=
\begin{cases}
1,&2n+1\text{ prime},\\
2,&2n+1\text{ composite}.
\end{cases}
$$

## Theorem 1: exact one-color classification

**Proposition.** $\kappa(n)=1$ if and only if $2n+1$ is prime.

**Proof.** The sum of all $2n$ integers is $n(2n+1)$. If all $n$ pair sums equal one prime $p$, then $np=n(2n+1)$, hence $p=2n+1$. Conversely, if $2n+1$ is prime, the pairs $\{i,2n+1-i\}$ for $1\le i\le n$ use that single sum. $\square$

This proposition is elementary and **not claimed new**.

## Theorem 2: prime-difference certificate for two colors

**Proposition.** Suppose there exist odd primes $q,p$ with

$$
3\le q\le 2n-1,\qquad p=2n+q.
$$

Then $\kappa(n)\le2$. If $2n+1$ is composite, then $\kappa(n)=2$.

**Proof.** Pair the initial even-length interval $\{1,\ldots,q-1\}$ by

$$
\{a,q-a\},\quad 1\le a\le(q-1)/2.
$$

Every such pair has sum $q$. Pair the remaining even-length interval $\{q,\ldots,2n\}$ by

$$
\{a,p-a\},\quad q\le a\le(p-1)/2.
$$

Every pair in the second interval has sum $p$. Each integer is used exactly once, and both sums are prime. If $2n+1$ is composite, Theorem 1 rules out one color. $\square$

Thus one concrete sufficient condition is that $2n$ admit a representation as the **difference of two primes** $p-q$, with the smaller prime $q<2n$. This is a *short-prime-pair* strengthening of the classical 1905 **Maillet conjecture**, which only asks for a representation $2n=p-q$ without our upper bound on $q$. Our sufficient condition is **not** asserted necessary: other two-color matchings can exist with sums whose difference is not $2n$.

## Exact finite tests

A sieve-generated certificate $q$ as in Theorem 2 exists for **every $2\le n\le100{,}000$**. The case $n=1$ is handled by Theorem 1. For cases with $2n+1$ prime, the one-color theorem of course suffices; the sieve also finds a two-prime certificate when $n\ge2$. A fixed implementation is in [`experiments/two_prime_palette.py`](../../experiments/two_prime_palette.py).

| $n$ | Prime $q$ | Prime $p=2n+q$ |
|---:|---:|---:|
| 4 | 3 | 11 |
| 7 | 3 | 17 |
| 12 | 5 | 29 |
| 57 | 13 | 127 |
| 100 | 11 | 211 |
| 1,000 | 3 | 2,003 |
| 10,000 | 11 | 20,011 |
| 100,000 | 3 | 200,003 |

The largest *least qualifying prime* $q$ among tested $n$ was $379$, attained at $n=90{,}407$. All tests are **finite**, with no implication of an unconditional theorem for every integer.

**Two distinct verification horizons.** The preceding table and $q=379$ record refer to the original script's run through **$n=100{,}000$**. A **separate, independent sieve** in [`audits/verify_p003_p009.py`](../../audits/verify_p003_p009.py) was run through **$n=1{,}000{,}000$** with no missing certificates; over that larger range the largest *least qualifying prime* was **$q=619$**, first attained at **$n=436{,}349$**. The dated [adversarial review](../../audits/2026-10-28-P001-P010-adversarial-review.md) records that million-case run. This clarifies the two ranges; the source's default verification script tests only through 100,000 and **neither horizon proves the conjecture**.

## Novelty and difficulty audit

- Lawrence E. and Stephen J. Greenfield, [*Some Problems of Combinatorial Number Theory Related to Bertrand's Postulate*](https://cs.uwaterloo.ca/journals/JIS/green.html), *Journal of Integer Sequences* 1 (1998), prove the baseline pairing.
- [OEIS A000341](https://oeis.org/A000341) counts all prime-sum perfect matchings, rather than their minimum number of distinct sums.
- [OEIS A202472](https://oeis.org/A202472) counts primes $q<2n$ for which $q+2n$ is prime: **exactly the sufficient certificates in Theorem 2**. Thus the prime-pair input is emphatically *not a new number-theoretic problem*.
- János Pintz, [*On the difference of primes*](https://arxiv.org/abs/1206.0149) (2012), studies differences of primes and their gaps; the classical Maillet conjecture concerns representation of all even integers as differences of primes.
- A [2018 Mathematics Stack Exchange discussion](https://math.stackexchange.com/questions/3031150/pair-up-1-2n-that-the-sums-of-each-pair-are-different-primes) asks the *opposite*, maximally many distinct prime sums, closely related to P001, not the two-color problem.

**Verdict:** the "two prime values" pairing formulation was not located in this targeted search, but its best simple sufficient condition is an explicit known prime-difference problem. Do not claim a fresh arithmetic breakthrough from Theorem 2 or the finite checks. An external specialist novelty review remains necessary.

## A verified two-palette matching outside the standard reflection-pair *form*

For $n=4$ the pairs

$$
\{1,6\},\quad \{2,5\},\quad \{3,8\},\quad \{4,7\}
$$

partition $[8]$ and have prime sums **$7,7,11,11$**, respectively. The two primes differ by **4**, not $2n=8$. Thus **not every two-palette matching is the standard two-interval construction with prime sums $q$ and $q+2n$**.

This does **not** show that the existence of a two-palette matching can hold where *no* standard prime-pair certificate exists; a separate such certificate exists when $n=4$. Therefore the logical relationship between the **two existence statements** remains unproved. See the [dated source-level audit](../../audits/2026-10-29-P015-P016-P018-P020-source-comparison-and-P010-snapshot.md).

## Further questions

1. Characterize two-color matchings directly via the union of two reflection matchings (paths and even cycles), without presupposing $p-q=2n$.
2. Determine whether the two-color statement can be reduced to a theorem *strictly weaker* than Maillet's prime-difference conjecture.
3. Search for counterexamples where the short prime-pair certificate fails but a more complicated two-color pairing survives.
4. Study the number of possible prime palettes and the trade-off with P001's maximum spectrum.


## Relation to existing results

Two-label pairings are closely related to Maillet-type prime-difference questions. An equivalence between the pairing statement and an established prime-difference conjecture has not been proved; finite certificates do not establish existence for every order.


