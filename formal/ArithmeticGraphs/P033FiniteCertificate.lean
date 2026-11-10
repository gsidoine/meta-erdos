import Mathlib

/-!
# P033 — Lean verification of the bounded prime-triple certificate

These 103 certificates cover all integers from 121 through 10^10.
Every listed prime is checked by Lean's decidable Nat.Prime predicate,
together with the coprimality and interval inequalities.

This module proves that each integer in the range admits a prime triple
satisfying the hypotheses of the *separately proved* three-reflection
connectivity criterion. It does NOT formalize the analytic existence
argument for n > 10^10 or the graph-theoretic reflection criterion.
-/

namespace P033

structure PrimeIntervalRow where
  lo : ℕ
  hi : ℕ
  p : ℕ
  q : ℕ
  r : ℕ
  deriving Repr, DecidableEq

def CertifiedRow (t : PrimeIntervalRow) : Prop :=
  t.lo ≤ t.hi ∧
  Nat.Prime t.p ∧ Nat.Prime t.q ∧ Nat.Prime t.r ∧
  t.p < t.q ∧ t.q < t.lo ∧ t.hi < t.r ∧
  Nat.Coprime ((t.q - t.p) / 2) ((t.r - t.p) / 2) ∧
  5*t.r ≤ 6*t.lo+2 ∧
  4*t.hi ≤ 5*t.p+2

