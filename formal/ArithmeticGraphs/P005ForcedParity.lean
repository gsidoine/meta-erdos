import P005ParitySplit

/-!
# P005 — Parity forced by coprimality in even order

Every even positive integer must be matched to an odd integer.
The induced assignment of the m even rows to the m odd
columns is a bijection. Thus the remaining odd rows must
be matched to even columns.

This is an arithmetic assertion independent of graph-switch
reconfiguration and is the crucial parity-splitting step.
-/

namespace P005

private theorem coprime_even_odd (a b : ℕ)
    (h : Nat.Coprime (2*a+2) (b+1)) : b % 2 = 0 := by
  by_contra hb
  have hbodd : b % 2 = 1 := by omega
  have hdiva : 2 ∣ (2*a+2) := by omega
  have hdivb : 2 ∣ (b+1) := by omega
  have htwo : 2 ∣ Nat.gcd (2*a+2) (b+1) :=
    Nat.dvd_gcd hdiva hdivb
  have hone : Nat.gcd (2*a+2) (b+1) = 1 := h
  rw [hone] at htwo
  omega

theorem coprime_oddIndex_image_evenIndex
    (m : ℕ) (σ : Equiv.Perm (Fin (2*m)))
    (hv : Valid (CoprimeRel (2*m)) σ)
    (i : Fin m) :
    (σ (oddIndex m i)).val % 2 = 0 := by
  have hcop := hv (oddIndex m i)
  change Nat.Coprime (2*i.val+2) ((σ (oddIndex m i)).val+1) at hcop
  exact coprime_even_odd i.val _ hcop

/-- An even positive row assigned an odd positive value, encoded as
the corresponding zero-based half-index. -/
def evenRowFactorMap
    (m : ℕ) (σ : Equiv.Perm (Fin (2*m)))
    (hv : Valid (CoprimeRel (2*m)) σ) :
    Fin m → Fin m :=
  fun i => ⟨(σ (oddIndex m i)).val / 2, by
    have hp := coprime_oddIndex_image_evenIndex m σ hv i
    have ht := (σ (oddIndex m i)).isLt
    omega⟩

theorem evenRowFactorMap_injective
    (m : ℕ) (σ : Equiv.Perm (Fin (2*m)))
    (hv : Valid (CoprimeRel (2*m)) σ) :
    Function.Injective (evenRowFactorMap m σ hv) := by
  intro i j hij
  have hvij := congrArg Fin.val hij
  have hpi := coprime_oddIndex_image_evenIndex m σ hv i
  have hpj := coprime_oddIndex_image_evenIndex m σ hv j
  have hmap : σ (oddIndex m i) = σ (oddIndex m j) := by
    apply Fin.ext
    dsimp [evenRowFactorMap] at hvij
    omega
  have hsource := σ.injective hmap
  apply Fin.ext
  have hindex := congrArg Fin.val hsource
  dsimp [oddIndex] at hindex
  omega

/-- The even-row restriction is automatically onto, since it
is injective between two finite sets with the same cardinality. -/
theorem evenRowFactorMap_surjective
    (m : ℕ) (σ : Equiv.Perm (Fin (2*m)))
    (hv : Valid (CoprimeRel (2*m)) σ) :
    Function.Surjective (evenRowFactorMap m σ hv) :=
  Finite.surjective_of_injective
    (evenRowFactorMap_injective m σ hv)

noncomputable def evenRowFactor
    (m : ℕ) (σ : Equiv.Perm (Fin (2*m)))
    (hv : Valid (CoprimeRel (2*m)) σ) : Equiv.Perm (Fin m) :=
  Equiv.ofBijective (evenRowFactorMap m σ hv)
    ⟨evenRowFactorMap_injective m σ hv,
      evenRowFactorMap_surjective m σ hv⟩

/-- Once all odd output values are occupied by even rows, no
odd row can map to an odd output value. -/
theorem coprime_evenIndex_image_oddIndex
    (m : ℕ) (σ : Equiv.Perm (Fin (2*m)))
    (hv : Valid (CoprimeRel (2*m)) σ)
    (i : Fin m) :
    (σ (evenIndex m i)).val % 2 = 1 := by
  by_contra he
  have hp : (σ (evenIndex m i)).val % 2 = 0 := by omega
  have hbound : (σ (evenIndex m i)).val / 2 < m := by
    have hlt := (σ (evenIndex m i)).isLt
    omega
  let j : Fin m := ⟨(σ (evenIndex m i)).val / 2, hbound⟩
  obtain ⟨k, hk⟩ :=
    evenRowFactorMap_surjective m σ hv j
  have hpk := coprime_oddIndex_image_evenIndex m σ hv k
  have hmap : σ (oddIndex m k) = σ (evenIndex m i) := by
    apply Fin.ext
    have hvmap := congrArg Fin.val hk
    dsimp [evenRowFactorMap, j] at hvmap
    omega
  have hsource := σ.injective hmap
  have hindex := congrArg Fin.val hsource
  dsimp [oddIndex, evenIndex] at hindex
  omega

