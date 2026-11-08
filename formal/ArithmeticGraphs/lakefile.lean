import Lake
open Lake DSL

package arithmeticGraphCertificates where

require mathlib from git
  "https://github.com/leanprover-community/mathlib4" @ "v4.35.0"

@[default_target]
lean_lib ArithmeticGraphs where
  srcDir := "."
  roots := #[`P030, `P033, `P033Palette]
