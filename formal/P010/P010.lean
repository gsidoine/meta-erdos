import Mathlib

/-!
# P010: minimum number of coprime adjacencies

This is a developing formalization of the theorem proved in
`theorems/P010-exact-coprime-adjacencies.md`.

The submitted manuscript is not modified. The universal lower bound
is formalized. The upper-bound construction remains partial: its
largest-prime-factor classes, prescribed-endpoint paths and local bridges
are certified, but the global assembly and prime-counting input remain.
There is no axiom or `sorry` asserting the manuscript's main result.
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
  exact (ha.nodup_iff).2 (List.nodup_range')

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


/-- A marked isolated vertex forces its entire non-coprime path
to be a singleton. -/
theorem isolated_path_singleton (n p : ℕ) (a : List ℕ)
    (hi : p ∈ isolatedVertices n) (hc : NonCoprimeChain a)
    (hd : a.Nodup) (hp : p ∈ a)
    (hb : ∀ t ∈ a, 0 < t ∧ t ≤ n) : a = [p] := by
  rcases Finset.mem_insert.mp hi with h1 | hl
  · subst p
    exact one_path_singleton a hc hd hp
  · exact large_prime_path_singleton n p a hl hc hd hp hb

/-- A simple non-coprime path has either one isolated vertex or
at most two middle primes, never both. -/
theorem isolated_middle_path_weight (n : ℕ) (a : List ℕ)
    (hc : NonCoprimeChain a) (hd : a.Nodup)
    (hb : ∀ t ∈ a, 0 < t ∧ t ≤ n) :
    2 * (a.filter (fun t => decide (t ∈ isolatedVertices n))).length +
        (a.filter (fun t => decide (t ∈ middlePrimes n))).length ≤ 2 := by
  by_cases hex : ∃ p, p ∈ a ∧ p ∈ isolatedVertices n
  · obtain ⟨p, hp, hi⟩ := hex
    have heq := isolated_path_singleton n p a hi hc hd hp hb
    rw [heq]
    have hm := isolated_not_middle n p hi
    simp [hi, hm]
  · have hno : ∀ p ∈ a, p ∉ isolatedVertices n := by
      intro p hp hi
      exact hex ⟨p, hp, hi⟩
    have hnil := filter_finset_nil (isolatedVertices n) a hno
    have hcap := middle_primes_path_capacity n a hc hd hb
    rw [hnil]
    simp only [List.length_nil, mul_zero, zero_add]
    exact hcap

/-- For n ≥ 4, isolated vertices and vertex 2 must occupy
different paths of any non-coprime cover. -/
theorem isolated_two_path_weight (n : ℕ) (hn : 4 ≤ n) (a : List ℕ)
    (hc : NonCoprimeChain a) (hd : a.Nodup)
    (hb : ∀ t ∈ a, 0 < t ∧ t ≤ n) :
    (a.filter (fun t => decide (t ∈ isolatedVertices n))).length +
        (a.filter (fun t => decide (t = 2))).length ≤ 1 := by
  by_cases hex : ∃ p, p ∈ a ∧ p ∈ isolatedVertices n
  · obtain ⟨p, hp, hi⟩ := hex
    have heq := isolated_path_singleton n p a hi hc hd hp hb
    have hne : p ≠ 2 := by
      intro heq2
      apply two_not_isolated n hn
      simpa [heq2] using hi
    rw [heq]
    simp [hi, hne]
  · have hno : ∀ p ∈ a, p ∉ isolatedVertices n := by
      intro p hp hi
      exact hex ⟨p, hp, hi⟩
    have hnil := filter_finset_nil (isolatedVertices n) a hno
    have hcap := filtered_two_le_one a hd
    rw [hnil]
    simpa using hcap

/-- The global path-cover lower bounds from isolated vertices,
degree-one middle primes and the remaining vertex 2. -/
theorem noncoprime_cover_lower_counts (n : ℕ) (hn : 4 ≤ n)
    (paths : List (List ℕ))
    (hcover : IsPermutation n paths.flatten)
    (hchains : ∀ p ∈ paths, NonCoprimeChain p) :
    2 * (isolatedVertices n).card + (middlePrimes n).card ≤
        2 * paths.length ∧
      (isolatedVertices n).card + 1 ≤ paths.length := by
  have hnodup := permutation_nodup n paths.flatten hcover
  have hpath_nodup : ∀ p ∈ paths, p.Nodup :=
    (List.nodup_flatten.mp hnodup).1
  have hbound : ∀ p ∈ paths, ∀ t ∈ p, 0 < t ∧ t ≤ n := by
    intro p hp t ht
    have hmem := List.mem_flatten_of_mem hp ht
    have hr := (permutation_mem_iff n paths.flatten hcover t).1 hmem
    omega
  have hi : (paths.flatten.filter
      (fun t => decide (t ∈ isolatedVertices n))).length =
      (isolatedVertices n).card :=
    permutation_filter_card n paths.flatten hcover (isolatedVertices n)
      (fun x hx => isolatedVertices_range n x hx (by omega))
  have hm : (paths.flatten.filter
      (fun t => decide (t ∈ middlePrimes n))).length =
      (middlePrimes n).card :=
    permutation_filter_card n paths.flatten hcover (middlePrimes n)
      (fun x hx => middlePrimes_range n x hx)
  have htwo : (paths.flatten.filter
      (fun t => decide (t = 2))).length = 1 := by
    have hf := permutation_filter_card n paths.flatten hcover
        ({2} : Finset ℕ) (by
          intro x hx
          simp only [Finset.mem_singleton] at hx
          omega)
    simpa using hf
  have hw : 2 * (paths.flatten.filter
      (fun t => decide (t ∈ isolatedVertices n))).length +
      (paths.flatten.filter
      (fun t => decide (t ∈ middlePrimes n))).length ≤
      2 * paths.length := by
    have h := weighted_capacity_flatten paths
        (fun t => decide (t ∈ isolatedVertices n))
        (fun t => decide (t ∈ middlePrimes n)) 2 1 2 (by
          intro p hp
          simpa using isolated_middle_path_weight n p
            (hchains p hp) (hpath_nodup p hp) (hbound p hp))
    simpa using h
  have hw2 : (paths.flatten.filter
      (fun t => decide (t ∈ isolatedVertices n))).length +
      (paths.flatten.filter
      (fun t => decide (t = 2))).length ≤ paths.length := by
    have h := weighted_capacity_flatten paths
        (fun t => decide (t ∈ isolatedVertices n))
        (fun t => decide (t = 2)) 1 1 1 (by
          intro p hp
          simpa using isolated_two_path_weight n hn p
            (hchains p hp) (hpath_nodup p hp) (hbound p hp))
    simpa using h
  constructor <;> omega

/-- The universal lower bound in P010. No assertion about the
constructive upper bound is used. -/
theorem P010_universal_lower_bound (n : ℕ) (hn : 4 ≤ n)
    (a : List ℕ) (ha : IsPermutation n a) :
    target n ≤ adjacentCount a := by
  cases a with
  | nil =>
      have hmem : 1 ∈ ([] : List ℕ) :=
        (permutation_mem_iff n [] ha 1).2 (by omega)
      simp at hmem
  | cons x xs =>
      let paths := maximalNonCoprimeRuns (x :: xs)
      have hcover : IsPermutation n paths.flatten := by
        simpa [paths, maximalNonCoprimeRuns_flatten] using ha
      have hchains : ∀ p ∈ paths, NonCoprimeChain p :=
        maximalNonCoprimeRuns_chains (x :: xs)
      obtain ⟨hdegree, hother⟩ :=
        noncoprime_cover_lower_counts n hn paths hcover hchains
      have hrun : paths.length = adjacentCount (x :: xs) + 1 :=
        maximalNonCoprimeRuns_length x xs
      have hi := isolatedVertices_card n
      have hm := middlePrimes_card n
      unfold target
      omega


/-- The full, unconditional lower half of the P010 formula for n ≥ 4. -/
theorem P010_h_lower_bound (n : ℕ) (hn : 4 ≤ n) :
    target n ≤ h n := by
  exact le_h_of_lower_bound n (target n)
    (fun a ha => P010_universal_lower_bound n hn a ha)

#print axioms P010_universal_lower_bound
#print axioms P010_h_lower_bound


/-!
## Largest-prime-factor classes for the upper construction

The integers from 2 through n are partitioned according to their
largest prime divisor. Every such class is a clique in the noncoprime
graph; the following results certify the partition and its endpoints.
-/

/-- The class of integers in [2,n] with largest prime factor p. -/
def primeClass (n p : ℕ) : Finset ℕ :=
  (Finset.Icc 2 n).filter (fun m => Nat.maxPrimeFac m = p)

theorem mem_primeClass {n p m : ℕ} :
    m ∈ primeClass n p ↔ 2 ≤ m ∧ m ≤ n ∧ Nat.maxPrimeFac m = p := by
  simp only [primeClass, Finset.mem_filter, Finset.mem_Icc, and_assoc]

theorem primeClass_dvd {n p m : ℕ} (hm : m ∈ primeClass n p) :
    p ∣ m := by
  have h := Nat.maxPrimeFac_dvd (n := m)
  simpa [(mem_primeClass.mp hm).2.2] using h

theorem primeClass_prime {n p m : ℕ} (hm : m ∈ primeClass n p) :
    Nat.Prime p := by
  have h := Nat.prime_maxPrimeFac_of_one_lt
      (show 1 < m by have := (mem_primeClass.mp hm).1; omega)
  simpa [(mem_primeClass.mp hm).2.2] using h

/-- The classes indexed by primes at most n cover every integer in [2,n]. -/
theorem primeClass_partition (n : ℕ) :
    (n.primesLE.biUnion (fun p => primeClass n p)) = Finset.Icc 2 n := by
  ext m
  constructor
  · intro hm
    obtain ⟨p, _, hmp⟩ := Finset.mem_biUnion.mp hm
    have h := mem_primeClass.mp hmp
    exact Finset.mem_Icc.mpr ⟨h.1, h.2.1⟩
  · intro hm
    have hr := Finset.mem_Icc.mp hm
    have hprime : Nat.Prime (Nat.maxPrimeFac m) :=
      Nat.prime_maxPrimeFac_of_one_lt (by omega)
    have hle : Nat.maxPrimeFac m ≤ n :=
      (Nat.maxPrimeFac_le (n := m)).trans hr.2
    apply Finset.mem_biUnion.mpr
    refine ⟨Nat.maxPrimeFac m, ?_, ?_⟩
    · exact Nat.mem_primesLE.mpr ⟨hle, hprime⟩
    · exact mem_primeClass.mpr ⟨hr.1, hr.2, rfl⟩

/-- Different largest-prime-factor classes have no common member. -/
theorem primeClass_disjoint (n p q : ℕ) (hpq : p ≠ q) :
    Disjoint (primeClass n p) (primeClass n q) := by
  apply Finset.disjoint_left.mpr
  intro m hm hn
  have h1 := (mem_primeClass.mp hm).2.2
  have h2 := (mem_primeClass.mp hn).2.2
  exact hpq (h1.symm.trans h2)

/-- Any ordering of a largest-prime-factor class is a noncoprime chain. -/
theorem primeClass_chain (n p : ℕ) (hp : Nat.Prime p)
    (a : List ℕ) (hclass : ∀ m ∈ a, m ∈ primeClass n p) :
    NonCoprimeChain a := by
  apply prime_class_chain p hp a
  intro m hm
  exact primeClass_dvd (hclass m hm)

/-- A prime occurs in its own class whenever it does not exceed n. -/
theorem prime_mem_primeClass (n p : ℕ) (hp : Nat.Prime p)
    (hpn : p ≤ n) : p ∈ primeClass n p := by
  exact mem_primeClass.mpr
    ⟨hp.two_le, hpn, hp.maxPrimeFac_eq_self⟩

/-- The even vertex 2p belongs to the class p when it lies in [2,n]. -/
theorem two_mul_prime_mem_class (n p : ℕ) (hp : Nat.Prime p)
    (hpn : 2 * p ≤ n) : 2 * p ∈ primeClass n p := by
  have hp2 := hp.two_le
  have hmax : Nat.maxPrimeFac (2 * p) = p := by
    rw [Nat.maxPrimeFac_mul (by omega) hp.ne_zero,
      (Nat.Prime.maxPrimeFac_eq_self (by norm_num : Nat.Prime 2)), hp.maxPrimeFac_eq_self]
    exact max_eq_right hp.two_le
  exact mem_primeClass.mpr ⟨by omega, hpn, hmax⟩

/-- The even vertex 4p belongs to the class p when it lies in [2,n]. -/
theorem four_mul_prime_mem_class (n p : ℕ) (hp : Nat.Prime p)
    (hpn : 4 * p ≤ n) : 4 * p ∈ primeClass n p := by
  have hp2 := hp.two_le
  have hmax : Nat.maxPrimeFac (4 * p) = p := by
    rw [Nat.maxPrimeFac_mul (by omega) hp.ne_zero,
      (show Nat.maxPrimeFac 4 = 2 by
        have h2 : Nat.maxPrimeFac 2 = 2 :=
          Nat.Prime.maxPrimeFac_eq_self (by norm_num : Nat.Prime 2)
        have hh := Nat.maxPrimeFac_mul (m := 2) (n := 2)
          (by norm_num) (by norm_num)
        simpa [h2] using hh), hp.maxPrimeFac_eq_self]
    exact max_eq_right hp.two_le
  exact mem_primeClass.mpr ⟨by omega, hpn, hmax⟩

/-- A vertex 3p belongs to class p when p is a prime at least 3. -/
theorem three_mul_prime_mem_class (n p : ℕ) (hp : Nat.Prime p)
    (hp3 : 3 ≤ p) (hpn : 3 * p ≤ n) :
    3 * p ∈ primeClass n p := by
  have hp2 := hp.two_le
  have hmax : Nat.maxPrimeFac (3 * p) = p := by
    rw [Nat.maxPrimeFac_mul (by omega) hp.ne_zero,
      (Nat.Prime.maxPrimeFac_eq_self (by norm_num : Nat.Prime 3)), hp.maxPrimeFac_eq_self]
    exact max_eq_right hp3
  exact mem_primeClass.mpr ⟨by omega, hpn, hmax⟩

/-- The p-class with p ≤ n/4 has two distinct even vertices. -/
theorem small_prime_even_endpoints (n p : ℕ) (hp : Nat.Prime p)
    (hsmall : 4 * p ≤ n) :
    2 * p ∈ primeClass n p ∧
      4 * p ∈ primeClass n p ∧ 2 * p ≠ 4 * p := by
  constructor
  · exact two_mul_prime_mem_class n p hp (by omega)
  constructor
  · exact four_mul_prime_mem_class n p hp hsmall
  · have := hp.two_le
    omega

/-- Prime classes in the intermediate interval possess one even
and one divisible-by-three endpoint. -/
theorem intermediate_prime_endpoints (n p : ℕ) (hn : 12 ≤ n)
    (hp : Nat.Prime p) (hquarter : n / 4 < p)
    (hthird : p ≤ n / 3) :
    2 * p ∈ primeClass n p ∧
      3 * p ∈ primeClass n p ∧ 2 * p ≠ 3 * p := by
  have hp3 : 3 ≤ p := by omega
  constructor
  · exact two_mul_prime_mem_class n p hp (by omega)
  constructor
  · exact three_mul_prime_mem_class n p hp hp3 (by omega)
  · have := hp.two_le
    omega


/-- An element of class p bounded by k*p has multiplier in [1,k). -/
theorem primeClass_multiple_below (n p m k : ℕ)
    (hm : m ∈ primeClass n p) (hupper : n < k * p) :
    ∃ t : ℕ, 1 ≤ t ∧ t < k ∧ m = t * p := by
  obtain ⟨t, ht⟩ := primeClass_dvd hm
  have hpos : 2 ≤ m := (mem_primeClass.mp hm).1
  have hle : m ≤ n := (mem_primeClass.mp hm).2.1
  have htp : m = t * p := by simpa [Nat.mul_comm] using ht
  have htpos : 1 ≤ t := by
    by_contra h
    have hzero : t = 0 := by omega
    subst t
    simp at htp
    omega
  have htlt : t < k := by
    by_contra h
    have hge : k ≤ t := by omega
    have hprod : k * p ≤ t * p := Nat.mul_le_mul_right p hge
    omega
  exact ⟨t, htpos, htlt, htp⟩

/-- Above n/2 the largest-prime-factor class is a singleton. -/
theorem large_prime_class_eq (n p : ℕ) (hp : Nat.Prime p)
    (hbig : n / 2 < p) (hle : p ≤ n) :
    primeClass n p = {p} := by
  ext m
  constructor
  · intro hm
    obtain ⟨t, htpos, htlt, hmt⟩ :=
      primeClass_multiple_below n p m 2 hm (by omega)
    have ht : t = 1 := by omega
    simp only [Finset.mem_singleton]
    simpa [ht] using hmt
  · intro hm
    have heq : m = p := Finset.mem_singleton.mp hm
    subst m
    exact prime_mem_primeClass n p hp hle

/-- In (n/3,n/2] the class has exactly the prime and its double. -/
theorem leaf_prime_class_eq (n p : ℕ) (hp : Nat.Prime p)
    (hthird : n / 3 < p) (hhalf : p ≤ n / 2) :
    primeClass n p = {p, 2 * p} := by
  ext m
  constructor
  · intro hm
    obtain ⟨t, htpos, htlt, hmt⟩ :=
      primeClass_multiple_below n p m 3 hm (by omega)
    have hcases : t = 1 ∨ t = 2 := by omega
    rcases hcases with ht | ht
    · simp [ht, hmt]
    · simp [ht, hmt]
  · intro hm
    simp only [Finset.mem_insert, Finset.mem_singleton] at hm
    rcases hm with heq | heq
    · subst m
      exact prime_mem_primeClass n p hp (by omega)
    · subst m
      exact two_mul_prime_mem_class n p hp (by omega)

/-- In (n/4,n/3] the class consists of p, 2p, and 3p for n≥12. -/
theorem intermediate_prime_class_eq (n p : ℕ) (hn : 12 ≤ n)
    (hp : Nat.Prime p) (hquarter : n / 4 < p)
    (hthird : p ≤ n / 3) :
    primeClass n p = {p, 2 * p, 3 * p} := by
  have hp3 : 3 ≤ p := by omega
  ext m
  constructor
  · intro hm
    obtain ⟨t, htpos, htlt, hmt⟩ :=
      primeClass_multiple_below n p m 4 hm (by omega)
    have hcases : t = 1 ∨ t = 2 ∨ t = 3 := by omega
    rcases hcases with ht | ht | ht
    · simp [ht, hmt]
    · simp [ht, hmt]
    · simp [ht, hmt]
  · intro hm
    simp only [Finset.mem_insert, Finset.mem_singleton] at hm
    rcases hm with heq | heq | heq
    · subst m
      exact prime_mem_primeClass n p hp (by omega)
    · subst m
      exact two_mul_prime_mem_class n p hp (by omega)
    · subst m
      exact three_mul_prime_mem_class n p hp hp3 (by omega)

/-- Class 3 supplies the even endpoint 6 and the bridge endpoint 9
when n≥12. -/
theorem three_class_bridge_vertices (n : ℕ) (hn : 12 ≤ n) :
    6 ∈ primeClass n 3 ∧ 9 ∈ primeClass n 3 ∧ 6 ≠ 9 := by
  have hp : Nat.Prime 3 := by norm_num
  constructor
  · simpa using two_mul_prime_mem_class n 3 hp (by omega)
  constructor
  · simpa using three_mul_prime_mem_class n 3 hp (by omega) (by omega)
  · norm_num


/-!
## Paths with prescribed endpoints in a prime class
-/

/-- List every member of a prime class exactly once, placing two
distinct prescribed members at the beginning and end. -/
noncomputable def orderedPrimeClass (n p u v : ℕ) : List ℕ := by
  classical
  exact u :: (((primeClass n p).erase u).erase v).toList ++ [v]

theorem orderedPrimeClass_mem (n p u v m : ℕ)
    (hu : u ∈ primeClass n p) (hv : v ∈ primeClass n p)
    (hm : m ∈ orderedPrimeClass n p u v) :
    m ∈ primeClass n p := by
  classical
  change m ∈ u :: (((primeClass n p).erase u).erase v).toList ++ [v] at hm
  rcases List.mem_cons.mp hm with heq | ht
  · simpa [heq] using hu
  rcases List.mem_append.mp ht with hmid | hlast
  · exact (Finset.mem_erase.mp
      (Finset.mem_erase.mp (Finset.mem_toList.mp hmid)).2).2
  · have heq : m = v := by simpa using hlast
    simpa [heq] using hv

/-- The prescribed-endpoint ordering covers precisely its class. -/
theorem orderedPrimeClass_toFinset (n p u v : ℕ)
    (hu : u ∈ primeClass n p) (hv : v ∈ primeClass n p) :
    (orderedPrimeClass n p u v).toFinset = primeClass n p := by
  classical
  ext m
  simp only [List.mem_toFinset]
  constructor
  · exact orderedPrimeClass_mem n p u v m hu hv
  · intro hm
    by_cases hmu : m = u
    · subst m
      simp [orderedPrimeClass]
    by_cases hmv : m = v
    · subst m
      simp [orderedPrimeClass]
    · simp [orderedPrimeClass, hm, hmu, hmv]

/-- The ordering has no repeated vertex when endpoints are distinct. -/
theorem orderedPrimeClass_nodup (n p u v : ℕ) (huv : u ≠ v) :
    (orderedPrimeClass n p u v).Nodup := by
  classical
  unfold orderedPrimeClass
  apply List.nodup_cons.mpr
  constructor
  · simp [Finset.mem_erase, huv]
  · apply List.nodup_append'.mpr
    refine ⟨Finset.nodup_toList _, by simp, ?_⟩
    intro m hm hv
    have hnot : m ≠ v :=
      (Finset.mem_erase.mp (Finset.mem_toList.mp hm)).1
    exact hnot (by simpa using hv)

/-- The prescribed-endpoint class ordering is a noncoprime chain. -/
theorem orderedPrimeClass_chain (n p u v : ℕ)
    (hp : Nat.Prime p)
    (hu : u ∈ primeClass n p) (hv : v ∈ primeClass n p) :
    NonCoprimeChain (orderedPrimeClass n p u v) := by
  apply primeClass_chain n p hp
  intro m hm
  exact orderedPrimeClass_mem n p u v m hu hv hm

/-- The prescribed path starts at u. -/
theorem orderedPrimeClass_head (n p u v : ℕ) :
    (orderedPrimeClass n p u v).head? = some u := by
  simp [orderedPrimeClass]

/-- The prescribed path ends at v. -/
theorem orderedPrimeClass_last (n p u v : ℕ) :
    (orderedPrimeClass n p u v).getLast? = some v := by
  change ((u :: (((primeClass n p).erase u).erase v).toList) ++ [v]).getLast? =
    some v
  rw [List.getLast?_append_cons]
  rfl

/-- A prescribed-endpoint ordering is a permutation of the class list. -/
theorem orderedPrimeClass_perm (n p u v : ℕ)
    (hu : u ∈ primeClass n p) (hv : v ∈ primeClass n p)
    (huv : u ≠ v) :
    (orderedPrimeClass n p u v).Perm (primeClass n p).toList := by
  classical
  apply List.perm_of_nodup_nodup_toFinset_eq
    (orderedPrimeClass_nodup n p u v huv)
    (Finset.nodup_toList _)
  simpa using orderedPrimeClass_toFinset n p u v hu hv


/-- Two intermediate prime classes can be joined along their
multiple-of-three endpoints into one noncoprime path. -/
theorem paired_intermediate_classes_chain (n p q : ℕ) (hn : 12 ≤ n)
    (hp : Nat.Prime p) (hq : Nat.Prime q)
    (hpquarter : n / 4 < p) (hpthird : p ≤ n / 3)
    (hqquarter : n / 4 < q) (hqthird : q ≤ n / 3) :
    NonCoprimeChain
      (orderedPrimeClass n p (2 * p) (3 * p) ++
       orderedPrimeClass n q (3 * q) (2 * q)) := by
  obtain ⟨hp2, hp3, _⟩ :=
    intermediate_prime_endpoints n p hn hp hpquarter hpthird
  obtain ⟨hq2, hq3, _⟩ :=
    intermediate_prime_endpoints n q hn hq hqquarter hqthird
  apply join_three_ended_paths
  · exact orderedPrimeClass_chain n p (2 * p) (3 * p) hp hp2 hp3
  · exact orderedPrimeClass_chain n q (3 * q) (2 * q) hq hq3 hq2
  · intro x hx
    have heq : 3 * p = x := by
      simpa [orderedPrimeClass_last] using hx
    subst x
    exact ⟨p, rfl⟩
  · intro y hy
    have heq : 3 * q = y := by
      simpa [orderedPrimeClass_head] using hy
    subst y
    exact ⟨q, rfl⟩

/-- An unpaired intermediate class may be bridged through the
class of 3 along the edge 9--3p. -/
theorem intermediate_three_bridge_chain (n p : ℕ) (hn : 12 ≤ n)
    (hp : Nat.Prime p) (hquarter : n / 4 < p)
    (hthird : p ≤ n / 3) :
    NonCoprimeChain
      (orderedPrimeClass n 3 6 9 ++
       orderedPrimeClass n p (3 * p) (2 * p)) := by
  obtain ⟨h6, h9, _⟩ := three_class_bridge_vertices n hn
  obtain ⟨h2, h3, _⟩ :=
    intermediate_prime_endpoints n p hn hp hquarter hthird
  apply join_three_ended_paths
  · exact orderedPrimeClass_chain n 3 6 9 (by norm_num) h6 h9
  · exact orderedPrimeClass_chain n p (3 * p) (2 * p) hp h3 h2
  · intro x hx
    have heq : 9 = x := by
      simpa [orderedPrimeClass_last] using hx
    subst x
    exact ⟨3, rfl⟩
  · intro y hy
    have heq : 3 * p = y := by
      simpa [orderedPrimeClass_head] using hy
    subst y
    exact ⟨p, rfl⟩


/-!
## Arithmetic capacity for assembling class paths
-/

/-- The intermediate primes whose classes are paired in the construction. -/
def intermediatePrimes (n : ℕ) : Finset ℕ :=
  (n / 3).primesLE \ (n / 4).primesLE

theorem intermediatePrimes_card (n : ℕ) :
    (intermediatePrimes n).card = pi (n / 3) - pi (n / 4) := by
  have hsub : (n / 4).primesLE ⊆ (n / 3).primesLE := by
    intro p hp
    obtain ⟨hle, hprime⟩ := Nat.mem_primesLE.mp hp
    exact Nat.mem_primesLE.mpr ⟨by omega, hprime⟩
  simpa [intermediatePrimes, pi, Nat.primesLE_card_eq_primeCounting]
    using Finset.card_sdiff_of_subset hsub

theorem mem_intermediatePrimes {n p : ℕ} :
    p ∈ intermediatePrimes n ↔
      Nat.Prime p ∧ n / 4 < p ∧ p ≤ n / 3 := by
  constructor
  · intro h
    obtain ⟨hm, hnot⟩ := Finset.mem_sdiff.mp h
    obtain ⟨hle, hp⟩ := Nat.mem_primesLE.mp hm
    have hbig : n / 4 < p := by
      by_contra hsmall
      exact hnot (Nat.mem_primesLE.mpr ⟨by omega, hp⟩)
    exact ⟨hp, hbig, hle⟩
  · rintro ⟨hp, hbig, hle⟩
    apply Finset.mem_sdiff.mpr
    constructor
    · exact Nat.mem_primesLE.mpr ⟨hle, hp⟩
    · intro hsmall
      have hle' := (Nat.mem_primesLE.mp hsmall).1
      omega

/-- Number of even-ended units produced by the small classes and
paired intermediate classes. -/
def evenUnitCount (n : ℕ) : ℕ :=
  pi (n / 4) + (intermediatePrimes n).card / 2

/-- The known Landau prime-counting inequality supplies sufficient
even-ended units for all leaf-class attachments. The Landau
inequality is a *hypothesis* here, not asserted as a Lean theorem. -/
theorem landau_implies_attachment_capacity (n : ℕ) (hn : 12 ≤ n)
    (hlandau : pi (n / 2) ≤ 2 * pi (n / 4)) :
    max 1 (((pi (n / 2) - pi (n / 3)) + 1) / 2) ≤
      evenUnitCount n := by
  have htwo : 2 ≤ n / 4 := by omega
  have hpos : 0 < pi (n / 4) := by
    have hh : (n / 4).primesLE.Nonempty :=
      ⟨2, Nat.mem_primesLE.mpr ⟨htwo, by norm_num⟩⟩
    simpa [pi, Nat.primesLE_card_eq_primeCounting] using
      (Finset.card_pos.mpr hh)
  have hdiff : pi (n / 2) - pi (n / 3) ≤ 2 * pi (n / 4) :=
    by omega
  unfold evenUnitCount
  omega

#print axioms primeClass_partition
#print axioms orderedPrimeClass_perm
#print axioms paired_intermediate_classes_chain
#print axioms intermediate_three_bridge_chain
#print axioms landau_implies_attachment_capacity


/-!
## Even-ended core paths and leaf-class pairing

An even-ended core path permits all leaf-prime classes to be assembled
in pairs without invoking an inequality for the prime-counting function.
-/

/-- A nonempty path whose first and last vertices are even. -/
def EvenEnded (a : List ℕ) : Prop :=
  ∃ u v, a.head? = some u ∧ a.getLast? = some v ∧ 2 ∣ u ∧ 2 ∣ v

/-- Concatenating two even-ended noncoprime paths preserves the
noncoprime-chain property and both even endpoints. -/
theorem append_even_ended (a b : List ℕ)
    (ha : NonCoprimeChain a) (hb : NonCoprimeChain b)
    (hea : EvenEnded a) (heb : EvenEnded b) :
    NonCoprimeChain (a ++ b) ∧ EvenEnded (a ++ b) := by
  obtain ⟨u, v, hau, hav, hu, hv⟩ := hea
  obtain ⟨w, z, hbw, hbz, hw, hz⟩ := heb
  have hchain : NonCoprimeChain (a ++ b) := by
    apply join_even_ended_paths a b ha hb
    · intro x hx
      have heq : v = x := by simpa [hav] using hx
      simpa [← heq] using hv
    · intro y hy
      have heq : w = y := by simpa [hbw] using hy
      simpa [← heq] using hw
  have hane : a ≠ [] := by
    intro h
    simp [h] at hau
  have hbne : b ≠ [] := by
    intro h
    simp [h] at hbw
  refine ⟨hchain, u, z, ?_, ?_, hu, hz⟩
  · rw [List.head?_append_of_ne_nil a hane, hau]
  · rw [List.getLast?_append_of_ne_nil a hbne, hbz]

/-- For any prime p, the two-vertex leaf path p--2p is
a simple noncoprime chain ending at an even vertex. -/
theorem leaf_left_chain (p : ℕ) (hp : Nat.Prime p) :
    NonCoprimeChain [p, 2 * p] := by
  exact (List.isChain_pair).2
    (common_prime_divisor_noncoprime hp (dvd_refl p)
      ⟨2, by omega⟩)

/-- The reverse leaf class ends at the prime vertex p. -/
theorem leaf_right_chain (p : ℕ) (hp : Nat.Prime p) :
    NonCoprimeChain [2 * p, p] := by
  exact (List.isChain_pair).2
    (common_prime_divisor_noncoprime hp
      ⟨2, by omega⟩ (dvd_refl p))

/-- Two distinct leaf-prime classes can form a noncoprime path
without using any vertex of the even-ended core. -/
theorem paired_leaf_classes_chain (p q : ℕ)
    (hp : Nat.Prime p) (hq : Nat.Prime q) :
    NonCoprimeChain [p, 2 * p, 2 * q, q] := by
  simp only [NonCoprimeChain, List.isChain_cons_cons,
    List.IsChain.singleton, and_true]
  refine ⟨?_, ?_, ?_⟩
  · exact common_prime_divisor_noncoprime hp (dvd_refl p)
      ⟨2, by omega⟩
  · exact common_prime_divisor_noncoprime
      (by norm_num : Nat.Prime 2)
      ⟨p, by omega⟩ ⟨q, by omega⟩
  · exact common_prime_divisor_noncoprime hq
      ⟨2, by omega⟩ (dvd_refl q)

/-- An unmatched leaf class may be attached to the even-ended
core path, with no use of prime-counting estimates. -/
theorem unpaired_leaf_with_core_chain (p : ℕ) (hp : Nat.Prime p)
    (core : List ℕ) (hc : NonCoprimeChain core)
    (he : EvenEnded core) :
    NonCoprimeChain ([p, 2 * p] ++ core) := by
  obtain ⟨u, v, hu, hv, h2u, h2v⟩ := he
  apply join_prime_ended_paths 2 (by norm_num)
    [p, 2 * p] core (leaf_left_chain p hp) hc
  · intro x hx
    have hxx : 2 * p = x := by simpa using hx
    subst x
    exact ⟨p, by omega⟩
  · intro y hy
    have hyy : u = y := by simpa [hu] using hy
    simpa [← hyy] using h2u

/-- One paired leaf path can absorb the core by inserting it
between its two even vertices. -/
theorem paired_leaf_with_core_chain (p q : ℕ)
    (hp : Nat.Prime p) (hq : Nat.Prime q)
    (core : List ℕ) (hc : NonCoprimeChain core)
    (he : EvenEnded core) :
    NonCoprimeChain ([p, 2 * p] ++ core ++ [2 * q, q]) := by
  obtain ⟨u, v, hu, hv, h2u, h2v⟩ := he
  have hleft : NonCoprimeChain ([p, 2 * p] ++ core) :=
    unpaired_leaf_with_core_chain p hp core hc ⟨u, v, hu, hv, h2u, h2v⟩
  apply join_prime_ended_paths 2 (by norm_num)
    ([p, 2 * p] ++ core) [2 * q, q] hleft (leaf_right_chain q hq)
  · intro x hx
    have heq : v = x := by
      have hlast : ([p, 2 * p] ++ core).getLast? = some v := by
        rw [List.getLast?_append_of_ne_nil]
        · exact hv
        · intro h
          simp [h] at hu
      have hx' : x ∈ (some v : Option ℕ) := by
        rw [← hlast]
        exact hx
      simpa using hx'
    simpa [← heq] using h2v
  · intro y hy
    have heq : 2 * q = y := by simpa using hy
    simpa [← heq] using (show 2 ∣ 2 * q from ⟨q, by omega⟩)


/-- Pack leaf-prime classes into pairs, inserting the even-ended core
in the final pair (or next to the final unpaired prime). No capacity
hypothesis is needed: every pair uses its own even multiples. -/
def packLeafClasses (core : List ℕ) : List ℕ → List (List ℕ)
  | [] => [core]
  | [p] => [[p, 2 * p] ++ core]
  | [p, q] => [[p, 2 * p] ++ core ++ [2 * q, q]]
  | p :: q :: r :: rs =>
      [p, 2 * p, 2 * q, q] :: packLeafClasses core (r :: rs)

/-- Pair packing creates the exact required number of nonisolated
paths, regardless of how many leaf-prime classes are present. -/
theorem packLeafClasses_length (core : List ℕ) :
    ∀ leafs : List ℕ,
      (packLeafClasses core leafs).length =
        max 1 ((leafs.length + 1) / 2) := by
  intro leafs
  induction leafs using List.twoStepInduction with
  | nil =>
      norm_num [packLeafClasses]
  | singleton p =>
      norm_num [packLeafClasses]
  | cons_cons p q rest ih =>
      cases rest with
      | nil =>
          norm_num [packLeafClasses]
      | cons r rs =>
          have hi := ih
          simp only [packLeafClasses, List.length_cons] at hi ⊢
          omega

/-- Every packed leaf component is a noncoprime path when the
core is an even-ended noncoprime path. -/
theorem packLeafClasses_chains (core : List ℕ)
    (hc : NonCoprimeChain core) (he : EvenEnded core) :
    ∀ (leafs : List ℕ),
      (∀ p ∈ leafs, Nat.Prime p) →
      ∀ path ∈ packLeafClasses core leafs, NonCoprimeChain path := by
  intro leafs
  induction leafs using List.twoStepInduction with
  | nil =>
      intro _ path hm
      have hpath : path = core := by simpa [packLeafClasses] using hm
      subst path
      exact hc
  | singleton p =>
      intro hprime path hm
      have hpath : path = [p, 2 * p] ++ core := by
        simpa [packLeafClasses] using hm
      subst path
      exact unpaired_leaf_with_core_chain p
        (hprime p (by simp)) core hc he
  | cons_cons p q rest ih =>
      intro hprime path hm
      have hp : Nat.Prime p := hprime p (by simp)
      have hq : Nat.Prime q := hprime q (by simp)
      cases rest with
      | nil =>
          have hpath : path = [p, 2 * p] ++ core ++ [2 * q, q] := by
            simpa [packLeafClasses] using hm
          subst path
          exact paired_leaf_with_core_chain p q hp hq core hc he
      | cons r rs =>
          have hrest : ∀ x ∈ r :: rs, Nat.Prime x := by
            intro x hx
            exact hprime x (by simp [hx])
          have hmem : path ∈
              [p, 2 * p, 2 * q, q] :: packLeafClasses core (r :: rs) := by
            simpa only [packLeafClasses] using hm
          rcases List.mem_cons.mp hmem with heq | ht
          · subst path
            exact paired_leaf_classes_chain p q hp hq
          · exact ih hrest path ht


/-- Split an arbitrary list into consecutive pairs and at most one
unpaired final element. -/
def splitPrimePairs : List ℕ → List (ℕ × ℕ) × Option ℕ
  | [] => ([], none)
  | [p] => ([], some p)
  | p :: q :: rest =>
      let split := splitPrimePairs rest
      ((p, q) :: split.1, split.2)

/-- The pair splitting loses no elements: unfolding the pairs and
optional leftover reproduces the input list in its original order. -/
theorem splitPrimePairs_recompose :
    ∀ ps : List ℕ,
      (splitPrimePairs ps).1.flatMap (fun pq => [pq.1, pq.2]) ++
        (splitPrimePairs ps).2.toList = ps := by
  intro ps
  induction ps using List.twoStepInduction with
  | nil => rfl
  | singleton p => rfl
  | cons_cons p q rest ih =>
      simp only [splitPrimePairs, List.flatMap_cons, List.append_assoc]
      simpa using congrArg (fun t => p :: q :: t) ih

/-- The number of paired items in a split is exactly twice the
number of resulting pairs, with one additional item if unmatched. -/
theorem splitPrimePairs_length (ps : List ℕ) :
    2 * (splitPrimePairs ps).1.length +
      (splitPrimePairs ps).2.toList.length = ps.length := by
  induction ps using List.twoStepInduction with
  | nil => rfl
  | singleton p => rfl
  | cons_cons p q rest ih =>
      simp only [splitPrimePairs, List.length_cons, Option.toList]
        at ih ⊢
      omega


/-- Any nonempty list of even-ended noncoprime paths can be flattened
to a single even-ended noncoprime path. -/
theorem flatten_even_ended_units :
    ∀ units : List (List ℕ), units ≠ [] →
      (∀ unit ∈ units, NonCoprimeChain unit ∧ EvenEnded unit) →
      NonCoprimeChain units.flatten ∧ EvenEnded units.flatten := by
  intro units
  induction units with
  | nil =>
      intro h
      exact (h rfl).elim
  | cons a rest ih =>
      intro _ hgood
      have ha : NonCoprimeChain a ∧ EvenEnded a :=
        hgood a (by simp)
      cases rest with
      | nil =>
          simpa using ha
      | cons b bs =>
          have hrest : ∀ unit ∈ b :: bs,
              NonCoprimeChain unit ∧ EvenEnded unit := by
            intro unit hu
            exact hgood unit (by simp [hu])
          have htail := ih (by simp) hrest
          simpa only [List.flatten_cons] using
            append_even_ended a (List.flatten (b :: bs))
              ha.1 htail.1 ha.2 htail.2

/-- The even-ended path through one small prime class. -/
noncomputable def smallEvenUnit (n p : ℕ) : List ℕ :=
  orderedPrimeClass n p (2 * p) (4 * p)

/-- The even-ended path through two paired intermediate classes. -/
noncomputable def intermediateEvenUnit (n : ℕ) (pq : ℕ × ℕ) : List ℕ :=
  orderedPrimeClass n pq.1 (2 * pq.1) (3 * pq.1) ++
    orderedPrimeClass n pq.2 (3 * pq.2) (2 * pq.2)

/-- The class of prime 3, optionally bridged to one unpaired
intermediate class. -/
noncomputable def threeEvenUnit (n : ℕ) : Option ℕ → List ℕ
  | none => orderedPrimeClass n 3 6 12
  | some p =>
      orderedPrimeClass n 3 6 9 ++
        orderedPrimeClass n p (3 * p) (2 * p)

/-- Small prime classes admit noncoprime even-ended paths. -/
theorem smallEvenUnit_good (n p : ℕ) (hp : Nat.Prime p)
    (hbound : 4 * p ≤ n) :
    NonCoprimeChain (smallEvenUnit n p) ∧
      EvenEnded (smallEvenUnit n p) := by
  obtain ⟨hu, hv, _⟩ := small_prime_even_endpoints n p hp hbound
  have hc : NonCoprimeChain (smallEvenUnit n p) :=
    orderedPrimeClass_chain n p (2 * p) (4 * p) hp hu hv
  refine ⟨hc, 2 * p, 4 * p, ?_, ?_, ?_, ?_⟩
  · exact orderedPrimeClass_head n p (2 * p) (4 * p)
  · exact orderedPrimeClass_last n p (2 * p) (4 * p)
  · exact ⟨p, by omega⟩
  · exact ⟨2 * p, by omega⟩

/-- Paired intermediate classes admit noncoprime even-ended paths. -/
theorem intermediateEvenUnit_good (n p q : ℕ) (hn : 12 ≤ n)
    (hp : p ∈ intermediatePrimes n)
    (hq : q ∈ intermediatePrimes n) :
    NonCoprimeChain (intermediateEvenUnit n (p, q)) ∧
      EvenEnded (intermediateEvenUnit n (p, q)) := by
  obtain ⟨hpp, hpquarter, hpthird⟩ := mem_intermediatePrimes.mp hp
  obtain ⟨hqq, hqquarter, hqthird⟩ := mem_intermediatePrimes.mp hq
  have hc := paired_intermediate_classes_chain n p q hn
    hpp hqq hpquarter hpthird hqquarter hqthird
  let a := orderedPrimeClass n p (2 * p) (3 * p)
  let b := orderedPrimeClass n q (3 * q) (2 * q)
  have ha : a.head? = some (2 * p) := orderedPrimeClass_head ..
  have hb : b.getLast? = some (2 * q) := orderedPrimeClass_last ..
  have hane : a ≠ [] := by intro h; simp [h] at ha
  have hbne : b ≠ [] := by intro h; simp [h] at hb
  refine ⟨hc, 2 * p, 2 * q, ?_, ?_, ?_, ?_⟩
  · change (a ++ b).head? = some (2 * p)
    rw [List.head?_append_of_ne_nil a hane]
    exact ha
  · change (a ++ b).getLast? = some (2 * q)
    rw [List.getLast?_append_of_ne_nil a hbne]
    exact hb
  · exact ⟨p, by omega⟩
  · exact ⟨q, by omega⟩

/-- With no unmatched intermediate class, class 3 itself provides
an even-ended core unit. -/
theorem threeEvenUnit_none_good (n : ℕ) (hn : 12 ≤ n) :
    NonCoprimeChain (threeEvenUnit n none) ∧
      EvenEnded (threeEvenUnit n none) := by
  have hp : Nat.Prime 3 := by norm_num
  have hh := smallEvenUnit_good n 3 hp (by omega)
  simpa [threeEvenUnit, smallEvenUnit, show 2 * 3 = 6 by omega,
    show 4 * 3 = 12 by omega] using hh

/-- With one unmatched intermediate class, the prime-3 bridge
remains even-ended. -/
theorem threeEvenUnit_some_good (n p : ℕ) (hn : 12 ≤ n)
    (hp : p ∈ intermediatePrimes n) :
    NonCoprimeChain (threeEvenUnit n (some p)) ∧
      EvenEnded (threeEvenUnit n (some p)) := by
  obtain ⟨hpp, hquarter, hthird⟩ := mem_intermediatePrimes.mp hp
  have hc := intermediate_three_bridge_chain n p hn hpp hquarter hthird
  let a := orderedPrimeClass n 3 6 9
  let b := orderedPrimeClass n p (3 * p) (2 * p)
  have ha : a.head? = some 6 := orderedPrimeClass_head ..
  have hb : b.getLast? = some (2 * p) := orderedPrimeClass_last ..
  have hane : a ≠ [] := by intro h; simp [h] at ha
  have hbne : b ≠ [] := by intro h; simp [h] at hb
  refine ⟨hc, 6, 2 * p, ?_, ?_, ?_, ?_⟩
  · change (a ++ b).head? = some 6
    rw [List.head?_append_of_ne_nil a hane]
    exact ha
  · change (a ++ b).getLast? = some (2 * p)
    rw [List.getLast?_append_of_ne_nil a hbne]
    exact hb
  · exact ⟨3, by norm_num⟩
  · exact ⟨p, by omega⟩


/-- Every member of a pair produced by splitting belongs to the
original list. -/
theorem splitPrimePairs_pair_mem (ps : List ℕ) (pair : ℕ × ℕ)
    (hp : pair ∈ (splitPrimePairs ps).1) :
    pair.1 ∈ ps ∧ pair.2 ∈ ps := by
  have hrec := splitPrimePairs_recompose ps
  have hleft : pair.1 ∈
      (splitPrimePairs ps).1.flatMap (fun pq => [pq.1, pq.2]) := by
    apply List.mem_flatMap.mpr
    exact ⟨pair, hp, by simp⟩
  have hright : pair.2 ∈
      (splitPrimePairs ps).1.flatMap (fun pq => [pq.1, pq.2]) := by
    apply List.mem_flatMap.mpr
    exact ⟨pair, hp, by simp⟩
  constructor
  · rw [← hrec]
    exact List.mem_append.mpr (Or.inl hleft)
  · rw [← hrec]
    exact List.mem_append.mpr (Or.inl hright)

/-- The optional unmatched element of a split belongs to its input. -/
theorem splitPrimePairs_spare_mem (ps : List ℕ) (p : ℕ)
    (hp : (splitPrimePairs ps).2 = some p) : p ∈ ps := by
  rw [← splitPrimePairs_recompose ps]
  apply List.mem_append.mpr
  right
  simp [hp]

/-- The list of core units, starting with the class of prime 3.
The optional spare intermediate class is included in this first unit.
Remaining small classes and paired intermediate classes follow. -/
noncomputable def coreUnits (n : ℕ) : List (List ℕ) := by
  classical
  let mids := splitPrimePairs (intermediatePrimes n).toList
  exact threeEvenUnit n mids.2 ::
      (((n / 4).primesLE.erase 3).toList.map (smallEvenUnit n) ++
        mids.1.map (intermediateEvenUnit n))

/-- Concatenation of the core units. -/
noncomputable def corePath (n : ℕ) : List ℕ :=
  (coreUnits n).flatten

/-- Every unit of the core is a noncoprime even-ended path. -/
theorem coreUnits_good (n : ℕ) (hn : 12 ≤ n) :
    ∀ unit ∈ coreUnits n, NonCoprimeChain unit ∧ EvenEnded unit := by
  classical
  intro unit hu
  simp only [coreUnits, List.mem_cons, List.mem_append,
    List.mem_map] at hu
  rcases hu with hfirst | hsmall | hpaired
  · subst unit
    cases hs : (splitPrimePairs (intermediatePrimes n).toList).2 with
    | none =>
        exact threeEvenUnit_none_good n hn
    | some p =>
        have hp : p ∈ intermediatePrimes n := by
          apply Finset.mem_toList.mp
          exact splitPrimePairs_spare_mem
            (intermediatePrimes n).toList p hs
        exact threeEvenUnit_some_good n p hn hp
  · obtain ⟨p, hp, hunit⟩ := hsmall
    subst unit
    have hmem : p ∈ (n / 4).primesLE :=
      (Finset.mem_erase.mp (Finset.mem_toList.mp hp)).2
    obtain ⟨hpn, hprime⟩ := Nat.mem_primesLE.mp hmem
    exact smallEvenUnit_good n p hprime (by omega)
  · obtain ⟨pair, hpair, hunit⟩ := hpaired
    subst unit
    obtain ⟨hp, hq⟩ := splitPrimePairs_pair_mem
      (intermediatePrimes n).toList pair hpair
    exact intermediateEvenUnit_good n pair.1 pair.2 hn
      (Finset.mem_toList.mp hp) (Finset.mem_toList.mp hq)

/-- The assembled core path is nonempty, noncoprime, and even-ended,
with no appeal to the Landau prime-counting inequality. -/
theorem corePath_chain_even (n : ℕ) (hn : 12 ≤ n) :
    NonCoprimeChain (corePath n) ∧ EvenEnded (corePath n) := by
  unfold corePath
  apply flatten_even_ended_units (coreUnits n)
  · unfold coreUnits
    simp
  · exact coreUnits_good n hn


/-!
## Permutations of the largest-prime-factor class catalog
-/

/-- Concatenate the complete prime-factor classes indexed by a list
of primes. -/
noncomputable def classConcat (n : ℕ) (ps : List ℕ) : List ℕ :=
  ps.flatMap (fun p => (primeClass n p).toList)

theorem mem_classConcat (n m : ℕ) (ps : List ℕ) :
    m ∈ classConcat n ps ↔
      ∃ p ∈ ps, m ∈ primeClass n p := by
  simp only [classConcat, List.mem_flatMap, Finset.mem_toList]

/-- Distinct prime-factor classes have disjoint vertex lists. -/
theorem primeClass_toList_disjoint (n p q : ℕ) (hpq : p ≠ q) :
    List.Disjoint (primeClass n p).toList (primeClass n q).toList := by
  apply List.disjoint_left.mpr
  intro x hx hy
  have hd := primeClass_disjoint n p q hpq
  exact (Finset.disjoint_left.mp hd)
    (Finset.mem_toList.mp hx) (Finset.mem_toList.mp hy)

/-- Concatenating distinct prime-factor classes never repeats
a vertex. -/
theorem classConcat_nodup (n : ℕ) (ps : List ℕ) (hps : ps.Nodup) :
    (classConcat n ps).Nodup := by
  classical
  apply List.nodup_flatMap.mpr
  refine ⟨?_, ?_⟩
  · intro p hp
    exact Finset.nodup_toList _
  · exact hps.imp (fun {_ _} hpq => primeClass_toList_disjoint n _ _ hpq)

/-- Reordering the indices merely permutes the concatenated class
catalog. -/
theorem classConcat_congr_perm (n : ℕ) (ps qs : List ℕ)
    (hpq : ps.Perm qs) :
    (classConcat n ps).Perm (classConcat n qs) := by
  unfold classConcat
  exact hpq.flatMap_right _

/-- The union of prime-factor classes indexed by ps is precisely
the set of vertices occurring in their concatenated lists. -/
theorem classConcat_toFinset (n : ℕ) (ps : List ℕ) :
    (classConcat n ps).toFinset =
      ps.toFinset.biUnion (primeClass n) := by
  classical
  ext m
  simp only [List.mem_toFinset, Finset.mem_biUnion, mem_classConcat]


/-- Small and intermediate primes partition the primes at most n/3. -/
theorem small_intermediate_partition (n : ℕ) :
    (n / 4).primesLE ∪ intermediatePrimes n =
      (n / 3).primesLE := by
  ext p
  simp only [Finset.mem_union, Nat.mem_primesLE, mem_intermediatePrimes]
  constructor
  · rintro (⟨hle, hp⟩ | ⟨hp, _, hle⟩)
    · exact ⟨by omega, hp⟩
    · exact ⟨hle, hp⟩
  · rintro ⟨hle, hp⟩
    by_cases hs : p ≤ n / 4
    · exact Or.inl ⟨hs, hp⟩
    · exact Or.inr ⟨hp, by omega, hle⟩

/-- The three disjoint arithmetic prime ranges partition all
primes up to n. -/
theorem prime_segments_partition (n : ℕ) :
    (n / 3).primesLE ∪ middlePrimes n ∪ largePrimes n =
      n.primesLE := by
  ext p
  simp only [Finset.mem_union, Nat.mem_primesLE,
    mem_middlePrimes, mem_largePrimes]
  constructor
  · rintro ((⟨hle, hp⟩ | ⟨hp, _, hle⟩) | ⟨hp, _, hle⟩)
    · exact ⟨by omega, hp⟩
    · exact ⟨by omega, hp⟩
    · exact ⟨hle, hp⟩
  · rintro ⟨hle, hp⟩
    by_cases ht : p ≤ n / 3
    · exact Or.inl (Or.inl ⟨ht, hp⟩)
    by_cases hh : p ≤ n / 2
    · exact Or.inl (Or.inr ⟨hp, by omega, hh⟩)
    · exact Or.inr ⟨hp, by omega, hle⟩

/-- The canonical list of prime indices represented in the core. -/
noncomputable def coreIndices (n : ℕ) : List ℕ :=
  3 :: (((n / 4).primesLE.erase 3).toList ++
    (intermediatePrimes n).toList)

theorem coreIndices_nodup (n : ℕ) (hn : 12 ≤ n) :
    (coreIndices n).Nodup := by
  classical
  unfold coreIndices
  apply List.nodup_cons.mpr
  constructor
  · simp only [List.mem_append, Finset.mem_toList, Finset.mem_erase,
        not_or]
    constructor
    · simp
    · intro hm
      have hgt := (mem_intermediatePrimes.mp hm).2.1
      omega
  · apply List.nodup_append'.mpr
    refine ⟨Finset.nodup_toList _, Finset.nodup_toList _, ?_⟩
    apply List.disjoint_left.mpr
    intro p hp hq
    have hsmall : p ≤ n / 4 :=
      (Nat.mem_primesLE.mp
        (Finset.mem_erase.mp (Finset.mem_toList.mp hp)).2).1
    have hlarge : n / 4 < p :=
      (mem_intermediatePrimes.mp (Finset.mem_toList.mp hq)).2.1
    omega

theorem coreIndices_toFinset (n : ℕ) (hn : 12 ≤ n) :
    (coreIndices n).toFinset = (n / 3).primesLE := by
  classical
  have hthree : 3 ∈ (n / 4).primesLE :=
    Nat.mem_primesLE.mpr ⟨by omega, by norm_num⟩
  have hclean : insert 3 ((n / 4).primesLE.erase 3) =
      (n / 4).primesLE := Finset.insert_erase hthree
  rw [coreIndices]
  simp only [List.toFinset_cons, List.toFinset_append,
    Finset.toList_toFinset]
  rw [← Finset.insert_union]
  rw [hclean]
  exact small_intermediate_partition n

/-- The core prime-index list is a permutation of all primes ≤ n/3. -/
theorem coreIndices_perm (n : ℕ) (hn : 12 ≤ n) :
    (coreIndices n).Perm (n / 3).primesLE.toList := by
  classical
  apply List.perm_of_nodup_nodup_toFinset_eq
    (coreIndices_nodup n hn) (Finset.nodup_toList _)
  simpa using coreIndices_toFinset n hn


/-- Concatenating all largest-prime-factor classes yields precisely
the integers 2,...,n, without repetition. -/
theorem classConcat_all_primes (n : ℕ) :
    (classConcat n n.primesLE.toList).Perm
      (Finset.Icc 2 n).toList := by
  classical
  apply List.perm_of_nodup_nodup_toFinset_eq
    (classConcat_nodup n _ (Finset.nodup_toList _))
    (Finset.nodup_toList _)
  simpa only [classConcat_toFinset, Finset.toList_toFinset] using
    primeClass_partition n

theorem range_one_toFinset (n : ℕ) :
    (List.range' 1 n).toFinset = Finset.Icc 1 n := by
  classical
  ext m
  simp only [List.mem_toFinset, Finset.mem_Icc]
  constructor
  · intro hm
    obtain ⟨i, hi, heq⟩ := List.mem_range'.mp hm
    omega
  · rintro ⟨hpos, hle⟩
    apply List.mem_range'.mpr
    refine ⟨m - 1, by omega, ?_⟩
    omega

theorem range_one_perm_Icc (n : ℕ) :
    (List.range' 1 n).Perm (Finset.Icc 1 n).toList := by
  classical
  apply List.perm_of_nodup_nodup_toFinset_eq
    (List.nodup_range') (Finset.nodup_toList _)
  rw [range_one_toFinset, Finset.toList_toFinset]


/-- Small-class units enumerate their whole class exactly once. -/
theorem smallEvenUnit_perm (n p : ℕ) (hp : Nat.Prime p)
    (hbound : 4 * p ≤ n) :
    (smallEvenUnit n p).Perm (primeClass n p).toList := by
  obtain ⟨hu, hv, hne⟩ := small_prime_even_endpoints n p hp hbound
  exact orderedPrimeClass_perm n p (2 * p) (4 * p) hu hv hne

/-- A paired intermediate unit enumerates both of its classes. -/
theorem intermediateEvenUnit_perm (n p q : ℕ) (hn : 12 ≤ n)
    (hp : p ∈ intermediatePrimes n)
    (hq : q ∈ intermediatePrimes n) :
    (intermediateEvenUnit n (p, q)).Perm (classConcat n [p, q]) := by
  obtain ⟨hpp, hpquarter, hpthird⟩ := mem_intermediatePrimes.mp hp
  obtain ⟨hqq, hqquarter, hqthird⟩ := mem_intermediatePrimes.mp hq
  obtain ⟨hp2, hp3, hpneq⟩ :=
    intermediate_prime_endpoints n p hn hpp hpquarter hpthird
  obtain ⟨hq2, hq3, hqneq⟩ :=
    intermediate_prime_endpoints n q hn hqq hqquarter hqthird
  have h1 := orderedPrimeClass_perm n p (2 * p) (3 * p)
    hp2 hp3 hpneq
  have h2 := orderedPrimeClass_perm n q (3 * q) (2 * q)
    hq3 hq2 hqneq.symm
  simpa [intermediateEvenUnit, classConcat] using h1.append h2

/-- The prime-3 unit without an unmatched intermediate class
enumerates just its own class. -/
theorem threeEvenUnit_none_perm (n : ℕ) (hn : 12 ≤ n) :
    (threeEvenUnit n none).Perm (classConcat n [3]) := by
  have hp : Nat.Prime 3 := by norm_num
  have h := smallEvenUnit_perm n 3 hp (by omega)
  simpa [threeEvenUnit, smallEvenUnit, classConcat] using h

/-- The prime-3 bridge with one unmatched class enumerates both
classes exactly once. -/
theorem threeEvenUnit_some_perm (n p : ℕ) (hn : 12 ≤ n)
    (hp : p ∈ intermediatePrimes n) :
    (threeEvenUnit n (some p)).Perm (classConcat n [3, p]) := by
  obtain ⟨hpp, hquarter, hthird⟩ := mem_intermediatePrimes.mp hp
  obtain ⟨h6, h9, hneq⟩ := three_class_bridge_vertices n hn
  obtain ⟨h2, h3, hneq2⟩ :=
    intermediate_prime_endpoints n p hn hpp hquarter hthird
  have h1 := orderedPrimeClass_perm n 3 6 9 h6 h9 hneq
  have h2 := orderedPrimeClass_perm n p (3 * p) (2 * p)
    h3 h2 hneq2.symm
  simpa [threeEvenUnit, classConcat] using h1.append h2

/-- Pair-unit concatenation is a permutation of the catalogs for
all primes occurring in the pairs, in pair order. -/
theorem intermediateUnits_perm (n : ℕ) (pairs : List (ℕ × ℕ))
    (hn : 12 ≤ n)
    (hpairs : ∀ pair ∈ pairs,
      pair.1 ∈ intermediatePrimes n ∧
        pair.2 ∈ intermediatePrimes n) :
    (pairs.map (intermediateEvenUnit n)).flatten.Perm
      (classConcat n (pairs.flatMap (fun pq => [pq.1, pq.2]))) := by
  induction pairs with
  | nil => simp [classConcat]
  | cons pq rest ih =>
      have hpair := hpairs pq (by simp)
      have htail : ∀ pair ∈ rest,
          pair.1 ∈ intermediatePrimes n ∧
            pair.2 ∈ intermediatePrimes n := by
        intro pair hp
        exact hpairs pair (by simp [hp])
      have hunit := intermediateEvenUnit_perm n pq.1 pq.2
        hn hpair.1 hpair.2
      have hrest := ih htail
      simpa [classConcat, List.map_cons, List.flatten_cons,
        List.flatMap_cons] using hunit.append hrest

/-- Small-unit concatenation enumerates exactly the classes
indexed by the prescribed small-prime list. -/
theorem smallUnits_perm (n : ℕ) (small : List ℕ)
    (hsmall : ∀ p ∈ small, Nat.Prime p ∧ 4 * p ≤ n) :
    (small.map (smallEvenUnit n)).flatten.Perm (classConcat n small) := by
  change (small.flatMap (smallEvenUnit n)).Perm
    (small.flatMap (fun p => (primeClass n p).toList))
  apply List.Perm.flatMap_left
  intro p hp
  obtain ⟨hprime, hbound⟩ := hsmall p hp
  exact smallEvenUnit_perm n p hprime hbound


/-- The complete core path is a permutation of the concatenated
classes indexed by all primes at most n/3. -/
theorem corePath_perm_classConcat (n : ℕ) (hn : 12 ≤ n) :
    (corePath n).Perm (classConcat n (n / 3).primesLE.toList) := by
  classical
  let mids := (intermediatePrimes n).toList
  let sp := splitPrimePairs mids
  let small := ((n / 4).primesLE.erase 3).toList
  let pairIdx := sp.1.flatMap (fun pq => [pq.1, pq.2])

  have hthree : (threeEvenUnit n sp.2).Perm
      (classConcat n (3 :: sp.2.toList)) := by
    cases hopt : sp.2 with
    | none =>
        simpa [hopt] using threeEvenUnit_none_perm n hn
    | some p =>
        have hp : p ∈ intermediatePrimes n := by
          apply Finset.mem_toList.mp
          exact splitPrimePairs_spare_mem mids p (by simpa [sp, mids] using hopt)
        simpa [hopt] using threeEvenUnit_some_perm n p hn hp

  have hsmall : ∀ p ∈ small, Nat.Prime p ∧ 4 * p ≤ n := by
    intro p hp
    have hmem : p ∈ (n / 4).primesLE :=
      (Finset.mem_erase.mp (Finset.mem_toList.mp hp)).2
    obtain ⟨hle, hprime⟩ := Nat.mem_primesLE.mp hmem
    exact ⟨hprime, by omega⟩
  have hsmallPerm : (small.map (smallEvenUnit n)).flatten.Perm
      (classConcat n small) :=
    smallUnits_perm n small hsmall

  have hpairs : ∀ pq ∈ sp.1,
      pq.1 ∈ intermediatePrimes n ∧ pq.2 ∈ intermediatePrimes n := by
    intro pq hp
    obtain ⟨hp1, hp2⟩ :=
      splitPrimePairs_pair_mem mids pq (by simpa [sp, mids] using hp)
    exact ⟨Finset.mem_toList.mp hp1, Finset.mem_toList.mp hp2⟩
  have hpairsPerm : (sp.1.map (intermediateEvenUnit n)).flatten.Perm
      (classConcat n pairIdx) := by
    simpa [pairIdx] using intermediateUnits_perm n sp.1 hn hpairs

  have hsum : (corePath n).Perm
      (classConcat n ((3 :: sp.2.toList) ++ small ++ pairIdx)) := by
    have hh := hthree.append (hsmallPerm.append hpairsPerm)
    simpa [corePath, coreUnits, mids, sp, small, pairIdx,
      classConcat, List.flatMap_append, List.flatten_append,
      List.map_append, List.append_assoc] using hh

  have hrecompose : pairIdx ++ sp.2.toList = mids := by
    simpa [pairIdx, sp, mids] using splitPrimePairs_recompose mids
  have hindices : ((3 :: sp.2.toList) ++ small ++ pairIdx).Perm
      (coreIndices n) := by
    have hswap : (sp.2.toList ++ (small ++ pairIdx)).Perm
        ((small ++ pairIdx) ++ sp.2.toList) := List.perm_append_comm
    have hswap' : (sp.2.toList ++ small ++ pairIdx).Perm
        (small ++ mids) := by
      simpa [List.append_assoc, hrecompose] using hswap
    simpa [coreIndices, small, mids, List.append_assoc] using
      hswap'.cons 3

  have hcore : (corePath n).Perm (classConcat n (coreIndices n)) :=
    hsum.trans (classConcat_congr_perm n _ _ hindices)
  exact hcore.trans (classConcat_congr_perm n _ _
    (coreIndices_perm n hn))

/-- No vertex is repeated in the core path. -/
theorem corePath_nodup (n : ℕ) (hn : 12 ≤ n) :
    (corePath n).Nodup := by
  have hd : (classConcat n (n / 3).primesLE.toList).Nodup :=
    classConcat_nodup n _ (Finset.nodup_toList _)
  exact (corePath_perm_classConcat n hn).nodup_iff.mpr hd


/-- Leaf-class packing preserves the multiset of all core vertices
and all vertices p,2p from the leaf list. -/
theorem packLeafClasses_perm (core : List ℕ) :
    ∀ leafs : List ℕ,
      (packLeafClasses core leafs).flatten.Perm
        (core ++ leafs.flatMap (fun p => [p, 2 * p])) := by
  intro leafs
  induction leafs using List.twoStepInduction with
  | nil =>
      simp [packLeafClasses]
  | singleton p =>
      simpa [packLeafClasses] using
        (List.perm_append_comm :
          ([p, 2 * p] ++ core).Perm (core ++ [p, 2 * p]))
  | cons_cons p q rest ih =>
      have hswap : ([2 * q, q] : List ℕ).Perm [q, 2 * q] :=
        List.Perm.swap _ _ []
      have hswap' : ([p, 2 * p, 2 * q, q] : List ℕ).Perm
          [p, 2 * p, q, 2 * q] := (hswap.cons (2 * p)).cons p
      cases rest with
      | nil =>
          have hmove : ([p, 2 * p] ++ core).Perm
              (core ++ [p, 2 * p]) := List.perm_append_comm
          have hresult := (hmove.append_right [2 * q, q]).trans
              (hswap.append_left (core ++ [p, 2 * p]))
          simpa [packLeafClasses, List.append_assoc] using hresult
      | cons r rs =>
          have hr := ih
          have hfirst := hswap'.append hr
          have hmove : ([p, 2 * p, q, 2 * q] ++ core).Perm
              (core ++ [p, 2 * p, q, 2 * q]) :=
            List.perm_append_comm
          have hresult := hfirst.trans
            (by simpa [List.append_assoc] using
              hmove.append_right ((r :: rs).flatMap
                (fun t => [t, 2 * t])))
          simpa [packLeafClasses, List.flatMap_cons,
            List.append_assoc] using hresult

end P010
