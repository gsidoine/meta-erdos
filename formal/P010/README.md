# P010 — Lean 4 formalization

**Verification status: partial.** The submitted mathematical theorem is stated
in [the P010 dossier](../../problems/graph-theory/P010-minimum-coprime-adjacencies.md)
and proved in [the manuscript's supplementary theorem note](../../theorems/P010-exact-coprime-adjacencies.md).
The submitted [PDF](../../manuscripts/P010/coprime_adjacencies.pdf) is not altered
by this formalization.

The [Lean source](P010.lean) uses Lean 4.35.0 and Mathlib 4.35.0.

## Mathematical statement

For a permutation $a=(a_1,\ldots,a_n)$ of $[n]$, let
$
c(a)=\#\{i:1\le i<n,\ \gcd(a_i,a_{i+1})=1\},
\qquad h(n)=\min_{a}c(a).
$
The theorem submitted to *Integers* states that for $n\ge4$,
$
h(n)=\pi(n)-\pi(\lfloor n/2\rfloor)
 +\max\!\left(1,\left\lceil
 \frac{\pi(\lfloor n/2\rfloor)-\pi(\lfloor n/3\rfloor)}2
 \right\rceil\right).
$

The Lean definitions \`IsPermutation\`, \`adjacentCount\`, \`h\` and
\`target\` encode the **same extremal assertion**. Here \`h\` uses
\`Nat.find\` on the nonempty set of realized adjacency counts; this
avoids treating a finite enumeration as an asymptotic proof.

## Lean-checked lemmas

The source proves the following with ordinary kernel-checked Lean
tactics, without a \`sorry\` or any added mathematical axiom:

- Existence of a permutation attaining the minimum, and the usual
  extremal characterization of \`h\`.
- A prime larger than $\lfloor n/2\rfloor$ has no distinct
  non-coprime neighbor in $[n]$.
- A prime in $(\lfloor n/3\rfloor,\lfloor n/2\rfloor]$
  has precisely the non-coprime neighbor $2p$.
- The finite-set counts of these two prime ranges equal the
  differences of Mathlib's \`Nat.primeCounting\`.
- Every ordering of numbers sharing a prime divisor is a
  non-coprime chain.
- Prime-divisor endpoint gluing, including the even–even
  and divisible-by-three bridges in the submitted construction.
- Explicit optimal *upper-bound witnesses* for $1\le n\le11$.

Any additional finite enumeration and exact small-order result in
\`P010.lean\` is explicitly limited to the stated values of $n$.

## Outstanding proof obligations

The file **does not yet prove** \`∀ n ≥ 4, h n = target n\`.
Two independent arithmetic tasks remain:

1. **Global lower bound.** Show for every permutation that the
   isolated vertices $1$ and primes $p>n/2$, together with the
   degree-one primes $n/3<q\le n/2$, require at least the predicted
   number of coprime adjacencies. The local degree statements are
   checked, but the global path-cover counting lemma is not.
2. **Universal upper construction.** Formalize the largest-prime-factor
   partition, the lists constituting each class path, pairing of
   middle classes, even-endpoint concatenation, attachment of
   one-ended classes, and the required prime-counting inequality.
   Verify that the resulting permutation covers every integer
   exactly once and achieves the stated count for arbitrary $n$.

The Lean theorem \`exact_of_matching_bounds\` explicitly assumes
these two bounds. It is a **reduction**, not a proof of either
assumption. No theorem in the source asserts the unproved result
without stating its hypotheses. A finite computation is not a
substitute for these universal steps.

## Build

With Lean's \`elan\` toolchain manager installed:

\`\`\`sh
cd formal/P010
lake update
lake exe cache get
lake build P010
\`\`\`

GitHub Actions runs the same commands in
[the P010 Lean workflow](../../.github/workflows/p010-lean.yml).

The label *partial* must be retained until the complete
all-$n$ statement has been proved and kernel-checked.
The manuscript's submission status is unchanged, and the
separate symbolic reward for a complete Lean formalization
has not been attained.
