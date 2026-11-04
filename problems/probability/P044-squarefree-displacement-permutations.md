# P044 — Squarefree displacement permutations

<!-- DOSSIER-SUMMARY -->
> **Research question:** What is the optimal second-order term in the number of permutations of [N] with every absolute displacement positive and squarefree?  
> **Formulation:** candidate. **Novelty:** unverified; related squarefree-sum permanents and classical permanent bounds are known.  
> **Verified/known progress:** Internally proved log M(N)=log(N!)+N log(6/pi^2)+O(sqrt N).  
> **Finite evidence:** Exact integer permanents via subset dynamic programming through N=17.  
> **Symbolic prize:** A Research Prize (symbolic) — The optimal order of the error in the squarefree-displacement permanent asymptotic.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

Let $M(N)$ count permutations $\sigma\in S_N$ such that $|\sigma(i)-i|$ is a positive squarefree number for every $i$.

**Question.** Determine the optimal growth order of

$$
R(N)=\log M(N)-\log(N!)-N\log(6/\pi^2).
$$

## Known result

The [supporting proof](../../theorems/P044-squarefree-displacement-permanent.md) establishes

$$
\boxed{|R(N)|=O(\sqrt N).}
$$

Its ingredients are the elementary squarefree counting estimate, a regular bipartite subfactor extracted via max-flow/min-cut, and the classical van der Waerden and Brégman–Minc permanent bounds. This is a proved baseline, not a claim of a new general permanent inequality.

## Computation

An [exact verifier](../../experiments/P044_squarefree_displacement_permanent.py) enumerates the permanent using subset dynamic programming. These finite values do not determine the asymptotic order of the remainder.

## Prior art

The squarefree-*sum* permutation permanent is recorded as [OEIS A398305](https://oeis.org/A398305); it concerns the matrix with entries $\mu^2(i+j)$, not $\mu^2(|i-j|)$. Classical permanent inequalities appear in [Alon's review of matchings and subcubes](https://web.math.princeton.edu/~nalon/PDFS/hypcube11.pdf). Historical distinctness of the absolute-difference remainder question is not certified.
