# The Scottish Book

<p align="center">
  <img src="assets/scottish-book.jpg" alt="Photograph of the original Scottish Book notebook" width="560">
</p>

<p align="center"><small>The Scottish Book. <a href="assets/README.md">Image provenance and reuse information</a>.</small></p>

*An independent, collaborative mathematical notebook inspired by the Scottish Café of Lwów.*

**Can humans and AI systems collaborate to formulate new mathematical problems of lasting significance?** This collection explores that question through precise formulations, prior-art comparison, independent criticism, proofs, counterexamples and reproducible computation.

The [Scottish Book](https://link.springer.com/book/10.1007/978-3-319-22897-6), kept at the Scottish Café in Lwów beginning in 1935, recorded mathematical questions and occasionally offered prizes for solutions. This contemporary collection follows its tradition of accessible, collaborative problem formulation. It is independent of the original historical notebook and its successors.

Many entries were developed through **human–AI collaboration**. Mathematical validity and historical priority must be assessed independently of provenance. Human-only contributions are equally welcome. See [provenance and credit](PROVENANCE.md). **Contributions are welcome.**

**[Propose a problem with a simple form](https://github.com/gsidoine/the-scottish-book/issues/new?template=propose-problem.yml)** · [Browse the searchable book](https://gsidoine.github.io/the-scottish-book/) · [Contribute a proof or correction](CONTRIBUTING.md) · [Symbolic rewards](REWARDS.md)

The collection also retains a historical encouragement to problem formulation:

> “The purpose of life is to prove and to conjecture.” — Paul Erdős ([MacTutor, University of St Andrews](https://mathshistory.st-andrews.ac.uk/Biographies/Erdos/quotations/))

This collection currently contains **50 numbered research entries (P001–P050)**. New proposals do not receive a permanent identifier until reviewed.

## Catalogue

[Complete numbered catalogue](#problem-catalogue) · [Mathematical status](#status-and-scope) · [Prizes and historical designations](REWARDS.md) · [Contributions](CONTRIBUTING.md)

The catalogue contains all numbered entries in a single sequence. Mathematical formulation and the assessment of historical novelty are recorded separately. A reward, where specified, is a symbolic designation with an explicit condition; it does not measure difficulty, originality, or importance.

## Status and scope

| Status | Entries | Meaning |
|---|---:|---|
| Candidate | 38 | Precisely defined open question with a substantive unresolved mathematical target; novelty is not certified |
| Reframe | 8 (P007, P009, P012, P013, P025, P029, P032, P037) | A predecessor or insufficiently independent target requires a stronger mathematical formulation |
| Needs specification | 2 (P008, P022) | A sharper quantified problem or nontrivial asymptotic target is required |
| Proved internally | 1 (P010) | Exact theorem kernel-checked in Lean 4; journal review and historical priority remain separate |
| Known result | 1 (P048) | The statement is resolved by established mathematics; retained to preserve its permanent identifier |

Computational verification establishes only the stated finite cases. An internal proof is not a claim of verified historical novelty. The full collection is open to mathematical corrections and independent assessments.

## Symbolic rewards

The original Scottish Book included prizes associated with particular questions, including prizes depending on the kind of solution. This collection uses four [modern symbolic designations](REWARDS.md)—A Coffee, A Book, A Dinner, and A Research Prize—while preserving the historically documented prizes and previous assignments. They form no scale of difficulty or prestige. The catalogue distinguishes symbolic, pledged, funded, and awarded states; every current assignment is **symbolic**, and **no physical prize is presently offered**. A dash in the catalogue denotes no assigned reward.

## Manuscript record

**[P010 — Minimum coprime adjacencies](problems/graph-theory/P010-minimum-coprime-adjacencies.md)** has a [complete Lean-verified exact theorem](formal/P010/README.md), checked without nonfoundational axioms. The [submitted manuscript](manuscripts/P010/coprime_adjacencies.pdf) was submitted to the journal _Integers_; submission does not imply acceptance or publication. The archived PDF, the accompanying manuscript record, and its factual AI-use statement are preserved. The journal [permits supporting AI-tool use](https://math.colgate.edu/~integers/submit.html), subject to its stated rules.

## Problem folders

Problems are classified by mathematical subject. Detailed folders collect proofs, exploration, references, verification and optional formalization files. Examples are [P015 (geometry)](problems/geometry/P015-odd-area-triangulations/README.md), [P020 (number theory)](problems/number-theory/P020-padic-hankel-cokernels/README.md) and [P047 (topology)](problems/topology/P047-perfect-algebraic-fusion/README.md). Earlier single-file dossiers remain accessible as historical records.

A contributor may [submit a proposed problem](https://github.com/gsidoine/the-scottish-book/issues/new?template=propose-problem.yml) using Markdown or TeX, select a mathematical field, describe sources and AI involvement, and suggest an optional symbolic reward. A moderator can convert an issue into a draft PR; proposals are not automatically admitted to the book.

## Historical inspiration

<p align="center">
  <img src="assets/Banach.jpg" alt="Historical portrait of mathematician Stefan Banach" width="350">
</p>

Stefan Banach was one of the mathematicians associated with the Scottish Café in Lwów, where mathematical problems were recorded in a shared notebook. This contemporary collection takes its name from that tradition; it is not an edition of the original book or its official continuation. See [the historical Scottish Book](https://link.springer.com/book/10.1007/978-3-319-22897-6) and the [image provenance notes](assets/README.md).

## Literature and verification

The [P001–P050 mathematical merit review](audits/P001-P050-mathematical-merit-review.md) examines the substance and precision of every numbered statement, including four demotions. The [P001–P050 literature comparison](audits/P001-P050-literature-comparison.md) records principal known predecessors and historical-priority uncertainty. It does not certify novelty or unresolved status.

The [specialist scrutiny of P020–P050](audits/P020-P050-specialist-priority-gates.md) distinguishes proved resolutions from adjacent literature for the principal current candidates. In particular, P048 is resolved by classical prime-reflection pairing and is not an open prize question.

### Historical source reviews

The [P001–P020 consolidation](audits/2026-10-29-P001-P020-first-collection-consolidation.md), [P001–P025 literature gate](audits/2026-10-29-P001-P025-literature-source-gate.md), and [P001–P030 portfolio consolidation](audits/portfolio-consolidation-P001-P030.md) are historical audits, not the current curation. Their mathematical and bibliographic conclusions are retained as research records.

The [P001–P041 literature comparison](audits/literature-comparison-P001-P041.md) is a historical review, not a current certification of the full catalogue. Individual entries carry their own closest sources and verification links. [P010's manuscript information](manuscripts/P010/README.md) preserves its submission status and archival checksum.

## Problem catalogue

This is the **single numbered catalogue of all 50 entries**. The canonical catalogue is [data/problems.json](data/problems.json); its derived tables and [GitHub Pages browser](https://gsidoine.github.io/the-scottish-book/) are generated. [Searchable browser](https://gsidoine.github.io/the-scottish-book/).

<!-- CATALOG:START -->
| ID | Question | Area | Formulation | Novelty | Reward |
|---|---|---|---|---|---|
| [P001](problems/number-theory/P001-prime-spectrum.md) | Prime-spectrum saturation | number theory | candidate | not certified; targeted literature comparison only | A Coffee (symbolic) — A proof of bounded prime-sum deficit, or an unbounded sequence of deficits. |
| [P002](problems/graph-theory/P002-prime-matching-reconfiguration.md) | Prime-sum matching reconfiguration | graph theory | candidate | not certified; targeted literature comparison only | A Coffee (symbolic) — A classification of four-cycle-switch components for all prime-sum perfect matchings. |
| [P003](problems/graph-theory/P003-prime-matching-packing.md) | Edge-disjoint prime-sum matchings | graph theory | candidate | not certified; targeted literature comparison only | A Book (symbolic) — A proof of matching-packing equality for every order, or a counterexample. |
| [P004](problems/number-theory/P004-sidon-exchange-connectivity.md) | Sidon exchange connectivity | additive combinatorics | candidate | not certified; targeted literature comparison only | A Research Prize (symbolic) — An asymptotic determination of the connectivity threshold for one-mark Sidon exchanges. |
| [P005](problems/graph-theory/P005-coprime-permutation-switches.md) | Coprime permutation switches | graph theory | candidate | not certified; targeted literature comparison only | A Research Prize (symbolic) — A necessary and sufficient criterion for connected coprime-permutation switch graphs. |
| [P006](problems/number-theory/P006-prime-avoiding-sidon-sets.md) | Sidon sets without prime differences | additive combinatorics | candidate | not certified; targeted literature comparison only | A Dinner (symbolic) — The sharp leading constant in the maximum size of a prime-difference-free Sidon set. |
| [P007](problems/graph-theory/P007-coprime-difference-spectrum.md) | Coprime path difference spectrum | graph labeling | reframe | known subproblem; extension unverified | A Dinner (symbolic) — A proof or disproof of eventual attainment of the parity upper bound for coprime paths. |
| [P008](problems/probability/P008-coprime-percolation-critical-window.md) | Arithmetic centering of coprime percolation | probability | needs specification | needs precise formulation | A Coffee (symbolic) — A specified non-tautological expansion of the arithmetic connectivity threshold with a proved error term. |
| [P009](problems/number-theory/P009-two-prime-palette-pairings.md) | Two-prime palette pairings | number theory | reframe | high overlap: Maillet-type prime differences and OEIS A202472; distinct pairing statement not shown equivalent | A Book (symbolic) — A proof that two prime sums suffice for every positive integer n, or an explicit counterexample. |
| [P010](problems/graph-theory/P010-minimum-coprime-adjacencies.md) | Minimum coprime adjacencies | graph theory | proved internally | internal proof; priority unverified | A Coffee (symbolic) — An independently checked Lean formalization of the exact coprime-adjacency theorem. |
| [P011](problems/probability/P011-random-sum-diagonal-matchings.md) | Random sum-diagonal matching transitions | probability | candidate | not certified; targeted literature comparison only | A Research Prize (symbolic) — A rigorous threshold law for perfect matchings in the random sum-diagonal graph model. |
| [P012](problems/probability/P012-coprime-matching-space-percolation.md) | Coprime matching-space percolation | probability | reframe | model and switch chain have known predecessors; no arithmetic-specific fragmentation regime established | A Book (symbolic) — A proved asymptotic law for switch-space connectivity in a specified nontrivial thinning regime, or an explicit arithmetic fragmentation obstruction. |
| [P013](problems/probability/P013-random-sidon-reconfiguration.md) | Random-site Sidon exchange geometry | probability | reframe | random Sidon thresholds and exchange heuristics have predecessors; no fixed k(N),q(N) regime with a proved new phenomenon | A Coffee (symbolic) — A sequence of site probabilities where Sidon configurations exist with high probability but the exchange graph is disconnected with high probability. |
| [P014](problems/topology/P014-random-cayley-sum-flag-homology.md) | Homology of random Cayley sum flag complexes | probabilistic topology | candidate | not certified; targeted literature comparison only | A Dinner (symbolic) — A proof or disproof that the specified Cayley-sum flag-complex homology thresholds match the independent-edge model. |
| [P015](problems/geometry/P015-odd-area-triangulations/README.md) | Odd-area lattice triangulation flip connectivity | discrete geometry | candidate | high overlap risk: colored triangulation flip graphs | A Coffee (symbolic) — A general proof of four-class odd-area flip connectivity, or a finite counterexample. |
| [P016](problems/topology/P016-sidon-complex-homology.md) | Topology of the Sidon simplicial complex | topological combinatorics | candidate | not certified; targeted literature comparison only | A Dinner (symbolic) — A proof of eventual vanishing for each fixed homological degree, or an infinite nonvanishing family. |
| [P017](problems/probability/P017-random-divisibility-chain-height.md) | Random divisibility-poset chain height | probability | candidate | not certified; targeted literature comparison only | A Coffee (symbolic) — Existence or nonexistence of the normalized longest-chain limit for a fixed site density strictly between zero and one. |
| [P018](problems/matroid-theory/P018-conserved-xor-basis-fibers.md) | Conserved-XOR basis exchange fibers | matroid theory | candidate | not certified; targeted literature comparison only | A Research Prize (symbolic) — The least uniform exchange size connecting every feasible conserved-XOR basis fiber. |
| [P019](problems/geometry/P019-no-three-line-exchange.md) | Exchange complexity of optimal no-three-in-line configurations | discrete geometry | candidate | not certified; targeted literature comparison only | A Book (symbolic) — A universal bound on simultaneous replacements in optimal no-three-in-line configurations, or a proof of unboundedness. |
| [P020](problems/number-theory/P020-padic-hankel-cokernels/README.md) | Cokernel laws of random p-adic Hankel matrices | algebraic probability | candidate | not certified; targeted literature comparison only | A Research Prize (symbolic) — An explicit limiting distribution for random p-adic Hankel cokernels, or a proof that it does not exist.; A Coffee (symbolic) — An exact probability for a previously untreated three-generator higher-exponent cokernel class. |
| [P021](problems/probability/P021-cayley-sum-sandpile-laws.md) | Random Cayley-sum sandpile groups | algebraic probability | candidate | not certified (targeted audit) | A Dinner (symbolic) — An explicit limiting Sylow-group distribution for the correlated Cayley-sum sandpile model. |
| [P022](problems/geometry/P022-random-unimodular-triangle-complex.md) | Random unimodular triangle complex homology | discrete geometry | needs specification | only a one-square finite example established; no focused homological degree, critical exponent or verified new asymptotic phenomenon | — |
| [P023](problems/probability/P023-random-prime-incidence-rank.md) | Rank of random prime-divisibility incidence matrices | probabilistic number theory | candidate | not certified (targeted audit) | A Coffee (symbolic) — A sharp threshold for full rank of the random prime-incidence matrix. |
| [P024](problems/graph-theory/P024-zero-forcing-divisor-graph.md) | Zero forcing on the divisor comparability graph | graph theory | candidate | not certified (targeted audit) | A Dinner (symbolic) — The first-order asymptotics of the zero-forcing number of the divisor comparability graph. |
| [P025](problems/number-theory/P025-lcm-hamiltonian-bottleneck.md) | Cyclic lcm Hamiltonian bottleneck | number theory | reframe | confirmed collision for linear-path analogue | A Book (symbolic) — A proof or disproof of the cyclic analogue of the known adjacent-lcm bottleneck asymptotic. |
| [P026](problems/graph-theory/P026-prime-sum-square-cycle-generation.md) | Four-cycle generation in prime-sum bipartite graphs | graph theory | candidate | not certified (specialist source check needed) | A Coffee (symbolic) — A proof that prime-sum four-cycles span the binary cycle space in all orders, or a counterexample. |
| [P027](problems/number-theory/P027-primitive-set-exchange-mixing.md) | Mixing of maximum primitive-set exchanges | multiplicative combinatorics | candidate | not certified; closely related to counting primitive sets and distributive-lattice walks | A Research Prize (symbolic) — A sharp full-chain mixing-time order with a matching upper bound, or a proof that the mixing scale exceeds every fixed multiple of n log n. |
| [P028](problems/number-theory/P028-random-divisor-complex-mobius-deformation.md) | Möbius deformation from random divisibility complexes | analytic number theory | candidate | not certified; arithmetic Dirichlet convolution and order-complex Möbius theory are classical | A Dinner (symbolic) — A nondegenerate fluctuation law for the random Euler characteristic after explicit centering and scaling. |
| [P029](problems/graph-theory/P029-prime-sum-permutation-xray-fibers.md) | Prime-supported permutation X-ray fiber reconfiguration | combinatorics | reframe | known exact anti-diagonal X-ray invariant; novelty of prime-restricted bounded Markov moves unverified | A Book (symbolic) — A universal bounded-size exchange theorem for nontrivial prime-sum X-ray fibers, or counterexamples with unbounded exchange size. |
| [P030](problems/number-theory/P030-double-prime-perfect-matchings.md) | Double-prime perfect matchings on integer intervals | number theory | candidate | not certified; prime sum/difference cycles have explicit earlier study | A Coffee (symbolic) — A perfect double-prime matching for every even order at least eight, or an exceptional order. |
| [P031](problems/number-theory/P031-coprime-sidon-extremum.md) | How large can a pairwise-coprime Sidon set be? | number theory | candidate | not certified; Sidon sets of primes and additive-multiplicative restrictions require a specialist search | A Book (symbolic) — A sharp asymptotic for the maximum size of a pairwise-coprime Sidon subset of an initial interval. |
| [P032](problems/graph-theory/P032-prime-sum-bipartite-diameter.md) | Is the prime-sum bipartite diameter eventually seven? | graph theory | reframe | strong overlap: bounded prime differences and Erdős Problem 17; exact quantifiers not equivalent | A Dinner (symbolic) — A proof of eventual diameter seven in prime-sum bipartite graphs, or infinitely many failures. |
| [P033](problems/graph-theory/P033-prime-sum-three-palette.md) | Can three prime sums connect all integers? | graph theory | candidate | not certified; Chen–Fu–Guo (2021) established three-color Hamiltonian-prime-set phenomena for some orders, not this stated eventual connectivity theorem | A Research Prize (symbolic) — A proof that three prime sums always connect the graph on an initial interval, or a counterexample. |
| [P034](problems/graph-theory/P034-four-prime-sum-biconnectivity.md) | Four prime sums without cut vertices | graph theory | candidate | unverified; prime-sum connectivity predecessor | A Coffee (symbolic) — A construction using four prime sums for every odd order at least seven, or an exceptional order. |
| [P035](problems/number-theory/P035-primitive-sidon-coloring.md) | Sidon coloring by divisibility antichains | additive combinatorics | candidate | high overlap risk: Sidon–Ramsey coloring and primitive sets | A Research Prize (symbolic) — An asymptotically optimal Sidon and divisibility-antichain coloring, or a larger lower bound. |
| [P036](problems/probability/P036-random-schur-hypergraph-two-core.md) | When does a random Schur hypergraph acquire a 2-core? | probability | candidate | unverified; Schur Ramsey thresholds are close but the peeling observable is different | A Dinner (symbolic) — The critical scale and limiting law for the first nonempty two-core in a random Schur hypergraph. |
| [P037](problems/graph-theory/P037-induced-gcd-cycle-prime-gap-deficit.md) | Prime-gap deficit of induced cycles in the non-coprime graph | graph theory | reframe | leading induced-cycle asymptotic and unbounded deficit already proved; residual maximal-deficit question presently transfers classical prime-gap fluctuations | A Coffee (symbolic) — The maximal-order growth of the induced-cycle prime-gap deficit. |
| [P038](problems/graph-theory/P038-coprime-induced-matching.md) | Fine asymptotics of induced matchings in the coprime graph | graph theory | candidate | unverified; classical Bollobás set-pair extremality is the main predecessor | A Coffee (symbolic) — A sharpened asymptotic error term for the logarithm of the coprime-graph induced-matching number. |
| [P039](problems/number-theory/P039-prime-product-plus-one-matching.md) | Perfect matchings with prime product plus one | number theory | candidate | high overlap: closely related 2020 MathOverflow bilinear prime pairing with two intervals and either sign | A Book (symbolic) — A proof that prime-product-plus-one pairings exist for every n≥1, or a single explicit counterexample. |
| [P040](problems/graph-theory/P040-coprime-matching-local-resilience.md) | Local resilience of coprime perfect matchings | graph theory | candidate | unverified; original half-resilience conjecture disproved by finite-prime Hall cuts; true sharp limit unknown | A Research Prize (symbolic) — Existence and exact value of the limiting coprime-matching local resilience. |
| [P041](problems/probability/P041-random-order-divisibility-chains.md) | Random-order divisibility chains | probability | candidate | unverified; related arithmetic-subsequence and hypercube accessibility results are established | A Book (symbolic) — A limiting constant for the second-order gap between unrestricted and squarefree random divisibility chains. |
| [P042](problems/graph-theory/P042-kummer-one-carry-graph.md) | Hamiltonian paths in one-carry graphs | graph theory | candidate | unverified; Kummer's theorem and digital carry combinatorics are classical, precise Hamiltonian question requires specialist review | A Dinner (symbolic) — Hamiltonian paths for every one-carry graph of dimension at least four, or one explicit counterexample. |
| [P043](problems/graph-theory/P043-prime-denominator-farey-components.md) | Components of the prime-denominator Farey graph | graph theory | candidate | unverified; Farey graphs and prime-denominator fractions have established prior art | A Coffee (symbolic) — A sharp asymptotic for the largest component of the prime-denominator Farey graph. |
| [P044](problems/probability/P044-squarefree-displacement-permutations.md) | Squarefree displacement permutations | probability | candidate | unverified; related squarefree-sum permanents and classical permanent bounds are known | A Research Prize (symbolic) — The optimal order of the error in the squarefree-displacement permanent asymptotic. |
| [P045](problems/number-theory/P045-additive-multiplicative-complete-mappings.md) | Additive complete mappings with almost distinct products | number theory | candidate | unverified; additive and multiplicative complete mappings have extensive literature | A Coffee (symbolic) — A complete construction of almost-distinct-product additive complete mappings for all primes at least five, or a counterexample. |
| [P046](problems/number-theory/P046-prime-xor-sidon-sets.md) | Sidon sets of primes under binary XOR | number theory | candidate | unverified; binary Sidon sets and APN functions are classical, prime-restricted extremal size needs comparison | A Book (symbolic) — A constant-factor square-root lower bound for XOR-Sidon sets of primes in all sufficiently large dyadic intervals.; A Coffee (symbolic) — An improvement of the current 1/m factor in the dyadic XOR-Sidon lower bound. |
| [P047](problems/topology/P047-perfect-algebraic-fusion/README.md) | Full-dimensional simultaneous Sidon sets in a local field | topological combinatorics | candidate | unverified; close to Mycielski perfect-set fusion and quantitative pattern avoidance in local fields | A Book (symbolic) — A full-dimensional compact perfect simultaneous four-point Sidon set, or a proof that none exists. |
| [P048](problems/number-theory/P048-coprime-squarefree-permutations.md) | Coprime permutations with squarefree sums | arithmetic combinatorics | known result | resolved by the classical Bertrand prime-reflection construction; not an open problem | — |
| [P049](problems/probability/P049-random-coprimality-matrix-rank.md) | Rank of a randomly thinned coprimality matrix | probability | candidate | unverified; full-matrix rank classical, random principal-submatrix limit needs a targeted specialist comparison | A Research Prize (symbolic) — A proved limit and explicit characterization of the rank density for every fixed retention probability. |
| [P050](problems/graph-theory/P050-prime-hamming-cube-colorings.md) | Prime-Hamming cube colorings at dyadic dimensions | graph theory | candidate | high overlap risk: hypercube distance colorings; first-order asymptotics already follow from established coding theory | A Coffee (symbolic) — A proof or counterexample to the exact dyadic prime-Hamming cube coloring formula. |
<!-- CATALOG:END -->
