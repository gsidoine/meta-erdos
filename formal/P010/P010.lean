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



/-- Expanding one adjacent pair in the counted adjacency list. -/
theorem adjacentCount_cons_cons (x y : ℕ) (xs : List ℕ) :
    adjacentCount (x :: y :: xs) =
      (if Nat.Coprime x y then 1 else 0) + adjacentCount (y :: xs) := by
  by_cases h : Nat.Coprime x y
  · simp [adjacentCount, h, List.countP_cons, Nat.add_comm]
  · simp [adjacentCount, h, List.countP_cons, Nat.add_comm]

/-- Joining two lists introduces at most one new coprime adjacency. -/
theorem adjacentCount_append_le (a b : List ℕ) :
    adjacentCount (a ++ b) ≤
      adjacentCount a + adjacentCount b + 1 := by
  induction a with
  | nil => simp [adjacentCount]
  | cons x xs ih =>
    cases xs with
    | nil =>
      cases b with
      | nil => simp [adjacentCount]
      | cons y ys =>
        change adjacentCount (x :: y :: ys) ≤
          adjacentCount [x] + adjacentCount (y :: ys) + 1
        rw [adjacentCount_cons_cons]
        have hsingle : adjacentCount [x] = 0 := by rfl
        rw [hsingle]
        split_ifs <;> omega
    | cons y ys =>
      simp only [List.cons_append, adjacentCount_cons_cons] at ih ⊢
      omega

/-- The concatenation of k non-coprime paths contains at most k-1
coprime adjacencies. Empty paths are harmless. -/
theorem adjacentCount_flatten_le (paths : List (List ℕ))
    (hpaths : ∀ p ∈ paths, NonCoprimeChain p) :
    adjacentCount paths.flatten ≤ paths.length - 1 := by
  induction paths with
  | nil => simp [adjacentCount]
  | cons a rest ih =>
    cases rest with
    | nil =>
      have ha : NonCoprimeChain a := hpaths a (by simp)
      simpa [List.flatten, chain_adjacentCount_zero a ha]
    | cons b bs =>
      have ha : NonCoprimeChain a := hpaths a (by simp)
      have ht : ∀ p ∈ b :: bs, NonCoprimeChain p := by
        intro p hp
        exact hpaths p (by simp [hp])
      have hi := ih ht
      have hjoin := adjacentCount_append_le a (List.flatten (b :: bs))
      have hzero := chain_adjacentCount_zero a ha
      simp only [List.flatten_cons, List.length_cons] at *
      omega

/-- Formal version of the graph-theoretic path-cover upper-bound
reduction used in the submitted P010 proof. -/
theorem h_le_of_noncoprime_cover (n : ℕ) (paths : List (List ℕ))
    (hcover : IsPermutation n paths.flatten)
    (hpaths : ∀ p ∈ paths, NonCoprimeChain p) :
    h n ≤ paths.length - 1 := by
  exact (h_le_of_permutation n paths.flatten hcover).trans
    (adjacentCount_flatten_le paths hpaths)



/-- Canonical decomposition into maximal non-coprime runs. It is
the path cover obtained by cutting a permutation at precisely the
coprime consecutive pairs. -/
def maximalNonCoprimeRuns (a : List ℕ) : List (List ℕ) :=
  a.splitBy (fun x y => decide (¬Nat.Coprime x y))

/-- Splitting at coprime adjacencies never removes or duplicates vertices. -/
theorem maximalNonCoprimeRuns_flatten (a : List ℕ) :
    (maximalNonCoprimeRuns a).flatten = a := by
  exact List.flatten_splitBy _ a

/-- Every component of the canonical cut decomposition is a
non-coprime path, with no appeal to the submitted construction. -/
theorem maximalNonCoprimeRuns_chains (a : List ℕ) :
    ∀ p ∈ maximalNonCoprimeRuns a, NonCoprimeChain p := by
  intro p hp
  have hc : List.IsChain
      (fun (x y : ℕ) => (decide (¬Nat.Coprime x y)) = true) p := by
    exact List.isChain_of_mem_splitBy (show
      p ∈ a.splitBy (fun x y => decide (¬Nat.Coprime x y)) from hp)
  simpa [NonCoprimeChain] using hc

