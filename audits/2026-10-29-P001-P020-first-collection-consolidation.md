# Mathematical problem collection — First collection consolidation (P001–P020)

**Audit date:** 29 October 2026  
**Scope:** the first twenty permanent problem identifiers.  
**Scope:** The twenty entries P001–P020 were examined without additions to the catalogue.  
**Status:** first comprehensive editorial and targeted-literature audit; **not** twenty peer reviews, formal proof verification, or exhaustive MathSciNet/zbMATH coverage.

## Executive summary

The collection is not presently a list of **20 certified novel open problems**. It is a curated *research portfolio* containing:
- **17 mathematical candidates** (several with important direct historical overlap);
- **one candidate requiring reformulation** (P007: a previously established subtheorem);
- **one ill-specified remaining question** (P008: what counts as an admissible explicit threshold center);
- **one internally proved result** (P010: exact coprime adjacencies), whose historical priority and external proof review remain pending.

The original repository independently proposed the *questions*, not the base notions of prime-sum graphs, matching switches, Sidon sets, random Cayley sum graphs, matroids, geometric flips, or $p$-adic cokernels. The labels **apparent novelty (targeted audit)** mean only that the precise observable was not located in the accessible searched works. A missing search hit is **not an originality certificate**.

**First-stage priorities (eight potential flagships):** **P003, P005, P010, P014, P016, P017, P018, P020**. This is a **portfolio editorial shortlist**, not a judgment that all eight are novel or will be solvable; P010 is an internal theorem rather than an open research question. P015 is a high-interest *reserve* that needs an urgent close-paper comparison before promotion. Strong adjacent/redundancy risks are detailed below.

## Auditing standard

Each entry is assessed on four **independent** dimensions:

1. **Correctness / well-posedness** — is the mathematical statement precise? Is a claimed computation an exact check or only evidence? Is some part already settled?
2. **Historical priority** — what is the *nearest exact* published predecessor, and how does the proposed assertion differ? This is a literature-risk assessment, not priority certification.
3. **Structural payoff** — would an answer classify a mechanism, yield a universality law, or expose a new obstruction, rather than merely one more sequence entry?
4. **Editorial action** — retain, sharpen, merge *navigation* with a related family, reframe, or archive if source-based evidence later warrants it. Preserve IDs for provenance even when demoted.

The classifications below are **proposals**, not silent changes to the mathematical dossier status fields.

## All-twenty assessment matrix

"High" = potentially broad structural implications **if the question is actually novel and its answer substantive**, not an impact-factor prediction. "Moderate" = clean and worthwhile but localized or closely tied to an established method. "Conditional" = cannot judge significance until the mathematical formulation or historical independence is clarified.

