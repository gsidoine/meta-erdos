# P034 — Four prime sums without cut vertices

<!-- DOSSIER-SUMMARY -->
> **Research question:** For every odd n≥7, do four distinct prime sums suffice to make the graph on [n] 2-vertex-connected?  
> **Formulation:** candidate. **Novelty:** unverified; prime-sum connectivity predecessor.  
> **Verified/known progress:** For odd n≥5, at least four odd-prime labels are necessary for minimum degree two; the bound is attained in tested odd cases 7≤n≤39.  
> **Finite evidence:** Exhaustive four-label search for odd n=7,9,...,39; n=5 impossible even with all prime sums.  
> **Symbolic prize:** One small beer — A construction using four prime sums for every odd order at least seven, or an exceptional order.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

**Area:** graph theory and number theory. **Status:** candidate; historical novelty and openness unverified.

## The question

For a set $S$ of odd primes, let $G_n(S)$ have vertex set $[n]$, with an edge between distinct $i,j$ whenever $i+j\in S$. Call a graph **2-vertex-connected** if it has at least three vertices, is connected, and remains connected after any one vertex is deleted.

**P034.** For every odd $n\ge7$, can four distinct prime sums make $G_n(S)$ 2-vertex-connected?

Equivalently, does the minimum number $\kappa_2(n)$ of prime sums giving 2-vertex-connectivity equal **four for every odd $n\ge7$**?

## Rigorous baseline: four are necessary for odd n

For odd $n\ge5$, the sum $n+1$ is even and greater than two, hence is not prime. Every neighbour of vertex 1 produces an odd prime sum $1+j\le n+1$, therefore $1+j\le n$. Every neighbour of vertex n produces an odd prime sum $n+j\ge n+1$, therefore $n+j\ge n+2$. The sets of labels incident to 1 and to n are thus **disjoint**.

In a 2-vertex-connected graph every vertex has degree at least two. Since a fixed sum label determines at most one neighbour of each vertex, two distinct labels are needed at vertex 1 and two **different** labels are needed at vertex n. Hence $\kappa_2(n)\ge4$ for all odd $n\ge5$, whenever $\kappa_2(n)$ is defined.

For even n the lower bound is **not** valid: $n+1$ may be an odd prime and labels at the two endpoint vertices can overlap. For example $n=4$, the palette $\{3,5,7\}$ gives a 4-cycle and is 2-vertex-connected.

The restriction $n\ge7$ is essential: at $n=5$, vertex 5 has only the prime-sum neighbour 2 (because the possible sums are 6,7,8,9,10). Thus no palette of any size can give degree two at vertex 5.

## Finite evidence and witness method

An exhaustive search over four-element subsets of odd primes less than 2n found a 2-vertex-connected palette for **every odd n from 7 to 39 inclusive**. Representative witnesses:

| n | Four prime sums |
|---:|---|
| 7 | 5, 7, 11, 13 |
| 9 | 3, 5, 11, 13 |
| 15 | 3, 5, 17, 19 |
| 25 | 5, 7, 29, 31 |
| 39 | 3, 5, 41, 43 |

Each candidate graph was checked for connectivity after deletion of each individual vertex. These tests are finite evidence, **not a proof for all odd n**. The construction may benefit from using two sums below n and two above n, but this pattern alone does not imply 2-connectivity.

## Predecessors and novelty risk

The complete prime-sum graph and its Hamiltonian questions have an established literature, including [Chen–Fu–Guo (2021)](https://doi.org/10.1007/s00373-020-02241-1) and [Croot–Jin (2026)](https://doi.org/10.1007/s00373-025-02999-2). The existing [P033](P033-prime-sum-three-palette.md) deals with **connectivity** using three labels; that does not imply 2-vertex-connectivity. In particular, central three-sum palettes with one sum above n typically give vertex n degree one.

The remaining question concerns the *sparse-label 2-vertex-connectivity extremum*; the prime-sum graph itself is an established object. A specialist priority check against rainbow/Hamiltonian prime-set literature remains mandatory.

## Falsification and research plan

Search for an odd n≥7 for which **every** four-prime palette has a cut vertex or disconnected graph; or establish a uniform four-label construction via two independent reflection-step movements with controlled boundary attachments. A theorem for all sufficiently large odd n would already be substantial even without an effective threshold. Do not confuse the tested range with an all-n proof.
