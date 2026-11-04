import Mathlib

/-!
# P010: minimum number of coprime adjacencies

This is a developing formalization of the theorem proved in
`theorems/P010-exact-coprime-adjacencies.md`.

The submitted manuscript is not modified. The full prime-factor
path-cover construction and all-n arithmetic lower bound are not
yet formalized. There is deliberately no axiom or `sorry` that
asserts the manuscript's main result.
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

theorem h_attained (n : ℕ) : Attained n (h n) := by
  classical
  exact Nat.find_spec (attainable n)

theorem h_le_of_permutation (n : ℕ) (a : List ℕ) (ha : IsPermutation n a) :
    h n ≤ adjacentCount a := by
  classical
  exact Nat.find_min' (attainable n) ⟨a, ha, rfl⟩

theorem le_h_of_lower_bound (n k : ℕ)
    (hlower : ∀ a : List ℕ, IsPermutation n a → k ≤ adjacentCount a) :
    k ≤ h n := by
  obtain ⟨a, ha, hc⟩ := h_attained n
  rw [← hc]
  exact hlower a ha

/-- A general extremal principle. This does not supply either arithmetic bound. -/
theorem exact_of_matching_bounds (n : ℕ)
    (hlower : ∀ a : List ℕ, IsPermutation n a → target n ≤ adjacentCount a)
    (hupper : ∃ a : List ℕ, IsPermutation n a ∧ adjacentCount a ≤ target n) :
    h n = target n := by
  apply Nat.le_antisymm
  · obtain ⟨a, ha, hscore⟩ := hupper
    exact (h_le_of_permutation n a ha).trans hscore
  · exact le_h_of_lower_bound n (target n) hlower

/-- In the non-coprime graph, the vertex 1 is isolated. -/
theorem one_coprime (x : ℕ) : Nat.Coprime 1 x := by
  simp

/-- A prime above `n/2` has no non-coprime neighbor distinct
from itself among positive integers at most `n`. -/
theorem large_prime_isolated {n p x : ℕ} (hp : Nat.Prime p)
    (hbig : n / 2 < p) (hxpos : 0 < x) (hxle : x ≤ n)
    (hne : x ≠ p) : Nat.Coprime p x := by
  apply (hp.coprime_iff_not_dvd).2
  intro hdiv
  obtain ⟨k, hk⟩ := hdiv
  have hlt : n < 2 * p := by omega
  have hklt : k < 2 := by
    by_contra h
    have hk2 : 2 ≤ k := by omega
    have hprod : p * 2 ≤ p * k := Nat.mul_le_mul_left p hk2
    omega
  have hkcases : k = 0 ∨ k = 1 := by omega
  rcases hkcases with hzero | hone
  · subst k
    simp at hk
    omega
  · subst k
    simp at hk
    omega

/-- A prime between `n/3` and `n/2` has at most one
possible non-coprime neighbor: `2p`. -/
theorem middle_prime_unique_neighbor {n p x : ℕ} (hp : Nat.Prime p)
    (hthird : n / 3 < p) (hxpos : 0 < x) (hxle : x ≤ n)
    (hne : x ≠ p) (hnoncoprime : ¬Nat.Coprime p x) : x = 2 * p := by
  have hdiv : p ∣ x := (hp.dvd_iff_not_coprime).2 hnoncoprime
  obtain ⟨k, hk⟩ := hdiv
  have hlt : n < 3 * p := by omega
  have hklt : k < 3 := by
    by_contra h
    have hk3 : 3 ≤ k := by omega
    have hprod : p * 3 ≤ p * k := Nat.mul_le_mul_left p hk3
    omega
  have hkcases : k = 0 ∨ k = 1 ∨ k = 2 := by omega
  rcases hkcases with hzero | hone | htwo
  · subst k
    simp at hk
    omega
  · subst k
    simp at hk
    omega
  · subst k
    simpa [hk, Nat.mul_comm]

end P010
