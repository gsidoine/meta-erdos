import P005Diameter

/-!
# P005 — Reference-matching transport

The generic universal-hub matching theorem is stated relative
to an identity reference matching. These lemmas transport
switch paths through an arbitrary reference permutation.
-/

namespace P005

variable {α : Type*} [Fintype α] [DecidableEq α]

theorem rowSwap_trans (σ N : Equiv.Perm α) (i j : α) :
    RowSwap (σ.trans N) i j = (RowSwap σ i j).trans N := by
  ext x
  rfl

/-- Postcomposition with a reference matching preserves the switch
    sequence, its length, and the allowed-edge conditions. -/
theorem hubPathLen_postcompose
    (G : α → α → Prop) (N : Equiv.Perm α)
    {σ τ : Equiv.Perm α} {k : ℕ}
    (hp : HubPathLen (fun i j => G i (N j)) σ τ k) :
    HubPathLen G (σ.trans N) (τ.trans N) k := by
  induction hp with
  | refl σ =>
      exact HubPathLen.refl _
  | @step σ i j τ k hvalid hrest ih =>
      have hv : Valid G (RowSwap (σ.trans N) i j) := by
        intro x
        change G x (N ((RowSwap σ i j) x))
        exact hvalid x
      have hs : HubPathLen G
          (RowSwap (σ.trans N) i j) (τ.trans N) k := by
        simpa only [rowSwap_trans] using ih
      exact HubPathLen.step (σ.trans N) i j hv hs

/-- An allowed matching becomes an allowed permutation after the
    target's columns are relabeled by the reference matching. -/
theorem valid_relative
    (G : α → α → Prop) (N σ : Equiv.Perm α)
    (hv : Valid G σ) :
    Valid (fun i j => G i (N j)) (σ.trans N.symm) := by
  intro i
  change G i (N (N.symm (σ i)))
  simpa using hv i

/-- The reference matching is connected to every valid matching
    whenever the transported graph has a universal hub. -/
theorem universal_reference_length
    (G : α → α → Prop) (N : Equiv.Perm α) (h : α)
    (hrow : ∀ v, G h (N v))
    (hcol : ∀ i, G i (N h))
    (hdiag : ∀ i, G i (N i))
    (σ : Equiv.Perm α) (hvalid : Valid G σ) :
    ∃ k, HubPathLen G σ N k ∧
        2*k ≤ 3*(WrongRows h (σ.trans N.symm)).card := by
  have hv : Valid (fun i j => G i (N j)) (σ.trans N.symm) :=
    valid_relative G N σ hvalid
  obtain ⟨k,hpath,hbound⟩ :=
    universal_hub_length
      (fun i j => G i (N j)) h hrow hcol hdiag
      (σ.trans N.symm) hv
  refine ⟨k, ?_, hbound⟩
  have htrans := hubPathLen_postcompose G N hpath
  convert htrans using 1
  · ext x
    simp [Equiv.trans_apply]
  · ext x
    simp [Equiv.trans_apply]

#print axioms hubPathLen_postcompose
#print axioms universal_reference_length

end P005
