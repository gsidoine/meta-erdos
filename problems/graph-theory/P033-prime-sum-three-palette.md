# P033 — Can three prime sums connect all integers?

<!-- DOSSIER-SUMMARY -->
> **Research question:** Can three distinct prime edge sums connect every initial interval [n], n≥3? (Resolved internally.)  
> **Formulation:** proved internally. **Novelty:** historical priority unverified; universal all-n three-prime connectivity proved by an effective prime-progression sieve and an exact finite certificate; earlier Hamiltonian prime-set results are related but distinct.  
> **Verified/known progress:** Unconditional all-order theorem κ(n)≤3 (n≥3): explicit analytic bound n≥10^10 via Bennett–Martin–O’Bryant–Rechnitzer and Brun–Titchmarsh; exact small-n check n≤120 and 103 verified prime-triple interval certificates cover 121≤n≤10,034,390,380; κ(n)=2 exactly at the nearby twin-prime cases.  
> **Finite evidence:** Standard-library integer certificate: exhaustive 3≤n≤120, 103 contiguous prime-triple intervals through 10,034,390,380 with trial-division primality, and exact rational 0.8+0.12+0.02<1 analytic obstruction checks; all-n proof is partly computer-assisted, with novelty unverified.  
> **Symbolic prize:** A Research Prize (symbolic) — A proof that three prime sums always connect the graph on an initial interval, or a counterexample.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

**Area:** additive number theory, graph connectivity and edge-colored matchings. **Status:** universal three-prime connectivity proved internally with a fully effective analytic threshold and an exact finite certificate; historical priority unverified.

## The question

Color each edge {a,b} of the graph on [n] by its sum a+b, but retain an edge **only if that sum is prime**. Let κ(n) be the minimum number of distinct prime colors whose union connects all n vertices.

**Theorem (resolved P033).**

$$
\boxed{\kappa(n)\le3\quad\text{for every }n\ge3.}
$$

Each fixed sum color is a matching, so one color cannot connect three or more vertices. The question asks whether **three prime-sum matchings always suffice to make a connected graph**, regardless of prime gaps.

## Complete theorem — Three prime sums connect every interval

The [effective universal theorem](../../theorems/P033-universal-three-prime-sum-connectivity.md) establishes unconditionally that

$
\boxed{\kappa(n)\le3\qquad\text{for every integer }n\ge3.}
$

The proof has two parts. An explicit union bound on common prime divisors, using the published Bennett–Martin–O'Bryant–Rechnitzer prime-progression estimates and the Montgomery–Vaughan Brun–Titchmarsh inequality, proves existence of a suitable prime triple for **every $n\ge10^{10}$**. Below that threshold, a separate exact certificate checks all $n\le120$ directly and supplies 103 prime triples whose consecutive validity intervals cover every $121\le n\le10{,}034{,}390{,}380$. All 307 distinct prime labels are checked by trial division; the finite certificate and rational analytic error bounds are [reproducible](../../experiments/P033_effective_universal.py).

The full theorem is **computer-assisted** because the bounded range is certified by exact computation. The infinite range is proved analytically with explicit constants. Neither component relies on unproved prime-gap conjectures. Historical priority of the all-order theorem has not been established.

Combining the result with the earlier exact two-color characterization yields, for every $n\ge3$,

$
\boxed{\kappa(n)=2\iff
\text{some }p\in\{n-1,n,n+1\}\text{ has }p,p+2\text{ prime};}
$

otherwise $\kappa(n)=3$.

## Quantitative theorem — Almost half of nearby prime triples connect

The [prime-palette density theorem](../../theorems/P033-prime-palette-density-and-reflection-criterion.md) proves that, for every fixed real $0<\delta<1/5$, among all prime triples

$$
(1-\delta)n<p<q<n<r<(1+\delta)n,
$$

the proportion whose three sum-color matchings **connect all of $[n]$** tends to the exact constant

$$
\boxed{\mathfrak C=\frac34\prod_{\substack{\ell\ge3\\\ell\ \mathrm{prime}}}
\left(1-\frac1{(\ell-1)^2}\right)\approx0.49512138.}
$$

The prime-product factor is the classical **twin-prime constant**, but **no twin-prime hypothesis** is used. This follows from fixed-modulus prime equidistribution and Brun–Titchmarsh bounds for large common divisors.

The new elementary graph criterion is also stronger: if three odd sums $p<q<n<r$ are within $D$ of $n$ and $n\ge5D$, their graph is connected **exactly when** their two half-differences are coprime (previously sufficiency required $n\ge12D+10$). A [fully reproducible finite verifier](../../experiments/P033_prime_palette_density.py) additionally provides prime-palette witnesses for every $3\le n\le1{,}000{,}000$, combining the existing exact small-n checker with the improved arithmetic criterion. These density and million-case findings predate the effective all-order theorem above; they remain independent quantitative results, rather than the final existence proof.

## Earlier theorem — Three prime sums suffice eventually

The [full constructive theorem](../../theorems/P033-eventual-three-prime-sum-connectivity.md) proves **unconditionally** that

$$
\boxed{\kappa(n)\le3\qquad\text{for all sufficiently large }n.}
$$

The central graph lemma is elementary: if odd integers $p<q<n<r$ all lie within $D$ of $n$, if

$$
\gcd((q-p)/2,(r-p)/2)=1,
$$

