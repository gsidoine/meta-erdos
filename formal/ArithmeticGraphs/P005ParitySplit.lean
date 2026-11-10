import P005EvenFactors
import P005Odd

/-!
# P005 — Explicit parity identification of Fin (2m)

The even and odd zero-based indices of Fin (2m) are identified
with two copies of Fin m by a bijection. This is the type-level
bridge needed to transport the two arithmetic matching factors
into a statement about permutations of the original interval.
-/

namespace P005

/-- Even zero-based indices, corresponding to odd positive integers. -/
def evenIndex (m : ℕ) (i : Fin m) : Fin (2*m) :=
  ⟨2*i.val, by omega⟩

/-- Odd zero-based indices, corresponding to even positive integers. -/
def oddIndex (m : ℕ) (i : Fin m) : Fin (2*m) :=
  ⟨2*i.val+1, by omega⟩

/-- Put the two parity classes into their original interval. -/
def parityMap (m : ℕ) : Sum (Fin m) (Fin m) → Fin (2*m)
  | .inl i => evenIndex m i
  | .inr j => oddIndex m j

theorem parityMap_injective (m : ℕ) :
    Function.Injective (parityMap m) := by
  intro a b h
  cases a with
  | inl i =>
      cases b with
      | inl j =>
          have hv := congrArg Fin.val h
          have hij : i = j := by
            apply Fin.ext
            dsimp [parityMap, evenIndex] at hv
            omega
          exact congrArg Sum.inl hij
      | inr j =>
          have hv := congrArg Fin.val h
          dsimp [parityMap, evenIndex, oddIndex] at hv
          omega
  | inr i =>
      cases b with
      | inl j =>
          have hv := congrArg Fin.val h
          dsimp [parityMap, evenIndex, oddIndex] at hv
          omega
      | inr j =>
          have hv := congrArg Fin.val h
          have hij : i = j := by
            apply Fin.ext
            dsimp [parityMap, oddIndex] at hv
            omega
          exact congrArg Sum.inr hij

theorem parityMap_surjective (m : ℕ) :
    Function.Surjective (parityMap m) := by
  intro i
  by_cases hp : i.val % 2 = 0
  · have hbound : i.val / 2 < m := by omega
    refine ⟨Sum.inl ⟨i.val/2, hbound⟩, ?_⟩
    apply Fin.ext
    dsimp [parityMap, evenIndex]
    omega
  · have hbound : i.val / 2 < m := by omega
    refine ⟨Sum.inr ⟨i.val/2, hbound⟩, ?_⟩
    apply Fin.ext
    dsimp [parityMap, oddIndex]
    omega

/-- The parity decomposition of any interval of even cardinality. -/
def parityEquiv (m : ℕ) : Sum (Fin m) (Fin m) ≃ Fin (2*m) :=
  Equiv.ofBijective (parityMap m)
    ⟨parityMap_injective m, parityMap_surjective m⟩

@[simp]
theorem parityEquiv_inl (m : ℕ) (i : Fin m) :
    parityEquiv m (.inl i) = evenIndex m i := rfl

@[simp]
theorem parityEquiv_inr (m : ℕ) (i : Fin m) :
    parityEquiv m (.inr i) = oddIndex m i := rfl

#print axioms parityMap_injective
#print axioms parityMap_surjective
#print axioms parityEquiv

end P005
