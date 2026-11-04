# P010 — Lean 4 certificate

**Verification status: complete for the exact theorem.** The theorem
`P010_exact` has an unconditional kernel-checked proof for every integer
$n\ge 4$, with Lean 4.35.0 and Mathlib 4.35.0.

The mathematical statement appears in the
[P010 dossier](../../problems/graph-theory/P010-minimum-coprime-adjacencies.md)
and the [constructive theorem note](../../theorems/P010-exact-coprime-adjacencies.md).
The [submitted manuscript](../../manuscripts/P010/coprime_adjacencies.pdf)
is an unchanged archival submission to *Integers*; submission does not
imply acceptance or publication.

## Statement

For any permutation $a=(a_1,\ldots,a_n)$ of $[n]$, put

$$
c(a)=\sum_{i=1}^{n-1}\mathbf{1}_{\gcd(a_i,a_{i+1})=1},
\qquad h(n)=\min_{a\in S_n}c(a).
$$

The independently readable [statement definitions](P010Statement.lean) and [Lean proof](P010.lean) establish, for every $n\ge4$,

$$
h(n)=\pi(n)-\pi(\lfloor n/2\rfloor)
+\max\left\{1,
\left\lceil\frac{\pi(\lfloor n/2\rfloor)-\pi(\lfloor n/3\rfloor)}{2}\right\rceil
\right\}.
$$

The exact declaration, in the proof module, is:

```lean
theorem P010_exact (n : ℕ) (hn : 4 ≤ n) :
    h n = target n
```

The definitions `IsPermutation`, `adjacentCount`, `h`, and `target` are in the separate `P010Statement.lean` module; `h` is the least attained coprime-adjacency count. The [statement-fidelity audit](STATEMENT_AUDIT.md) relates each definition to the mathematical statement. The proof also establishes `P010_statement_valid` for the exact independent proposition `ExactStatement`.

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
4. `P010_upper_large` covers $n\ge12$; the explicit
   `small_upper_bound` handles $4\le n\le11$.
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

Reproducibility is pinned by the committed [Lake manifest](lake-manifest.json), `lean-toolchain` and `lakefile.lean`. To verify the existing lockfile without updating dependencies:

```sh
cd formal/P010
lake exe cache get
lake build P010
lake env lean P010.lean
```

The last command prints the final theorem's axiom list. Dependency updates require an explicit manifest change and a successful CI run.

The [P010 Lean workflow](../../.github/workflows/p010-lean.yml)
builds both the statement module and the formalization, checks that dependency resolution does not modify the committed manifest, and checks the final exact theorem and independent statement theorem's axiom declarations. This certificate covers the exact finite-$n$ identity;
the asymptotic corollary is not formalized separately.

## Development provenance

The proof development used AI-assisted Lean drafting and incremental debugging against the Lean build and kernel-check workflow. The [statement audit](STATEMENT_AUDIT.md) records the correspondence with the original finite-$n$ theorem. Formal verification does not certify historical novelty, external refereeing, or journal acceptance. No change has been made to the submitted manuscript's archival AI-use declaration.
