# P010 — Lean 4 formalization

**Verification status: partial.** The submitted mathematical theorem is stated
in [the P010 dossier](../../problems/graph-theory/P010-minimum-coprime-adjacencies.md)
and proved in [the manuscript's supplementary theorem note](../../theorems/P010-exact-coprime-adjacencies.md).
The submitted [PDF](../../manuscripts/P010/coprime_adjacencies.pdf) is not altered
by this formalization.

The [Lean source](P010.lean) uses Lean 4.35.0 and Mathlib 4.35.0.

## Mathematical statement

For a permutation $a=(a_1,\ldots,a_n)$ of $[n]$, let

$$
c(a)=\#\{i:1\le i<n,\ \gcd(a_i,a_{i+1})=1\},
\qquad h(n)=\min_{a}c(a).

$$

The theorem submitted to *Integers* states that for $n\ge4$,

$$
h(n)=\pi(n)-\pi(\lfloor n/2\rfloor)
 +\max\!\left(1,\left\lceil
 \frac{\pi(\lfloor n/2\rfloor)-\pi(\lfloor n/3\rfloor)}2
 \right\rceil\right).

$$

The Lean definitions `IsPermutation`, `adjacentCount`, `h` and
`target` encode the **same extremal assertion**. Here `h` uses
`Nat.find` on the nonempty set of realized adjacency counts; this
avoids treating a finite enumeration as an asymptotic proof.

## Lean-checked lemmas

The source proves the following with ordinary kernel-checked Lean
tactics, without a `sorry` or any added mathematical axiom:

- Existence of a permutation attaining the minimum, and the usual
  extremal characterization of `h`.
- A prime larger than $\lfloor n/2\rfloor$ has no distinct
  non-coprime neighbor in $[n]$.
- A prime in $(\lfloor n/3\rfloor,\lfloor n/2\rfloor]$
  has precisely the non-coprime neighbor $2p$.
- The finite-set counts of these two prime ranges equal the
  differences of Mathlib's `Nat.primeCounting`.
- Every ordering of numbers sharing a prime divisor is a
  non-coprime chain.
- Prime-divisor endpoint gluing, including the even–even
  and divisible-by-three bridges in the submitted construction.
- Explicit optimal *upper-bound witnesses* for $1\le n\le11$.
- The exact global path-cover lower bound: isolated vertices require singleton
  paths; middle-range degree-one primes occupy only endpoints, at most two per
  path; the vertex 2 forces an additional path when $n\ge4$.
- The largest-prime-factor classes partition $[2,n]$ without overlap,
  and every ordering within one class forms a non-coprime path.
- Exact class descriptions: singleton classes for $p>n/2$,
  two-vertex classes for $n/3<p\le n/2$, and three-vertex
  classes for $n/4<p\le n/3$ when $n\ge12$.
- A nodup, class-covering non-coprime path with any two distinct
  prescribed endpoints in a prime class (`orderedPrimeClass_perm`).
- Local joining of two intermediate classes and the special bridge
  through the class of prime $3$.
- The inequality supplying sufficient even-ended units, conditional
  on the stated Landau prime-counting inequality
  (`landau_implies_attachment_capacity`).
- The unconditional universal inequality `P010_h_lower_bound`:
  $h(n)\ge\pi(n)-\pi(\lfloor n/2\rfloor)+\max(1,\lceil (\pi(\lfloor n/2\rfloor)-\pi(\lfloor n/3\rfloor))/2\rceil)$
  for every $n\ge4$.

Any additional finite enumeration and exact small-order result in
`P010.lean` is explicitly limited to the stated values of $n$.

## Outstanding proof obligations

The file **does not yet prove** `∀ n ≥ 4, h n = target n`. The
unconditional lower bound is proved in `P010_universal_lower_bound` and
`P010_h_lower_bound`, for every `n ≥ 4`. Their dependency audit is
printed by `#print axioms` in the Lean source.

The universal upper-bound construction is still incomplete.
The class partition, within-class endpoint paths, and two local
bridging constructions are now checked. The remaining steps are:

1. Assemble every small and intermediate class into the specified
   number of even-ended disjoint paths; verify that pairing and the
   special prime-3 bridge preserve coverage and use each vertex once.
2. Establish the arithmetic capacity inequality for all $n\ge12$.
   The source currently proves the needed capacity **conditional** on
   $\pi(\lfloor n/2\rfloor)\le2\pi(\lfloor n/4\rfloor)$.
   That known prime-counting inequality has not been formalized here.
3. Group the even-ended paths, attach each $\{p,2p\}$ leaf class at
   an endpoint, and prove the resulting path cover is a permutation
   of $[n]$ with precisely the predicted number of components.

The theorem `exact_of_matching_bounds` is a reduction; the lower-bound
hypothesis is now discharged universally, but its constructive upper-bound
hypothesis is not. No theorem asserts the full equality without that
hypothesis. Finite computation does not replace the missing construction.

## Build

With Lean's `elan` toolchain manager installed:

```sh
cd formal/P010
lake update
lake exe cache get
lake build P010
```

GitHub Actions runs the same commands in
[the P010 Lean workflow](../../.github/workflows/p010-lean.yml).

The label *partial* must be retained until the complete
all-$n$ statement has been proved and kernel-checked.
The manuscript's submission status is unchanged, and the
separate symbolic reward for a complete Lean formalization
has not been attained.
