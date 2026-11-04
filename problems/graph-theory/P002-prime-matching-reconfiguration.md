# P002 — Reconfiguring prime-sum perfect matchings

<!-- DOSSIER-SUMMARY -->
> **Research question:** Are all prime-sum perfect matchings joined by four-cycle switches?  
> **Formulation:** candidate. **Novelty:** not certified; targeted literature comparison only.  
> **Verified/known progress:** One connected component through n=12 in exhaustive tests.  
> **Finite evidence:** Enumerated 423,884 matchings at n=12 in initial exploration.  
> **Symbolic prize:** A Coffee (symbolic) — A classification of four-cycle-switch components for all prime-sum perfect matchings.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->


**Area:** graph theory, local reconfiguration, additive arithmetic  
**Status:** candidate question; novelty and unresolved status unverified  
**Proposed:** 28 October 2026

## Setup

Define the graph $P_{2n}$ with vertices $1,\dots,2n$, where two **distinct** vertices $a,b$ are adjacent iff $a+b$ is prime. It is bipartite across odd and even vertices.

Prime-sum perfect matchings exist: by Bertrand's postulate, take a prime $p$ with $2n<p<4n$. Pair the interval $[p-2n,2n]$ by $x\leftrightarrow p-x$; the remaining initial interval has even length, so repeat by induction.

Form a **switch graph** $\mathcal R_n$: its vertices are the perfect matchings of $P_{2n}$; two vertices are adjacent iff their matchings differ by an alternating four-cycle (replace two disjoint pairs with the other pairing of the same four vertices, retaining prime sums).

## Main question

**Is $\mathcal R_n$ connected for every $n\ge1$?**

Stronger: is its diameter bounded by a fixed polynomial in $n$? Can one construct a monotone sequence of valid switches taking any matching to a canonical one?

## Exhaustive finite checks

Run `python experiments/reconfiguration_small.py --max-n 10`. The script enumerates all valid perfect matchings and all allowed switches, then computes connected components using union–find.

| $n$ | Matchings | Components | Undirected switch edges |
|---:|---:|---:|---:|
| 5 | 26 | 1 | 53 |
| 6 | 96 | 1 | 288 |
| 7 | 210 | 1 | 721 |
| 8 | 1,106 | 1 | 5,206 |
| 9 | 3,759 | 1 | 19,847 |
| 10 | 12,577 | 1 | 75,259 |

The figures are **exhaustive finite computations, not a proof**. The included script is standard-library Python and was run through $n=10$ prior to repository initialization.

## Obstacles / next steps

- Look for conserved quantities that could separate switch components.
- Study induced cycles and the existence of chordless obstructions.
- Try reduction to a canonical matching, using number-theoretic inequalities.
- Explore diameter and mixing time if connectivity holds.

## Literature audit

Four-cycle matching reconfiguration, switch chains and Markov bases are established subjects. Audit whether a general theorem implies this special claim; do not assume that specifying prime-sum edges makes an existing problem new.

## Related literature

Dyer–Jerrum–Müller and Bonamy et al. established the general four-cycle switch framework; the prime-sum special case still requires an exact overlap check. This is **not a certification of novelty or of unresolved status**. Read the [full P001–P008 audit](../../literature-audits/2026-10-28-comprehensive-P001-P008.md) before citing this question in a mathematical publication.
