# P027 — Mixing and geometry of maximum primitive-set exchanges

<!-- DOSSIER-SUMMARY -->
> **Research question:** Determine the mixing-time order and possible cutoff for single-chain heat-bath dynamics on maximum primitive subsets of [2n].  
> **Formulation:** candidate. **Novelty:** not certified; closely related to counting primitive sets and distributive-lattice walks.  
> **Verified/known progress:** Exact exchange diameter and isolated 23-state factors; certified full mixing lower bound (121926/66083)n log n−O(n) and 23-adic divisibility; full mixing unresolved.  
> **Finite evidence:** Exact 23-state enumeration; improved rational Rayleigh 66083/243852 (older 101/363); five-block isolation proved and finitely checked.  
> **Symbolic prize:** One hundred grams of caviar — A classification of irreducible components and a sharp mixing-time estimate on a specified nontrivial component.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

**Area:** multiplicative combinatorics, graph reconfiguration, probability. **Status:** candidate with a proved structural foundation.

## Definitions

A primitive set A⊂[2n] is one in which no two distinct elements divide one another. Its maximum size is n (the upper half {n+1,…,2n} attains this). Let M_n be the family of all size-n primitive sets. Join A,B∈M_n when they differ by exactly one element. The resulting *exchange graph* is G_n.

For every odd u≤2n, its dyadic chain C_u={u,2u,4u,…}∩[2n] meets each A∈M_n in exactly one element. The single-chain **heat-bath walk** chooses an odd u uniformly and uniformly replaces the choice in C_u by one of the choices preserving primitivity and size n, including the current choice. The chain is reversible with the uniform distribution on M_n.

**P027.** Determine the total-variation mixing-time order of this walk as n→∞; is there cutoff? Relate the spectral gap to arithmetic divisibility constraints among odd u. The question is *not* whether the exchange graph is connected: that is established below.

## Structural theorem already proved within the project

Let e_A(u)≥0 satisfy u2^{e_A(u)}∈A. For odd u<v with u|v, A is primitive precisely when

$$
e_A(u)>e_A(v).
$$

The feasible exponent vectors are closed under coordinatewise minimum and maximum. The graph distance is exactly

$$
d_{G_n}(A,B)=\#\{u\le2n:\ u\text{ odd},\ e_A(u)\ne e_B(u)\}.
$$

Consequently,

$$
\boxed{\mathrm{diam}(G_n)=
\#\{u\le n/2:\ u\text{ odd}\}+
\#\{2n/3<u\le n:\ u\text{ odd}\}
=\frac{5n}{12}+O(1).}
$$

**Proof:** see [Primitive-set exchange geometry](../../theorems/P027-primitive-set-exchange-diameter.md). The source decomposition is classical and the theorem is **internally proved**, not externally refereed or historically certified original.

## Exact autonomous factor and rigorous mixing lower bound

The [autonomous-coordinate theorem](../../theorems/P027-autonomous-coordinate-hypercube-cutoff.md) identifies **five disjoint arithmetic bands** of coordinates that are completely unconstrained by every other coordinate. Their number satisfies

$$
k_n=\frac{1454}{8505}n+O(1).
$$

Under the uniform distribution on maximum primitive sets these coordinates are independent fair bits; the state space is exactly their hypercube times a residual interacting factor. The single-chain heat-bath walk projected onto these bits has **total-variation cutoff** at (n/2)log k_n with O(n) window. Therefore the **full chain** has the rigorous necessary mixing time

$$
t_{\mathrm{mix}}(n,\varepsilon)\ge\frac n2\log n-O_\varepsilon(n).
$$

The full transition operator splits into a hypercube refresh and a **residual core** operator, giving an exact spectral decomposition and reducing the remaining upper-bound question to the core chain. None of this proves the full walk mixes in O(n log n), has a cutoff, or has a spectral gap of order 1/n. The [dependency-free finite checker](../../experiments/P027_autonomous_coordinates.py) and [optional full-chain spectral diagnostic](../../experiments/P027_full_heatbath_spectrum.py) accompany the proof.

## New 23-state mixing obstruction

The [isolated arithmetic-block theorem](../../theorems/P027-five-site-arithmetic-blocks-and-mixing-lower-bound.md) identifies a positive density of mutually independent **five-site factors with 23 configurations**. Their exact 23-state heat-bath generator has an improved certified rational Rayleigh quotient $66083/243852$ (sharpening the previous $101/363$ certificate). Consequently the full-chain lower bound is

$
\boxed{t_{\mathrm{mix}}(n,\varepsilon)\ge
\frac{121926}{66083}n\log n-O_\varepsilon(n).}
$

The projection onto these factors has total-variation cutoff; **the entire P027 walk has no proved cutoff or matching upper bound**. The factorization also implies

$$
23^{k_n}\mid f(n),\qquad
k_n=\frac{16}{63063}n+O(1),
$$

where $f(n)$ counts maximum primitive sets. Independently isolated three-state pairs also imply a 3-adic valuation lower bound. Exact arithmetic certificates and finite isolation checks appear in the [verification script](../../experiments/P027_five_site_mixing_obstruction.py). The underlying counting framework is established work and the precise historical originality remains unverified.

## Existing literature and novelty caveat

- [Liu–Pach–Palincza, *The number of maximum primitive sets of integers* (2021)](https://doi.org/10.1017/S0963548321000018): crucial primary predecessor. They prove the exponential counting constant exists; **the family M_n and dyadic chain decomposition are known**. Do not present either as original.
- [Heat-bath random walks with Markov bases (2018)](https://doi.org/10.1016/j.aam.2017.08.002): general heat-bath dynamics on integer fibers.
- [Propp–Wilson, *Exact sampling with coupled Markov chains* (1996)](https://doi.org/10.1002/(SICI)1098-2418(199608/09)9:1/2%3C223::AID-RSA14%3E3.0.CO;2-O): establishes general monotone exact sampling and supplies examples with exponentially slow mixing; **distributivity is insufficient to guarantee rapid mixing**.
- [Alexeev et al., *Primitive sets and von Mangoldt chains* (2026)](https://arxiv.org/abs/2605.00301): uses a different chain to bound weighted primitive-set sums; not the finite uniform heat-bath process.
- [Rowmotion Markov chains (2024)](https://www.sciencedirect.com/science/article/pii/S0196885823001847): random walks on distributive lattices; closely related abstract machinery.

A specialized mixing theorem could already apply to this arithmetic poset. The exact-diameter argument is included for transparency, not novelty certification.

## Next adversarial gate

Seek a known general mixing theorem for uniformly random order ideals or monotone functions that subsumes the exponent constraints. Classify the slowest positive-density arithmetic motifs, and obtain a uniform spectral-gap lower bound for the **residual core** and determine whether the full walk has O(n log n) mixing or cutoff. Compare two natural update rules (whole-chain heat bath versus adjacent 2-exponent toggles) rather than conflating their mixing times.