| ID | Status / evidence | Historical overlap risk | Structural payoff | Editorial decision |
|---|---|---|---|---|
| **P001** | Candidate; no perfect-rainbow proof | **Medium–high**: classical prime-sum pairing / rainbow matching | Moderate | Retain; investigate completion of partial rainbow matchings |
| **P002** | Candidate; finite four-switch connectivity only | **Medium–high**: established matching switch chain | Moderate | Retain; group with P001/P003/P009 on site |
| **P003** | Candidate; finite $k$-factor / flow evidence | **Medium**: generic $k$-factor theory, arithmetic host distinct | **High** | **Flagship conditional**; arithmetic cut characterization |
| **P004** | Candidate; sparse-range exchange result, not near $\sqrt N$ | **Medium**: Golomb ruler local search | Moderate | Retain; emphasize valid-only and near-extremal regime |
| **P005** | Candidate; finite connectivity and explicit generic counterexample | **Medium**: coprime permutations + switches individually known | **High** | **Flagship conditional**; seek arithmetic flip-space invariant |
| **P006** | Candidate; $\liminf F(N)/\sqrt N\ge1/\sqrt2$ | **Medium**: Sidon extremal / prime-distance graph | Moderate–high | Retain; joint constraint asymptotics |
| **P007** | Refine; full graceful path iff $n\le5$ is **known** | **High / confirmed collision** for full-graceful case | Moderate | **Reframe** as coprime-restricted gracesize only; cite 2021 theorem |
| **P008** | Implicit-center/window theorem claimed internally; *remaining question lacks expression class* | **High**: deterministic-host percolation theory | Conditional | **Reformulate before listing as open**; independently referee proof |
| **P009** | Two-prime matching conjecture; certificate linked to classical prime differences | **High**: Maillet-type primes, OEIS A202472 | Moderate / conditional | **Watch/demotion candidate** if independence cannot be shown |
| **P010** | **Internally proved exact theorem**; DP and constructive checks | **Undetermined**: arithmetic permutations and path covers | Moderate; **publishable-note potential** | **Retain as resolved**, external referee + priority audit |
| **P011** | Random sum-diagonal perfect-match/factor phase questions | **Medium–high**: random Cayley sums are established | High / conditional | Retain; specify the exact asymptotic regimes |
| **P012** | Percolated coprime matching flip-space question | **Medium–high**: P005 plus general switch/percolation theory | Moderate–high | Retain with direct P005 cross-reference; conditional nonmonotone event |
| **P013** | Random-site Sidon exchange graph | **Medium–high**: P004 plus random Sidon/CSP | Moderate | Retain, cross-link P004/P016; beware trivial $k=2$ |
| **P014** | Random Cayley-sum flag-complex homology windows | **Medium–high**: Kahle/topology + Cayley sums known | **High** | **Flagship conditional**; do not infer homology shift from $K_4$ correction |
| **P015** | Fixed vertex-parity valid flips; finite tests through $n=10$ | **Very high**: August 2026 cyclic colored triangulations | High if arbitrary-pattern case truly distinct | **Reserve / hold** until full proof comparison |
| **P016** | Sidon independence-complex homology, exact finite Betti values | **Medium–high**: Sidon complexes / hypergraph topology | **High** | **Flagship conditional**; distinguish Betti numbers from persistence maps |
| **P017** | Random divisor-poset height $L_N/\log_2N$ | **Medium**: Boolean lattice random heights, divisor posets | **High** | **Flagship conditional**; limit existence is the actual question |
| **P018** | XOR-conserved basis exchange; all $d=4$ fibers connected; $d=5$ disconnection witness | **Very high**: group-labeled matroid basis proximity | **High** | **Flagship conditional**; read matroid group-labeled proofs closely |
| **P019** | Optimal grid general-position exchange complexity | **Medium–high**: classical no-three-in-line enumeration | Moderate–high | Retain; compare to geometric local-repair methods |
| **P020** | Random Haar $p$-adic Hankel finite-group cokernels | **Medium–high**: finite-field rank law known; random Smith forms | **High** | **Flagship conditional**; investigate structured invariant-factor laws |

No numerical probabilities are assigned to historical novelty or publication outcome.

## Individual audit notes and precise next gates

### P001–P003: prime-sum matching programme

**P001 (rainbow spectrum)** is **not** Greenfield–Greenfield's known existence theorem: their proof of prime-sum pairing does not maximize the number of distinct prime sums. But a rainbow *partial matching* does not necessarily extend to a perfect matching. Next gate: identify the right Hall-type completion inequalities; check rainbow matching literature specialized to sum-color edge partitions.

**P002 (four-switch)** uses exactly the standard perfect-matching switch operation studied by Dyer–Jerrum–Müller (SODA 2016 / JACM 2017). Neither existence nor number of matchings implies connectivity of the arithmetic host's matching space. Next gate: test whether a known sufficient structural theorem for the prime-sum bipartite host applies; do not infer connectivity from finite enumeration.

**P003 (min-degree factor packing)** is an application of the *classical* bipartite integral $k$-factor condition to a prime-sum adjacency matrix. It is not already solved by stating the max-flow criterion. The unresolved mathematics is whether all corresponding arithmetic cuts satisfy it. General Hankel/banded-matrix $k$-factor saturation is **false** for arbitrary allowed sum sets, while the special interval-sum control theorem is [proved internally](../theorems/interval-sum-factor-saturation.md). Next gate: exact Hall-factor inequality / number-theoretic expansion, not more finite flow checks.

