import P005EvenPath

/-!
# P005 — Complete all-order coprime switch theorem

For every n≥1, all coprime permutations of [n] lie in the
same valid-switch component, and their switch distance is at most
3(n−1).

This is the final target theorem: quantitative paths in both
arithmetic parities plus symmetry and concatenation.
-/

namespace P005

variable {α : Type*} [Fintype α] [DecidableEq α]

theorem rowSwap_involutive (σ : Equiv.Perm α) (i j : α) :
    RowSwap (RowSwap σ i j) i j = σ := by
  ext x
  simp [RowSwap]

/-- Every valid switch sequence can be reversed without changing
its length; validity of the initial matching is essential. -/
theorem hubPathLen_reverse (G : α → α → Prop)
    {σ τ : Equiv.Perm α} {k : ℕ}
    (hp : HubPathLen G σ τ k)
    (hvalid : Valid G σ) :
    HubPathLen G τ σ k := by
  revert hvalid
  induction hp with
  | refl σ =>
      intro _
      exact HubPathLen.refl σ
  | @step σ i j τ k hv hrest ih =>
      intro hσ
      have hbackValid :
          Valid G (RowSwap (RowSwap σ i j) i j) := by
        simpa only [rowSwap_involutive] using hσ
      have hback : HubPathLen G (RowSwap σ i j) σ 1 := by
        have href : HubPathLen G
            (RowSwap (RowSwap σ i j) i j) σ 0 := by
          simpa only [rowSwap_involutive] using
            (HubPathLen.refl σ)
        exact HubPathLen.step (RowSwap σ i j) i j hbackValid href
      have htail := ih hv
      have hjoin := hubPathLen_trans G htail hback
      simpa [Nat.add_comm] using hjoin

/-- Every coprime permutation has a canonical sorting path,
uniformly for even and odd cardinalities. -/
theorem all_coprime_canonical_path (n : ℕ)
    (hn : 0 < n)
    (σ : Equiv.Perm (Fin n))
    (hvalid : Valid (CoprimeRel n) σ) :
    ∃ k, HubPathLen (CoprimeRel n) σ (refPerm n) k ∧
      2*k ≤ 3*(n-1) := by
  by_cases hodd : n % 2 = 1
  · exact odd_coprime_canonical_path n hodd hn σ hvalid
  · have heven : n % 2 = 0 := by omega
    obtain ⟨m, rfl⟩ : ∃ m : ℕ, n = 2*m :=
      ⟨n/2, by omega⟩
    have hm : 0 < m := by omega
    exact even_coprime_canonical_path m hm σ hvalid

/-- The complete P005 conclusion. Valid coprime permutations on
the same interval admit a legal switch path with length at most
three times the number of nontrivial positions. -/
theorem coprime_switch_diameter (n : ℕ)
    (hn : 0 < n)
    (σ τ : Equiv.Perm (Fin n))
    (hσ : Valid (CoprimeRel n) σ)
    (hτ : Valid (CoprimeRel n) τ) :
    ∃ k, HubPathLen (CoprimeRel n) σ τ k ∧
      k ≤ 3*(n-1) := by
  obtain ⟨k,hpath,hbound⟩ :=
    all_coprime_canonical_path n hn σ hσ
  obtain ⟨l,hother,hotherbound⟩ :=
    all_coprime_canonical_path n hn τ hτ
  have hr := hubPathLen_reverse (CoprimeRel n) hother hτ
  have htotal := hubPathLen_trans (CoprimeRel n) hpath hr
  exact ⟨k+l,htotal,by omega⟩

#print axioms all_coprime_canonical_path
#print axioms coprime_switch_diameter

end P005
