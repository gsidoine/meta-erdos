# P010 — Exact minimum number of coprime adjacencies

**Mathematical proof completed internally:** 28 October 2026  
**Priority:** originality *not certified*; independent referee audit required  
**Relation to P010:** **resolves the original extremal question**, not merely its leading asymptotic constant.

## Theorem

For a permutation $a=(a_1,\ldots,a_n)$ of $[n]$, let

$$
c(a)=\sum_{i=1}^{n-1}\mathbf{1}_{\gcd(a_i,a_{i+1})=1},\qquad
h(n)=\min_{a\in S_n}c(a).
$$

Write $\pi(x)$ for the number of primes at most the real number $x$ and set

$$
A_n=\pi(n)-\pi(n/2),\qquad
B_n=\pi(n/2)-\pi(n/3).
$$

**Theorem.** For **every $n\ge4$**,

$$
\boxed{h(n)=A_n+\max\left(1,\left\lceil\frac{B_n}{2}\right\rceil\right)}.
$$

For the remaining cases $h(1)=0,\ h(2)=1,\ h(3)=2$.

In particular the prime number theorem gives

$$
\boxed{h(n)\sim \frac7{12}\frac{n}{\log n}}\qquad(n\to\infty).
$$

This exact formula is proved by a constructive path cover in a noncoprime graph. The first independent computation tests all $12\le n\le10\,000$, with sampled full witness checking, and exact elementary small-case witnesses cover $4\le n\le11$. None of those finite tests substitutes for the proof.

## Step 1 — Graph equivalence and lower bound

Let $H_n$ have vertex set $[n]$, with $\{u,v\}$ an edge iff $u\ne v$ and $\gcd(u,v)>1$. Let $\mathrm{pc}(H_n)$ be the least number of **vertex-disjoint paths covering all vertices**, allowing singleton paths. Cutting a permutation immediately after every coprime adjacent pair produces $c(a)+1$ paths in $H_n$; conversely concatenating any path cover produces at most $k-1$ coprime adjacencies if the cover has $k$ components. Thus

$$
h(n)=\mathrm{pc}(H_n)-1.
$$

For $n\ge4$, vertex 1 and every prime $p\in(n/2,n]$ are **isolated** in $H_n$: there are $A_n+1$ such vertices. The set of remaining nonisolated vertices is nonempty (it contains 2 and 4), and hence requires at least one further path.

Every prime $q\in(n/3,n/2]$ has precisely one neighbor in $H_n$, namely $2q$; these are $B_n$ distinct degree-one vertices. Any path can have **at most two** degree-one vertices, both as endpoints. Such leaves cannot lie in the paths for the isolated vertices. Therefore

$$
\mathrm{pc}(H_n)\ge A_n+1+\max\{1,\lceil B_n/2\rceil\},
$$

or

$$
h(n)\ge A_n+\max\{1,\lceil B_n/2\rceil\}. \tag{1}
$$

## Step 2 — Partition by largest prime factor

For each prime $p\le n$ let

$$
C_p=\{m\in\{2,\ldots,n\}:P^+(m)=p\},
$$

where $P^+(m)$ is the largest prime factor of $m$. These classes partition $\{2,\ldots,n\}$, and each $C_p$ induces a clique in $H_n$, because every member is divisible by $p$.

Partition the primes into four ranges:

$$
\begin{array}{ll}
S:\ p\le n/4,&s=|S|=\pi(n/4),\\
M:\ n/4<p\le n/3,&m=|M|,\\
L:\ n/3<p\le n/2,&\ell=|L|=B_n,\\
I:\ n/2<p\le n,&|I|=A_n.
\end{array}
$$

We assume $n\ge12$. Then the following statements hold.

* Every $p\in S$ has **two distinct even vertices** $2p,4p$ in $C_p$; the class can be arranged as a path starting at $2p$ and ending at $4p$. For $p=2$ these vertices are 4 and 8 and are still present.
* For $p\in M$, one has $C_p=\{p,2p,3p\}$. Indeed $n/4<p\le n/3$ implies $3\le n/p<4$; also $p\ge5$, so 2 and 3 are smaller than $p$. The class can be ordered from the **even** endpoint $2p$ to the **multiple-of-three** endpoint $3p$.
* For $p\in L$, $C_p=\{p,2p\}$, with just one even endpoint $2p$.
* For $p\in I$, $C_p=\{p\}$, isolated.

## Step 3 — Form units with two even endpoints

**If $m$ is even:** pair the primes of $M$ arbitrarily. For each pair $p,q$, concatenate the $C_p$-path $2p,\ldots,3p$ with the $C_q$-path $3q,\ldots,2q$. The bridge $3p\!-\!3q$ is valid in $H_n$ because both endpoints are divisible by 3. This creates one path whose **two endpoints are even**.

**If $m$ is odd:** first remove one prime $p$ from $M$ and pair the remaining $m-1$ primes as above. Merge its class $C_p$ with the special small-prime class $C_3$. The class $C_3$ contains both 6 and 9 since $n\ge12$, and can be ordered from 6 to 9. Appending the path $3p,\ldots,2p$ via the bridge $9\!-\!3p$ produces a path from **even** vertex 6 to **even** vertex $2p$, since both $9$ and $3p$ are multiples of 3. Remove $C_3$ from the list of remaining small classes; it has been used exactly once.

