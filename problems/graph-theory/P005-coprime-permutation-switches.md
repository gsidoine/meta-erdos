# P005 — Switch connectivity of coprime permutations

<!-- DOSSIER-SUMMARY -->
> **Research question:** Can all permutations satisfying gcd(i,σ(i))=1 be connected by valid two-position swaps?  
> **Formulation:** candidate. **Novelty:** not certified; targeted literature comparison only.  
> **Verified/known progress:** No universal-row/column shortcut; arithmetic structure is essential.  
> **Finite evidence:** 3,459,600 states at n=14, one component.  
> **Symbolic prize:** A live goose — A necessary and sufficient criterion for connected coprime-permutation switch graphs.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->


**Area:** number theory and graph reconfiguration  
**Status:** candidate, exact novelty and unresolved status **unverified**

## Definition

A coprime permutation of $[n]=\{1,\ldots,n\}$ is a permutation $\sigma$ satisfying

$$
\gcd(i,\sigma(i))=1\quad\text{for all }i\in[n].
$$

Two such permutations are *switch-adjacent* if one results from the other by exchanging $\sigma(i)$ and $\sigma(j)$ for some $i\ne j$, while preserving the coprimality requirements at positions $i,j$.

Let $\mathcal C_n$ be the graph of coprime permutations and these switches. Equivalently, $\mathcal C_n$ is the four-cycle switch graph of the perfect matchings of the bipartite graph on two copies of $[n]$, where $i\sim j$ iff $\gcd(i,j)=1$.

## Question

**Is $\mathcal C_n$ connected for every $n\ge1$?**

Stronger: does $\mathrm{diam}(\mathcal C_n)$ grow at most polynomially in $n$? Can a canonical coprime permutation be reached by a monotone local reduction?

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

## Next work

1. Find a switch invariant or an explicit disconnected component at larger $n$.
2. Seek a pivot strategy using positions/values $1$ and arithmetic structure.
3. Test whether every coprime permutation reduces to the cyclic shift in $O(n^2)$ switches.
4. Investigate whether a standard matching-reconfiguration theorem already handles the coprime graph.

## Related literature

Pomerance and Sah–Sawhney study the underlying coprime permutations; Dyer–Jerrum–Müller study matching switches. Exact arithmetic connectivity was not located. This is **not a certification of novelty or of unresolved status**. Read the [full P001–P008 audit](../../literature-audits/2026-10-28-comprehensive-P001-P008.md) before citing this question in a mathematical publication.
## Additional literature comparison

A tempting generic argument fails: even a bipartite graph with one universal row and one universal column can have *two isolated* perfect matchings in its 4-cycle switch graph. An explicit 5-by-5 matrix counterexample is in the pass-4 literature audit. Thus a proof of P005 must exploit more than the universally coprime index 1. See the [archived literature audit](../../literature-audits/2026-10-28-pass-4.md).