def primeIntervals : List PrimeIntervalRow := [
  { lo := 121, hi := 130, p := 109, q := 113, r := 131 },
  { lo := 131, hi := 138, p := 113, q := 127, r := 139 },
  { lo := 139, hi := 162, p := 131, q := 137, r := 163 },
  { lo := 163, hi := 180, p := 149, q := 151, r := 181 },
  { lo := 181, hi := 210, p := 173, q := 179, r := 211 },
  { lo := 211, hi := 240, p := 197, q := 199, r := 241 },
  { lo := 241, hi := 282, p := 233, q := 239, r := 283 },
  { lo := 283, hi := 336, p := 271, q := 281, r := 337 },
  { lo := 337, hi := 396, p := 317, q := 331, r := 397 },
  { lo := 397, hi := 466, p := 379, q := 389, r := 467 },
  { lo := 467, hi := 556, p := 461, q := 463, r := 557 },
  { lo := 557, hi := 658, p := 541, q := 547, r := 659 },
  { lo := 659, hi := 786, p := 647, q := 653, r := 787 },
  { lo := 787, hi := 936, p := 751, q := 773, r := 937 },
  { lo := 937, hi := 1122, p := 919, q := 929, r := 1123 },
  { lo := 1123, hi := 1326, p := 1109, q := 1117, r := 1327 },
  { lo := 1327, hi := 1582, p := 1319, q := 1321, r := 1583 },
  { lo := 1583, hi := 1888, p := 1571, q := 1579, r := 1889 },
  { lo := 1889, hi := 2266, p := 1877, q := 1879, r := 2267 },
  { lo := 2267, hi := 2718, p := 2237, q := 2251, r := 2719 },
  { lo := 2719, hi := 3258, p := 2711, q := 2713, r := 3259 },
  { lo := 3259, hi := 3910, p := 3253, q := 3257, r := 3911 },
  { lo := 3911, hi := 4690, p := 3889, q := 3907, r := 4691 },
  { lo := 4691, hi := 5622, p := 4673, q := 4679, r := 5623 },
  { lo := 5623, hi := 6736, p := 5581, q := 5591, r := 6737 },
  { lo := 6737, hi := 8080, p := 6719, q := 6733, r := 8081 },
  { lo := 8081, hi := 9696, p := 8059, q := 8069, r := 9697 },
  { lo := 9697, hi := 11632, p := 9679, q := 9689, r := 11633 },
  { lo := 11633, hi := 13932, p := 11579, q := 11621, r := 13933 },
  { lo := 13933, hi := 16702, p := 13921, q := 13931, r := 16703 },
  { lo := 16703, hi := 20028, p := 16691, q := 16699, r := 20029 },
  { lo := 20029, hi := 24028, p := 20021, q := 20023, r := 24029 },
  { lo := 24029, hi := 28816, p := 24019, q := 24023, r := 28817 },
  { lo := 28817, hi := 34548, p := 28751, q := 28813, r := 34549 },
  { lo := 34549, hi := 41452, p := 34537, q := 34543, r := 41453 },
  { lo := 41453, hi := 49740, p := 41411, q := 41443, r := 49741 },
  { lo := 49741, hi := 59670, p := 49697, q := 49739, r := 59671 },
  { lo := 59671, hi := 71596, p := 59659, q := 59669, r := 71597 },
  { lo := 71597, hi := 85908, p := 71483, q := 71593, r := 85909 },
  { lo := 85909, hi := 103090, p := 85889, q := 85903, r := 103091 },
  { lo := 103091, hi := 123706, p := 103069, q := 103087, r := 123707 },
  { lo := 123707, hi := 148438, p := 123667, q := 123701, r := 148439 },
  { lo := 148439, hi := 178126, p := 148411, q := 148429, r := 178127 },
  { lo := 178127, hi := 213750, p := 178103, q := 178117, r := 213751 },
  { lo := 213751, hi := 256498, p := 213727, q := 213737, r := 256499 },
  { lo := 256499, hi := 307758, p := 256489, q := 256493, r := 307759 },
  { lo := 307759, hi := 369300, p := 307711, q := 307733, r := 369301 },
  { lo := 369301, hi := 443160, p := 369283, q := 369293, r := 443161 },
  { lo := 443161, hi := 531792, p := 443153, q := 443159, r := 531793 },
  { lo := 531793, hi := 638146, p := 531673, q := 531731, r := 638147 },
  { lo := 638147, hi := 765772, p := 638059, q := 638123, r := 765773 },
  { lo := 765773, hi := 918912, p := 765763, q := 765767, r := 918913 },
  { lo := 918913, hi := 1102692, p := 918889, q := 918899, r := 1102693 },
  { lo := 1102693, hi := 1323220, p := 1102669, q := 1102691, r := 1323221 },
  { lo := 1323221, hi := 1587846, p := 1323197, q := 1323199, r := 1587847 },
  { lo := 1587847, hi := 1905390, p := 1587809, q := 1587841, r := 1905391 },
  { lo := 1905391, hi := 2286468, p := 1905367, q := 1905383, r := 2286469 },
  { lo := 2286469, hi := 2743758, p := 2286443, q := 2286457, r := 2743759 },
  { lo := 2743759, hi := 3292510, p := 2743669, q := 2743751, r := 3292511 },
  { lo := 3292511, hi := 3951000, p := 3292463, q := 3292507, r := 3951001 },
  { lo := 3951001, hi := 4741182, p := 3950941, q := 3950951, r := 4741183 },
  { lo := 4741183, hi := 5689402, p := 4741129, q := 4741169, r := 5689403 },
  { lo := 5689403, hi := 6827280, p := 5689367, q := 5689381, r := 6827281 },
  { lo := 6827281, hi := 8192698, p := 6827167, q := 6827273, r := 8192699 },
  { lo := 8192699, hi := 9831222, p := 8192633, q := 8192677, r := 9831223 },
  { lo := 9831223, hi := 11797440, p := 9831191, q := 9831193, r := 11797441 },
  { lo := 11797441, hi := 14156928, p := 11797361, q := 11797363, r := 14156929 },
  { lo := 14156929, hi := 16988302, p := 14156893, q := 14156927, r := 16988303 },
  { lo := 16988303, hi := 20385930, p := 16988189, q := 16988281, r := 20385931 },
  { lo := 20385931, hi := 24463096, p := 20385823, q := 20385887, r := 24463097 },
  { lo := 24463097, hi := 29355706, p := 24462989, q := 24463063, r := 29355707 },
  { lo := 29355707, hi := 35226808, p := 29355679, q := 29355691, r := 35226809 },
  { lo := 35226809, hi := 42272146, p := 35226773, q := 35226799, r := 42272147 },
  { lo := 42272147, hi := 50726566, p := 42272119, q := 42272141, r := 50726567 },
  { lo := 50726567, hi := 60871870, p := 50726449, q := 50726551, r := 60871871 },
  { lo := 60871871, hi := 73046226, p := 60871829, q := 60871859, r := 73046227 },
  { lo := 73046227, hi := 87655470, p := 73046179, q := 73046201, r := 87655471 },
  { lo := 87655471, hi := 105186562, p := 87655441, q := 87655453, r := 105186563 },
  { lo := 105186563, hi := 126223872, p := 105186539, q := 105186547, r := 126223873 },
  { lo := 126223873, hi := 151468612, p := 126223837, q := 126223843, r := 151468613 },
  { lo := 151468613, hi := 181762312, p := 151468519, q := 151468571, r := 181762313 },
  { lo := 181762313, hi := 218114748, p := 181762271, q := 181762309, r := 218114749 },
  { lo := 218114749, hi := 261737698, p := 218114669, q := 218114731, r := 261737699 },
  { lo := 261737699, hi := 314085228, p := 261737659, q := 261737687, r := 314085229 },
  { lo := 314085229, hi := 376902232, p := 314085169, q := 314085227, r := 376902233 },
  { lo := 376902233, hi := 452282650, p := 376902161, q := 376902199, r := 452282651 },
  { lo := 452282651, hi := 542739172, p := 452282627, q := 452282641, r := 542739173 },
  { lo := 542739173, hi := 651286930, p := 542739049, q := 542739167, r := 651286931 },
  { lo := 651286931, hi := 781544292, p := 651286879, q := 651286919, r := 781544293 },
  { lo := 781544293, hi := 937853142, p := 781544021, q := 781544263, r := 937853143 },
  { lo := 937853143, hi := 1125423736, p := 937853131, q := 937853141, r := 1125423737 },
  { lo := 1125423737, hi := 1350508450, p := 1125423701, q := 1125423727, r := 1350508451 },
  { lo := 1350508451, hi := 1620610140, p := 1350508403, q := 1350508447, r := 1620610141 },
  { lo := 1620610141, hi := 1944732148, p := 1620610099, q := 1620610133, r := 1944732149 },
  { lo := 1944732149, hi := 2333678536, p := 1944732071, q := 1944732121, r := 2333678537 },
  { lo := 2333678537, hi := 2800414228, p := 2333678521, q := 2333678531, r := 2800414229 },
  { lo := 2800414229, hi := 3360497056, p := 2800414219, q := 2800414223, r := 3360497057 },
  { lo := 3360497057, hi := 4032596452, p := 3360497051, q := 3360497053, r := 4032596453 },
  { lo := 4032596453, hi := 4839115740, p := 4032596387, q := 4032596429, r := 4839115741 },
  { lo := 4839115741, hi := 5806938888, p := 4839115703, q := 4839115709, r := 5806938889 },
  { lo := 5806938889, hi := 6968326662, p := 5806938881, q := 5806938883, r := 6968326663 },
  { lo := 6968326663, hi := 8361991992, p := 6968326579, q := 6968326637, r := 8361991993 },
  { lo := 8361991993, hi := 10034390380, p := 8361991907, q := 8361991933, r := 10034390381 }
]

