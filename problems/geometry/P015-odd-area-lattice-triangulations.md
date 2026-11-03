# P015 — Flip connectivity of odd-area lattice triangulations

<!-- DOSSIER-SUMMARY -->
> **Research question:** Are all odd-normalized-area triangulations of a convex lattice polygon connected by odd-area-preserving diagonal flips when all four mod-2 vertex residues occur?  
> **Formulation:** candidate. **Novelty:** high overlap risk: colored triangulation flip graphs.  
> **Verified/known progress:** Odd doubled area iff the triangle has three different mod-2 vertex classes; flips require all four classes.  
> **Finite evidence:** Exhaustive parity color patterns through n=9 (zero disconnected four-class cases); six-vertex three-color obstruction.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

**Fields:** discrete geometry, lattice arithmetic, combinatorial reconfiguration  
**Status:** unproved candidate. Neither novelty nor unresolved status is certified.

## Geometry, parity, and the question

Let $P$ be a strictly convex polygon whose $n\ge4$ vertices $v_0,\dots,v_{n-1}\in\mathbb Z^2$ are listed cyclically (no three collinear). A **triangulation** uses diagonals between these vertices. Call it **odd-area** if, for every triangle with vertices $a,b,c$,

$$
\left|\det(b-a,c-a)\right|\equiv1\pmod2.
$$

This requires every triangle to have **odd normalized area**, i.e. an odd integer for twice the Euclidean area. Let $\mathcal T_{\mathrm{odd}}(P)$ denote the set of such triangulations. Join two states by an edge if a single usual diagonal flip transforms one into the other *and both triangulations remain odd-area*.

**P015.** Suppose the vertices of $P$ represent **all four** residues in $(\mathbb Z/2\mathbb Z)^2$, and $|\mathcal T_{\mathrm{odd}}(P)|\ge2$. Must the odd-area flip graph be connected?

A broader structural task is to classify the connected components and, if connected, bound the diameter as a function of $n$. The exact polygon coordinates may matter less than their mod-2 residue sequence.

## Two exact elementary propositions

**Proposition 1 (arithmetic-to-color translation).** Three distinct lattice vertices form a triangle of odd doubled area **if and only if** their reductions modulo 2 are **three distinct** elements of $\mathbb F_2^2$.

*Proof.* Reducing the determinant modulo 2, its value is nonzero exactly when the two difference vectors are linearly independent in $\mathbb F_2^2$. In the affine plane of order 2, any three distinct points are affinely independent, while any repeated class makes two differences linearly dependent. $\square$

Thus the full parity-area problem is equivalently one of triangulations of a convex polygon whose vertices are precolored with four colors, requiring every triangular face to have three **different** colors.

**Proposition 2 (flippability criterion).** In an odd-area triangulation, a diagonal bordering a convex quadrilateral is flippable within the odd-area state space **if and only if** the quadrilateral's four vertices have **all four** different mod-2 residues.

*Proof.* If the diagonal is $ac$ in cyclic quadrilateral $a,b,c,d$, the two current triangles force the colors of $a,c$ to be distinct and each of the colors of $b,d$ to differ from those of $a,c$. The other diagonal $bd$ gives two valid triangles exactly if $b,d$ differ as well; equivalently all four colors occur. $\square$

**Immediate obstruction.** If exactly three parity classes occur, **no** valid flip is possible. Hence two or more valid triangulations in such a three-color configuration always give a disconnected flip graph. One explicit six-vertex coloring is $(0,1,0,2,1,2)$, where there are exactly two odd-area triangulations and no valid flip.

**Realizability.** Any prescribed cyclic four-color pattern can be realized by the mod-2 residues of vertices of a sufficiently large strictly convex lattice polygon: choose a large-scale regular polygon in $\mathbb R^2$, then perturb/round each vertex to a nearby lattice point in its prescribed parity class. Bounded perturbations preserve strict convexity for sufficiently large scale. Thus the combinatorial four-color question is not artificially broader than the geometric lattice formulation.

## Exact finite falsification

The dependency-free program [`experiments/P015_odd_area_flip_graph.py`](../../experiments/P015_odd_area_flip_graph.py) enumerates all triangulations of the convex $n$-gon, all precolorings up to global color relabeling (restricted-growth strings), filters for odd-area faces, and constructs adjacency by a single diagonal flip.

