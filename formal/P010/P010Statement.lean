import Mathlib

/-!
# P010 — exact minimum number of coprime adjacencies (statement)

For a permutation of `[1,n]`, `adjacentCount` counts adjacent pairs
of coprime integers. `h` denotes the minimum such count.
The advertised formula is `target`, valid for `n ≥ 4`.

The definitions are independent of the construction proving the theorem.
See `P010.lean` for its kernel-checked proof.

Mathematical reference:
https://github.com/gsidoine/the-scottish-book/blob/main/theorems/P010-exact-coprime-adjacencies.md
-/

namespace P010

/-- The list contains every integer in `[1, n]` exactly once. -/
def IsPermutation (n : ℕ) (a : List ℕ) : Prop :=
  a.Perm (List.range' 1 n)

/-- The number of adjacent coprime pairs in a list. -/
def adjacentCount (a : List ℕ) : ℕ :=
  (a.zip a.tail).countP (fun z => decide (Nat.Coprime z.1 z.2))

/-- The number of primes not exceeding `n`. -/
def pi (n : ℕ) : ℕ := Nat.primeCounting n

/-- The exact expression in the submitted manuscript, for `n ≥ 4`. -/
def target (n : ℕ) : ℕ :=
  (pi n - pi (n / 2)) +
    max 1 (((pi (n / 2) - pi (n / 3)) + 1) / 2)

/-- The nonempty set of possible adjacency counts. -/
def Attained (n k : ℕ) : Prop :=
  ∃ a : List ℕ, IsPermutation n a ∧ adjacentCount a = k

theorem attainable (n : ℕ) : ∃ k : ℕ, Attained n k := by
  refine ⟨adjacentCount (List.range' 1 n), List.range' 1 n, ?_, rfl⟩
  exact List.Perm.refl _

/-- The extremal quantity, defined as the least realized score. -/
noncomputable def h (n : ℕ) : ℕ := by
  classical
  exact Nat.find (attainable n)

/-- The exact P010 assertion, with its full domain restriction. -/
def ExactStatement (n : ℕ) : Prop := 4 ≤ n → h n = target n

end P010
