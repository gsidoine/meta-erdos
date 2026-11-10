# P005 — Switch connectivity of coprime permutations

<!-- DOSSIER-SUMMARY -->
> **Research question:** Can all coprime permutations be connected by two-position switches? (Resolved; diameter at most 3(n−1).)  
> **Formulation:** proved internally. **Novelty:** elementary universal-hub switch theorem; historical priority unverified; 2007 square-count formula known.  
> **Verified/known progress:** Proved all-order connectivity and diameter at most 3(n−1); the exact arithmetic theorem is kernel-checked in Lean 4.35.0, including both parity cases.  
> **Finite evidence:** Constructive explicit switch algorithm exhaustively checked for all coprime permutations n≤11; prior even-order BFS n≤22.  
> **Symbolic prize:** A Research Prize (symbolic) — A necessary and sufficient criterion for connected coprime-permutation switch graphs.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->


**Area:** number theory and graph reconfiguration  
**Status:** proved internally. **Historical novelty remains unverified.**

## Definition

A coprime permutation of $[n]=\{1,\ldots,n\}$ is a permutation $\sigma$ satisfying

$$
\gcd(i,\sigma(i))=1\quad\text{for all }i\in[n].
$$

Two such permutations are *switch-adjacent* if one results from the other by exchanging $\sigma(i)$ and $\sigma(j)$ for some $i\ne j$, while preserving the coprimality requirements at positions $i,j$.

Let $\mathcal C_n$ be the graph of coprime permutations and these switches. Equivalently, $\mathcal C_n$ is the four-cycle switch graph of the perfect matchings of the bipartite graph on two copies of $[n]$, where $i\sim j$ iff $\gcd(i,j)=1$.

## Resolved question

The [universal-hub theorem](../../theorems/P005-universal-hub-switch-connectivity.md) proves for every $n\ge1$

$$
\mathcal C_n\text{ is connected},\qquad
\mathrm{diam}(\mathcal C_n)\le3(n-1).
$$

The proof resolves each permutation cycle by using a universal matching row and a universal matching column as temporary buffers. For odd $n$, both are the integer $1$ and a reference coprime permutation fixes $1$; for even $n$, the parity product theorem reduces to two matching graphs with universal row $2$ and universal column $1$. It is a complete elementary proof, and its exact all-order conclusion is [kernel-checked in Lean 4.35.0](../../formal/ArithmeticGraphs/P005All.lean), with only the standard axioms propext, Classical.choice, and Quot.sound and no sorryAx. The [deterministic switch constructor](../../experiments/P005_canonical_switch_certificate.py) independently checks every intermediate swap for all coprime permutations with $n\le11$. The optimal diameter and the mixing time of the switch chain are not determined.

## Finite verification