| $n$ | Four-class patterns with at least two valid triangulations (mod global color relabeling) | Disconnected flip graphs |
|---:|---:|---:|
| 5 | 5 | 0 |
| 6 | 20 | 0 |
| 7 | 70 | 0 |
| 8 | 231 | 0 |
| 9 | 735 | 0 |

Additional random precolorings at $n=10$ and $11$ yielded no disconnected examples. These checks are finite and are **not** a general connectivity proof.

**Crucial contrast:** If at most three residue classes are present, nontrivial state spaces can be totally disconnected. The **four-residue** hypothesis is therefore essential.

## Why a solution would matter

This problem links lattice determinants to a constrained associahedron (a subgraph of the ordinary flip graph). A positive theorem would classify when an arithmetically defined family of planar triangulations remains locally reconfigurable, potentially with a canonical-form or shellability argument. A negative theorem would exhibit a new parity-driven obstruction and could suggest new invariants of constrained triangulations.

It also tests whether a combinatorially feasible state space remains connected under natural local moves.

## Direct and potentially subsuming prior art

- Baur, Bergerova, Voon and Xu, [*Flip graphs of coloured triangulations of convex polygons*](https://arxiv.org/abs/2402.06546) (2024; 2025 publication), study colored flips of triangles and their connected components. **Their colored flips are not automatically the same as our fixed vertex-color, odd-area-preserving diagonal flips.**
- Acharya, Mütze and Verciani, [*Flips in colorful triangulations*](https://doi.org/10.20382/jocg.v16i1a9) (2025), obtain connectedness/Hamiltonicity for vertex coloring constraints, including certain arbitrary **two-color** patterns. Their permitted faces are not the same three-distinct-out-of-four condition.
- Debrohim, Sasaki and Nunes, [*Cyclically Colored Triangulations: Enumeration and Connectedness of Reconfiguration Graphs*](https://arxiv.org/abs/2608.26006) (August 2026), prove connectivity of valid flips for **cyclically repeated colors** with at least four colors. **This is the most serious near-predecessor:** our arbitrary mod-2 parity sequences need not be cyclic repetitions, and an exact equivalence has not been verified.
- Lawson's classical connectivity theorem for unrestricted triangulation flip graphs does not survive arbitrary hard constraints.

**Novelty status:** *apparently distinct after targeted searching*, but no genuine originality certification. Before presenting P015 as a newly posed open problem, check whether general arbitrary-vertex-color "rainbow triangulation" connectivity is already solved or follows from the 2026 cyclic-color theorem.

### Source-level boundary clarified, 29 October 2026

The **2025 arbitrary-pattern colorful-triangulation result** of Acharya–Mütze–Verciani concerns **two vertex colors** and requires each face to contain **both colors**. It does not directly address a face requiring **three different colors among four fixed colors**. The **2026** Debrohim–Sasaki–Nunes theorem *does* use the three-distinct-color face condition, but establishes connectivity for **cyclically repeated colorings**, not explicitly for arbitrary patterns in the accessible abstract. This is the unresolved historical boundary, not a claim that all colored triangulation reconfiguration is new.

See the [source-level comparison](../../audits/2026-10-29-P015-P016-P018-P020-source-comparison-and-P010-snapshot.md). No complete full-text proof comparison with the 2026 preprint was possible during this pass.

## Remaining cases

1. Exhaustively verify the graph for every four-color pattern with $n=10$ using dynamic state-space enumeration and color-class/dihedral symmetries.
2. Search for configurations that have a frozen triangulation despite using four parity residues.
3. Read the proof in Debrohim–Sasaki–Nunes (2026), specifically whether the cyclic hypothesis is essential or merely expositional.
4. If a general connectivity theorem covers these patterns, the parity translation supplies a reformulation rather than a distinct conjecture.


## Relation to existing results

**Disposition — source gate, downgrade apparent novelty.** The mod-2 parity reduction is elementary and connectedness of colored triangulation flip graphs has prior literature. Require an exact theorem-by-theorem comparison of allowed polygons, cyclic colorings, residue classes and flip constraints before retaining a genuinely distinct formulation.


