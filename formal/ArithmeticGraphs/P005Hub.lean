import Mathlib

/-!
# P005 — Local universal-hub switch certificates

A reference perfect matching identifies both parts with a common type.
Assume all diagonal edges, all edges from a distinguished row,
and all edges to its distinguished column are present.

These are local transformations only, not a certificate for the
complete P005 connectivity and diameter assertions.
-/

namespace P005

variable {α : Type*} [DecidableEq α]

def Valid (G : α → α → Prop) (σ : Equiv.Perm α) : Prop :=
  ∀ i, G i (σ i)

def RowSwap (σ : Equiv.Perm α) (i j : α) : Equiv.Perm α :=
  (Equiv.swap i j).trans σ

@[simp]
theorem rowSwap_left (σ : Equiv.Perm α) (i j : α) :
    RowSwap σ i j i = σ j := by
  simp [RowSwap]

@[simp]
theorem rowSwap_right (σ : Equiv.Perm α) (i j : α) :
    RowSwap σ i j j = σ i := by
  simp [RowSwap]

theorem rowSwap_other (σ : Equiv.Perm α) (i j z : α)
    (hi : z ≠ i) (hj : z ≠ j) :
    RowSwap σ i j z = σ z := by
  simp [RowSwap, Equiv.swap_apply_of_ne_of_ne hi hj]

theorem valid_rowSwap (G : α → α → Prop) (σ : Equiv.Perm α)
    (i j : α)
    (hvalid : Valid G σ)
    (hi : G i (σ j)) (hj : G j (σ i)) :
    Valid G (RowSwap σ i j) := by
  intro z
  by_cases hzi : z = i
  · subst z
    simpa using hi
  · by_cases hzj : z = j
    · subst z
      simpa using hj
    · rw [rowSwap_other σ i j z hzi hzj]
      exact hvalid z

/-- If the universal row carries an incorrect value, moving this
    value to its own row fixes that row and preserves all constraints. -/
theorem hub_fix_step (G : α → α → Prop) (h : α)
    (hrow : ∀ v, G h v) (hdiag : ∀ x, G x x)
    (σ : Equiv.Perm α) (hvalid : Valid G σ)
    (hwrong : σ h ≠ h) :
    Valid G (RowSwap σ h (σ h)) ∧
      RowSwap σ h (σ h) (σ h) = σ h ∧
      (∀ z, z ≠ h → z ≠ σ h →
        RowSwap σ h (σ h) z = σ z) := by
  refine ⟨?_, ?_, ?_⟩
  · apply valid_rowSwap G σ h (σ h) hvalid
    · exact hrow (σ (σ h))
    · exact hdiag (σ h)
  · exact rowSwap_right σ h (σ h)
  · intro z hz hzy
    exact rowSwap_other σ h (σ h) z hz hzy

theorem hub_fix_step_strict (h : α) (σ : Equiv.Perm α)
    (hwrong : σ h ≠ h) : σ (σ h) ≠ σ h := by
  intro heq
  apply hwrong
  exact σ.injective heq

/-- If the hub is initially fixed and x is not, a three-switch
    transformation fixes two distinct non-hub rows. -/
theorem hub_three_steps (G : α → α → Prop) (h : α)
    (hrow : ∀ v, G h v)
    (hcol : ∀ i, G i h)
    (hdiag : ∀ i, G i i)
    (σ : Equiv.Perm α)
    (hvalid : Valid G σ) (hh : σ h = h)
    (x : α) (hxh : x ≠ h) (hxx : σ x ≠ x) :
    let y := σ.symm x
    let z := σ x
    let σ₁ := RowSwap σ h y
    let σ₂ := RowSwap σ₁ h x
    let σ₃ := RowSwap σ₂ h z
    Valid G σ₁ ∧ Valid G σ₂ ∧ Valid G σ₃ ∧
      σ₃ x = x ∧ σ₃ z = z := by
  dsimp only
  let y := σ.symm x
  let z := σ x
  let σ₁ := RowSwap σ h y
  let σ₂ := RowSwap σ₁ h x
  let σ₃ := RowSwap σ₂ h z
  have hsy : σ y = x := by simp [y]
  have hyh : y ≠ h := by
    intro heq
    have hh' : σ y = σ h := congrArg (fun t => σ t) heq
    rw [hsy, hh] at hh'
    exact hxh hh'
  have hyx : y ≠ x := by
    intro heq
    have hy := hsy
    rw [heq] at hy
    exact hxx hy
  have hzh : z ≠ h := by
    intro heq
    have hσx : σ x = σ h := by
      rw [hh]
      exact heq
    exact hxh (σ.injective hσx)
  have hzx : z ≠ x := hxx
  have hσ₁ : Valid G σ₁ := by
    apply valid_rowSwap G σ h y hvalid
    · exact hrow (σ y)
    · simpa [hh] using hcol y
  have hσ₁h : σ₁ h = x := by
    simpa only [σ₁, rowSwap_left] using hsy
  have hσ₁x : σ₁ x = z := by
    simpa [σ₁, z] using
      (rowSwap_other σ h y x hxh hyx.symm)
  have hσ₂ : Valid G σ₂ := by
    apply valid_rowSwap G σ₁ h x hσ₁
    · exact hrow (σ₁ x)
    · simpa only [hσ₁h] using hdiag x
  have hσ₂h : σ₂ h = z := by
    simpa only [σ₂, rowSwap_left] using hσ₁x
  have hσ₂x : σ₂ x = x := by
    simpa only [σ₂, rowSwap_right] using hσ₁h
  have hσ₃ : Valid G σ₃ := by
    apply valid_rowSwap G σ₂ h z hσ₂
    · exact hrow (σ₂ z)
    · simpa only [hσ₂h] using hdiag z
  have hσ₃x : σ₃ x = x := by
    rw [show σ₃ x = σ₂ x from rowSwap_other σ₂ h z x hxh hzx.symm]
    exact hσ₂x
  have hσ₃z : σ₃ z = z := by
    simpa only [σ₃, rowSwap_right] using hσ₂h
  exact ⟨hσ₁, hσ₂, hσ₃, hσ₃x, hσ₃z⟩

#print axioms hub_fix_step
#print axioms hub_fix_step_strict
#print axioms hub_three_steps

end P005
