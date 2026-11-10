# P033 — Prime-label resilience and many disjoint connecting palettes

**Status:** rigorous combinatorial corollaries *conditional on the correctness of the existing P033 prime-palette density theorem*. Internal proof complete; source priority unverified. These are asymptotic statements and do not themselves provide the all-n proof or an effective bound. The [later universal theorem](P033-universal-three-prime-sum-connectivity.md) supplies both independently.

## Setup

Fix `0 < delta < 1/5`. Let `A_n` be the primes in `((1-delta)n,n)` and `B_n` the primes in `(n,(1+delta)n)`. Write `L=|A_n|`, `U=|B_n|`, and let `H_n` be the 3-uniform hypergraph on the *prime labels* `A_n union B_n` whose hyperedges are triples `{p,q,r}` with `p<q` in `A_n`, `r` in `B_n`, such that the associated prime-sum graph on `[n]` is connected.

By [the P033 density theorem](P033-prime-palette-density-and-reflection-criterion.md), if

$$
\mathfrak C=\frac34\prod_{\ell\ge3\text{ prime}}\left(1-\frac1{(\ell-1)^2}\right),
$$

then

$$
L\sim U\sim\frac{\delta n}{\log n},
\qquad
E_n:=|E(H_n)|=(\mathfrak C+o(1))\binom L2 U
=\left(\frac{\mathfrak C}{2}+o(1)\right)L^2U.
$$

No independence assumption between successful hyperedges is needed below.

## Theorem A — Resilience under deletion of prime-sum labels

For each fixed `epsilon > 0`, for all sufficiently large `n`, deleting **any** set of at most

$$
\left(\frac{\mathfrak C}{2}-\epsilon\right)
\frac{\delta n}{\log n}
$$

prime labels from `A_n union B_n` still leaves three undeleted prime sums whose edge-sum graph connects `[n]` (when the displayed threshold is positive).

**Proof.** A lower-side prime label belongs to at most `(L-1)U` potential triples, and an upper-side label to at most `binom(L,2)`. Hence the maximum hypergraph degree `Delta_n` satisfies

$$
\Delta_n\le\max\{(L-1)U,\binom L2\}=(1+o(1))LU.
$$

Deleting `t` labels can destroy at most `t Delta_n` successful triples, by the union bound on incident hyperedges. As

$$
\frac{E_n}{\Delta_n}\ge
\left(\frac{\mathfrak C}{2}+o(1)\right)L
=\left(\frac{\mathfrak C}{2}+o(1)\right)\frac{\delta n}{\log n},
$$

at least one hyperedge survives whenever `t<E_n/Delta_n`. QED.

This is *adversarial* deletion resilience: labels need not be selected randomly, and an adversary can see the entire set of connecting triples.

## Theorem B — Linearly many label-disjoint connecting palettes

For every fixed `epsilon>0`, for all sufficiently large `n`, there exist at least

$$
\left(\frac{\mathfrak C}{6}-\epsilon\right)
\frac{\delta n}{\log n}
$$

pairwise disjoint three-prime palettes, **each** of which produces a connected graph on `[n]` (when the threshold is positive).

**Proof.** Greedily select a hyperedge of `H_n` and delete all hyperedges incident to any of its three vertices. At most `3 Delta_n` hyperedges are removed per selection. When none remain, at least `E_n/(3 Delta_n)` selections have been made. The bounds above imply

$$
\nu(H_n)\ge\frac{E_n}{3\Delta_n}
\ge\left(\frac{\mathfrak C}{6}+o(1)\right)
\frac{\delta n}{\log n}.
$$

The selected hyperedges are vertex-disjoint as sets of *prime labels*. QED.

## Interpretation and limitations

* Every selected 3-prime palette individually spans a connected sum-edge graph on the same vertex set `[n]`. These are **not** edge-disjoint graph copies: different prime sums can generate graph edges that share endpoints, and the conclusion concerns disjoint *sum labels*, not disjoint graph vertices.
* Numerically, the coefficients are `mathfrak C/2 ≈ 0.24756069` for deletion resilience and `mathfrak C/6 ≈ 0.08252023` for disjoint palettes, multiplied by `delta n/log n`.
* Both constants are conservative counting bounds, not claims of optimality. The resilience and matching statements have no effective `n_0` because the parent density theorem has no quantitative error term.
* These resilience statements alone do not imply that every `n>=3` has a connecting three-prime palette. The gap has since been closed by the independent [effective theorem](P033-universal-three-prime-sum-connectivity.md).
* Novelty is **unverified**: these deductions are standard hypergraph maximum-degree and greedy-matching arguments applied to the P033 density theorem. They should not be marketed as independently novel methods.

## Next gate

The all-n connectivity question is resolved by explicit analytic bounds and finite certification in the [effective theorem](P033-universal-three-prime-sum-connectivity.md). Remaining questions concern quantitative palette robustness, expansion, and Hamiltonian subgraphs under a fixed small set of prime sums.
