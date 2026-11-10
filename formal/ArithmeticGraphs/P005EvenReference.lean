import P005FactorSwap

/-!
# P005 — The adjacent matching agrees with both identity factors

The global canonical adjacent-pair matching on [2m] is exactly
the combination of the identity even-to-odd and odd-to-even factors.
-/

namespace P005

theorem refPerm_evenIndex (m : ℕ) (i : Fin m) :
    refPerm (2*m) (evenIndex m i) = oddIndex m i := by
  apply Fin.ext
  have hn : (2*m)%2 ≠ 1 := by omega
  have hp : (2*i.val)%2 = 0 := by omega
  change refNat (2*m) (2*i.val) = 2*i.val+1
  simp [refNat, hn, hp]

theorem refPerm_oddIndex (m : ℕ) (i : Fin m) :
    refPerm (2*m) (oddIndex m i) = evenIndex m i := by
  apply Fin.ext
  have hn : (2*m)%2 ≠ 1 := by omega
  have hp : (2*i.val+1)%2 = 1 := by omega
  change refNat (2*m) (2*i.val+1) = 2*i.val
  simp [refNat, hn, hp]
  omega

theorem combineFactors_reference (m : ℕ) :
    combineFactors m 1 1 = refPerm (2*m) := by
  apply Equiv.ext
  intro x
  obtain ⟨s,hs⟩ := (parityEquiv m).surjective x
  subst x
  cases s with
  | inl i =>
      rw [parityEquiv_inl, combineFactors_evenIndex, refPerm_evenIndex]
      rfl
  | inr i =>
      rw [parityEquiv_inr, combineFactors_oddIndex, refPerm_oddIndex]
      rfl

#print axioms combineFactors_reference

end P005