**Mandatory sources:** [Greenfield–Greenfield (1998)](https://cs.uwaterloo.ca/journals/JIS/green.html); [Dyer–Jerrum–Müller (2016)](https://doi.org/10.1137/1.9781611974331.ch138); [Bonamy et al. (2019)](https://doi.org/10.4230/LIPIcs.MFCS.2019.80).

### P004–P006: valid-state Sidon and arithmetic constraints

**P004** concerns *valid-intermediate* $k$-Sidon-set connectivity. Golomb-ruler algorithms allowing invalid intermediate states cannot settle it. The auxiliary sparse-range construction is substantially below $k\asymp\sqrt N$ and must not be advertised as the main conjecture. **P006** is the intersection of two classical systems: Sidon sets and **independent sets in the prime-distance graph**. Its lower construction via doubling gives the order of magnitude, not the exact constant. Recent [Carter–O'Bryant–Tao (26 October 2026)](https://arxiv.org/abs/2610.36207) improves *generic Sidon-size* estimates, not the prime-difference exclusion. **P005** connects coprime permutations to standard perfect-matching switches; a generic universal-row/column argument was already disproved by an explicit small structural-zero example. Prior literature enumerating coprime permutations is **not a switch-space theorem**.

**Mandatory sources:** [Pomerance (2022)](https://arxiv.org/abs/2203.03085), [Sah–Sawhney (2022)](https://doi.org/10.1112/mtk.12159), [Carter–O'Bryant–Tao (2026)](https://arxiv.org/abs/2610.36207), [prime-distance graph literature](https://research.ibm.com/publications/colouring-prime-distance-graphs).

### P007–P010: highest-priority corrections and resolved work

**P007 — exact known overlap.** Panma–Rochanakul [*Prime-Graceful Graphs* (2021)](https://thaijmath.com/index.php/thaijmath/article/view/1264), Theorem 2.1, already resolves the fully graceful coprime Hamiltonian-path existence iff question. The proposed remaining problem is an *extremal number of distinct differences* under the gcd-one constraint; its exact maximum has not been located in this audit. Keep the historical proof clearly attributed. Avoid calling the full-graceful proof original.

**P008 — not yet a well-posed remaining problem.** The underlying deterministic-host edge-percolation model is classical, including [Gupta–Lee–Li (SODA 2021)](https://doi.org/10.1137/1.9781611976465.7). If the implicit center $b_n$ is *defined* by $\sum_v(1-b_n)^{d_n(v)}=1$, that is already exact; asking for an "explicit" expression without specifying permitted functions/expansion length is not a falsifiable conjecture. State a candidate class of arithmetic asymptotic formulas and an error scale, then **independently audit** the internally claimed Poisson/Gumbel window proof. Do not mark as externally verified theorem.

**P009 — historically entangled.** The sufficient prime-pair construction is exactly the short-even-prime-difference condition counted by [OEIS A202472](https://oeis.org/A202472); its arithmetic principle is **not new**. The "two colors always suffice" matching assertion is not obviously logically equivalent to that prime-pair certificate. Next gate: prove a *necessity* or give a two-palette witness without the known sufficient condition; failing to separate the questions is grounds for **reframing/demotion**.

**P010 — internally resolved, not an open question.** The exact formula

$$
h(n)=\pi(n)-\pi(n/2)+
\max\left(1,\left\lceil\frac{\pi(n/2)-\pi(n/3)}2\right\rceil\right)
\qquad(n\ge4)
$$

was obtained by a noncoprime-graph path cover, partition by largest prime factor, and two/three-factor gluing. See [the full proof](../theorems/P010-exact-coprime-adjacencies.md) and [dated publication review](../audits/2026-10-29-P010-publishability-priority-review.md).

**New independent cross-check in this consolidation:** a separately coded **Held–Karp dynamic program**, minimizing the count of adjacent gcd-one transitions across Hamiltonian paths, reproduces the exact formula **for every $4\le n\le11$**, independently of the constructor. This checks finite correctness only; it is not a general proof or external peer review. The closest located historical work, [Erdős–Freud–Hegyvári (1983)](https://users.renyi.hu/~p_erdos/1983-02.pdf), studies other adjacent gcd/lcm extremal functionals. **Publication verdict:** a credible short mathematical note **if** no predecessor exists and an independent mathematician checks the proof. No priority claim beyond targeted search.

### P011–P014: random constraint spaces and correlated topology

**P011** randomizes whole *sum labels*, creating correlated anti-diagonals. Random Cayley sum graphs themselves are known; our matching/factor questions are distinct *observables*, not a new model. Perfect-matching existence is monotone; **factor saturation relative to the changing minimum degree is not monotone**. It is invalid to assert a conventional sharp threshold for the latter without additional work.

**P012** is the randomized version of P005's coprime-permutation matching space. Conditioning on at least **two** perfect matchings avoids a vacuous connected one-state graph. Even conditioned connectivity is not generally an increasing event. Cross-reference P005 rather than create duplicate foundational exposition.

**P013** is P004's random-site analogue, measuring *feasible Sidon configurations* and their exchange graph; distinguish it from the appearance of just one Sidon set. At $k=2$, the state graph is a Johnson graph, so the first nontrivial research regime has larger $k$.

**P014** asks whether random Cayley-sum **flag-complex** homological windows share Erdős–Rényi exponents. The exact four-clique correction demonstrates finite local dependence but its *relative size is $O((np)^{-1})$*, which **vanishes when $np\to\infty$**. It does **not** prove differing topological thresholds. The nearest homological benchmark is [Kahle (2009)](https://doi.org/10.1016/j.disc.2008.02.037); the Cayley-sum framework is older as well.

### P015–P018: colored geometry, arithmetic topology, random order and matroid conservation

**P015 — urgent historical comparison.** Reducing lattice area parity mod 2 converts the problem to **fixed four-color polygon triangulations with three distinct colors per triangle**. [Debrohim–Sasaki–Nunes (26 August 2026)](https://arxiv.org/abs/2608.26006) **already proves** connectivity for *cyclically repeated* color patterns with $j\ge4$. P015 asks about **arbitrary** four-residue sequences, whose full equivalence to that theorem has not been checked. This is the greatest danger of a **nearly immediate known special-case corollary** among the newer entries. Hold flagship promotion pending full-text comparison. Finite connectedness through ten vertices is not a substitute for that check.

**P016** makes a hereditary simplicial complex of Sidon subsets; minimal nonfaces have sizes three or four, so it is a **hypergraph independence complex**, not a flag complex. The exact finite $\mathbb F_2$ Betti values (through $N=23$ claimed and script-backed) do not establish eventual fixed-dimensional vanishing, and **Betti numbers alone do not determine persistence maps**. This is distinct from the P004 *single-level exchange graph*, despite sharing admissible Sidon sets. Verify the hypergraph-topology literature, especially Sidon-related complexes, before claiming a new topological object.

**P017** is site percolation on the **integer divisibility poset**, not on a Boolean lattice. The power-of-two chain gives $L_N/\log_2N\ge p-o_{\mathbb P}(1)$ and strict divisibility gives the upper bound $1+o(1)$. The *limiting constant's existence* is the main question; simulations at a few $N$ do not show a limit law. [Kohayakawa–Kreuter–Osthus (2000)](https://doi.org/10.1002/%28SICI%291098-2418%28200003%2916%3A2%3C177%3A%3AAID-RSA4%3E3.0.CO;2-9) studies random **Boolean** lattice chains, a related but distinct poset.

**P018** is explicitly a group-labeled matroid problem: see [Hörsch et al. (ICALP 2024)](https://doi.org/10.4230/LIPIcs.ICALP.2024.86). One-vector exchange while conserving a nonzero XOR total is impossible; $d=4$ exhaustive fiber connectivity, and the exhibited $d=5$ two-exchange **disconnection** are finite structural checks. There is no license to claim group-constrained bases as a novel definition. The nearest group-label-proximity theorem should be compared *at the level of allowed intermediate fiber states*, not just abstracts.

### P019–P020: geometry and random structured groups

**P019** studies the **exchange connectivity** of *maximum* no-three-in-line configurations, not the classical maximum cardinality itself. Exact small finite data have been checked through $n=7$ by the repository's script. **New independent cross-check:** a separate brute-force enumeration of two points per row with exact integer determinant tests reproduces the number of optimal configurations and all exchange-component counts for **$n=3,4,5$**: counts $2,11,32$; two-exchange component counts $1,7,12$; minimal connecting sizes $2,4,3$. This supports the smaller values without proving asymptotic growth. [Flammenkamp's actively maintained repository](https://wwwhomes.uni-bielefeld.de/achim/no3in/readme.html) and [Prellberg (2026; 2027 volume)](https://doi.org/10.1016/j.jcta.2026.106244) concern extremal configurations/algorithms and must remain credited. P019's exchange-size invariant was not located in the reviewed sources.

**P020** is a question about the **distribution of full finite abelian $p$-groups** produced by a Haar-random $p$-adic Hankel matrix, not simply its mod-$p$ rank. The classical exact rank count, as acknowledged by [Dwivedi–Grinberg (2022)](https://doi.org/10.1016/j.laa.2022.02.014), is $q^{2r}$ Hankel matrices of rank at most $r<n$ over $\mathbb F_q$; therefore $\Pr(\mathrm{corank}\ge k)=p^{-(2k-1)}$ and $\Pr(C_n=0)=1-p^{-1}$. **These are known results**. Their difference from the independent-entry Cohen–Lenstra law is a decisive model distinction but **does not determine the higher invariant factors**. Compare to [Wood (2019)](https://doi.org/10.1353/ajm.2019.0008) and structured Smith form literature. Keep as a flagship candidate if no random-Hankel Smith-form distribution is already known.

## Related-family graph: share context, do not collapse distinct observables

| Cluster | IDs | Shared mathematical object | Distinguishing open observable |
|---|---|---|---|
| Prime-sum | **P001, P002, P003, P009** | prime-sum admissible pairings/graph | colors, switches, factor packing, smallest palette |
| Coprime / percolation | **P005, P008, P012** | gcd-one host / its random thinning | permutation reconfiguration, graph connectivity, **matching-space** connectivity |
| Sidon | **P004, P006, P013, P016** | additive Sidon feasibility | level exchanges, forbidden prime differences, random sites, **all-level homology** |
| Sum-correlated randomness | **P011, P014** | edge dependence through common sum labels | matching/factor law vs **clique complex homology** |
| Geometric reconfiguration | **P015, P019** | constrained planar configurations | parity-valid triangulation flips vs general-position set exchanges |
| Order / algebraic conservation | **P017, P018, P020** | distinct algebraic/discrete structures | poset height, label-fiber connectivity, random $p$-group laws |
| Explicit arithmetic extremum | **P007, P010** | permutation graphs and adjacent arithmetic conditions | maximum distinct differences vs minimum coprime adjacencies |

These clusters are **navigation links**, not mathematical equivalences. Never silently merge the problems themselves just because the base objects are related.

## Evidentiary tests completed during consolidation

| Item | What was independently checked now | What remains |
|---|---|---|
| P010 exact finite formula | Held–Karp DP on all $n=4,\ldots,11$ vs formula | Independent proof referee and specialist priority audit |
| P019 first finite values | Separately written exact combinatorial enumeration at $n=3,4,5$; all cardinality and component values match | Scalable independent check beyond $n=5$, asymptotics |
| P007 historical collision | Exact matching definition from Panma–Rochanakul's 2021 prime-graceful work | Novelty of restricted *maximum gracesize* alone |
| P009 necessary/source distinction | OEIS A202472 directly counts the prime-difference certificate | Two-palette matching equivalence/counterexample |
| P020 known rank fact | Published 2022 finite-field Hankel count and earlier authors confirmed | The full $p$-adic Smith/cokernel probability law |
| P015 close overlap | August 2026 cyclic-coloring paper confirms connectedness under a **cyclic** assumption | Full-text compare general arbitrary four-color case |
| P018 group-label provenance | ICALP 2024 foundational group-labeled matroid base theory confirmed | Identify exact theorems on fixed-fiber reconfiguration |
| Remaining computation | Previously recorded CI / experiment scripts, not all independently rerun | Fresh independent implementation, scaling, human audit |

**Do not describe the entire collection as "independently proof-verified" because two finite instances were independently reproduced.** The remaining experimental and analytical assertions still require targeted second implementations or referee checks.

## Editorial decisions and concrete next actions

### 1. Highest urgency: eliminate misleading statuses

- **P007:** title/intro must foreground that the prime-graceful path existence theorem is **already known**; only the partial-gracesize extremum is candidate open.
- **P008:** add an explicit allowed class of arithmetic centering formulas and a quantifiable error criterion. Until then, **"needs specification"** must stay.
- **P009:** split "two prime palette matching" from the **known Maillet-type sufficient condition**; investigate whether the remaining statement genuinely has separate content.
- **P010:** a **resolved internal theorem** in its own category, never "one of 20 unsolved conjectures." Human proof audit is the immediate publication bottleneck.

### 2. Historical collision checklist before external promotion

- P015 ↔ Debrohim–Sasaki–Nunes 2026, exact arbitrary vs cyclic color-pattern assumptions;
- P018 ↔ Hörsch et al. 2024 / 2025, conserved-label fiber vs proximity and exchange classes;
- P016 ↔ Sidon-associated simplicial complexes, hypergraph independence complexes;
- P020 ↔ random Hankel Smith normal forms / $p$-adic linear recurrences;
- P008 ↔ Gupta–Lee–Li fixed-host connectivity thresholds;
- P009 ↔ Maillet prime differences and OEIS A202472.

### 3. Research portfolio (not a final ranking)

**Flagship candidates:** P003, P005, P014, P016, P017, P018, P020.  
**Separate theorem/publication track:** P010.  
**Reserve / promising but overlap-sensitive:** P006, P011, P015, P019.  
**Keep with sharper scope and/or lower immediate priority:** P001, P002, P004, P007, P008, P009, P012, P013.

This preserves all 20 permanent IDs. Nothing is yet **certified original and open**. If deeper literature establishes a prior resolution, move that entry to "historically known" rather than simply deleting it.

## Unresolved questions

This document is the **first full-portfolio gate**, not a declaration that all twenty historical priority questions are settled. Before seeking community feedback, perform a second, independent phase with full-text primary-source comparisons for the **six collision-risk cases**, and a structured proof/computation audit for the flagship set. Apply verified corrections in separate small PRs after reviewing the evidence. Avoid adding P021 until that work is complete.
