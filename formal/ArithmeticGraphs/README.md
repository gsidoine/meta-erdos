# Arithmetic graph structural certificates (P005, P030, and P033)

**Verification status:** All declarations listed as proved below are kernel-checked by the [Arithmetic graph Lean workflow](../../.github/workflows/arithmetic-graph-lean.yml) using Lean 4.35.0 / Mathlib 4.35.0. The complete P005 theorem for *both parities* and its final diameter bound have not yet been formalized.

The project contains self-contained graph/arithmetic lemmas using Lean 4.35.0 and Mathlib 4.35.0.

- [P030.lean](P030.lean) formalizes the assertion that an edge whose sum and difference are prime, and whose endpoints are not divisible by 3, has difference exactly 3. It also formalizes the implication from such an edge to a Goldbach representation of twice the larger endpoint.
- [P033.lean](P033.lean) formalizes the additive residue-class invariant of two sum colors. For colors agreeing modulo $m$, a finite path can visit only the starting residue and one reflected residue.

- [P033Palette.lean](P033Palette.lean) formalizes the finite-palette residue obstruction: if every edge-sum color agrees modulo $m$, every connected path projects to at most two residue classes. The special three-color statement follows without primality assumptions.

- [P005Hub.lean](P005Hub.lean) proves legal hub swaps and the three-switch local construction under universal-row/column assumptions.
- [P005Reach.lean](P005Reach.lean) formalizes strict progress in both hub cases, measured by the finite set of incorrect rows.

- [P005Connected.lean](P005Connected.lean) formalizes the generic universal-hub connectivity theorem by finite induction.
- [P005Diameter.lean](P005Diameter.lean) proves a quantitative sorting bound: a reference matching can be reached in `L` switches satisfying `2*L ≤ 3*r`, where `r` is the initial number of incorrect non-hub rows.
- [P005Reference.lean](P005Reference.lean) constructs the canonical consecutive-integer coprime reference permutation and proves it is an involution.
- [P005Transport.lean](P005Transport.lean) transports sorting certificates to arbitrary reference matchings.
- [P005Odd.lean](P005Odd.lean) proves the odd-order **arithmetic** P005 statement: every valid coprime permutation reaches the canonical one in `L` switches with `2*L ≤ 3*(n−1)`.
- [P005EvenFactors.lean](P005EvenFactors.lean) proves the quantitative connectivity bound separately for both parity factors of the even-order coprime problem. The explicit Lean equivalence between a global coprime permutation on `[2m]` and its two factors, and the resulting global even-order theorem, remain to be formalized.

These are **structural components**, not formalizations of the full matching upper bound of P030, the finite Hall certificate, or P033's complete two-/three-color classification. The [mathematical dossier P030](../../problems/number-theory/P030-double-prime-perfect-matchings.md) and [P033 theorem note](../../theorems/P033-eventual-three-prime-sum-connectivity.md) state the corresponding mathematical results.

To check the Lean sources:

```sh
cd formal/ArithmeticGraphs
lake update
lake exe cache get
lake build ArithmeticGraphs
lake env lean P030.lean
lake env lean P033.lean
lake env lean P033Palette.lean
lake env lean P005Hub.lean
lake env lean P005Reach.lean
lake env lean P005Connected.lean
lake env lean P005Diameter.lean
lake env lean P005Reference.lean
lake env lean P005Transport.lean
lake env lean P005Odd.lean
lake env lean P005EvenFactors.lean
```

The CI axiom report gives exactly `[propext, Quot.sound]` for each of `P030.prime_edge_difference_three`, `P030.edge_gives_two_primes`, `P033.two_color_orbit`, and `P033.two_color_at_most_two`, without `sorryAx` or unproved mathematical assumptions. No journal or historical novelty claim follows from the formalization.
