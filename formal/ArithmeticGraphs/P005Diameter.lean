import P005Connected

/-!
# P005 — Quantitative universal-hub switch bound

The three-switch hub operation fixes at least two previously
incorrect non-hub rows. This module quantifies that progress.
-/

namespace P005

variable {α : Type*} [Fintype α] [DecidableEq α]

/-- In the three-switch hub transformation, the rows x and σ x
are distinct, initially incorrect, and correct afterward. -/
theorem hub_fixed_reduces_two
    (G : α → α → Prop) (h : α)
    (hrow : ∀ v, G h v)
    (hcol : ∀ i, G i h)
    (hdiag : ∀ i, G i i)
    (σ : Equiv.Perm α) (hvalid : Valid G σ)
    (hh : σ h = h)
    (x : α) (hxh : x ≠ h) (hxx : σ x ≠ x) :
    let y := σ.symm x
    let z := σ x
    let σ₁ := RowSwap σ h y
    let σ₂ := RowSwap σ₁ h x
    let τ := RowSwap σ₂ h z
    Valid G τ ∧
      (WrongRows h τ).card + 2 ≤ (WrongRows h σ).card := by
  dsimp only
  let y := σ.symm x
  let z := σ x
  let σ₁ := RowSwap σ h y
  let σ₂ := RowSwap σ₁ h x
  let τ := RowSwap σ₂ h z
  have hprogress :=
    hub_fixed_reduces G h hrow hcol hdiag σ hvalid hh x hxh hxx
  have hmove :=
    hub_three_steps G h hrow hcol hdiag σ hvalid hh x hxh hxx
  have hτvalid : Valid G τ := hmove.2.2.1
  have hτx : τ x = x := hmove.2.2.2.1
  have hτz : τ z = z := hmove.2.2.2.2
  have hzx : z ≠ x := hxx
  have hzh : z ≠ h := by
    intro heq
    have heq : σ x = σ h := by
      rw [hh]
      exact heq
    exact hxh (σ.injective heq)
  have hzwrong : σ z ≠ z := by
    intro heq
    have hσeq : σ x = σ z := by
      calc
        σ x = z := rfl
        _ = σ z := heq.symm
    exact hzx (σ.injective hσeq).symm
  have hsub : WrongRows h τ ⊆ WrongRows h σ :=
    hprogress.2.subset
  have hxold : x ∈ WrongRows h σ :=
    (mem_wrongRows h σ x).2 ⟨hxh,hxx⟩
  have hzold : z ∈ WrongRows h σ :=
    (mem_wrongRows h σ z).2 ⟨hzh,hzwrong⟩
  have hxnew : x ∉ WrongRows h τ := by
    intro hmem
    exact (mem_wrongRows h τ x).1 hmem |>.2 hτx
  have hznew : z ∉ WrongRows h τ := by
    intro hmem
    exact (mem_wrongRows h τ z).1 hmem |>.2 hτz
  have hins : insert x (insert z (WrongRows h τ)) ⊆ WrongRows h σ := by
    intro w hw
    rcases Finset.mem_insert.mp hw with heq | hw
    · simpa [heq] using hxold
    · rcases Finset.mem_insert.mp hw with heq | hw'
      · simpa [heq] using hzold
      · exact hsub hw'
  have hcount : (insert x (insert z (WrongRows h τ))).card =
      (WrongRows h τ).card + 2 := by
    have hxne : x ∉ insert z (WrongRows h τ) := by
      simp [hxnew,hzx.symm]
    rw [Finset.card_insert_of_notMem hxne, Finset.card_insert_of_notMem hznew]
  refine ⟨hτvalid, ?_⟩
  calc
    (WrongRows h τ).card + 2 =
        (insert x (insert z (WrongRows h τ))).card := hcount.symm
    _ ≤ (WrongRows h σ).card := Finset.card_le_card hins

#print axioms hub_fixed_reduces_two

end P005
