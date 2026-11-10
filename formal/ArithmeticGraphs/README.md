# Arithmetic graph certificates

The modules use Lean 4.35.0 and Mathlib 4.35.0. The [Lean verification workflow](../../.github/workflows/arithmetic-graph-lean.yml) compiles the project and reports axioms of the principal declarations.

## P005 — Complete coprime permutation switch theorem

The theorem [P005.coprime_switch_diameter](P005All.lean) states that, for every positive integer $n$ and any two permutations of $[n]$ satisfying the coprimality condition at every position, there is a sequence of **at most $3(n-1)$ legal two-position switches** connecting them.

The source represents $[n]$ by zero-based Fin n; the coprimality relation explicitly applies to the positive integers $i+1$. A switch exchanges the values at two positions. The theorem is universally quantified over all $n\ge1$ and valid permutations; it is not a finite enumeration.

The proof comprises:

- [P005Hub.lean](P005Hub.lean) and [P005Reach.lean](P005Reach.lean): legal local switches and strict progress.
- [P005Connected.lean](P005Connected.lean) and [P005Diameter.lean](P005Diameter.lean): generic universal-hub connectivity and quantitative length bound.
- [P005Reference.lean](P005Reference.lean) and [P005Transport.lean](P005Transport.lean): canonical reference matching and transport of paths.
- [P005Odd.lean](P005Odd.lean): odd-order arithmetic specialization.
- [P005EvenFactors.lean](P005EvenFactors.lean): both even-order arithmetic matching factors.
- [P005ParitySplit.lean](P005ParitySplit.lean) and [P005ForcedParity.lean](P005ForcedParity.lean): explicit parity identification and forced parity exchange.
- [P005FactorCombine.lean](P005FactorCombine.lean) and [P005FactorSwap.lean](P005FactorSwap.lean): global reconstruction and lifting of factor switches.
- [P005EvenReference.lean](P005EvenReference.lean) and [P005EvenPath.lean](P005EvenPath.lean): even-order reference and global paths.
- [P005All.lean](P005All.lean): path reversal, all-order canonical sorting, and the diameter bound.

The principal declarations are P005.all_coprime_canonical_path and P005.coprime_switch_diameter. The GitHub Actions axiom reports for both give exactly [propext, Classical.choice, Quot.sound], without unproved mathematical axioms or sorryAx.

The [independent mathematical proof](../../theorems/P005-universal-hub-switch-connectivity.md) is complete; the Lean source now verifies its arithmetic conclusion for every order. This certificate does not establish historical originality.

## P030 and P033 — Structural lemmas

- [P030.lean](P030.lean) certifies the prime sum/difference congruence lemma and its elementary Goldbach-representation implication. It does not formalize the full matching counterexample.
- [P033.lean](P033.lean) certifies the two-color residue reflection invariant.
- [P033Palette.lean](P033Palette.lean) certifies the finite-palette residue obstruction and its three-color specialization.

The broader [P030](../../problems/number-theory/P030-double-prime-perfect-matchings.md) and [P033](../../problems/graph-theory/P033-prime-sum-three-palette.md) problems contain mathematical results beyond these Lean declarations.

## Verification

From the repository root, change into formal/ArithmeticGraphs, run lake update, retrieve the Mathlib cache with lake exe cache get, and run lake build ArithmeticGraphs. The final source can also be checked with lake env lean P005All.lean.

All Lean modules are library roots included in the [pinned CI workflow](../../.github/workflows/arithmetic-graph-lean.yml). The certificate does not establish manuscript acceptance, publication, or priority.
