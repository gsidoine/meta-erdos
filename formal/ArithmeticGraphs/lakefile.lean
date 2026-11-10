import Lake
open Lake DSL

package arithmeticGraphCertificates where

require mathlib from git
  "https://github.com/leanprover-community/mathlib4" @ "v4.35.0"

@[default_target]
lean_lib ArithmeticGraphs where
  srcDir := "."
  roots := #[`P030, `P033, `P033Palette, `P033FiniteCertificate, `P033ReflectionMoves, `P033SieveBudget, `P005Hub, `P005Reach, `P005Connected, `P005Diameter, `P005Reference, `P005Transport, `P005Odd, `P005EvenFactors, `P005ParitySplit, `P005ForcedParity, `P005FactorCombine, `P005FactorSwap, `P005EvenReference, `P005EvenPath, `P005All]