/-- The canonical non-coprime-run cover of any permutation
gives a valid upper bound on its minimum coprime adjacency count. -/
theorem h_le_canonical_run_count (n : ℕ) (a : List ℕ)
    (ha : IsPermutation n a) :
    h n ≤ (maximalNonCoprimeRuns a).length - 1 := by
  apply h_le_of_noncoprime_cover n (maximalNonCoprimeRuns a)
  · simpa [maximalNonCoprimeRuns_flatten] using ha
  · exact maximalNonCoprimeRuns_chains a


/-- Each coprime adjacency creates one new non-coprime run. -/
private theorem splitBy_loop_run_count
    (xs : List ℕ) (b : ℕ) (rev : List ℕ) (parts : List (List ℕ)) :
    (List.splitBy.loop (fun x y : ℕ => decide (¬Nat.Coprime x y))
      xs b rev parts).length =
        parts.length + 1 + adjacentCount (b :: xs) := by
  induction xs generalizing b rev parts with
  | nil =>
    simp [List.splitBy.loop, adjacentCount]
  | cons x xs ih =>
    by_cases hc : Nat.Coprime b x
    · have hr : decide (¬Nat.Coprime b x) = false := by simp [hc]
      simp only [List.splitBy.loop, hr, adjacentCount_cons_cons]
      rw [if_pos hc]
      have hi := ih x [] ((b :: rev).reverse :: parts)
      simp only [List.length_cons] at hi
      omega
    · have hr : decide (¬Nat.Coprime b x) = true := by simp [hc]
      simp only [List.splitBy.loop, hr, adjacentCount_cons_cons]
      rw [if_neg hc]
      have hi := ih x (b :: rev) parts
      omega

/-- The number of maximal non-coprime runs is exactly one more
than the number of adjacent coprime pairs. -/
theorem maximalNonCoprimeRuns_length (x : ℕ) (xs : List ℕ) :
    (maximalNonCoprimeRuns (x :: xs)).length =
      adjacentCount (x :: xs) + 1 := by
  simpa [maximalNonCoprimeRuns, List.splitBy, Nat.add_comm, Nat.add_left_comm]
    using splitBy_loop_run_count xs x [] []


/-!
## Degree-one prime capacity of a non-coprime path

The local unique-neighbor lemma has a global consequence: in a simple
non-coprime path, no middle-range prime may occur at an interior vertex.
The next two theorems make this restriction quantitative.
-/

