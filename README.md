# The Problem Café

*A collaborative mathematical problem book, inspired by the Scottish Café.*

**Can humans and AI systems collaborate to formulate new mathematical problems of lasting significance?** This collection explores that question through precise formulations, prior-art comparison, independent criticism, proofs, counterexamples and reproducible computation.

The [Scottish Book](https://link.springer.com/book/10.1007/978-3-319-22897-6), kept at the Scottish Café in Lwów beginning in 1935, recorded mathematical questions and occasionally offered prizes for solutions. This modern notebook follows its spirit of accessible, collaborative problem formulation. The collection is not affiliated with the original Scottish Book or with [Erdős Problems](https://www.erdosproblems.com/).

Many entries were developed through **human–AI collaboration**. Mathematical validity and historical priority must be assessed independently of provenance. Human-only contributions are equally welcome. **Contributions are welcome.** See [provenance and credit](PROVENANCE.md).

**[Propose a problem with a simple form](https://github.com/gsidoine/meta-erdos/issues/new?template=propose-problem.yml)** · [Browse the searchable book](https://gsidoine.github.io/meta-erdos/) · [Contribute a proof or correction](CONTRIBUTING.md) · [Symbolic rewards](REWARDS.md)

This collection currently contains **46 numbered research entries (P001–P046)**. New proposals do not receive a permanent identifier until reviewed.

## Browse the book

[The Acorns](#the-acorns) · [The Seedbed](#the-seedbed) · [The Harvest](#the-harvest) · [Complete index](#problem-catalogue) · [Contributing](CONTRIBUTING.md)

## Status and scope

| Status | Entries | Meaning |
|---|---:|---|
| Candidate | 42 | Research question under investigation; novelty and unresolved status are not certified |
| Reframe | 2 (P007, P025) | A known predecessor requires the remaining question to be narrowed |
| Needs specification | 1 (P008) | The open objective requires a sharper formulation |
| Proved internally | 1 (P010) | A complete proof is supplied; external review and historical priority remain separate |

Numerical checks establish only their stated finite cases. The Acorns and The Seedbed indicate editorial interest, not a priority or difficulty score. Formalized statements and formalized solutions are distinguished. No symbolic reward implies a funded prize.

## The Acorns

Fifteen research questions selected for their potential mathematical consequences. Classification does not assert originality.

<!-- ACORNS:START -->
| ID | Problem | Area |
|---|---|---|
| [P003](problems/graph-theory/P003-prime-matching-packing.md) | Edge-disjoint prime-sum matchings | graph theory |
| [P005](problems/graph-theory/P005-coprime-permutation-switches.md) | Coprime permutation switches | graph theory |
| [P006](problems/number-theory/P006-prime-avoiding-sidon-sets.md) | Sidon sets without prime differences | additive combinatorics |
| [P014](problems/topology/P014-random-cayley-sum-flag-homology.md) | Homology of random Cayley sum flag complexes | probabilistic topology |
| [P017](problems/probability/P017-random-divisibility-chain-height.md) | Random divisibility-poset chain height | probability |
| [P018](problems/matroid-theory/P018-conserved-xor-basis-fibers.md) | Conserved-XOR basis exchange fibers | matroid theory |
| [P020](problems/P020-padic-hankel-cokernels/README.md) | Cokernel laws of random p-adic Hankel matrices | algebraic probability |
| [P026](problems/graph-theory/P026-prime-sum-square-cycle-generation.md) | Four-cycle generation in prime-sum bipartite graphs | graph theory |
| [P027](problems/number-theory/P027-primitive-set-exchange-mixing.md) | Mixing of maximum primitive-set exchanges | multiplicative combinatorics |
| [P030](problems/number-theory/P030-double-prime-perfect-matchings.md) | Double-prime perfect matchings on integer intervals | number theory |
| [P031](problems/number-theory/P031-coprime-sidon-extremum.md) | How large can a pairwise-coprime Sidon set be? | number theory |
| [P033](problems/graph-theory/P033-prime-sum-three-palette.md) | Can three prime sums connect all integers? | graph theory |
| [P040](problems/graph-theory/P040-coprime-matching-local-resilience.md) | Local resilience of coprime perfect matchings | graph theory |
| [P043](problems/graph-theory/P043-prime-denominator-farey-components.md) | Components of the prime-denominator Farey graph | graph theory |
| [P044](problems/probability/P044-squarefree-displacement-permutations.md) | Squarefree displacement permutations | probability |
<!-- ACORNS:END -->

## The Seedbed

Thirty research questions developing through formulation, proof, computation and literature comparison.

<!-- SEEDBED:START -->
| ID | Problem | Area |
|---|---|---|
| [P001](problems/number-theory/P001-prime-spectrum.md) | Prime-spectrum saturation | number theory |
| [P002](problems/graph-theory/P002-prime-matching-reconfiguration.md) | Prime-sum matching reconfiguration | graph theory |
| [P004](problems/number-theory/P004-sidon-exchange-connectivity.md) | Sidon exchange connectivity | additive combinatorics |
| [P007](problems/graph-theory/P007-coprime-difference-spectrum.md) | Coprime path difference spectrum | graph labeling |
| [P008](problems/probability/P008-coprime-percolation-critical-window.md) | Arithmetic centering of coprime percolation | probability |
| [P009](problems/number-theory/P009-two-prime-palette-pairings.md) | Two-prime palette pairings | number theory |
| [P011](problems/probability/P011-random-sum-diagonal-matchings.md) | Random sum-diagonal matching transitions | probability |
| [P012](problems/probability/P012-coprime-matching-space-percolation.md) | Coprime matching-space percolation | probability |
| [P013](problems/probability/P013-random-sidon-reconfiguration.md) | Random-site Sidon exchange geometry | probability |
| [P015](problems/P015-odd-area-triangulations/README.md) | Odd-area lattice triangulation flip connectivity | discrete geometry |
| [P016](problems/topology/P016-sidon-complex-homology.md) | Topology of the Sidon simplicial complex | topological combinatorics |
| [P019](problems/geometry/P019-no-three-line-exchange.md) | Exchange complexity of optimal no-three-in-line configurations | discrete geometry |
| [P021](problems/probability/P021-cayley-sum-sandpile-laws.md) | Random Cayley-sum sandpile groups | algebraic probability |
| [P022](problems/geometry/P022-random-unimodular-triangle-complex.md) | Random unimodular triangle complex homology | discrete geometry |
| [P023](problems/probability/P023-random-prime-incidence-rank.md) | Rank of random prime-divisibility incidence matrices | probabilistic number theory |
| [P024](problems/graph-theory/P024-zero-forcing-divisor-graph.md) | Zero forcing on the divisor comparability graph | graph theory |
| [P025](problems/number-theory/P025-lcm-hamiltonian-bottleneck.md) | Cyclic lcm Hamiltonian bottleneck | number theory |
| [P028](problems/number-theory/P028-random-divisor-complex-mobius-deformation.md) | Möbius deformation from random divisibility complexes | analytic number theory |
| [P029](problems/graph-theory/P029-prime-sum-permutation-xray-fibers.md) | Prime-supported permutation X-ray fiber reconfiguration | combinatorics |
| [P032](problems/graph-theory/P032-prime-sum-bipartite-diameter.md) | Is the prime-sum bipartite diameter eventually seven? | graph theory |
| [P034](problems/graph-theory/P034-four-prime-sum-biconnectivity.md) | Four prime sums without cut vertices | graph theory |
| [P035](problems/number-theory/P035-primitive-sidon-coloring.md) | Sidon coloring by divisibility antichains | additive combinatorics |
| [P036](problems/probability/P036-random-schur-hypergraph-two-core.md) | When does a random Schur hypergraph acquire a 2-core? | probability |
| [P037](problems/graph-theory/P037-induced-gcd-cycle-prime-gap-deficit.md) | Prime-gap deficit of induced cycles in the non-coprime graph | graph theory |
| [P038](problems/graph-theory/P038-coprime-induced-matching.md) | Fine asymptotics of induced matchings in the coprime graph | graph theory |
| [P039](problems/number-theory/P039-prime-product-plus-one-matching.md) | Perfect matchings with prime product plus one | number theory |
| [P041](problems/probability/P041-random-order-divisibility-chains.md) | Random-order divisibility chains | probability |
| [P042](problems/graph-theory/P042-kummer-one-carry-graph.md) | Hamiltonian paths in one-carry graphs | graph theory |
| [P045](problems/number-theory/P045-additive-multiplicative-complete-mappings.md) | Additive complete mappings with almost distinct products | number theory |
| [P046](problems/number-theory/P046-prime-xor-sidon-sets.md) | Sidon sets of primes under binary XOR | number theory |
<!-- SEEDBED:END -->

## The Harvest

**[P010 — Minimum coprime adjacencies](problems/graph-theory/P010-minimum-coprime-adjacencies.md)** has a complete internally checked construction. Its [submitted manuscript](manuscripts/P010/coprime_adjacencies.pdf) was submitted to the journal _Integers_; submission does not establish acceptance or publication. The submitted PDF and its factual AI-use disclosure remain an archival record. The journal [permits supporting AI-tool use](https://math.colgate.edu/~integers/submit.html), subject to its authorship, accuracy and disclosure requirements; later repository changes do not alter the submitted declaration.

## Problem folders

Problems gradually receive a compact public page and their own proofs, exploration, references, verification and optional Lean files. The first two examples are [P015](problems/P015-odd-area-triangulations/README.md) and [P020](problems/P020-padic-hankel-cokernels/README.md). Historical dossier URLs and existing theorem/certificate links remain available during migration.

A contributor may [submit a proposed problem](https://github.com/gsidoine/meta-erdos/issues/new?template=propose-problem.yml) using Markdown or TeX, select a mathematical field, describe sources and AI involvement, and suggest an optional symbolic reward. A moderator can convert an issue into a draft PR; proposals are not automatically admitted to the book.

## Literature and verification

### Historical source reviews

The [P001–P020 consolidation](audits/2026-10-29-P001-P020-first-collection-consolidation.md), [P001–P025 literature gate](audits/2026-10-29-P001-P025-literature-source-gate.md), and [P001–P030 portfolio consolidation](audits/portfolio-consolidation-P001-P030.md) are historical audits, not the current curation. Their mathematical and bibliographic conclusions are retained as research records.

The [P001–P041 literature comparison](audits/literature-comparison-P001-P041.md) is a historical review, not a current certification of the full catalogue. Individual entries carry their own closest sources and verification links. [P010's manuscript information](manuscripts/P010/README.md) preserves its submission status and archival checksum.

## Problem catalogue

This is a **complete archival index of all 46 IDs**. The canonical catalogue is [data/problems.json](data/problems.json); its derived tables and [GitHub Pages browser](https://gsidoine.github.io/meta-erdos/) are generated. [Searchable browser](https://gsidoine.github.io/meta-erdos/).

<!-- CATALOG:START -->
| ID | Question | Area | Formulation | Novelty |
|---|---|---|---|---|
| [P001](problems/number-theory/P001-prime-spectrum.md) | Prime-spectrum saturation | number theory | candidate | apparent novelty (targeted audit) |
| [P002](problems/graph-theory/P002-prime-matching-reconfiguration.md) | Prime-sum matching reconfiguration | graph theory | candidate | apparent novelty (targeted audit) |
| [P003](problems/graph-theory/P003-prime-matching-packing.md) | Edge-disjoint prime-sum matchings | graph theory | candidate | apparent novelty (targeted audit) |
| [P004](problems/number-theory/P004-sidon-exchange-connectivity.md) | Sidon exchange connectivity | additive combinatorics | candidate | apparent novelty (targeted audit) |
| [P005](problems/graph-theory/P005-coprime-permutation-switches.md) | Coprime permutation switches | graph theory | candidate | apparent novelty (targeted audit) |
| [P006](problems/number-theory/P006-prime-avoiding-sidon-sets.md) | Sidon sets without prime differences | additive combinatorics | candidate | apparent novelty (targeted audit) |
| [P007](problems/graph-theory/P007-coprime-difference-spectrum.md) | Coprime path difference spectrum | graph labeling | reframe | known subproblem; extension unverified |
| [P008](problems/probability/P008-coprime-percolation-critical-window.md) | Arithmetic centering of coprime percolation | probability | needs specification | needs precise formulation |
| [P009](problems/number-theory/P009-two-prime-palette-pairings.md) | Two-prime palette pairings | number theory | candidate | high overlap risk: Maillet-type prime differences |
| [P010](problems/graph-theory/P010-minimum-coprime-adjacencies.md) | Minimum coprime adjacencies | graph theory | proved internally | internal proof; priority unverified |
| [P011](problems/probability/P011-random-sum-diagonal-matchings.md) | Random sum-diagonal matching transitions | probability | candidate | apparent novelty (targeted audit) |
| [P012](problems/probability/P012-coprime-matching-space-percolation.md) | Coprime matching-space percolation | probability | candidate | apparent novelty (targeted audit) |
| [P013](problems/probability/P013-random-sidon-reconfiguration.md) | Random-site Sidon exchange geometry | probability | candidate | apparent novelty (targeted audit) |
| [P014](problems/topology/P014-random-cayley-sum-flag-homology.md) | Homology of random Cayley sum flag complexes | probabilistic topology | candidate | apparent novelty (targeted audit) |
| [P015](problems/P015-odd-area-triangulations/README.md) | Odd-area lattice triangulation flip connectivity | discrete geometry | candidate | high overlap risk: colored triangulation flip graphs |
| [P016](problems/topology/P016-sidon-complex-homology.md) | Topology of the Sidon simplicial complex | topological combinatorics | candidate | apparent novelty (targeted audit) |
| [P017](problems/probability/P017-random-divisibility-chain-height.md) | Random divisibility-poset chain height | probability | candidate | apparent novelty (targeted audit) |
| [P018](problems/matroid-theory/P018-conserved-xor-basis-fibers.md) | Conserved-XOR basis exchange fibers | matroid theory | candidate | apparent novelty (targeted audit) |
| [P019](problems/geometry/P019-no-three-line-exchange.md) | Exchange complexity of optimal no-three-in-line configurations | discrete geometry | candidate | apparent novelty (targeted audit) |
| [P020](problems/P020-padic-hankel-cokernels/README.md) | Cokernel laws of random p-adic Hankel matrices | algebraic probability | candidate | apparent novelty (targeted audit) |
| [P021](problems/probability/P021-cayley-sum-sandpile-laws.md) | Random Cayley-sum sandpile groups | algebraic probability | candidate | not certified (targeted audit) |
| [P022](problems/geometry/P022-random-unimodular-triangle-complex.md) | Random unimodular triangle complex homology | discrete geometry | candidate | not certified (targeted audit) |
| [P023](problems/probability/P023-random-prime-incidence-rank.md) | Rank of random prime-divisibility incidence matrices | probabilistic number theory | candidate | not certified (targeted audit) |
| [P024](problems/graph-theory/P024-zero-forcing-divisor-graph.md) | Zero forcing on the divisor comparability graph | graph theory | candidate | not certified (targeted audit) |
| [P025](problems/number-theory/P025-lcm-hamiltonian-bottleneck.md) | Cyclic lcm Hamiltonian bottleneck | number theory | reframe | confirmed collision for linear-path analogue |
| [P026](problems/graph-theory/P026-prime-sum-square-cycle-generation.md) | Four-cycle generation in prime-sum bipartite graphs | graph theory | candidate | not certified (specialist source check needed) |
| [P027](problems/number-theory/P027-primitive-set-exchange-mixing.md) | Mixing of maximum primitive-set exchanges | multiplicative combinatorics | candidate | not certified; closely related to counting primitive sets and distributive-lattice walks |
| [P028](problems/number-theory/P028-random-divisor-complex-mobius-deformation.md) | Möbius deformation from random divisibility complexes | analytic number theory | candidate | not certified; arithmetic Dirichlet convolution and order-complex Möbius theory are classical |
| [P029](problems/graph-theory/P029-prime-sum-permutation-xray-fibers.md) | Prime-supported permutation X-ray fiber reconfiguration | combinatorics | candidate | high overlap risk: discrete tomography X-ray fibers |
| [P030](problems/number-theory/P030-double-prime-perfect-matchings.md) | Double-prime perfect matchings on integer intervals | number theory | candidate | not certified; prime sum/difference cycles have explicit earlier study |
| [P031](problems/number-theory/P031-coprime-sidon-extremum.md) | How large can a pairwise-coprime Sidon set be? | number theory | candidate | not certified; Sidon sets of primes and additive-multiplicative restrictions require a specialist search |
| [P032](problems/graph-theory/P032-prime-sum-bipartite-diameter.md) | Is the prime-sum bipartite diameter eventually seven? | graph theory | candidate | high overlap risk: prime-difference conjectures |
| [P033](problems/graph-theory/P033-prime-sum-three-palette.md) | Can three prime sums connect all integers? | graph theory | candidate | not certified; Chen–Fu–Guo (2021) established three-color Hamiltonian-prime-set phenomena for some orders, not this stated eventual connectivity theorem |
| [P034](problems/graph-theory/P034-four-prime-sum-biconnectivity.md) | Four prime sums without cut vertices | graph theory | candidate | unverified; prime-sum connectivity predecessor |
| [P035](problems/number-theory/P035-primitive-sidon-coloring.md) | Sidon coloring by divisibility antichains | additive combinatorics | candidate | high overlap risk: Sidon–Ramsey coloring and primitive sets |
| [P036](problems/probability/P036-random-schur-hypergraph-two-core.md) | When does a random Schur hypergraph acquire a 2-core? | probability | candidate | unverified; Schur Ramsey thresholds are close but the peeling observable is different |
| [P037](problems/graph-theory/P037-induced-gcd-cycle-prime-gap-deficit.md) | Prime-gap deficit of induced cycles in the non-coprime graph | graph theory | candidate | unverified; unboundedness follows from Pintz (2015), general threshold-cycle theory is classical |
| [P038](problems/graph-theory/P038-coprime-induced-matching.md) | Fine asymptotics of induced matchings in the coprime graph | graph theory | candidate | unverified; classical Bollobás set-pair extremality is the main predecessor |
| [P039](problems/number-theory/P039-prime-product-plus-one-matching.md) | Perfect matchings with prime product plus one | number theory | candidate | high overlap: closely related 2020 MathOverflow bilinear prime pairing with two intervals and either sign |
| [P040](problems/graph-theory/P040-coprime-matching-local-resilience.md) | Local resilience of coprime perfect matchings | graph theory | candidate | unverified; original half-resilience conjecture disproved by finite-prime Hall cuts; true sharp limit unknown |
| [P041](problems/probability/P041-random-order-divisibility-chains.md) | Random-order divisibility chains | probability | candidate | unverified; related arithmetic-subsequence and hypercube accessibility results are established |
| [P042](problems/graph-theory/P042-kummer-one-carry-graph.md) | Hamiltonian paths in one-carry graphs | graph theory | candidate | unverified; Kummer's theorem and digital carry combinatorics are classical, precise Hamiltonian question requires specialist review |
| [P043](problems/graph-theory/P043-prime-denominator-farey-components.md) | Components of the prime-denominator Farey graph | graph theory | candidate | unverified; Farey graphs and prime-denominator fractions have established prior art |
| [P044](problems/probability/P044-squarefree-displacement-permutations.md) | Squarefree displacement permutations | probability | candidate | unverified; related squarefree-sum permanents and classical permanent bounds are known |
| [P045](problems/number-theory/P045-additive-multiplicative-complete-mappings.md) | Additive complete mappings with almost distinct products | number theory | candidate | unverified; additive and multiplicative complete mappings have extensive literature |
| [P046](problems/number-theory/P046-prime-xor-sidon-sets.md) | Sidon sets of primes under binary XOR | number theory | candidate | unverified; binary Sidon sets and APN functions are classical, prime-restricted extremal size needs comparison |
<!-- CATALOG:END -->
