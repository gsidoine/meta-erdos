import Mathlib

/-!
Arithmetic lemmas underlying the modular-3 obstruction for P030.
These results do not yet formalize the maximum-matching bound.
-/

namespace P030

private theorem prime_eq_three_of_mod (n : ℕ)
    (hn : Nat.Prime n) (hmod : n % 3 = 0) : n = 3 := by
  have hdvd : 3 ∣ n := Nat.dvd_of_mod_eq_zero hmod
  exact (hn.dvd_iff_eq (by decide : (3 : ℕ) ≠ 1)).mp hdvd

/-- Every prime-sum-and-difference edge avoiding multiples of 3
    necessarily has difference exactly 3. -/
theorem prime_edge_difference_three (a b : ℕ)
    (ha : 0 < a) (hab : a < b)
    (hsum : Nat.Prime (a + b)) (hdiff : Nat.Prime (b - a))
    (ha3 : a % 3 ≠ 0) (hb3 : b % 3 ≠ 0) : b - a = 3 := by
  have hmod : (a + b) % 3 = 0 ∨ (b - a) % 3 = 0 := by omega
  rcases hmod with hsum0 | hdiff0
  · have hsum3 : a + b = 3 := prime_eq_three_of_mod (a + b) hsum hsum0
    have hd2 : 2 ≤ b - a := hdiff.two_le
    omega
  · exact prime_eq_three_of_mod (b - a) hdiff hdiff0

/-- Each prime-sum-and-difference edge supplies a Goldbach
    representation of twice its larger endpoint. -/
theorem edge_gives_two_primes (a b : ℕ)
    (hab : a ≤ b) (hsum : Nat.Prime (a + b))
    (hdiff : Nat.Prime (b - a)) :
    ∃ u v : ℕ, Nat.Prime u ∧ Nat.Prime v ∧ u + v = 2 * b := by
  refine ⟨b - a, b + a, hdiff, ?_, ?_⟩
  · simpa only [Nat.add_comm] using hsum
  · omega

#print axioms prime_edge_difference_three
#print axioms edge_gives_two_primes

end P030
