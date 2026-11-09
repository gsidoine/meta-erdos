import P005Reach

/-!
# P005 — Generic universal-hub matching connectivity

This theorem formalizes the termination argument for a balanced
bipartite matching graph after transporting a reference matching
to the identity. It assumes a universal row and column at h and
that all diagonal matching edges are present.

It does not by itself formalize the coprime-specific parity reduction
or the explicit diameter bound for the original P005 statement.
-/

namespace P005

variable {α : Type*} [Fintype α] [DecidableEq α]

/-- A sequence of legal value swaps, where each successor satisfies
    the bipartite edge constraints. -/
inductive HubPath (G : α → α → Prop) :
    Equiv.Perm α → Equiv.Perm α → Prop where
  | refl (σ : Equiv.Perm α) : HubPath G σ σ
  | step (σ : Equiv.Perm α) (i j : α) {τ : Equiv.Perm α}
      (hvalid : Valid G (RowSwap σ i j))
      (hrest : HubPath G (RowSwap σ i j) τ) : HubPath G σ τ

/-- The universal-row/column hypotheses give a legal switch path
    from every allowed perfect matching to the identity matching. -/
theorem universal_hub_reaches_identity
    (G : α → α → Prop) (h : α)
    (hrow : ∀ v, G h v)
    (hcol : ∀ i, G i h)
    (hdiag : ∀ i, G i i)
    (σ : Equiv.Perm α) (hvalid : Valid G σ) :
    HubPath G σ 1 := by
  have aux : ∀ k : ℕ, ∀ σ : Equiv.Perm α,
      (WrongRows h σ).card = k → Valid G σ → HubPath G σ 1 := by
    intro k
    induction k using Nat.strong_induction_on with
    | h k ih =>
      intro σ hk hv
      by_cases hempty : WrongRows h σ = ∅
      · have hσ : σ = 1 :=
          eq_identity_of_wrongRows_empty h σ hempty
        subst σ
        exact HubPath.refl 1
      · by_cases hhub : σ h = h
        · obtain ⟨x, hx⟩ :
              (WrongRows h σ).Nonempty :=
            Finset.nonempty_iff_ne_empty.mpr hempty
          rcases (mem_wrongRows h σ x).1 hx with ⟨hxh, hxx⟩
          let y := σ.symm x
          let z := σ x
          let σ₁ := RowSwap σ h y
          let σ₂ := RowSwap σ₁ h x
          let τ := RowSwap σ₂ h z
          have hmove :=
            hub_three_steps G h hrow hcol hdiag σ hv hhub x hxh hxx
          have hv₁ : Valid G σ₁ := hmove.1
          have hv₂ : Valid G σ₂ := hmove.2.1
          have hvτ : Valid G τ := hmove.2.2.1
          have hprogress :=
            hub_fixed_reduces G h hrow hcol hdiag σ hv hhub x hxh hxx
          have hlt : (WrongRows h τ).card < k := by
            calc
              (WrongRows h τ).card <
                  (WrongRows h σ).card :=
                Finset.card_lt_card hprogress.2
              _ = k := hk
          have hrest : HubPath G τ 1 :=
            ih _ hlt τ rfl hvτ
          exact HubPath.step σ h y hv₁
            (HubPath.step σ₁ h x hv₂
              (HubPath.step σ₂ h z hvτ hrest))
        · let τ := RowSwap σ h (σ h)
          have hprogress := hub_wrong_reduces G h hrow hdiag σ hv hhub
          have hvτ : Valid G τ := hprogress.1
          have hlt : (WrongRows h τ).card < k := by
            calc
              (WrongRows h τ).card <
                  (WrongRows h σ).card :=
                Finset.card_lt_card hprogress.2
              _ = k := hk
          have hrest : HubPath G τ 1 :=
            ih _ hlt τ rfl hvτ
          exact HubPath.step σ h (σ h) hvτ hrest
  exact aux _ σ rfl hvalid

#print axioms universal_hub_reaches_identity

end P005
