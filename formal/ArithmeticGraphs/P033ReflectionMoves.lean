import Mathlib

/-!
# P033 — Arithmetic two-edge reflection paths

The two elementary path moves used in the P033 graph criterion.
Every vertex is represented by its *positive* integer label.
The proofs verify endpoint bounds, unequal endpoints, and exact
prime-sum color equalities; primality is not needed in these lemmas.
-/

namespace P033

def SumEdge (n p q r x y : ℕ) : Prop :=
  x ≠ y ∧ 1 ≤ x ∧ x ≤ n ∧ 1 ≤ y ∧ y ≤ n ∧
    (x + y = p ∨ x + y = q ∨ x + y = r)

/-- Composition of reflections in odd sums p and q realizes
    the forward translation x ↦ x+(q-p), with both edges valid
    inside [n] whenever the final point lies in the interval. -/
theorem forward_two_edges (n p q r x : ℕ)
    (hpodd : p % 2 = 1)
    (hqodd : q % 2 = 1)
    (hxodd : x % 2 = 1)
    (hx : 1 ≤ x) (hxp : x < p) (hpn : p < n)
    (hpq : p < q)
    (hupper : x + (q-p) ≤ n) :
    SumEdge n p q r x (p-x) ∧
      SumEdge n p q r (p-x) (x+(q-p)) := by
  constructor
  · unfold SumEdge
    refine ⟨?_, ?_, ?_, ?_, ?_, ?_⟩
    · omega
    · omega
    · omega
    · omega
    · omega
    · exact Or.inl (by omega)
  · unfold SumEdge
    refine ⟨?_, ?_, ?_, ?_, ?_, ?_⟩
    · omega
    · omega
    · omega
    · omega
    · omega
    · exact Or.inr (Or.inl (by omega))

/-- The reverse pair of reflections, of sums r and p, realizes
    x ↦ x-(r-p) when both intermediate and terminal points
    belong to the interval. -/
theorem backward_two_edges (n p q r x : ℕ)
    (hpodd : p % 2 = 1)
    (hrodd : r % 2 = 1)
    (hxodd : x % 2 = 1)
    (hpx : p ≤ x) (hxn : x ≤ n)
    (hrn : n < r) (hrp : r-p ≤ n)
    (hpositive : 1 ≤ x-(r-p)) :
    SumEdge n p q r x (r-x) ∧
      SumEdge n p q r (r-x) (x-(r-p)) := by
  constructor
  · unfold SumEdge
    refine ⟨?_, ?_, ?_, ?_, ?_, ?_⟩
    · omega
    · omega
    · omega
    · omega
    · omega
    · exact Or.inr (Or.inr (by omega))
  · unfold SumEdge
    refine ⟨?_, ?_, ?_, ?_, ?_, ?_⟩
    · omega
    · omega
    · omega
    · omega
    · omega
    · exact Or.inl (by omega)

#print axioms forward_two_edges
#print axioms backward_two_edges

end P033
