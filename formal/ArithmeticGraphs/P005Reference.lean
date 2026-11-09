import P005Diameter

/-!
# P005 — The canonical arithmetic matching on Fin n

The reference involution fixes the first row in odd order and pairs
successive integers elsewhere. In even order it pairs every two
successive integers. Each reference edge is coprime.
-/

namespace P005

/-- Zero-based index of the canonical adjacent matching partner.
    In odd order the first index is fixed. -/
def refNat (n i : ℕ) : ℕ :=
  if n % 2 = 1 then
    if i = 0 then 0
    else if i % 2 = 1 then i + 1
    else i - 1
  else
    if i % 2 = 0 then i + 1
    else i - 1

theorem refNat_lt (n i : ℕ) (hi : i < n) : refNat n i < n := by
  unfold refNat
  split_ifs <;> omega

theorem refNat_involutive (n i : ℕ) (hi : i < n) :
    refNat n (refNat n i) = i := by
  by_cases hn : n % 2 = 1
  · by_cases hz : i = 0
    · simp [refNat, hn, hz]
    · by_cases ho : i % 2 = 1
      · have hp : (i + 1) % 2 = 0 := by omega
        have hnew : refNat n i = i + 1 := by simp [refNat, hn, hz, ho]
        rw [hnew]
        have hnz : i + 1 ≠ 0 := by omega
        simp [refNat, hn, hnz, hp]
      · have he : i % 2 = 0 := by omega
        have himin : 2 ≤ i := by omega
        have hp : (i - 1) % 2 = 1 := by omega
        have hnew : refNat n i = i - 1 := by simp [refNat, hn, hz, he]
        rw [hnew]
        have hnz : i - 1 ≠ 0 := by omega
        simp [refNat, hn, hnz, hp]
        omega
  · have hne : n % 2 = 0 := by omega
    by_cases he : i % 2 = 0
    · have hp : (i + 1) % 2 = 1 := by omega
      have hnew : refNat n i = i + 1 := by simp [refNat, hn, he]
      rw [hnew]
      simp [refNat, hn, hp]
    · have ho : i % 2 = 1 := by omega
      have himin : 1 ≤ i := by omega
      have hp : (i - 1) % 2 = 0 := by omega
      have hnew : refNat n i = i - 1 := by simp [refNat, hn, ho]
      rw [hnew]
      simp [refNat, hn, hp]
      omega

def refIndex (n : ℕ) (i : Fin n) : Fin n :=
  ⟨refNat n i.val, refNat_lt n i.val i.isLt⟩

theorem refIndex_involutive (n : ℕ) (i : Fin n) :
    refIndex n (refIndex n i) = i := by
  apply Fin.ext
  exact refNat_involutive n i.val i.isLt

/-- The canonical coprime permutation of the interval [n]. -/
def refPerm (n : ℕ) : Equiv.Perm (Fin n) where
  toFun := refIndex n
  invFun := refIndex n
  left_inv := refIndex_involutive n
  right_inv := refIndex_involutive n

/-- An adjacent pair of positive integers is coprime. -/
private theorem coprime_succ (a : ℕ) : Nat.Coprime a (a+1) := by
  simpa using (Nat.coprime_self_add_right).2
    (by simp : Nat.Coprime a 1)

theorem refNat_adjacent (n i : ℕ) (hi : i < n) :
    (refNat n i = i) ∨
    (refNat n i = i + 1) ∨
    (i = refNat n i + 1) := by
  unfold refNat
  split_ifs <;> omega

/-- Every edge of the canonical permutation joins consecutive
    integers, except the fixed point 1 in odd order. -/
theorem refPerm_coprime (n : ℕ) (i : Fin n) :
    Nat.Coprime (i.val+1) ((refPerm n i).val+1) := by
  have hs := refNat_adjacent n i.val i.isLt
  change Nat.Coprime (i.val+1) (refNat n i.val+1)
  rcases hs with h | h | h
  · have hfirst : i.val = 0 := by
      unfold refNat at h
      split_ifs at h <;> omega
    simp [h, hfirst]
  · rw [h]
    simpa only [Nat.add_assoc, Nat.reduceAdd] using
      coprime_succ (i.val+1)
  · have heq : i.val+1 = refNat n i.val+2 := by omega
    rw [heq]
    exact (coprime_succ (refNat n i.val+1)).symm

/-- The canonical reference fixes the first positive integer in odd order. -/
theorem refPerm_odd_zero (n : ℕ) (hn : n % 2 = 1)
    (hpos : 0 < n) :
    refPerm n ⟨0,hpos⟩ = ⟨0,hpos⟩ := by
  apply Fin.ext
  simp [refPerm, refIndex, refNat, hn]

#print axioms refNat_involutive
#print axioms refPerm_coprime
#print axioms refPerm_odd_zero

end P005
