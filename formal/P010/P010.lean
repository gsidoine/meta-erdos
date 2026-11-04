import Mathlib

/-!
# P010: minimum number of coprime adjacencies

This is a developing formalization of the theorem proved in
`theorems/P010-exact-coprime-adjacencies.md`.

The submitted manuscript is not modified. The full prime-factor
path-cover construction and all-n arithmetic lower bound are not
yet formalized. There is deliberately no axiom or `sorry` that
asserts the manuscript's main result.
-/

namespace P010

/-- The list contains every integer in `[1, n]` exactly once. -/
def IsPermutation (n : ℕ) (a : List ℕ) : Prop :=
  a.Perm (List.range' 1 n)

/-- The number of adjacent coprime pairs in a list. -/
def adjacentCount (a : List ℕ) : ℕ :=
  (a.zip a.tail).countP (fun z => decide (Nat.Coprime z.1 z.2))

/-- The number of primes not exceeding `n`. -/
def pi (n : ℕ) : ℕ := Nat.primeCounting n

/-- The exact expression in the submitted manuscript, for `n ≥ 4`. -/
def target (n : ℕ) : ℕ :=
  (pi n - pi (n / 2)) +
    max 1 (((pi (n / 2) - pi (n / 3)) + 1) / 2)

/-- The nonempty set of possible adjacency counts. -/
def Attained (n k : ℕ) : Prop :=
  ∃ a : List ℕ, IsPermutation n a ∧ adjacentCount a = k

theorem attainable (n : ℕ) : ∃ k : ℕ, Attained n k := by
  refine ⟨adjacentCount (List.range' 1 n), List.range' 1 n, ?_, rfl⟩
  exact List.Perm.refl _

/-- The extremal quantity, defined as the least realized score. -/
noncomputable def h (n : ℕ) : ℕ := by
  classical
  exact Nat.find (attainable n)

theorem h_attained (n : ℕ) : Attained n (h n) := by
  classical
  exact Nat.find_spec (attainable n)

theorem h_le_of_permutation (n : ℕ) (a : List ℕ) (ha : IsPermutation n a) :
    h n ≤ adjacentCount a := by
  classical
  exact Nat.find_min' (attainable n) ⟨a, ha, rfl⟩

theorem le_h_of_lower_bound (n k : ℕ)
    (hlower : ∀ a : List ℕ, IsPermutation n a → k ≤ adjacentCount a) :
    k ≤ h n := by
  obtain ⟨a, ha, hc⟩ := h_attained n
  rw [← hc]
  exact hlower a ha

/-- A general extremal principle. This does not supply either arithmetic bound. -/
theorem exact_of_matching_bounds (n : ℕ)
    (hlower : ∀ a : List ℕ, IsPermutation n a → target n ≤ adjacentCount a)
    (hupper : ∃ a : List ℕ, IsPermutation n a ∧ adjacentCount a ≤ target n) :
    h n = target n := by
  apply Nat.le_antisymm
  · obtain ⟨a, ha, hscore⟩ := hupper
    exact (h_le_of_permutation n a ha).trans hscore
  · exact le_h_of_lower_bound n (target n) hlower

/-- In the non-coprime graph, the vertex 1 is isolated. -/
theorem one_coprime (x : ℕ) : Nat.Coprime 1 x := by
  simp

/-- A prime above `n/2` has no non-coprime neighbor distinct
from itself among positive integers at most `n`. -/
theorem large_prime_isolated {n p x : ℕ} (hp : Nat.Prime p)
    (hbig : n / 2 < p) (hxpos : 0 < x) (hxle : x ≤ n)
    (hne : x ≠ p) : Nat.Coprime p x := by
  apply (hp.coprime_iff_not_dvd).2
  intro hdiv
  obtain ⟨k, hk⟩ := hdiv
  have hlt : n < 2 * p := by omega
  have hklt : k < 2 := by
    by_contra h
    have hk2 : 2 ≤ k := by omega
    have hprod : p * 2 ≤ p * k := Nat.mul_le_mul_left p hk2
    omega
  have hkcases : k = 0 ∨ k = 1 := by omega
  rcases hkcases with hzero | hone
  · subst k
    simp at hk
    omega
  · subst k
    simp at hk
    omega

/-- A prime between `n/3` and `n/2` has at most one
possible non-coprime neighbor: `2p`. -/
theorem middle_prime_unique_neighbor {n p x : ℕ} (hp : Nat.Prime p)
    (hthird : n / 3 < p) (hxpos : 0 < x) (hxle : x ≤ n)
    (hne : x ≠ p) (hnoncoprime : ¬Nat.Coprime p x) : x = 2 * p := by
  have hdiv : p ∣ x := (hp.dvd_iff_not_coprime).2 hnoncoprime
  obtain ⟨k, hk⟩ := hdiv
  have hlt : n < 3 * p := by omega
  have hklt : k < 3 := by
    by_contra h
    have hk3 : 3 ≤ k := by omega
    have hprod : p * 3 ≤ p * k := Nat.mul_le_mul_left p hk3
    omega
  have hkcases : k = 0 ∨ k = 1 ∨ k = 2 := by omega
  rcases hkcases with hzero | hone | htwo
  · subst k
    simp at hk
    omega
  · subst k
    simp at hk
    omega
  · subst k
    simpa [hk, Nat.mul_comm]


/-- The set of isolated large primes, of size $\pi(n)-\pi(\lfloor n/2\rfloor)$. -/
def largePrimes (n : ℕ) : Finset ℕ :=
  n.primesLE \ (n / 2).primesLE

/-- The primes that have degree one in the non-coprime graph. -/
def middlePrimes (n : ℕ) : Finset ℕ :=
  (n / 2).primesLE \ (n / 3).primesLE

theorem largePrimes_card (n : ℕ) :
    (largePrimes n).card = pi n - pi (n / 2) := by
  have hsubset : (n / 2).primesLE ⊆ n.primesLE := by
    intro p hp
    obtain ⟨hpbound, hpprime⟩ := Nat.mem_primesLE.mp hp
    exact Nat.mem_primesLE.mpr ⟨by omega, hpprime⟩
  simpa [largePrimes, pi, Nat.primesLE_card_eq_primeCounting]
    using Finset.card_sdiff_of_subset hsubset

theorem middlePrimes_card (n : ℕ) :
    (middlePrimes n).card = pi (n / 2) - pi (n / 3) := by
  have hsubset : (n / 3).primesLE ⊆ (n / 2).primesLE := by
    intro p hp
    obtain ⟨hpbound, hpprime⟩ := Nat.mem_primesLE.mp hp
    exact Nat.mem_primesLE.mpr ⟨by omega, hpprime⟩
  simpa [middlePrimes, pi, Nat.primesLE_card_eq_primeCounting]
    using Finset.card_sdiff_of_subset hsubset

theorem mem_largePrimes {n p : ℕ} :
    p ∈ largePrimes n ↔ Nat.Prime p ∧ n / 2 < p ∧ p ≤ n := by
  constructor
  · intro h
    obtain ⟨hp, hnot⟩ := Finset.mem_sdiff.mp h
    obtain ⟨hle, hprime⟩ := Nat.mem_primesLE.mp hp
    have hbig : n / 2 < p := by
      by_contra hsmall
      apply hnot
      exact Nat.mem_primesLE.mpr ⟨by omega, hprime⟩
    exact ⟨hprime, hbig, hle⟩
  · rintro ⟨hprime, hbig, hle⟩
    apply Finset.mem_sdiff.mpr
    constructor
    · exact Nat.mem_primesLE.mpr ⟨hle, hprime⟩
    · intro hp
      have hle' := (Nat.mem_primesLE.mp hp).1
      omega

theorem mem_middlePrimes {n p : ℕ} :
    p ∈ middlePrimes n ↔ Nat.Prime p ∧ n / 3 < p ∧ p ≤ n / 2 := by
  constructor
  · intro h
    obtain ⟨hp, hnot⟩ := Finset.mem_sdiff.mp h
    obtain ⟨hle, hprime⟩ := Nat.mem_primesLE.mp hp
    have hbig : n / 3 < p := by
      by_contra hsmall
      apply hnot
      exact Nat.mem_primesLE.mpr ⟨by omega, hprime⟩
    exact ⟨hprime, hbig, hle⟩
  · rintro ⟨hprime, hbig, hle⟩
    apply Finset.mem_sdiff.mpr
    constructor
    · exact Nat.mem_primesLE.mpr ⟨hle, hprime⟩
    · intro hp
      have hle' := (Nat.mem_primesLE.mp hp).1
      omega

/-- Every middle prime has exactly one non-coprime neighbor,
namely twice itself. -/
theorem middle_prime_exact_neighbor {n p : ℕ} (hp : Nat.Prime p)
    (hthird : n / 3 < p) (hhalf : p ≤ n / 2) :
    ∃ x : ℕ, 0 < x ∧ x ≤ n ∧ x ≠ p ∧ ¬Nat.Coprime p x ∧
      ∀ y : ℕ, 0 < y → y ≤ n → y ≠ p → ¬Nat.Coprime p y → y = x := by
  have hppos : 0 < p := by have := hp.two_le; omega
  refine ⟨2 * p, by omega, by omega, by omega, ?_, ?_⟩
  · apply (hp.dvd_iff_not_coprime).1
    exact ⟨2, by omega⟩
  · intro y hypos hyle hyne hyn
    exact middle_prime_unique_neighbor hp hthird hypos hyle hyne hyn

/-- Explicit optimal witnesses for the exceptional small inputs. -/
def smallWitness : ℕ → List ℕ
  | 1 => [1]
  | 2 => [1, 2]
  | 3 => [1, 2, 3]
  | 4 => [1, 2, 4, 3]
  | 5 => [1, 2, 4, 3, 5]
  | 6 => [1, 2, 4, 6, 3, 5]
  | 7 => [1, 2, 4, 6, 3, 5, 7]
  | 8 => [1, 2, 4, 8, 6, 3, 5, 7]
  | 9 => [1, 2, 4, 8, 6, 3, 9, 5, 7]
  | 10 => [1, 3, 9, 6, 2, 4, 8, 10, 5, 7]
  | 11 => [1, 3, 9, 6, 2, 4, 8, 10, 5, 7, 11]
  | _ => []

theorem smallWitness_certified (n : ℕ) (hnpos : 1 ≤ n) (hnmax : n ≤ 11) :
    IsPermutation n (smallWitness n) ∧
      adjacentCount (smallWitness n) =
        (if n ≤ 3 then n - 1 else target n) := by
  interval_cases n <;> (unfold IsPermutation; decide)

theorem small_upper_bound (n : ℕ) (hn4 : 4 ≤ n) (hn11 : n ≤ 11) :
    ∃ a : List ℕ, IsPermutation n a ∧ adjacentCount a = target n := by
  obtain ⟨hperm, hcount⟩ := smallWitness_certified n (by omega) hn11
  refine ⟨smallWitness n, hperm, ?_⟩
  simpa [show ¬n ≤ 3 by omega] using hcount


/-- The non-coprime adjacency condition on all consecutive elements
of a list. These are precisely the paths used in the manuscript's
path-cover argument. -/
def NonCoprimeChain (a : List ℕ) : Prop :=
  List.IsChain (fun x y : ℕ => ¬Nat.Coprime x y) a

theorem common_prime_divisor_noncoprime {p x y : ℕ}
    (hp : Nat.Prime p) (hx : p ∣ x) (hy : p ∣ y) :
    ¬Nat.Coprime x y := by
  exact Nat.Prime.not_coprime_iff_dvd.mpr ⟨p, hp, hx, hy⟩

/-- A genuine path in the non-coprime graph contributes zero
coprime adjacencies. This connects the graph representation with the
extremal quantity in the submitted manuscript. -/
theorem chain_adjacentCount_zero (a : List ℕ) (ha : NonCoprimeChain a) :
    adjacentCount a = 0 := by
  induction a with
  | nil => rfl
  | cons x xs ih =>
    cases xs with
    | nil => rfl
    | cons y ys =>
      have hxy : ¬ Nat.Coprime x y :=
        (List.isChain_cons.mp ha).1 y (by simp)
      have htail : NonCoprimeChain (y :: ys) :=
        (List.isChain_cons.mp ha).2
      have hzero := ih htail
      simpa [adjacentCount, hxy] using hzero

/-- Every ordering of a class of integers sharing a prime divisor
is a non-coprime path. This formalizes the internal class paths. -/
theorem prime_class_chain (p : ℕ) (hp : Nat.Prime p)
    (a : List ℕ) (hdiv : ∀ x ∈ a, p ∣ x) :
    NonCoprimeChain a := by
  have hpair : List.Pairwise (fun x y : ℕ => ¬Nat.Coprime x y) a := by
    induction a with
    | nil => exact List.Pairwise.nil
    | cons x xs ih =>
      apply List.Pairwise.cons
      · intro y hy
        exact common_prime_divisor_noncoprime hp
          (hdiv x (by simp)) (hdiv y (by simp [hy]))
      · exact ih (fun y hy => hdiv y (by simp [hy]))
  exact hpair.isChain

/-- A path ending in a multiple of p may be joined to a path
starting in a multiple of p. -/
theorem join_prime_ended_paths (p : ℕ) (hp : Nat.Prime p)
    (a b : List ℕ)
    (ha : NonCoprimeChain a) (hb : NonCoprimeChain b)
    (hend : ∀ x : ℕ, x ∈ a.getLast? → p ∣ x)
    (hstart : ∀ y : ℕ, y ∈ b.head? → p ∣ y) :
    NonCoprimeChain (a ++ b) := by
  exact List.IsChain.append ha hb (fun x hx y hy =>
    common_prime_divisor_noncoprime hp (hend x hx) (hstart y hy))

/-- The proof's even-endpoint concatenation rule (p = 2). -/
theorem join_even_ended_paths (a b : List ℕ)
    (ha : NonCoprimeChain a) (hb : NonCoprimeChain b)
    (hend : ∀ x : ℕ, x ∈ a.getLast? → 2 ∣ x)
    (hstart : ∀ y : ℕ, y ∈ b.head? → 2 ∣ y) :
    NonCoprimeChain (a ++ b) := by
  exact join_prime_ended_paths 2 (by norm_num) a b ha hb hend hstart

/-- The same rule for bridges formed by multiples of three. -/
theorem join_three_ended_paths (a b : List ℕ)
    (ha : NonCoprimeChain a) (hb : NonCoprimeChain b)
    (hend : ∀ x : ℕ, x ∈ a.getLast? → 3 ∣ x)
    (hstart : ∀ y : ℕ, y ∈ b.head? → 3 ∣ y) :
    NonCoprimeChain (a ++ b) := by
  exact join_prime_ended_paths 3 (by norm_num) a b ha hb hend hstart


end P010