#print axioms evenRowFactorMap_injective
#print axioms evenRowFactorMap_surjective
#print axioms evenRowFactor
#print axioms coprime_evenIndex_image_oddIndex


/-- The odd positive input positions, now known to map into even
    output integers, induce a second permutation of Fin m. -/
def oddRowFactorMap
    (m : ℕ) (σ : Equiv.Perm (Fin (2*m)))
    (hv : Valid (CoprimeRel (2*m)) σ) :
    Fin m → Fin m :=
  fun i => ⟨(σ (evenIndex m i)).val / 2, by
    have hp := coprime_evenIndex_image_oddIndex m σ hv i
    have ht := (σ (evenIndex m i)).isLt
    omega⟩

theorem oddRowFactorMap_injective
    (m : ℕ) (σ : Equiv.Perm (Fin (2*m)))
    (hv : Valid (CoprimeRel (2*m)) σ) :
    Function.Injective (oddRowFactorMap m σ hv) := by
  intro i j hij
  have hq := congrArg Fin.val hij
  have hpi := coprime_evenIndex_image_oddIndex m σ hv i
  have hpj := coprime_evenIndex_image_oddIndex m σ hv j
  have hmap : σ (evenIndex m i) = σ (evenIndex m j) := by
    apply Fin.ext
    dsimp [oddRowFactorMap] at hq
    omega
  have hsource := σ.injective hmap
  apply Fin.ext
  have heq := congrArg Fin.val hsource
  dsimp [evenIndex] at heq
  omega

theorem oddRowFactorMap_surjective
    (m : ℕ) (σ : Equiv.Perm (Fin (2*m)))
    (hv : Valid (CoprimeRel (2*m)) σ) :
    Function.Surjective (oddRowFactorMap m σ hv) :=
  Finite.surjective_of_injective (oddRowFactorMap_injective m σ hv)

noncomputable def oddRowFactor
    (m : ℕ) (σ : Equiv.Perm (Fin (2*m)))
    (hv : Valid (CoprimeRel (2*m)) σ) : Equiv.Perm (Fin m) :=
  Equiv.ofBijective (oddRowFactorMap m σ hv)
    ⟨oddRowFactorMap_injective m σ hv,
      oddRowFactorMap_surjective m σ hv⟩

/-- The first factor satisfies the even-row/odd-column coprimality relation. -/
theorem evenRowFactor_valid
    (m : ℕ) (σ : Equiv.Perm (Fin (2*m)))
    (hv : Valid (CoprimeRel (2*m)) σ) :
    Valid (EvenOddRel m) (evenRowFactor m σ hv) := by
  intro i
  have hcop := hv (oddIndex m i)
  have hp := coprime_oddIndex_image_evenIndex m σ hv i
  have hval : 2*((σ (oddIndex m i)).val / 2) =
      (σ (oddIndex m i)).val := by omega
  change Nat.Coprime (2*i.val+2) (2*((σ (oddIndex m i)).val/2)+1)
  rw [hval]
  exact hcop

/-- The second factor satisfies the odd-row/even-column relation. -/
theorem oddRowFactor_valid
    (m : ℕ) (σ : Equiv.Perm (Fin (2*m)))
    (hv : Valid (CoprimeRel (2*m)) σ) :
    Valid (OddEvenRel m) (oddRowFactor m σ hv) := by
  intro i
  have hcop := hv (evenIndex m i)
  have hp := coprime_evenIndex_image_oddIndex m σ hv i
  have hval : 2*((σ (evenIndex m i)).val / 2)+1 =
      (σ (evenIndex m i)).val := by omega
  change Nat.Coprime (2*i.val+1) (2*((σ (evenIndex m i)).val/2)+2)
  omega

#print axioms oddRowFactorMap_injective
#print axioms oddRowFactor
#print axioms evenRowFactor_valid
#print axioms oddRowFactor_valid


end P005
