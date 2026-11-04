# P011 — Matching transitions in random sum-diagonal graphs

<!-- DOSSIER-SUMMARY -->
> **Research question:** In random sum-diagonal bipartite graphs, how do perfect matchings and min-degree factor saturation emerge?  
> **Formulation:** candidate. **Novelty:** not certified; targeted literature comparison only.  
> **Verified/known progress:** Random sum-graphs are known; matching and factor phase behavior not located; factor saturation not monotone.  
> **Finite evidence:** Explicit three-by-three obstruction to monotonicity; no asymptotic claims.  
> **Symbolic prize:** A Research Prize (symbolic) — A rigorous threshold law for perfect matchings in the random sum-diagonal graph model.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

**Field:** probabilistic combinatorics / additive graph theory  
**Research status:** candidate, unproved, not certified novel.

## Model and precise questions

Let $S_n(p)\subseteq\{0,1,\dots,2n-2\}$ include each **sum value** independently with probability $p$. Define the balanced bipartite graph $G_n^\Sigma(p)$ with two copies of $\{0,\dots,n-1\}$, where

$$
(i,j)\in E(G_n^\Sigma(p))\quad\Longleftrightarrow\quad i+j\in S_n(p).
$$

**Important:** edges on the same anti-diagonal are perfectly correlated; randomizing **sum values** is not the usual independent-edge model $G(n,n,p)$.

Write $\nu_n(p)$ for the size of a maximum matching, $\lambda_n(p)$ for the maximum number of edge-disjoint perfect matchings, and $\delta_n(p)$ for the graph's minimum degree.

**Question A (monotone):** Determine the location and limiting window, if any, of the event $\nu_n(p)=n$. Does isolated-vertex disappearance govern the transition despite the strong sum-diagonal dependence?

**Question B (not monotone in general):** Determine the asymptotic behavior of

$$
\Pr\bigl(\lambda_n(p)=\delta_n(p)\,\big|\,\delta_n(p)>0\bigr).
$$

For which sparsity regimes does this probability tend to 0 or 1? If necessary, condition additionally on the existence of a perfect matching. We do **not** assert that this event has a monotone threshold.

**Question C:** Do random sum-support graphs have matching and factor statistics in the same universality class as random bipartite graphs, or is the diagonal dependence a genuinely different obstruction mechanism?

## Structural reason this might matter

A positive universality theorem would transfer matching and factor phenomena from Erdős–Rényi graphs to **strongly correlated additive graph ensembles**. A negative answer would isolate arithmetic cuts that standard independent-edge heuristics miss. The deterministic extremes connect P003 (prime-supported sums) and the **proved** interval-sum factor theorem.

The perfect matching event is monotone under adding sums. Factor saturation at the *current minimum degree* is not monotone: at $n=3$, allowed sums $S=\{1\}$ give $\delta=\lambda=0$; adding sum $3$ gives

$$
A=\begin{pmatrix}0&1&0\\1&0&1\\0&1&0\end{pmatrix},
$$

where $\delta=1$ but $\lambda=0$. Adding sum $2$ recovers the interval $[1,3]$ and $\lambda=\delta$. Consequently **Question B should not be described as a conventional monotone threshold without further proof**.

## Known work and novelty audit

- Campos, Dahia and Marciano, [*On the independence number of sparser random Cayley graphs* (2024)](https://doi.org/10.1112/jlms.70041), work on random **Cayley sum graphs** over finite cyclic groups. The *randomize sum values* model is **not a new general idea**; their main observable is independence number rather than the exact bipartite factor question here.
- [KolKom 2026, *On subgraph thresholds of random Cayley sum graphs*](https://kolkom26.zib.de/) further treats subgraph thresholds in a related cyclic model.
- Balachandran and Kush, [*The Normalized Matching Property in Random and Pseudorandom Bipartite Graphs* (2021)](https://doi.org/10.37236/9148), studies independently sampled bipartite edges and a stronger matching property, not the same sum-diagonal dependence.
- [The proved consecutive-interval factor theorem](../../theorems/interval-sum-factor-saturation.md) is a deterministic positive boundary case, not the random result.

**Novelty level:** *apparent distinctness of this specific matching/factor question after a targeted search*. The underlying random sum graph model and generic matching questions are classical; comprehensive synonym/citation-chain review is outstanding.

## Falsification and next work

1. Enumerate all $S\subseteq[0,2n-2]$ for small $n$, tracking matching and min-degree factor statistics.
2. Compare with independently sampled-edge graphs at equal expected density.
3. Search the random Cayley sum graph literature specifically for matching and $k$-factor thresholds before any priority claim.
4. Do **not** elevate an unproved threshold prediction to a conjectural theorem until finite/analytic obstructions are checked.
