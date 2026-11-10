import P005ForcedParity

/-!
# P005 — Reassemble the two parity matching factors

The two bijections f and g describe, respectively, the even-positive
rows and the odd-positive rows of a coprime permutation on [2m].
They combine into a permutation on Fin (2m) through the explicit
parity equivalence. The factorization is exact.
-/

namespace P005

/-- Exchange the two summands while applying a permutation
to each factor. -/
def sumSwapPerm {α β : Type*}
    (f : Equiv.Perm α) (g : Equiv.Perm β) :
    Sum β α ≃ Sum β α where
  toFun
    | .inl i => .inr (f i)
    | .inr j => .inl (g j)
  invFun
    | .inl j => .inr (g.symm j)
    | .inr i => .inl (f.symm i)
  left_inv := by
    intro s
    cases s <;> simp
  right_inv := by
    intro s
    cases s <;> simp

/-- The original permutation reconstructed from its two parity factors. -/
noncomputable def combineFactors (m : ℕ)
    (f g : Equiv.Perm (Fin m)) : Equiv.Perm (Fin (2*m)) :=
  (parityEquiv m).symm |>.trans (sumSwapPerm f g) |>.trans (parityEquiv m)

/-- Even-positive rows carry the first factor. -/
theorem combineFactors_oddIndex (m : ℕ)
    (f g : Equiv.Perm (Fin m)) (i : Fin m) :
    combineFactors m f g (oddIndex m i) =
      evenIndex m (f i) := by
  change (parityEquiv m)
      ((sumSwapPerm f g) ((parityEquiv m).symm (oddIndex m i))) =
      evenIndex m (f i)
  have he : (parityEquiv m).symm (oddIndex m i) =
      Sum.inr i := by
    apply (parityEquiv m).injective
    simpa using ((parityEquiv m).apply_symm_apply (oddIndex m i)).symm
  rw [he]
  rfl

/-- Odd-positive rows carry the second factor. -/
theorem combineFactors_evenIndex (m : ℕ)
    (f g : Equiv.Perm (Fin m)) (i : Fin m) :
    combineFactors m f g (evenIndex m i) =
      oddIndex m (g i) := by
  change (parityEquiv m)
      ((sumSwapPerm f g) ((parityEquiv m).symm (evenIndex m i))) =
      oddIndex m (g i)
  have he : (parityEquiv m).symm (evenIndex m i) =
      Sum.inl i := by
    apply (parityEquiv m).injective
    simpa using ((parityEquiv m).apply_symm_apply (evenIndex m i)).symm
  rw [he]
  rfl

/-- Both factor coprimality constraints imply global coprimality. -/
theorem combineFactors_valid (m : ℕ)
    (f g : Equiv.Perm (Fin m))
    (hf : Valid (EvenOddRel m) f)
    (hg : Valid (OddEvenRel m) g) :
    Valid (CoprimeRel (2*m)) (combineFactors m f g) := by
  intro x
  obtain ⟨s,hs⟩ := (parityEquiv m).surjective x
  subst x
  cases s with
  | inl i =>
      rw [parityEquiv_inl, combineFactors_evenIndex]
      exact hg i
  | inr i =>
      rw [parityEquiv_inr, combineFactors_oddIndex]
      exact hf i

/-- The two extracted factors reassemble the original
coprime permutation exactly. -/
theorem combineFactors_extracted (m : ℕ)
    (σ : Equiv.Perm (Fin (2*m)))
    (hv : Valid (CoprimeRel (2*m)) σ) :
    combineFactors m (evenRowFactor m σ hv) (oddRowFactor m σ hv) =
      σ := by
  apply Equiv.ext
  intro x
  obtain ⟨s,hs⟩ := (parityEquiv m).surjective x
  subst x
  cases s with
  | inl i =>
      rw [parityEquiv_inl, combineFactors_evenIndex]
      apply Fin.ext
      have hp := coprime_evenIndex_image_oddIndex m σ hv i
      dsimp [oddRowFactor, oddRowFactorMap, oddIndex]
      omega
  | inr i =>
      rw [parityEquiv_inr, combineFactors_oddIndex]
      apply Fin.ext
      have hp := coprime_oddIndex_image_evenIndex m σ hv i
      dsimp [evenRowFactor, evenRowFactorMap, evenIndex]
      omega

#print axioms combineFactors_oddIndex
#print axioms combineFactors_evenIndex
#print axioms combineFactors_valid
#print axioms combineFactors_extracted

end P005
