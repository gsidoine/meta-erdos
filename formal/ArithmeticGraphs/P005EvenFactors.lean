import P005Transport
import P005Reference

/-!
# P005 — The two even-order coprime matching factors

For n=2m, the even rows of an admissible coprime permutation
match to odd values, and conversely. The two factor graphs are
between numbers 2,4,...,2m and 1,3,...,2m-1.

Each factor admits an identity reference matching and a universal
row/column, so the quantitative P005 hub theorem applies.

This file certifies each factor separately. Reassembling arbitrary
permutations of [2m] from the two factors is a separate obligation.
-/

namespace P005

def EvenOddRel (m : ℕ) (i j : Fin m) : Prop :=
  Nat.Coprime (2*i.val+2) (2*j.val+1)

def OddEvenRel (m : ℕ) (i j : Fin m) : Prop :=
  Nat.Coprime (2*i.val+1) (2*j.val+2)

private theorem odd_coprime_two_left (i : ℕ) :
    Nat.Coprime 2 (2*i+1) := by
  apply (Nat.coprime_two_left).2
  exact ⟨i, by omega⟩

private theorem odd_coprime_two_right (i : ℕ) :
    Nat.Coprime (2*i+1) 2 := by
  apply (Nat.coprime_two_right).2
  exact ⟨i, by omega⟩

private theorem consecutive_coprime (i : ℕ) :
    Nat.Coprime i (i+1) := by
  simpa using (Nat.coprime_self_add_right).2
    (by simp : Nat.Coprime i 1)

theorem even_odd_hub_length (m : ℕ) (hm : 0 < m)
    (σ : Equiv.Perm (Fin m))
    (hv : Valid (EvenOddRel m) σ) :
    ∃ k, HubPathLen (EvenOddRel m) σ 1 k ∧
      2*k ≤ 3*(m-1) := by
  let h : Fin m := ⟨0,hm⟩
  have hr : ∀ v : Fin m, EvenOddRel m h v := by
    intro v
    simpa [EvenOddRel,h] using odd_coprime_two_left v.val
  have hc : ∀ i : Fin m, EvenOddRel m i h := by
    intro i
    simp [EvenOddRel,h]
  have hd : ∀ i : Fin m, EvenOddRel m i i := by
    intro i
    dsimp [EvenOddRel]
    have hh := consecutive_coprime (2*i.val+1)
    convert hh.symm using 1 <;> omega
  obtain ⟨k,hpath,hbudget⟩ :=
    universal_hub_length (EvenOddRel m) h hr hc hd σ hv
  have hsubset :
      WrongRows h σ ⊆ Finset.univ.erase h := by
    intro x hx
    have hx' := ((mem_wrongRows h σ x).mp hx).1
    simp only [Finset.mem_erase, Finset.mem_univ, and_true]
    exact hx'
  have hcard : (WrongRows h σ).card ≤ m-1 := by
    calc
      _ ≤ (Finset.univ.erase h).card := Finset.card_le_card hsubset
      _ = m-1 := by simp
  exact ⟨k,hpath,by omega⟩

theorem odd_even_hub_length (m : ℕ) (hm : 0 < m)
    (σ : Equiv.Perm (Fin m))
    (hv : Valid (OddEvenRel m) σ) :
    ∃ k, HubPathLen (OddEvenRel m) σ 1 k ∧
      2*k ≤ 3*(m-1) := by
  let h : Fin m := ⟨0,hm⟩
  have hr : ∀ v : Fin m, OddEvenRel m h v := by
    intro v
    simp [OddEvenRel,h]
  have hc : ∀ i : Fin m, OddEvenRel m i h := by
    intro i
    simpa [OddEvenRel,h] using odd_coprime_two_right i.val
  have hd : ∀ i : Fin m, OddEvenRel m i i := by
    intro i
    dsimp [OddEvenRel]
    have hh := consecutive_coprime (2*i.val+1)
    convert hh using 1 <;> omega
  obtain ⟨k,hpath,hbudget⟩ :=
    universal_hub_length (OddEvenRel m) h hr hc hd σ hv
  have hsubset :
      WrongRows h σ ⊆ Finset.univ.erase h := by
    intro x hx
    have hx' := ((mem_wrongRows h σ x).mp hx).1
    simp only [Finset.mem_erase, Finset.mem_univ, and_true]
    exact hx'
  have hcard : (WrongRows h σ).card ≤ m-1 := by
    calc
      _ ≤ (Finset.univ.erase h).card := Finset.card_le_card hsubset
      _ = m-1 := by simp
  exact ⟨k,hpath,by omega⟩

#print axioms even_odd_hub_length
#print axioms odd_even_hub_length

end P005
