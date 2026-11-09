import P005Hub

/-!
# P005 — Finite progress lemmas toward the universal-hub theorem

These assertions concern the set of incorrectly assigned non-hub rows.
They are preparatory lemmas and do not yet formalize full connectedness.
-/

namespace P005

variable {α : Type*} [Fintype α] [DecidableEq α]

/-- Rows other than the hub whose assigned values differ from the target. -/
def WrongRows (h : α) (σ : Equiv.Perm α) : Finset α :=
  Finset.univ.filter (fun x => x ≠ h ∧ σ x ≠ x)

@[simp]
theorem mem_wrongRows (h : α) (σ : Equiv.Perm α) (x : α) :
    x ∈ WrongRows h σ ↔ x ≠ h ∧ σ x ≠ x := by
  simp [WrongRows]

/-- If every non-hub row is correct, injectivity forces the hub row
    to be correct as well. -/
theorem eq_identity_of_wrongRows_empty (h : α) (σ : Equiv.Perm α)
    (hempty : WrongRows h σ = ∅) : σ = 1 := by
  have hfix : σ h = h := by
    by_contra hh
    have hy : σ h ∈ WrongRows h σ :=
      (mem_wrongRows h σ (σ h)).2
        ⟨hh, hub_fix_step_strict h σ hh⟩
    rw [hempty] at hy
    simpa using hy
  apply Equiv.ext
  intro x
  by_cases hx : x = h
  · simpa [hx] using hfix
  · have hxm : x ∉ WrongRows h σ := by simp [hempty]
    have hxx : σ x = x := by
      by_contra hne
      exact hxm ((mem_wrongRows h σ x).2 ⟨hx, hne⟩)
    simpa using hxx

/-- Progress in the hub-wrong case: one admissible switch strictly
    decreases the set of wrong non-hub rows. -/
theorem hub_wrong_reduces
    (G : α → α → Prop) (h : α)
    (hrow : ∀ v, G h v)
    (hdiag : ∀ x, G x x)
    (σ : Equiv.Perm α) (hvalid : Valid G σ)
    (hwrong : σ h ≠ h) :
    let τ := RowSwap σ h (σ h)
    Valid G τ ∧ WrongRows h τ ⊂ WrongRows h σ := by
  dsimp only
  let τ := RowSwap σ h (σ h)
  have hstep := hub_fix_step G h hrow hdiag σ hvalid hwrong
  have hτvalid : Valid G τ := hstep.1
  have hτy : τ (σ h) = σ h := hstep.2.1
  have holdwrong : σ (σ h) ≠ σ h := hub_fix_step_strict h σ hwrong
  have hpreserved : ∀ x, x ≠ h → σ x = x → τ x = x := by
    intro x hxh hx
    by_cases hxy : x = σ h
    · have heq : σ (σ h) = σ h := by simpa [hxy] using hx
      exact (holdwrong heq).elim
    · rw [show τ x = σ x from
        rowSwap_other σ h (σ h) x hxh hxy]
      exact hx
  have hsubset : WrongRows h τ ⊆ WrongRows h σ := by
    intro x hx
    have hx' := (mem_wrongRows h τ x).1 hx
    apply (mem_wrongRows h σ x).2
    refine ⟨hx'.1, ?_⟩
    intro hfix
    exact hx'.2 (hpreserved x hx'.1 hfix)
  have hyold : σ h ∈ WrongRows h σ :=
    (mem_wrongRows h σ (σ h)).2 ⟨hwrong, holdwrong⟩
  have hynew : σ h ∉ WrongRows h τ := by
    intro hmem
    exact (mem_wrongRows h τ (σ h)).1 hmem |>.2 hτy
  refine ⟨hτvalid, ?_⟩
  exact (Finset.ssubset_iff_of_subset hsubset).2
    ⟨σ h, hyold, hynew⟩

/-- Three star swaps leave every other row unchanged. -/
theorem triple_swap_other (σ : Equiv.Perm α)
    (h y x z w : α)
    (hwh : w ≠ h) (hwy : w ≠ y)
    (hwx : w ≠ x) (hwz : w ≠ z) :
    RowSwap (RowSwap (RowSwap σ h y) h x) h z w = σ w := by
  rw [rowSwap_other _ h z w hwh hwz,
      rowSwap_other _ h x w hwh hwx,
      rowSwap_other _ h y w hwh hwy]

#print axioms eq_identity_of_wrongRows_empty
#print axioms hub_wrong_reduces
#print axioms triple_swap_other

end P005
