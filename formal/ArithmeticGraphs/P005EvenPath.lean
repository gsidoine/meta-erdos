import P005EvenReference

/-!
# P005 — Lift both factor paths and prove the even-order theorem

Each legal row switch in either parity matching factor is a legal
switch in the full coprime permutation. The two paths are concatenated
to reach the canonical adjacent-pair matching on Fin (2m).
-/

namespace P005

theorem lift_even_row_path (m : ℕ)
    (g : Equiv.Perm (Fin m))
    (hg : Valid (OddEvenRel m) g)
    {f f' : Equiv.Perm (Fin m)} {k : ℕ}
    (hp : HubPathLen (EvenOddRel m) f f' k) :
    HubPathLen (CoprimeRel (2*m))
      (combineFactors m f g) (combineFactors m f' g) k := by
  induction hp with
  | refl σ =>
      exact HubPathLen.refl _
  | @step σ i j τ k hv hrest ih =>
      have heq :=
        combineFactors_switch_first m σ g i j
      have hw : Valid (CoprimeRel (2*m))
          (RowSwap (combineFactors m σ g) (oddIndex m i) (oddIndex m j)) := by
        rw [heq]
        exact combineFactors_valid m (RowSwap σ i j) g hv hg
      have ht : HubPathLen (CoprimeRel (2*m))
          (RowSwap (combineFactors m σ g) (oddIndex m i) (oddIndex m j))
          (combineFactors m τ g) k := by
        simpa only [heq] using ih
      exact HubPathLen.step (combineFactors m σ g)
        (oddIndex m i) (oddIndex m j) hw ht

theorem lift_odd_row_path (m : ℕ)
    (f : Equiv.Perm (Fin m))
    (hf : Valid (EvenOddRel m) f)
    {g g' : Equiv.Perm (Fin m)} {k : ℕ}
    (hp : HubPathLen (OddEvenRel m) g g' k) :
    HubPathLen (CoprimeRel (2*m))
      (combineFactors m f g) (combineFactors m f g') k := by
  induction hp with
  | refl σ =>
      exact HubPathLen.refl _
  | @step σ i j τ k hv hrest ih =>
      have heq :=
        combineFactors_switch_second m f σ i j
      have hw : Valid (CoprimeRel (2*m))
          (RowSwap (combineFactors m f σ) (evenIndex m i) (evenIndex m j)) := by
        rw [heq]
        exact combineFactors_valid m f (RowSwap σ i j) hf hv
      have ht : HubPathLen (CoprimeRel (2*m))
          (RowSwap (combineFactors m f σ) (evenIndex m i) (evenIndex m j))
          (combineFactors m f τ) k := by
        simpa only [heq] using ih
      exact HubPathLen.step (combineFactors m f σ)
        (evenIndex m i) (evenIndex m j) hw ht

/-- Every coprime permutation of even cardinality reaches the
    canonical adjacent matching in a linearly bounded number of
    valid two-position swaps. -/
theorem even_coprime_canonical_path (m : ℕ) (hm : 0 < m)
    (σ : Equiv.Perm (Fin (2*m)))
    (hv : Valid (CoprimeRel (2*m)) σ) :
    ∃ k, HubPathLen (CoprimeRel (2*m)) σ (refPerm (2*m)) k ∧
      2*k ≤ 3*((2*m)-1) := by
  let f := evenRowFactor m σ hv
  let g := oddRowFactor m σ hv
  have hf : Valid (EvenOddRel m) f := evenRowFactor_valid m σ hv
  have hg : Valid (OddEvenRel m) g := oddRowFactor_valid m σ hv
  obtain ⟨kf,hpf,hbf⟩ := even_odd_hub_length m hm f hf
  obtain ⟨kg,hpg,hbg⟩ := odd_even_hub_length m hm g hg
  have hId : Valid (EvenOddRel m) (1 : Equiv.Perm (Fin m)) := by
    intro i
    have hc : Nat.Coprime (2*i.val+1) ((2*i.val+1)+1) :=
      (Nat.coprime_self_add_right).2
        (by simp : Nat.Coprime (2*i.val+1) 1)
    change Nat.Coprime (2*i.val+2) (2*i.val+1)
    have hsucc : 2*i.val+2 = (2*i.val+1)+1 := by omega
    rw [hsucc]
    exact hc.symm
  have hl := lift_even_row_path m g hg hpf
  have hr := lift_odd_row_path m (1 : Equiv.Perm (Fin m)) hId hpg
  have hwhole := hubPathLen_trans (CoprimeRel (2*m)) hl hr
  have hstart : combineFactors m f g = σ :=
    combineFactors_extracted m σ hv
  have hend : combineFactors m (1 : Equiv.Perm (Fin m))
      (1 : Equiv.Perm (Fin m)) = refPerm (2*m) :=
    combineFactors_reference m
  refine ⟨kf+kg, ?_, ?_⟩
  · simpa only [hstart, hend] using hwhole
  · omega

#print axioms even_coprime_canonical_path

end P005
