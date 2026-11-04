# P022 — Homology of random unimodular lattice-triangle complexes

<!-- DOSSIER-SUMMARY -->
> **Research question:** At what vertex-retention scale does the unimodular lattice-triangle complex develop nonzero second homology over F2?  
> **Formulation:** needs specification. **Novelty:** only a one-square finite example established; no focused homological degree, critical exponent or verified new asymptotic phenomenon.  
> **Verified/known progress:** The N=1 full-retention complex is a tetrahedral boundary; no nontrivial homology scale, concentration theorem or limiting law has been established.  
> **Finite evidence:** Exact elementary N=1 example only; finite Betti experiments pending.  
> **Symbolic prize:** —  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

**Area:** discrete geometry, random topology, arithmetic combinatorics. **Status:** needs specification.

## Definition and question

For $N\ge1$, let $V_N=\{0,\ldots,N\}^2\subset\mathbb Z^2$. Independently keep each lattice point with probability $p_N$. Let $U_N(p_N)$ be the *two-dimensional simplicial complex* whose maximal two-faces are the triples of retained distinct vertices $\{a,b,c\}$ satisfying

$$
|\det(b-a,c-a)|=1.
$$

Include each edge and vertex of such a triangle, and every remaining retained vertex as a singleton; **do not** add triangles of larger area or fill higher cliques.

**Proposed primary question (not yet a promoted conjecture).** At what retention scale $p_N$ does the second reduced homology $\widetilde H_2(U_N(p_N);\mathbb F_2)$ become nonzero with high probability? A nontrivial critical exponent must be justified by an arithmetic witness-count and matching absence theorem.

Secondary questions include:

For fixed $k=0,1,2$, determine the asymptotic regimes of $\Pr(\widetilde H_k(U_N(p_N);\mathbb F_2)\ne0)$, especially at $p_N=N^{-\alpha}$ and at fixed density $p_N=p$. More strongly, is there a natural normalization under which $\beta_1$ satisfies a law of large numbers?

No monotonicity of nonzero homology is assumed: adding vertices can both create and fill cycles.

## Unresolved formulation

The construction defines a legitimate finite simplicial complex, but asking simultaneously for all three homology degrees, all sparse exponents, fixed-density behavior and a Betti-number law of large numbers does not yet identify an independent mathematical obstruction. Before promoting the question, one must specify a single homological degree and a conjectured critical scaling, supported by an arithmetic count of minimal cycles and a comparison with existing unimodular lattice complexes. The $N=1$ tetrahedral-boundary example is a boundary case, not evidence of a general phase transition.

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