/-- In a simple non-coprime path with at least two vertices, at most one
middle-range prime can occur after its first vertex. -/
theorem middle_primes_tail_at_most_one (n x y : ℕ) (xs : List ℕ)
    (hchain : NonCoprimeChain (x :: y :: xs))
    (hnodup : (x :: y :: xs).Nodup)
    (hbound : ∀ t ∈ x :: y :: xs, 0 < t ∧ t ≤ n) :
    ((y :: xs).filter (fun t => decide (t ∈ middlePrimes n))).length ≤ 1 := by
  induction xs generalizing x y with
  | nil =>
      by_cases hy : y ∈ middlePrimes n <;> simp [hy]
  | cons z zs ih =>
      have hy_not_middle : y ∉ middlePrimes n := by
        intro hy
        obtain ⟨hprime, hthird, _⟩ := mem_middlePrimes.mp hy
        have hxy : ¬Nat.Coprime x y :=
          (List.isChain_cons.mp hchain).1 y (by simp)
        have hyz : ¬Nat.Coprime y z :=
          (List.isChain_cons.mp (List.isChain_cons.mp hchain).2).1 z (by simp)
        have hyx : ¬Nat.Coprime y x := by
          intro hc
          exact hxy hc.symm
        have hx_ne_y : x ≠ y := by
          intro heq
          exact (List.nodup_cons.mp hnodup).1 (by simp [heq])
        have hx_ne_z : x ≠ z := by
          intro heq
          exact (List.nodup_cons.mp hnodup).1 (by simp [heq])
        have hz_ne_y : z ≠ y := by
          intro heq
          exact (List.nodup_cons.mp (List.nodup_cons.mp hnodup).2).1
            (by simp [heq])
        obtain ⟨hxpos, hxle⟩ := hbound x (by simp)
        obtain ⟨hzpos, hzle⟩ := hbound z (by simp)
        have hx : x = 2 * y :=
          middle_prime_unique_neighbor hprime hthird hxpos hxle hx_ne_y hyx
        have hz : z = 2 * y :=
          middle_prime_unique_neighbor hprime hthird hzpos hzle hz_ne_y hyz
        exact hx_ne_z (hx.trans hz.symm)
      have hchain' : NonCoprimeChain (y :: z :: zs) :=
        (List.isChain_cons.mp hchain).2
      have hnodup' : (y :: z :: zs).Nodup :=
        (List.nodup_cons.mp hnodup).2
      have hbound' : ∀ t ∈ y :: z :: zs, 0 < t ∧ t ≤ n := by
        intro t ht
        exact hbound t (by simp [ht])
      have htail := ih y z hchain' hnodup' hbound'
      simpa [hy_not_middle] using htail

/-- A simple non-coprime path contains at most two primes from
the degree-one interval (n/3,n/2]. The two can only be endpoints. -/
theorem middle_primes_path_capacity (n : ℕ) (a : List ℕ)
    (hchain : NonCoprimeChain a)
    (hnodup : a.Nodup)
    (hbound : ∀ t ∈ a, 0 < t ∧ t ≤ n) :
    (a.filter (fun t => decide (t ∈ middlePrimes n))).length ≤ 2 := by
  cases a with
  | nil =>
      simp
  | cons x xs =>
      cases xs with
      | nil =>
          by_cases hx : x ∈ middlePrimes n <;> simp [hx]
      | cons y ys =>
          have htail :=
            middle_primes_tail_at_most_one n x y ys hchain hnodup hbound
          by_cases hx : x ∈ middlePrimes n
          · simpa [hx] using Nat.succ_le_succ htail
          · have hsmall : ((y :: ys).filter
                (fun t => decide (t ∈ middlePrimes n))).length ≤ 2 :=
              htail.trans (by omega)
            simpa [hx] using hsmall


/-- In a simple non-coprime path, a vertex coprime to all other
vertices of the path can occur only as a singleton path. -/
theorem isolated_member_forces_singleton (p : ℕ) :
    ∀ a : List ℕ, NonCoprimeChain a → a.Nodup →
      p ∈ a → (∀ x ∈ a, x ≠ p → Nat.Coprime p x) → a = [p] := by
  intro a
  induction a with
  | nil =>
      intro _ _ hmem _
      simp at hmem
  | cons x xs ih =>
      intro hchain hnodup hmem hiso
      cases xs with
      | nil =>
          have hpx : p = x := by simpa using hmem
          subst x
          rfl
      | cons y ys =>
          have hxy : ¬Nat.Coprime x y :=
            (List.isChain_cons.mp hchain).1 y (by simp)
          by_cases hpx : p = x
          · have hy_ne : y ≠ p := by
              intro heq
              exact (List.nodup_cons.mp hnodup).1 (by simp [hpx, heq])
            have hc : Nat.Coprime x y := by
              simpa [hpx] using hiso y (by simp) hy_ne
            exact (hxy hc).elim
          · have hmemtail : p ∈ y :: ys := by
              rcases List.mem_cons.mp hmem with heq | ht
              · exact (hpx heq).elim
              · exact ht
            have htail : NonCoprimeChain (y :: ys) :=
              (List.isChain_cons.mp hchain).2
            have hnoduptail : (y :: ys).Nodup :=
              (List.nodup_cons.mp hnodup).2
            have hisotail : ∀ z ∈ y :: ys, z ≠ p → Nat.Coprime p z := by
              intro z hz hne
              exact hiso z (by simp [hz]) hne
            have htail_eq : y :: ys = [p] :=
              ih htail hnoduptail hmemtail hisotail
            have hy : y = p := by
              have hm : y ∈ [p] := by rw [← htail_eq]; simp
              simpa using hm
            have hx_ne : x ≠ p := by
              intro heq
              exact hpx heq.symm
            have hc : Nat.Coprime x y := by
              simpa [hy] using (hiso x (by simp) hx_ne).symm
            exact (hxy hc).elim

