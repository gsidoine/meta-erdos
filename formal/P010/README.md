# P010 — Lean 4 certificate

**Verification status: complete for the exact theorem.** The theorem
`P010_exact` has an unconditional kernel-checked proof for every integer
\(n\ge 4\), with Lean 4.35.0 and Mathlib 4.35.0.

The mathematical statement appears in the
[P010 dossier](../../problems/graph-theory/P010-minimum-coprime-adjacencies.md)
and the [constructive theorem note](../../theorems/P010-exact-coprime-adjacencies.md).
The [submitted manuscript](../../manuscripts/P010/coprime_adjacencies.pdf)
is an unchanged archival submission to *Integers*; submission does not
imply acceptance or publication.

## Statement

For any permutation \(a=(a_1,\ldots,a_n)\) of \([n]\), put

$$
c(a)=\sum_{i=1}^{n-1}\mathbf{1}_{\gcd(a_i,a_{i+1})=1},
\qquad h(n)=\min_{a\in S_n}c(a).
$$

The [Lean source](P010.lean) establishes, for every \(n\ge4\),

$$
h(n)=\pi(n)-\pi(\lfloor n/2\rfloor)
+\max\left\{1,
\left\lceil\frac{\pi(\lfloor n/2\rfloor)-\pi(\lfloor n/3\rfloor)}{2}\right\rceil
\right\}.
$$

The exact declaration is:

```lean
theorem P010_exact (n : ℕ) (hn : 4 ≤ n) :
    h n = target n
```

The definitions `IsPermutation`, `adjacentCount`, `h`, and `target`
encode the original extremal problem; `h` is the least attained
coprime-adjacency count.

## Proof structure

1. `P010_universal_lower_bound` and `P010_h_lower_bound`: isolated
   vertices and degree-one primes impose the sharp lower bound.
2. `primeClass_partition`, `orderedPrimeClass_perm`, and
   `corePath_perm_classConcat`: largest-prime-factor classes partition
   the vertices, and their prescribed-endpoint paths assemble into an
   even-ended noncoprime core without repetitions.
3. `packLeafClasses_perm`, `packLeafClasses_length`, and
   `optimalCover_isPermutation`: pairing the remaining two-vertex
   prime classes covers all remaining vertices and gives the exact
   number of paths.
4. `P010_upper_large` covers \(n\ge12\); the explicit
   `small_upper_bound` handles \(4\le n\le11\).
   `P010_exact` combines both bounds.

The upper construction joins all even-ended units into one core, then
pairs leaf-prime classes directly. **No prime-counting inequality is
required** by the final theorem. An earlier conditional auxiliary
lemma, `landau_implies_attachment_capacity`, is not used in its proof.

## Verification

The source includes `#print axioms P010_exact`. The checked output
reports exactly:

```text
'P010.P010_exact' depends on axioms: [propext, Classical.choice, Quot.sound]
```

These are Lean's standard foundational axioms. There is no
`sorryAx`, unproved mathematical hypothesis, or finite-enumeration
assumption in the exact theorem.

To reproduce:

```sh
cd formal/P010
lake update
lake exe cache get
lake build P010
```

The [P010 Lean workflow](../../.github/workflows/p010-lean.yml)
builds the formalization and checks the final theorem's axiom
declaration. This certificate covers the exact finite-\(n\) identity;
the asymptotic corollary is not formalized separately.