A C++17 BFS, starting at the cyclic shift $\sigma(i)=i+1$ and $\sigma(n)=1$, explores **all** matchings accessible by switches. The reached component size was compared to the independently published total number of coprime permutations in [OEIS A005326](https://oeis.org/A005326).

| $n$ | Total coprime permutations | Size of reached component |
|---:|---:|---:|
| 8 | 324 | 324 |
| 9 | 3,600 | 3,600 |
| 10 | 3,600 | 3,600 |
| 11 | 129,744 | 129,744 |
| 12 | 63,504 | 63,504 |
| 13 | 3,521,232 | 3,521,232 |
| 14 | 3,459,600 | 3,459,600 |

The C++17 program [`experiments/coprime_switch_components.cpp`](../../experiments/coprime_switch_components.cpp) is self-contained. Example:

```sh
g++ -O3 -std=c++17 experiments/coprime_switch_components.cpp -o /tmp/coprime_switch
/tmp/coprime_switch 14
```

**Limits:** verification is exhaustive only for $n\le14$. It is not an infinite proof.

## Proved parity decomposition

For even order $n=2m$, let $B_m$ be the bipartite coprime graph between even and odd vertices of $[2m]$, and $\mathcal R(B_m)$ its perfect-matching four-cycle switch graph. The [parity decomposition theorem](../../theorems/P005-parity-matching-decomposition.md) proves

$$
\mathcal C_{2m}\cong\mathcal R(B_m)\mathbin{\square}\mathcal R(B_m).
$$

Thus even-order P005 is connected exactly when $\mathcal R(B_m)$ is connected. The host graph $B_m$ is also the graph used in [P040](P040-coprime-matching-local-resilience.md), which studies local matching resilience rather than switches.

For odd order $n=2m+1$, every coprime permutation has exactly one odd-to-odd assignment $u\mapsto v$. If $t(u)$ counts coprime bijections between the even vertices and the odd vertices excluding $u$, the same theorem gives the exact identity, writing $C(n)$ for the total number of coprime permutations of $[n]$:

$$
C(2m+1)=\sum_{\substack{u,v\ \mathrm{odd}\\\gcd(u,v)=1}}t(u)t(v).
$$

Its proof partitions the switch space into marked-pair fibers, each a product of two smaller matching switch graphs. The [independent enumeration](../../experiments/P005_parity_matching_decomposition.py) checks both counting identities against direct permutation counts for $2\le n\le15$. This was a structural reduction; connectivity has now been established by the universal-hub theorem. The even-order perfect-square counting formula is already recorded in [OEIS A009679](https://oeis.org/A009679) (2007), and must not be claimed as new. Historical novelty of the switch-graph and odd-order refinements remains unverified.

## Extended finite switch evidence

The parity reduction permits exhaustive switch connectivity verification for even orders through $n=22$, by enumerating only the perfect matchings of the even–odd coprimality graph. The [independent C++17 BFS](../../experiments/P005_even_bipartite_switch_bfs.cpp) reaches all $4\,051\,872$ matchings for $n=22$, compared with an independently computed subset-DP total. The [theorem note](../../theorems/P005-parity-matching-decomposition.md#extended-finite-connectivity-certificate) records the previous even orders and reproduction instructions. This is finite evidence independently consistent with the general connectivity proof.

## Why nontrivial?

The underlying bipartite graph contains an induced six-cycle on rows $2,3,5$ and columns $2,3,5$: the 3-by-3 adjacency matrix has ones precisely off the diagonal. Thus it is not chordal bipartite for $n\ge5$, and standard immediate chordal-bipartite switch arguments do not apply.

In general graphs, four-cycle reconfiguration need not be connected (and even deciding reachability can be hard). The special number-theoretic structure may matter.

## Related literature (not novelty certification)

- Carl Pomerance, *Coprime permutations* (2022): https://arxiv.org/abs/2203.03085
- Ashwin Sah and Mehtaab Sawhney, *Enumerating coprime permutations* (2022): https://arxiv.org/abs/2203.06268
- OEIS [A005326](https://oeis.org/A005326): enumerates coprime permutations, **not** switch components.
- Ito et al., *The Perfect Matching Reconfiguration Problem*, MFCS 2019: https://doi.org/10.4230/LIPIcs.MFCS.2019.80
- Dyer and Müller, *Counting Perfect Matchings and the Switch Chain*: https://eprints.whiterose.ac.uk/id/eprint/137388/7/Dyer%20NonbipartiteSIDMA-final.pdf

Targeted searches did not expose a direct treatment of this exact arithmetic switch question. **This does not establish novelty.**

## Further questions

Determine the exact diameter and the mixing time of the coprime-permutation switch chain. Verify historical priority of the universal-hub argument against matching-reconfiguration literature. Seek the exact diameter, quantitative mixing-time behavior, and strengthened reconfiguration properties.

## Related literature

Pomerance and Sah–Sawhney study the underlying coprime permutations; Dyer–Jerrum–Müller study matching switches. Exact arithmetic connectivity was not located. This is **not a certification of novelty or of unresolved status**. Read the [full P001–P008 audit](../../literature-audits/2026-10-28-comprehensive-P001-P008.md) before citing this question in a mathematical publication.
## Additional literature comparison

A tempting generic argument fails: even a bipartite graph with one universal row and one universal column can have *two isolated* perfect matchings in its 4-cycle switch graph. An explicit 5-by-5 matrix counterexample is in the pass-4 literature audit. The completed proof also uses an extendible edge between universal vertices; mere existence of both universal vertices does not suffice for the general graph lemma. See the [archived literature audit](../../literature-audits/2026-10-28-pass-4.md).
