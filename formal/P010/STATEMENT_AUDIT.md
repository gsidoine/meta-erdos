# P010 — correspondence of mathematical and Lean statements

## Defined quantities

The source of the mathematical statement is [the exact P010 theorem](../../theorems/P010-exact-coprime-adjacencies.md). The independent [Lean statement module](P010Statement.lean) contains the following definitions.

| Mathematics | Lean | Verification of meaning |
|---|---|---|
| A permutation of $[n]$ | `IsPermutation n a` | `List.Perm (List.range' 1 n)` lists every integer $1,\ldots,n$ exactly once |
| The number of coprime adjacent pairs | `adjacentCount a` | `a.zip a.tail` enumerates consecutive pairs; `countP` tests `Nat.Coprime` |
| $\pi(k)$ | `pi k` | `Nat.primeCounting k` |
| The least possible adjacency count | `h n` | `Nat.find` selects the least realizable value of `adjacentCount`; `attainable` supplies an actual permutation |
| The proposed exact value | `target n` | $\pi(n)-\pi(\lfloor n/2\rfloor)+\max(1,\lceil [\pi(\lfloor n/2\rfloor)-\pi(\lfloor n/3\rfloor)]/2\rceil)$ |
| Exact equality for $n\ge4$ | `ExactStatement n` | `4 ≤ n → h n = target n` |

Natural-number division in Lean is integer division; the formula `(B + 1) / 2` is $\lceil B/2\rceil$ for $B\in\mathbb N$. Each subtraction in `target` is natural subtraction. Since the prime-counting function is nondecreasing, the corresponding differences are nonnegative and agree with ordinary integer differences.

## Formal result

The [proof module](P010.lean) imports the statement module. It establishes

```lean
theorem P010_exact (n : ℕ) (hn : 4 ≤ n) :
    h n = target n
```

and independently exposes the full quantified statement:

```lean
theorem P010_statement_valid (n : ℕ) : ExactStatement n
```

The [CI workflow](../../.github/workflows/p010-lean.yml) builds both declarations, verifies that the pinned dependency manifest is unchanged after dependency resolution, and checks that each declaration depends only on `propext`, `Classical.choice`, and `Quot.sound`.

Kernel verification establishes the formal claim; the correspondence in the preceding table is a statement-fidelity audit, not a theorem of Lean. Boundary values $4\le n\le11$ are covered by the formal proof's small-case branch, with $n\ge12$ covered by the general path construction.

## Scope and provenance

The exact finite-$n$ formula is formally proved. Its prime-number-theorem asymptotic, historical originality and journal acceptance are not asserted by the Lean certificate. The submitted *Integers* manuscript is retained without alteration.

The proof-development process included AI-assisted Lean drafting and iterative correction against GitHub Actions compilation feedback. The resulting declaration was checked by Lean's kernel, but no independent expert refereeing of the formalization is claimed.
