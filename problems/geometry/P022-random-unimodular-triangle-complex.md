# P022 — Homology of random unimodular lattice-triangle complexes

<!-- DOSSIER-SUMMARY -->
> **Research question:** What are homology regimes for random lattice-site complexes whose two-faces have normalized area one?  
> **Formulation:** candidate. **Novelty:** not certified (targeted audit).  
> **Verified/known progress:** At N=1 with all four vertices kept the complex is the tetrahedral boundary, with reduced H2 nonzero.  
> **Finite evidence:** Exact elementary N=1 example only; finite Betti experiments pending.  
> **Symbolic prize:** One small beer — A proved nontrivial homology transition regime for the random unimodular triangle complex.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

**Area:** discrete geometry, random topology, arithmetic combinatorics. **Status:** candidate.

## Definition and question

For $N\ge1$, let $V_N=\{0,\ldots,N\}^2\subset\mathbb Z^2$. Independently keep each lattice point with probability $p_N$. Let $U_N(p_N)$ be the *two-dimensional simplicial complex* whose maximal two-faces are the triples of retained distinct vertices $\{a,b,c\}$ satisfying

$$
|\det(b-a,c-a)|=1.
$$

Include each edge and vertex of such a triangle, and every remaining retained vertex as a singleton; **do not** add triangles of larger area or fill higher cliques.

For fixed $k=0,1,2$, determine the asymptotic regimes of $\Pr(\widetilde H_k(U_N(p_N);\mathbb F_2)\ne0)$, especially at $p_N=N^{-\alpha}$ and at fixed density $p_N=p$. More strongly, is there a natural normalization under which $\beta_1$ satisfies a law of large numbers?

No monotonicity of nonzero homology is assumed: adding vertices can both create and fill cycles.

## A rigorous basic distinction

A lattice triangle has normalized area one precisely if its edge-difference vectors are a basis of $\mathbb Z^2$. Thus the two-faces encode the unimodular bases of the rank-two integral lattice, rather than independently chosen triangular faces. The number of all retained vertices is $\mathrm{Bin}((N+1)^2,p_N)$, but this does not control nontrivial homology because long primitive segments can participate in unimodular triangles.

For $N=1$ with all four vertices retained, all four triples are unimodular: the resulting complex is the boundary of a tetrahedron, so $\widetilde H_1=0$ and $\widetilde H_2\cong\mathbb F_2$. This serves as a simple exact topological sanity check.

## Nearest primary literature

- [Haase–Paffenholz–Piechnik–Santos, *Existence of unimodular triangulations* (Memoirs AMS 2021)](https://doi.org/10.1090/memo/1321): deterministic lattice triangulations, not the random **all-area-one-triples** complex.
- [Łuczak–Peled, *Integral homology of random simplicial complexes* (2018)](https://doi.org/10.1007/s00454-017-9938-z): independent two-face process, not dependent vertex sampling on unimodular arithmetic constraints.
- [Kahle, *Topology of random clique complexes* (2009)](https://doi.org/10.1016/j.disc.2008.02.037): independent-edge flag complex rather than this nonflag two-complex.

**Originality:** a bounded search did not find the exact model. Its potential equivalence to a familiar lattice matroid or independence complex remains unchecked.

## Adversarial next step

Generate every area-one triple on $V_N$ exactly for small $N$; compute reduced boundary ranks and link structure using integer determinant tests. Determine whether $p=1$ has a general homology theorem before inferring a random threshold. Compare first-face and first-cycle occurrences; do not extrapolate numerical Betti migration.

