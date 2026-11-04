# P015 — Odd-area triangulations

<!-- DOSSIER-SUMMARY -->
> **Research question:** Are all odd-normalized-area triangulations of a convex lattice polygon connected by odd-area-preserving diagonal flips when all four mod-2 vertex residues occur?  
> **Formulation:** candidate. **Novelty:** high overlap risk: colored triangulation flip graphs.  
> **Verified/known progress:** Odd doubled area iff the triangle has three different mod-2 vertex classes; flips require all four classes.  
> **Finite evidence:** Exhaustive parity color patterns through n=9 (zero disconnected four-class cases); six-vertex three-color obstruction.  
> **Symbolic prize:** A Coffee (symbolic) — A general proof of four-class odd-area flip connectivity, or a finite counterexample.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

**Subject:** discrete geometry  
**Formal proof:** not yet verified in Lean

## Problem

Let $P$ be a strictly convex lattice polygon with vertices representing all four classes of $(\mathbb Z/2\mathbb Z)^2$. A triangulation is *odd-area* when every triangle has odd normalized area (twice its Euclidean area).

**Question.** If there are at least two odd-area triangulations of $P$, is the graph of odd-area-preserving diagonal flips connected?

## Established progress

A triangle has odd normalized area exactly when its three vertices represent distinct residue classes modulo $2$. An admissible flip requires all four residues in its quadrilateral. Four-class instances with at least two admissible triangulations were checked through nine vertices; none were disconnected. These finite checks do not prove connectivity in general.

## Context

Colored triangulation flip graphs are established subjects, and related published theorems may subsume the remaining question. The published colored-triangulation flip theories of [Baur–Bergerova–Voon–Xu](https://doi.org/10.12958/adm2312) and [Acharya–Mütze–Verciani](https://doi.org/10.20382/jocg.v16i1a9) are direct comparators. Their color conditions must be compared with the requirement that every face use three distinct classes of $(\mathbb Z/2\mathbb Z)^2$; ordinary colorful-flip connectivity does not alone establish connectivity under all simultaneous parity restrictions. The novelty and unresolved status of this exact formulation are not certified.

## Supporting material

- [Elementary proofs and obstructions](proofs/parity-criterion.md)
- [Literature comparisons](references/prior-art.md)
- [Finite checks and exploration](exploration/README.md)
- [Reproducible verification program](verification/P015_odd_area_flip_graph.py)
- [Formalization status](formal/README.md)
- [Historical full dossier](../geometry/P015-odd-area-lattice-triangulations.md)

Contributions to a proof, counterexample, Lean statement, or source comparison are welcome; see [Contributing](../../CONTRIBUTING.md).
