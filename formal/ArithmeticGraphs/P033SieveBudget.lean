import Mathlib

/-!
# P033 — Exact rational verification of the explicit sieve budget

This file certifies the arithmetic inequalities for the three
common-prime-divisor ranges in the analytic proof. The prime
distribution estimates and the derivation of these three bounds
are separate mathematical results, NOT formalized here.
-/

namespace P033

private def eps : ℚ := 7 / 10000

private def smallObstruction : ℚ :=
  (((1 + 2*eps)^3)/4 + 1/2 + 12*eps +
    1500*eps^2 + 250500*eps^3) /
      ((98/100)*(99/100)^2)

private def middleObstruction : ℚ :=
  8 / ((98/100)*(42/100)^3*999)

private def largeObstruction : ℚ :=
  (102/49) * ((24^2)/(10^5-1) + (6*24^2*25)/(10^10))

/-- The uniform small-modulus proportion is strictly below four-fifths. -/
theorem small_obstruction_lt : smallObstruction < 4/5 := by
  norm_num [smallObstruction, eps]

/-- The intermediate prime-divisor range has cost less than 3/25. -/
theorem middle_obstruction_lt : middleObstruction < 3/25 := by
  norm_num [middleObstruction]

/-- The large-divisor range has cost less than 1/50. -/
theorem large_obstruction_lt : largeObstruction < 1/50 := by
  norm_num [largeObstruction]

/-- All three error budgets together consume strictly less than one. -/
theorem sieve_obstruction_budget :
    smallObstruction + middleObstruction + largeObstruction < 1 := by
  have ha := small_obstruction_lt
  have hb := middle_obstruction_lt
  have hc := large_obstruction_lt
  norm_num at *
  linarith

#print axioms small_obstruction_lt
#print axioms middle_obstruction_lt
#print axioms large_obstruction_lt
#print axioms sieve_obstruction_budget

end P033
