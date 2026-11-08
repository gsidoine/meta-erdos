# Arithmetic graph structural certificates (P030 and P033)

**Status:** Lean source submitted for independent kernel checking; do not describe these modules as verified until CI succeeds.

The modules target two self-contained graph/arithmetic lemmas using Lean 4.35.0 and Mathlib 4.35.0.

- [P030.lean](P030.lean) formalizes the assertion that an edge whose sum and difference are prime, and whose endpoints are not divisible by 3, has difference exactly 3. It also formalizes the implication from such an edge to a Goldbach representation of twice the larger endpoint.
- [P033.lean](P033.lean) formalizes the additive residue-class invariant of two sum colors. For colors agreeing modulo $m$, a finite path can visit only the starting residue and one reflected residue.

These are **structural components**, not formalizations of the full matching upper bound of P030, the finite Hall certificate, or P033's complete two-/three-color classification. The [mathematical dossier P030](../../problems/number-theory/P030-double-prime-perfect-matchings.md) and [P033 theorem note](../../theorems/P033-eventual-three-prime-sum-connectivity.md) state the corresponding mathematical results.

To check the Lean sources:

```sh
cd formal/ArithmeticGraphs
lake update
lake exe cache get
lake build ArithmeticGraphs
lake env lean P030.lean
lake env lean P033.lean
```

The printed axiom declarations report the dependencies of each theorem. No journal or historical novelty claim follows from the formalization.