All other small classes become individual paths with even endpoints $2p,4p$. Thus every vertex belonging to some class with $p\le n/3$ has been covered by one of exactly

$$
u=s+\lfloor m/2\rfloor
$$

vertex-disjoint paths with **both endpoints even**. (In the odd case, the leftover $M$ class merges with $C_3$, so the count remains $u=s+\lfloor m/2\rfloor$.)

## Step 4 — Pair the one-ended classes directly

Concatenate all the two-even-ended units from Step 3 into a single path $U$. All connecting edges join even vertices. The path $U$ has two even endpoints and covers precisely the classes with $p\le n/3$. It is nonempty, since $2\in S$ for $n\ge12$.

Write $L=\{q_1,\ldots,q_\ell\}$ for the primes in $(n/3,n/2]$, and put

$$
r=\max\{1,\lceil\ell/2\rceil\}.
$$

The classes indexed by $L$ are $C_q=\{q,2q\}$. If $q\ne q'$ are in $L$, the four vertices

$$
q,\ 2q,\ 2q',\ q'
$$

form a path in $H_n$: the first and last edges are multiples-of-prime edges, while the middle edge joins two even vertices. These paths are disjoint for disjoint pairs of leaf primes, since the classes $C_q$ partition their vertices.

There are three cases.

* **$\ell=0$.** Retain $U$ as one path.
* **$\ell=2k>0$.** Partition $L$ into $k$ pairs. For $k-1$ pairs use the four-vertex paths above. For the last pair $\{q,q'\}$ use
  $$
  q,\ 2q,\ U,\ 2q',\ q'.
  $$
  Here $U$ denotes its full vertex sequence, inserted between the two even vertices. The two new connecting edges are even–even. This gives exactly $k$ paths.
* **$\ell=2k+1$.** Partition $2k$ leaf primes into $k$ pairs, and let $q$ be the remaining prime. Use the $k$ four-vertex paths and one path
  $$
  q,\ 2q,\ U.
  $$
  The final connection is even–even. This gives exactly $k+1$ paths.

In each case, every class with largest prime factor at most $n/2$ is covered exactly once by **$r$ vertex-disjoint paths**. The remaining classes are the $A_n$ isolated large primes and the singleton vertex $1$. Consequently,

$$
\operatorname{pc}(H_n)\le r+A_n+1,
\qquad
h(n)\le A_n+r. \tag{2}
$$

Together with (1), this proves the theorem for every $n\ge12$. No prime-counting inequality is required. $\square$

## Step 5 — Direct finite check for $4\le n\le11$

The following explicit permutations achieve the lower bound (1). Each listed count can be checked directly by applying gcd to adjacent entries; no solver is needed.

| $n$ | Optimal permutation | $h(n)$ |
|---:|---|---:|
| 4 | 1,2,4,3 | 2 |
| 5 | 1,2,4,3,5 | 3 |
| 6 | 1,2,4,6,3,5 | 2 |
| 7 | 1,2,4,6,3,5,7 | 3 |
| 8 | 1,2,4,8,6,3,5,7 | 3 |
| 9 | 1,2,4,8,6,3,9,5,7 | 3 |
| 10 | 1,3,9,6,2,4,8,10,5,7 | 2 |
| 11 | 1,3,9,6,2,4,8,10,5,7,11 | 3 |

This completes the exact all-$n$ proof.

## Corollary and interpretation

By the prime number theorem,

$$
A_n=(1/2+o(1))\,n/\log n,
\qquad B_n=(1/6+o(1))\,n/\log n.
$$

Therefore $h(n)=(7/12+o(1))n/\log n$. This also identifies the *entire* optimal path-cover number:

$$
\mathrm{pc}(H_n)=h(n)+1.
$$

The earlier small cases $n=9$ and $n=21$, which were previously described as exceptions to the leaf-prime lower bound, are explained exactly by the extra $\max\{1,\cdot\}$ term. There are no exceptions to the corrected formula for $n\ge4$.

## Reproducibility

[The independent standard-library witness generator](../experiments/P010_construct_optimal_permutation.py) implements this construction and verifies gcd values and optimality against the formula. Finite trials of the construction succeeded for all $12\le n\le10{,}000$; extensive direct checks of the resulting paths were made for the smaller instances and sampled larger cases. This program is a sanity check, not a formal proof.

## Novelty and historical audit

The theorem has a complete proof in this repository. Its historical priority has not been determined. No exact predecessor was found in searches for "fewest coprime adjacent pairs permutation", "maximum noncoprime adjacent pairs", "path cover of noncoprime graph", the $7/12$ constant, or the explicit prime-counting formula. That does **not** rule out earlier proofs using different names.

Most important historical antecedents:

1. **P. Erdős, R. Freud and N. Hegyvári**, *Arithmetical properties of permutations of integers*, *Acta Math. Hung.* 41 (1983), 169–176: https://users.renyi.hu/~p_erdos/1983-02.pdf . They study the sizes of consecutive gcd and lcm values, **not in the located statements** the minimum number of gcd-one adjacencies.
2. Standard graph-theoretic *minimum path cover* is known and not claimed new. The theorem exploits the **special arithmetic partition** by largest prime divisor.

**Provisional resolution:** P010's exact mathematics is resolved within this project, **subject to an adversarial independent proof check and historical novelty verification**. The P010 problem ID is preserved; do not create P011 as a replacement.
