# P010 — Exact minimum number of coprime adjacencies

<!-- DOSSIER-SUMMARY -->
> **Research question:** What is the exact minimum number of adjacent coprime pairs in a permutation of 1,…,n? (Resolved internally.)  
> **Formulation:** proved internally. **Novelty:** internal proof; priority unverified.  
> **Verified/known progress:** Exact formula for every n≥4 kernel-checked in Lean 4; asymptotic deduced mathematically; manuscript submitted to Integers.  
> **Finite evidence:** Constructive proof with prime-factor paths; explicit witnesses checked n≤10,000.  
> **Symbolic prize:** A Coffee (symbolic) — An independently checked Lean formalization of the exact coprime-adjacency theorem.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->


**Area:** arithmetic graph theory, extremal Hamiltonian paths, prime distribution  
**Research status:** Exact theorem formally verified in Lean 4; manuscript submitted to *Integers*.  
**Novelty:** **not certified**; independent proof audit and source-priority verification are required

**Formal certificate:** [Lean 4 source and verification record](../../formal/P010/README.md), including `P010_exact` and its foundational-axiom audit. The asymptotic corollary is established mathematically but is not part of the Lean certificate.

## Exact statement

For a permutation $a=(a_1,\dots,a_n)$ of $[n]$, let

$$
h(n)=\min_{a\in S_n}\sum_{i=1}^{n-1}\mathbf{1}_{\gcd(a_i,a_{i+1})=1}.
$$

Set $A_n=\pi(n)-\pi(n/2)$, $B_n=\pi(n/2)-\pi(n/3)$. The following theorem **resolves the original question**:

$$
\boxed{h(n)=A_n+\max\left(1,\left\lceil\frac{B_n}{2}\right\rceil\right),\qquad n\ge4.}
$$

For the three exceptional small inputs, $h(1)=0,\ h(2)=1,\ h(3)=2$.

**Corollary (prime number theorem).**

$$
\boxed{\displaystyle h(n)\sim\frac7{12}\frac{n}{\log n}.}
$$

**Full constructive proof:** [Exact minimum coprime adjacency theorem](../../theorems/P010-exact-coprime-adjacencies.md). The refined proof requires only elementary graph theory and the arithmetic partition by largest prime factor; it does not use a prime-counting inequality.

## Why the exact expression is inevitable

Let $H_n$ join distinct integers whose gcd exceeds 1. The minimum number of vertex-disjoint paths needed to cover $H_n$ equals $h(n)+1$.

The vertex 1 and all primes $p>n/2$ are isolated, forcing $A_n+1$ singleton paths. The primes $q\in(n/3,n/2]$ each have exactly **one** noncoprime neighbor, namely $2q$. Hence these $B_n$ leaves force at least $\lceil B_n/2\rceil$ further paths. For $n\ge4$, the remaining set containing 2 and 4 is nonempty, forcing at least one path even when $B_n=0$. This gives the exact lower bound.

For the matching upper bound, partition $[2,n]$ by **largest prime factor**. Classes with prime $p\le n/4$ have two even endpoints $2p,4p$; those with $n/4<p\le n/3$ have endpoints $2p,3p$. Pair middle classes through the edges $3p\!-\!3q$; when there is an odd one, attach it to the class for prime 3 through $3p\!-\!9$. This yields paths with **two even endpoints**, which may be concatenated freely through even–even edges. Concatenating all even-ended units gives one core path. The remaining classes $\{q,2q\}$ can be paired directly along even–even edges: each pair $q,2q,2q',q'$ forms a path, and the core is inserted into one such pair (or attached to a single unmatched class). This gives exactly $\max\{1,\lceil B_n/2\rceil\}$ nonisolated paths without a prime-counting inequality. Explicit permutations handle $4\le n\le11$. See the theorem for all details and endpoint accounting.

## Computation and independent checks

**Dependency-free constructive certificate:**

```bash
python experiments/P010_construct_optimal_permutation.py --n 200 --show
python experiments/P010_construct_optimal_permutation.py --max-n 500
```

The constructor returns a **permutation witness** and checks it contains all integers exactly once and has exactly the minimum number of coprime adjacencies predicted by the theorem. A separately implemented constructive algorithm was checked for every $12\le n\le10{,}000$, with complete gcd/coverage checks for small and sampled larger inputs. Exact mixed-integer optimizations from the original research pass also match the formula at selected $n\le200$.

The original "exceptions" $n=9$ and $n=21$ are not exceptions to the theorem. They are exactly the situations in which $\lceil B_n/2\rceil=0$ but a nonisolated path is still necessary.

## Prior art and publication caution

The closest known historical predecessor is **Erdős, Freud and Hegyvári (1983)**, [*Arithmetical properties of permutations of integers*](https://users.renyi.hu/~p_erdos/1983-02.pdf), investigating arithmetic properties of consecutive elements of permutations. The located theorem statements concern extrema of adjacent gcd/lcm **values**, not this exact count of gcd-one adjacencies. This is not sufficient to establish that the new theorem is original: synonym searches, older path-cover literature, and external specialist review are still necessary.

The graph-theoretic path-cover reduction is standard, as is the bound $\pi(2x)\le2\pi(x)$ (Rosser–Schoenfeld; see [OEIS A060208](https://oeis.org/A060208)). What is proved here is the exact arithmetic path-cover formula and the constructive decomposition, **established by the proof presented here, without a claim of independently certified historical novelty**.

## Publication status

The theorem is presented in [*The Minimum Number of Coprime Adjacencies in a Permutation*](../../manuscripts/P010/coprime_adjacencies.pdf), **submitted to the journal *Integers***. The entry is resolved in the repository and must not be classified as an unresolved conjecture. Submission does not imply acceptance, publication or independently certified historical novelty. The [manuscript record](../../manuscripts/P010/README.md) and [constructive proof](../../theorems/P010-exact-coprime-adjacencies.md) give the corresponding details.
