import P005FactorCombine

/-!
# P005 — Lift factor switches to switches of the full permutation

A switch of the even-positive row factor is exactly a switch of
the corresponding odd zero-based positions in the global matching.
Likewise for the opposite factor. This is a purely finite
permutation statement, independent of primality.
-/

namespace P005

theorem oddIndex_injective (m : ℕ) :
    Function.Injective (oddIndex m) := by
  intro i j heq
  apply Fin.ext
  have hv := congrArg Fin.val heq
  dsimp [oddIndex] at hv
  omega

theorem evenIndex_injective (m : ℕ) :
    Function.Injective (evenIndex m) := by
  intro i j heq
  apply Fin.ext
  have hv := congrArg Fin.val heq
  dsimp [evenIndex] at hv
  omega

theorem parity_index_disjoint (m : ℕ) (i j : Fin m) :
    evenIndex m i ≠ oddIndex m j := by
  intro heq
  have hv := congrArg Fin.val heq
  dsimp [evenIndex, oddIndex] at hv
  omega

theorem combineFactors_switch_first (m : ℕ)
    (f g : Equiv.Perm (Fin m)) (i j : Fin m) :
    RowSwap (combineFactors m f g) (oddIndex m i) (oddIndex m j) =
      combineFactors m (RowSwap f i j) g := by
  apply Equiv.ext
  intro x
  obtain ⟨s,hs⟩ := (parityEquiv m).surjective x
  subst x
  cases s with
  | inl k =>
      rw [parityEquiv_inl]
      have hi : evenIndex m k ≠ oddIndex m i :=
        parity_index_disjoint m k i
      have hj : evenIndex m k ≠ oddIndex m j :=
        parity_index_disjoint m k j
      calc
        RowSwap (combineFactors m f g) (oddIndex m i) (oddIndex m j)
            (evenIndex m k) =
            combineFactors m f g (evenIndex m k) :=
          rowSwap_other _ _ _ _ hi hj
        _ = oddIndex m (g k) := combineFactors_evenIndex m f g k
        _ = combineFactors m (RowSwap f i j) g (evenIndex m k) :=
          (combineFactors_evenIndex m (RowSwap f i j) g k).symm
  | inr k =>
      rw [parityEquiv_inr]
      by_cases hki : k = i
      · subst k
        calc
          RowSwap (combineFactors m f g) (oddIndex m i) (oddIndex m j)
              (oddIndex m i) =
              combineFactors m f g (oddIndex m j) := rowSwap_left _ _ _
          _ = evenIndex m (f j) := combineFactors_oddIndex m f g j
          _ = evenIndex m ((RowSwap f i j) i) := by rw [rowSwap_left]
          _ = combineFactors m (RowSwap f i j) g (oddIndex m i) :=
            (combineFactors_oddIndex m (RowSwap f i j) g i).symm
      · by_cases hkj : k = j
        · subst k
          calc
            RowSwap (combineFactors m f g) (oddIndex m i) (oddIndex m j)
                (oddIndex m j) =
                combineFactors m f g (oddIndex m i) := rowSwap_right _ _ _
            _ = evenIndex m (f i) := combineFactors_oddIndex m f g i
            _ = evenIndex m ((RowSwap f i j) j) := by rw [rowSwap_right]
            _ = combineFactors m (RowSwap f i j) g (oddIndex m j) :=
              (combineFactors_oddIndex m (RowSwap f i j) g j).symm
        · have hi : oddIndex m k ≠ oddIndex m i := by
            intro heq
            exact hki ((oddIndex_injective m) heq)
          have hj : oddIndex m k ≠ oddIndex m j := by
            intro heq
            exact hkj ((oddIndex_injective m) heq)
          calc
            RowSwap (combineFactors m f g) (oddIndex m i) (oddIndex m j)
                (oddIndex m k) =
                combineFactors m f g (oddIndex m k) :=
              rowSwap_other _ _ _ _ hi hj
            _ = evenIndex m (f k) := combineFactors_oddIndex m f g k
            _ = evenIndex m ((RowSwap f i j) k) := by
              rw [rowSwap_other f i j k hki hkj]
            _ = combineFactors m (RowSwap f i j) g (oddIndex m k) :=
              (combineFactors_oddIndex m (RowSwap f i j) g k).symm

theorem combineFactors_switch_second (m : ℕ)
    (f g : Equiv.Perm (Fin m)) (i j : Fin m) :
    RowSwap (combineFactors m f g) (evenIndex m i) (evenIndex m j) =
      combineFactors m f (RowSwap g i j) := by
  apply Equiv.ext
  intro x
  obtain ⟨s,hs⟩ := (parityEquiv m).surjective x
  subst x
  cases s with
  | inr k =>
      rw [parityEquiv_inr]
      have hi : oddIndex m k ≠ evenIndex m i := by
        exact (parity_index_disjoint m i k).symm
      have hj : oddIndex m k ≠ evenIndex m j := by
        exact (parity_index_disjoint m j k).symm
      calc
        RowSwap (combineFactors m f g) (evenIndex m i) (evenIndex m j)
            (oddIndex m k) =
            combineFactors m f g (oddIndex m k) :=
          rowSwap_other _ _ _ _ hi hj
        _ = evenIndex m (f k) := combineFactors_oddIndex m f g k
        _ = combineFactors m f (RowSwap g i j) (oddIndex m k) :=
          (combineFactors_oddIndex m f (RowSwap g i j) k).symm
  | inl k =>
      rw [parityEquiv_inl]
      by_cases hki : k = i
      · subst k
        calc
          RowSwap (combineFactors m f g) (evenIndex m i) (evenIndex m j)
              (evenIndex m i) =
              combineFactors m f g (evenIndex m j) := rowSwap_left _ _ _
          _ = oddIndex m (g j) := combineFactors_evenIndex m f g j
          _ = oddIndex m ((RowSwap g i j) i) := by rw [rowSwap_left]
          _ = combineFactors m f (RowSwap g i j) (evenIndex m i) :=
            (combineFactors_evenIndex m f (RowSwap g i j) i).symm
      · by_cases hkj : k = j
        · subst k
          calc
            RowSwap (combineFactors m f g) (evenIndex m i) (evenIndex m j)
                (evenIndex m j) =
                combineFactors m f g (evenIndex m i) := rowSwap_right _ _ _
            _ = oddIndex m (g i) := combineFactors_evenIndex m f g i
            _ = oddIndex m ((RowSwap g i j) j) := by rw [rowSwap_right]
            _ = combineFactors m f (RowSwap g i j) (evenIndex m j) :=
              (combineFactors_evenIndex m f (RowSwap g i j) j).symm
        · have hi : evenIndex m k ≠ evenIndex m i := by
            intro heq
            exact hki ((evenIndex_injective m) heq)
          have hj : evenIndex m k ≠ evenIndex m j := by
            intro heq
            exact hkj ((evenIndex_injective m) heq)
          calc
            RowSwap (combineFactors m f g) (evenIndex m i) (evenIndex m j)
                (evenIndex m k) =
                combineFactors m f g (evenIndex m k) :=
              rowSwap_other _ _ _ _ hi hj
            _ = oddIndex m (g k) := combineFactors_evenIndex m f g k
            _ = oddIndex m ((RowSwap g i j) k) := by
              rw [rowSwap_other g i j k hki hkj]
            _ = combineFactors m f (RowSwap g i j) (evenIndex m k) :=
              (combineFactors_evenIndex m f (RowSwap g i j) k).symm

#print axioms combineFactors_switch_first
#print axioms combineFactors_switch_second

end P005
