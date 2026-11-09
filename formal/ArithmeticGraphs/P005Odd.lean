import P005Reference
import P005Transport

/-!
# P005 — Odd-order arithmetic specialization

The canonical adjacent matching fixes 1 in odd order. Consequently
the transformed coprimality graph has a universal hub at index zero.

This formalizes a path from every odd-order coprime permutation to
its canonical reference, with a quantitative switch bound.
-/

namespace P005

def CoprimeRel (n : ℕ) (i j : Fin n) : Prop :=
  Nat.Coprime (i.val+1) (j.val+1)

theorem odd_coprime_canonical_path (n : ℕ)
    (hn : n % 2 = 1) (hpos : 0 < n)
    (σ : Equiv.Perm (Fin n))
    (hvalid : Valid (CoprimeRel n) σ) :
    ∃ k, HubPathLen (CoprimeRel n) σ (refPerm n) k ∧
      2*k ≤ 3*(n-1) := by
  let hub : Fin n := ⟨0,hpos⟩
  have hh : refPerm n hub = hub := refPerm_odd_zero n hn hpos
  have hrow : ∀ v : Fin n, CoprimeRel n hub (refPerm n v) := by
    intro v
    simp [CoprimeRel, hub]
  have hcol : ∀ i : Fin n, CoprimeRel n i (refPerm n hub) := by
    intro i
    simp [CoprimeRel, hh, hub]
  have hdiag : ∀ i : Fin n, CoprimeRel n i (refPerm n i) :=
    refPerm_coprime n
  obtain ⟨k,hpath,hbudget⟩ :=
    universal_reference_length (CoprimeRel n) (refPerm n) hub
      hrow hcol hdiag σ hvalid
  have hsubset :
      WrongRows hub (σ.trans (refPerm n).symm) ⊆
        Finset.univ.erase hub := by
    intro x hx
    have hxh :=
      ((mem_wrongRows hub (σ.trans (refPerm n).symm) x).mp hx).1
    simp only [Finset.mem_erase, Finset.mem_univ, and_true]
    exact hxh
  have hcard :
      (WrongRows hub (σ.trans (refPerm n).symm)).card ≤ n-1 := by
    calc
      _ ≤ (Finset.univ.erase hub).card := Finset.card_le_card hsubset
      _ = n-1 := by simp
  refine ⟨k,hpath,?_⟩
  omega

#print axioms odd_coprime_canonical_path

end P005
