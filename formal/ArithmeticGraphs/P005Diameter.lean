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


/-- A path of an explicitly specified number of admissible switches. -/
inductive HubPathLen (G : α → α → Prop) :
    Equiv.Perm α → Equiv.Perm α → ℕ → Prop where
  | refl (σ : Equiv.Perm α) : HubPathLen G σ σ 0
  | step (σ : Equiv.Perm α) (i j : α)
      {τ : Equiv.Perm α} {k : ℕ}
      (hvalid : Valid G (RowSwap σ i j))
      (hrest : HubPathLen G (RowSwap σ i j) τ k) :
      HubPathLen G σ τ (k+1)

theorem hubPathLen_trans (G : α → α → Prop)
    {σ τ υ : Equiv.Perm α} {k l : ℕ}
    (h₁ : HubPathLen G σ τ k)
    (h₂ : HubPathLen G τ υ l) :
    HubPathLen G σ υ (k+l) := by
  induction h₁ with
  | refl w =>
      simpa using h₂
  | @step w i j v t hv htail ih =>
      simpa [Nat.succ_add] using
        (HubPathLen.step w i j hv (ih h₂))

/-- Universal hub: a matching can be sorted by a switch path
    whose length L satisfies 2L ≤ 3 times the initial defect count. -/
theorem universal_hub_length
    (G : α → α → Prop) (h : α)
    (hrow : ∀ v, G h v)
    (hcol : ∀ i, G i h)
    (hdiag : ∀ i, G i i)
    (σ : Equiv.Perm α) (hvalid : Valid G σ) :
    ∃ k, HubPathLen G σ 1 k ∧
      2*k ≤ 3*(WrongRows h σ).card := by
  have aux : ∀ d : ℕ, ∀ σ : Equiv.Perm α,
      (WrongRows h σ).card = d → Valid G σ →
      ∃ k, HubPathLen G σ 1 k ∧ 2*k ≤ 3*d := by
    intro d
    induction d using Nat.strong_induction_on with
    | h d ih =>
      intro σ hd hv
      by_cases hempty : WrongRows h σ = ∅
      · have heq : σ = 1 :=
          eq_identity_of_wrongRows_empty h σ hempty
        subst σ
        refine ⟨0, HubPathLen.refl 1, ?_⟩
        omega
      · by_cases hh : σ h = h
        · obtain ⟨x,hx⟩ : (WrongRows h σ).Nonempty :=
            Finset.nonempty_iff_ne_empty.mpr hempty
          rcases (mem_wrongRows h σ x).1 hx with ⟨hxh,hxx⟩
          let y := σ.symm x
          let z := σ x
          let σ₁ := RowSwap σ h y
          let σ₂ := RowSwap σ₁ h x
          let τ := RowSwap σ₂ h z
          have hmove :=
            hub_three_steps G h hrow hcol hdiag σ hv hh x hxh hxx
          have hv₁ : Valid G σ₁ := hmove.1
          have hv₂ : Valid G σ₂ := hmove.2.1
          have hvτ : Valid G τ := hmove.2.2.1
          have hcount :=
            (hub_fixed_reduces_two G h hrow hcol hdiag σ hv hh x hxh hxx).2
          have hlt : (WrongRows h τ).card < d := by
            omega
          obtain ⟨k,hpath,hbudget⟩ :=
            ih _ hlt τ rfl hvτ
          have h₃ : HubPathLen G σ₂ τ 1 :=
            HubPathLen.step σ₂ h z hvτ (HubPathLen.refl τ)
          have h₂ : HubPathLen G σ₁ τ 2 :=
            HubPathLen.step σ₁ h x hv₂ h₃
          have h₁ : HubPathLen G σ τ 3 :=
            HubPathLen.step σ h y hv₁ h₂
          refine ⟨k+3, ?_, ?_⟩
          · simpa [Nat.add_comm] using
              hubPathLen_trans G h₁ hpath
          · omega
        · let τ := RowSwap σ h (σ h)
          have hmove := hub_wrong_reduces G h hrow hdiag σ hv hh
          have hvτ : Valid G τ := hmove.1
          have hlt : (WrongRows h τ).card < d := by
            have hlt' := Finset.card_lt_card hmove.2
            omega
          obtain ⟨k,hpath,hbudget⟩ :=
            ih _ hlt τ rfl hvτ
          refine ⟨k+1, ?_, ?_⟩
          · exact HubPathLen.step σ h (σ h) hvτ hpath
          · omega
  simpa using aux _ σ rfl hvalid

#print axioms hubPathLen_trans
#print axioms universal_hub_length

end P005