/-- Every large prime is a singleton in any simple non-coprime path
containing it and lying within [1,n]. -/
theorem large_prime_path_singleton (n p : ℕ) (a : List ℕ)
    (hp : p ∈ largePrimes n)
    (hchain : NonCoprimeChain a)
    (hnodup : a.Nodup)
    (hmem : p ∈ a)
    (hbound : ∀ t ∈ a, 0 < t ∧ t ≤ n) :
    a = [p] := by
  obtain ⟨hprime, hbig, _⟩ := mem_largePrimes.mp hp
  apply isolated_member_forces_singleton p a hchain hnodup hmem
  intro x hx hne
  obtain ⟨hxpos, hxle⟩ := hbound x hx
  exact large_prime_isolated hprime hbig hxpos hxle hne

/-- The vertex 1 is a singleton in any simple non-coprime path
containing it. -/
theorem one_path_singleton (a : List ℕ)
    (hchain : NonCoprimeChain a) (hnodup : a.Nodup)
    (hmem : 1 ∈ a) : a = [1] := by
  apply isolated_member_forces_singleton 1 a hchain hnodup hmem
  intro x _ _
  exact one_coprime x


/-!
## Global counting prerequisites for the P010 lower bound
-/

/-- The set of vertices forced to be singleton paths. -/
def isolatedVertices (n : ℕ) : Finset ℕ :=
  insert 1 (largePrimes n)

/-- The vertex 1 is not a prime, hence not in the large-prime set. -/
theorem one_not_large (n : ℕ) : 1 ∉ largePrimes n := by
  intro h
  have hp := (mem_largePrimes.mp h).1
  have htwo := hp.two_le
  omega

theorem isolatedVertices_card (n : ℕ) :
    (isolatedVertices n).card = pi n - pi (n / 2) + 1 := by
  simp [isolatedVertices, one_not_large, largePrimes_card]

theorem isolatedVertices_range (n x : ℕ) (hx : x ∈ isolatedVertices n)
    (hn : 1 ≤ n) : 1 ≤ x ∧ x ≤ n := by
  rcases Finset.mem_insert.mp hx with h1 | hl
  · omega
  · obtain ⟨hp, _, hle⟩ := mem_largePrimes.mp hl
    have htwo := hp.two_le
    omega

theorem middlePrimes_range (n x : ℕ) (hx : x ∈ middlePrimes n) :
    1 ≤ x ∧ x ≤ n := by
  obtain ⟨hp, _, hle⟩ := mem_middlePrimes.mp hx
  have htwo := hp.two_le
  omega

theorem isolated_not_middle (n x : ℕ) (hx : x ∈ isolatedVertices n) :
    x ∉ middlePrimes n := by
  intro hm
  obtain ⟨hp, _, hhalf⟩ := mem_middlePrimes.mp hm
  rcases Finset.mem_insert.mp hx with heq | hl
  · have htwo := hp.two_le
    omega
  · have hbig := (mem_largePrimes.mp hl).2.1
    omega

theorem two_not_isolated (n : ℕ) (hn : 4 ≤ n) :
    2 ∉ isolatedVertices n := by
  intro hx
  rcases Finset.mem_insert.mp hx with h1 | hl
  · omega
  · have hbig := (mem_largePrimes.mp hl).2.1
    omega