and if $n\ge12D+10$, then the union of their three sum-matchings is connected. Reflections give two-step translations of coprime lengths on an interval of odd vertices; all boundary vertices attach to that core.

The prime number theorem selects nearby primes $p<q<n$ with $q-p=O(\log n)$; Siegel–Walfisz supplies a prime $r>n$ in a suitable reduced residue class modulo $q-p$. This produces a qualifying triple for all sufficiently large $n$.

**The threshold in this earlier proof is ineffective.** It is superseded for all-order existence by the effective threshold and finite certificate above. The original proof remains as a separate asymptotic argument. The [independent verifier](../../experiments/P033_eventual_connectivity.py) checks the graph lemma exhaustively over thousands of bounded cases and finds explicit prime triples at several larger values of $n$. The proof uses published prime-distribution theorems, and its historical originality has not been established.

## Theorem — Exactly when two colors suffice

For every n≥3,

$$
\boxed{\kappa(n)=2\iff
\text{some }p\in\{n-1,n,n+1\}\text{ has }p,\ p+2\text{ prime}.}
$$

### Proof

Suppose two distinct prime colors p<q yield a connected graph. Their color classes are matchings. They cannot include 2 (the only solution a+b=2 with positive integers has a=b=1, which is excluded), so both primes are odd.

Traversing edges of sums p and q applies the involutions x↦p−x and x↦q−x. Their composition is a translation by q−p. Hence all vertices in a connected component belong to at most two residue classes modulo d=q−p: the classes of x and p−x. If d≥4, the three vertices 1,2,3 occupy three distinct residue classes, contradicting connectivity. Thus q=p+2.

Vertex n must have an incident edge, so q>n. Vertex 1 must also have an incident edge. If q>n+1, this requires p≤n+1; if q=n+1 then p=n−1. In either case n−1≤p≤n+1.

Conversely assume p,p+2 are prime with n−1≤p≤n+1. The admissible reflection edges with sums p and p+2 form one spanning alternating path:

- If p=n−1 (necessarily n even), start at n and alternately reflect through p+2=n+1 and p=n−1; successive vertices are n,1,n−2,3,n−4,5,… .
- If p=n (necessarily n odd), start at n and alternate sums n+2 and n; successive vertices are n,2,n−2,4,n−4,6,… .
- If p=n+1 (necessarily n even), start at 1 and alternate sums n+1 and n+3; successive vertices are 1,n,3,n−2,5,n−4,… .

In each case the process visits every integer in [n] exactly once (the two interleaved parity sequences exhaust the interval). Thus the graph is connected and κ(n)=2. □

**Prior-art warning:** alternating twin-prime reflections already appear in existing prime-sum Hamiltonian-path discussions, including [Douglas Zare and Zhi-Wei Sun on MathOverflow](https://mathoverflow.net/questions/241569/for-which-n-is-there-a-permutation-such-that-the-sum-of-any-two-adjacent-eleme). The argument above is included as a rigorous baseline, **not certified historically novel**.

## Evidence for the three-color question

The [exact prime-palette enumerator](../../experiments/P033_prime_sum_three_palette.py) checks every set of up to three available prime colors and determines the true minimum for all 3≤n≤120. Every tested instance needs **exactly two or three colors**; none needs more than three. There are 28 two-color and 90 three-color instances in this range.

These earlier finite checks were not, by themselves, a proof of the all-order statement. The effective theorem and complete interval certificate above now resolve the formerly open finite-exception problem.

## An easier question already settled

Let q(n) be the **first prime greater than n**. The graph consisting of *all* prime-sum edges whose sums are at most q(n) is connected for every n≥2.

**Proof:** for n=2, the edge 1–2 has sum 3=q(2). Suppose the claim holds for n. The threshold q(n+1) is at least q(n), so all old edges remain. Bertrand's postulate gives n+1<q(n+1)<2(n+1) for n+1≥3; therefore the new vertex n+1 has a prime-sum edge to the old vertex q(n+1)−(n+1)∈[1,n]. Induction completes the proof. □

This connectivity theorem is **not** the three-color problem: it allows all primes up to q(n), an unbounded number of colors. The easy version was therefore not entered as a separate open conjecture.

## Source/priority gate

- [Chen–Fu–Guo, *Hamiltonicity in Prime Sum Graphs*](https://doi.org/10.1007/s00373-020-02241-1): the host graph and prime-sum paths have published results.
- [Croot–Jin, *Prime Sum Graphs and the Induced Trees They Contain*](https://doi.org/10.1007/s00373-025-02999-2): structural theory of the same arithmetic graph.
- [Prime-sum Hamiltonian-path discussion](https://mathoverflow.net/questions/241569/for-which-n-is-there-a-permutation-such-that-the-sum-of-any-two-adjacent-eleme): the reflection method underlying the two-color characterization is an established construction.
- [P009 two-prime sum-palette pairings](../number-theory/P009-two-prime-palette-pairings.md): a **perfect matching** uses one or two sum colors, while this problem requires the **union** of a few prime-color matchings to be connected. These are different combinatorial questions.

Historical priority of the new all-order connected-palette theorem remains unverified. Compare particularly the Hamiltonian-prime-set constructions in Chen–Fu–Guo (2021), prime-sum graph Hamiltonicity in She (2026), and related affine-reflection arguments; unrestricted Hamiltonicity does not impose a three-color constraint.