def IntervalChain : ℕ → List PrimeIntervalRow → Prop
  | _, [] => True
  | start, t :: rest =>
      t.lo = start ∧ CertifiedRow t ∧
        IntervalChain (t.hi + 1) rest

/-! Decidability is proved by structural recursion on the finite list.
    The prime predicate itself has an effective decision procedure. -/
instance decidableIntervalChain (start : ℕ)
    (rows : List PrimeIntervalRow) :
    Decidable (IntervalChain start rows) := by
  induction rows generalizing start with
  | nil =>
      change Decidable True
      infer_instance
  | cons row remaining ih =>
      change Decidable
        (row.lo = start ∧ CertifiedRow row ∧
         IntervalChain (row.hi + 1) remaining)
      letI : Decidable (IntervalChain (row.hi+1) remaining) :=
        ih (row.hi+1)
      letI : Decidable (CertifiedRow row) := by
        unfold CertifiedRow
        infer_instance
      infer_instance

def intervalEnd : ℕ → List PrimeIntervalRow → ℕ
  | start, [] => start
  | _, t :: rest => intervalEnd (t.hi + 1) rest

/-- An independently checkable finite theorem: 103 consecutive valid
    prime-triple intervals, each satisfying the exact arithmetic criterion. -/
theorem finite_prime_interval_certificate :
    IntervalChain 121 primeIntervals := by
  native_decide