/-- Membership in [1,n] for an arbitrary valid permutation. -/
theorem permutation_mem_iff (n : ℕ) (a : List ℕ)
    (ha : IsPermutation n a) (x : ℕ) :
    x ∈ a ↔ 1 ≤ x ∧ x ≤ n := by
  change a.Perm (List.range' 1 n) at ha
  rw [ha.mem_iff]
  constructor
  · intro hx
    obtain ⟨i, hi, heq⟩ := List.mem_range'.mp hx
    omega
  · rintro ⟨hpos, hle⟩
    apply List.mem_range'.mpr
    refine ⟨x - 1, by omega, ?_⟩
    omega

theorem permutation_nodup (n : ℕ) (a : List ℕ)
    (ha : IsPermutation n a) : a.Nodup := by
  exact (ha.nodup_iff).2 (List.nodup_range' 1 n)

/-- A finite subset of [1,n] occurs with its exact cardinality in
any permutation of [1,n]. -/
theorem permutation_filter_card (n : ℕ) (a : List ℕ)
    (ha : IsPermutation n a) (s : Finset ℕ)
    (hs : ∀ x ∈ s, 1 ≤ x ∧ x ≤ n) :
    (a.filter (fun x => decide (x ∈ s))).length = s.card := by
  classical
  have hd : (a.filter (fun x => decide (x ∈ s))).Nodup :=
    (permutation_nodup n a ha).filter _
  have hsets : (a.filter (fun x => decide (x ∈ s))).toFinset = s := by
    ext x
    simp only [List.mem_toFinset, List.mem_filter, decide_eq_true_eq]
    constructor
    · intro hx
      aesop
    · intro hx
      have hmem : x ∈ a := (permutation_mem_iff n a ha x).2 (hs x hx)
      aesop
  calc
    (a.filter (fun x => decide (x ∈ s))).length =
        (a.filter (fun x => decide (x ∈ s))).toFinset.card :=
          (List.toFinset_card_of_nodup hd).symm
    _ = s.card := congrArg Finset.card hsets

/-- A filtered list contains no element when the predicate fails
throughout the input. -/
private theorem filter_finset_nil (s : Finset ℕ) (a : List ℕ)
    (h : ∀ x ∈ a, x ∉ s) :
    a.filter (fun x => decide (x ∈ s)) = [] := by
  induction a with
  | nil => rfl
  | cons x xs ih =>
      have hx : x ∉ s := h x (by simp)
      have ht : ∀ y ∈ xs, y ∉ s := by
        intro y hy
        exact h y (by simp [hy])
      simpa [hx] using ih ht

/-- No element can occur more than once in a filtered nodup list. -/
private theorem filtered_two_le_one (a : List ℕ) (hd : a.Nodup) :
    (a.filter (fun x => decide (x = 2))).length ≤ 1 := by
  have hf : (a.filter (fun x => decide (x = 2))).Nodup := hd.filter _
  have hsub : (a.filter (fun x => decide (x = 2))) ⊆ [2] := by
    intro x hx
    simp only [List.mem_singleton]
    simp only [List.mem_filter, decide_eq_true_eq] at hx
    aesop
  have hle := List.Nodup.length_le_of_subset hf hsub
  simpa using hle

/-- The total of local weighted path capacities bounds the number
of components of any (possibly empty) path family. -/
private theorem weighted_capacity_flatten (ps : List (List ℕ))
    (f g : ℕ → Bool) (r s cap : ℕ)
    (h : ∀ p ∈ ps,
      r * (p.filter f).length + s * (p.filter g).length ≤ cap) :
    r * (ps.flatten.filter f).length +
        s * (ps.flatten.filter g).length ≤ cap * ps.length := by
  induction ps with
  | nil => simp
  | cons p rest ih =>
      have hp := h p (by simp)
      have ht : ∀ q ∈ rest,
          r * (q.filter f).length + s * (q.filter g).length ≤ cap := by
        intro q hq
        exact h q (by simp [hq])
      have hi := ih ht
      simp only [List.flatten_cons, List.filter_append,
        List.length_append, List.length_cons]
      nlinarith

end P010