set_option maxRecDepth 8192

/-- A kernel-checkable pilot for the largest prime label in the table,
    using Mathlib's arithmetic certificate tactic rather than native evaluation. -/
private theorem largest_label_prime_kernel : Nat.Prime 10034390381 := by
  norm_num

theorem finite_certificate_upper_end :
    10^10 < intervalEnd 121 primeIntervals := by
  native_decide

theorem interval_chain_covers
    (rows : List PrimeIntervalRow) (start n : ℕ)
    (hchain : IntervalChain start rows)
    (hlo : start ≤ n)
    (hhi : n < intervalEnd start rows) :
    ∃ t ∈ rows, CertifiedRow t ∧ t.lo ≤ n ∧ n ≤ t.hi := by
  induction rows generalizing start with
  | nil =>
      simp [intervalEnd] at hhi
      omega
  | cons t remaining ih =>
      change t.lo = start ∧ CertifiedRow t ∧
        IntervalChain (t.hi+1) remaining at hchain
      rcases hchain with ⟨hstart, hv, hrest⟩
      by_cases hhere : n ≤ t.hi
      · exact ⟨t, by simp, hv, by omega, hhere⟩
      · have hnext : t.hi+1 ≤ n := by omega
        have hend : n < intervalEnd (t.hi+1) remaining := by
          simpa only [intervalEnd] using hhi
        obtain ⟨u, hu, huvalid, hul, huh⟩ :=
          ih (t.hi+1) hrest hnext hend
        exact ⟨u, by simp [hu], huvalid, hul, huh⟩

/-- The certificate gives suitable *prime labels* for every integer
    in the bounded interval, with a uniform sharp reflection inequality. -/
theorem certified_three_primes (n : ℕ)
    (hn : 121 ≤ n) (hN : n ≤ 10^10) :
    ∃ p q r : ℕ,
      Nat.Prime p ∧ Nat.Prime q ∧ Nat.Prime r ∧
      p < q ∧ q < n ∧ n < r ∧
      Nat.Coprime ((q-p)/2) ((r-p)/2) ∧
      5*(max (n-p) (r-n)) ≤ n+2 := by
  have hlimit : n < intervalEnd 121 primeIntervals := by
    have hupper := finite_certificate_upper_end
    omega
  obtain ⟨t, _, hv, htl, hth⟩ :=
    interval_chain_covers primeIntervals 121 n
      finite_prime_interval_certificate hn hlimit
  rcases hv with
    ⟨_, hp, hq, hr, hpq, hqlo, hhir, hcop, hleft, hright⟩
  refine ⟨t.p, t.q, t.r, hp, hq, hr, hpq, ?_, ?_, hcop, ?_⟩
  · omega
  · omega
  · have h1 : 5*(n-t.p) ≤ n+2 := by omega
    have h2 : 5*(t.r-n) ≤ n+2 := by omega
    rcases le_total (n-t.p) (t.r-n) with hle | hle
    · rw [max_eq_right hle]
      exact h2
    · rw [max_eq_left hle]
      exact h1

#print axioms finite_prime_interval_certificate
#print axioms certified_three_primes

end P033
