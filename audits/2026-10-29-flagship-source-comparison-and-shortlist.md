# Mathematical problem collection — Source-comparison gate and four-flagship shortlist

**Date:** 29 October 2026  
**Starting point:** merged [first 20-entry consolidation](../audits/2026-10-29-P001-P020-first-collection-consolidation.md).  
**Scope:** P003, P005, P014, P016, P017, P018, P020, with focused checks of P007, P008, P009, P015.  
**Decision:** keep **four provisional research flagships (P005, P017, P018, P020)**; **two strong reserves (P003, P016)**; **one exploratory reserve (P014)**. Do not add problems or change permanent IDs.

> **Audit limitation.** This pass checked primary published statements, selected PDF theorem/proof passages, and precise model definitions. It is **not** a complete reading of every cited monograph or paper, a MathSciNet/zbMATH exhaustive priority report, or external expert verification. “Not found” means *not located in this bounded check*, not *originality certified*. A known model with a novel observable is **not** a newly invented model.

## Priority matrix: independent mathematical value versus overlap

| ID | Nearest established result | Exact distinction that survives | Source-level judgment | Action |
|---|---|---|---|---|
| **P005** | Pomerance, *Coprime permutations* (2022); Sah–Sawhney, *Enumerating coprime permutations* (2022); Dyer–Jerrum–Müller switch-chain ergodicity (2017) | Connectivity/diameter of the **specific gcd-one bipartite matching flip graph** is not implied by counting states, and the graph has induced chordless 6-cycles | Clean arithmetic state-space question; no direct solution found | **Flagship 1** |
| **P017** | Kohayakawa–Kreuter–Osthus, *The length of random subsets of Boolean lattices* (2000) | Longest chain in Bernoulli-thinned **integer divisibility poset**, normalized by log₂ N, not a random Boolean lattice | Well-posed limiting constant; nontrivial arithmetic geometry; proof remains open in this dossier | **Flagship 2** |
| **P018** | Hörsch–Imolay–Mizutani–Oki–Schwarcz, *Problems on Group-Labeled Matroid Bases* (ICALP 2024); Garamvölgyi et al., *Towards the Proximity Conjecture* (ICALP 2025) | **Connectivity using moves entirely within one exact sum fiber**; a proximity result from arbitrary base to an F-avoiding base does not imply this | Model/labeling concept is prior art; two-swap obstruction in dimension five makes the exact subquestion substantive | **Flagship 3**, with specialist toric-ideal check |
| **P020** | Dwivedi–Grinberg, *On the rank of Hankel matrices over finite fields* (2022); Wood/random-cokernel theory; Van Peski (2024) | Full **Haar p-adic Hankel Smith-invariant distribution**, not mod-p corank or independent-entry Cohen–Lenstra law | Exact known corank law shows strong model effect; full finite-group law not found in reviewed sources | **Flagship 4**, highest algebraic-literature risk |
| **P003** | Greenfield–Greenfield prime-sum pairing; standard bipartite k-factor cut criteria | Does the **arithmetic prime-sum host** satisfy all min-degree k-factor cuts? General theory supplies a test, not these inequalities | Mathematically direct, but may be difficult to distinguish as a flagship absent an arithmetic cut lemma | **Strong reserve** |
| **P016** | Sidon/Golomb ruler extremal theory; general hypergraph independence-complex homology | Eventual vanishing of each fixed-dimensional homology group of **all Sidon subsets of [N]** | Clean model; add exact factor-two homological null-map lemma below. Existing hypergraph techniques may subsume stronger claims | **Strong reserve** |
| **P014** | Kahle (2009/2014) and Newman random flag complexes; Campos–Dahia–Marciano (2024), random Cayley sum graphs | Homology exponents of a **dependent-edge sum-generated flag complex** | The model is established, and the proved K₄ excess is lower order when np→∞. No different critical exponent presently established | **Exploratory reserve** |

### Why precisely these four?

**P005.** The primary Pomerance and Sah–Sawhney papers principally bound/count coprime permutations; they do not provide a theorem connecting every such state by permitted transpositions. The Dyer–Jerrum–Müller theory explicitly treats switch-chain ergodicity for classes of bipartite hosts; its generic sufficient classes cannot simply be applied without verifying the gcd-one host's structural properties. A proof would be a *specific arithmetic reconfiguration theorem*, not a new general switch formalism. Next gate: establish a canonical reduction or exhibit a high-n obstruction; independently verify whether the host belongs to a stronger known tractable class.

**P017.** Fixed-p Bernoulli thinning of [N] gives a natural one-parameter limit question:

$$
L_N(p)/\log_2 N \xrightarrow{\mathbb P}c(p)?
$$

The known easy sandwich p≤liminf and limsup≤1 does not supply existence. Random Boolean-lattice chains are analogous but do not identify this weighted, multiplicatively truncated poset. Next gate: try renormalization or independent multi-scale inequalities with carefully handled boundary effects; check random number-theoretic divisibility-order literature beyond Boolean-lattice keyword searches.

**P018.** ICALP 2024 defines general abelian group labels and studies existence/avoidance/proximity; the exact **zero-forbidden versus fixed-target** distinction is critical. ICALP 2025 proximity bounds do not yield a chain of bases all with the same prescribed sum. The d=5 example of two components under 2-replacement is explicitly exhibited in [P018](../problems/matroid-theory/P018-conserved-xor-basis-fibers.md); it disproves universal two-exchange connectivity. Next gate: characterize minimal connecting move size t(d), and test equivalence with fiber graphs/Markov bases in algebraic statistics before asserting novelty.

**P020.** Dwivedi–Grinberg Theorem 1.1 states the classical rank-at-most-r count q^(2r) for square finite-field Hankel matrices (r<n). Consequently, for n×n Haar p-adic Hankel, the number of mod-p cokernel generators has exact tail P(corank≥k)=p^(-(2k-1)) for 1≤k≤n, and P(C_n=0)=1−1/p. These **known** facts do not determine whether a limiting law on *full finite abelian p-groups* exists or is tight (the latter requires controlling growing higher p-power exponents, not just corank). Next gate: search structured Smith forms, rational linear recurrence and moment matrix literature; compute mod p² cokernel statistics in a reproducible small-n exact experiment, avoiding inference from mod p alone.

### New elementary consequence for P016 (proof, not priority claim)

**Proposition (factor-two null persistence).** Let K_N be the complex of Sidon subsets of [N], with pairwise distinct positive differences. For every M≥1 and every homological dimension k≥0, the inclusion

$$
K_M\hookrightarrow K_{2M}
$$

induces the **zero map**

$$
\widetilde H_k(K_M;R)\longrightarrow\widetilde H_k(K_{2M};R)
$$

for any coefficient ring R.

**Proof.** If A⊆[M] is Sidon, all its old positive differences are at most M−1. Every new difference introduced by adjoining x=2M is 2M−a≥M for a∈A; these new differences are mutually distinct and cannot equal an old difference. Hence A∪{2M} is Sidon. Therefore the entire image of K_M lies in the closed star of the vertex 2M in K_{2M}, which is a cone. The inclusion factors through this contractible subcomplex, so its induced map on reduced homology is zero. □

**Consequence.** A persistent class born at filtration index M must die no later than 2M (in the ordinary inclusion filtration). This does **not** prove H_k(K_N)=0 for large N: new classes can arise at each N. It shows the existing *persistence* subquestion requires finer scale than indefinite survival or a factor-two lifespan claim. The proof is elementary; **no novelty or publishability is claimed**. Independently enumerated all faces for M≤12 and checked the coning condition, in addition to the proof.

### Why P003, P016, P014 are reserves

- **P003:** a positive δ_n-factor theorem for the prime-sum graph would be a nontrivial arithmetic expansion result. But integral flow and factor equivalence are general background, and thousands of finite checks are insufficient to establish the needed arithmetic cuts. Promote on finding a structural cut reduction or serious uniform expansion lemma.
- **P016:** an attractive bridge of additive combinatorics and topology, with a useful exact filtration lemma. Yet its eventual fixed-dimensional Betti vanishing may be approachable through well-developed complex connectivity machinery; a full source comparison with independence complexes of arithmetic hypergraphs is still needed.
- **P014:** for the stated p=q^{-α} regimes, the relative four-clique correction is 3(1−p)/((q−2)p), so it goes to zero when qp→∞. This does not show homology matches Erdős–Rényi, but it removes the easiest advertised mechanism for *different exponents* at such scales. Promote only after identifying a genuinely non-ER asymptotic topological mechanism, or a precise universality theorem.

## Four high-risk entries: explicit editorial stops

| ID | Decision | Source distinction |
|---|---|---|
| **P007** | Reframe; do **not** promote the prime-graceful Hamiltonian-path existence subquestion | Panma–Rochanakul (2021), *Prime-Graceful Graphs*, covers the previously advertised full-graceful path part. The maximum distinct-differences **under coprimality** is a different extremal observable, whose priority remains open to review. |
| **P008** | Hold as under-specified until admissible arithmetic expansion class is defined; separately referee the internal Poisson/Gumbel proof | Gupta–Lee–Li (SODA 2021) analyze connectivity thresholds for independent edge retention on a fixed host with cut structure. The coprime **arithmetic window** is an additional specialization, not a novel percolation model. Implicit b_n defined by expected isolates =1 is already exact; “explicit formula” must exclude re-labeling the same root. |
| **P009** | Demote from flagship consideration, preserve ID | The two-prime palette sufficient certificate uses prime differences already counted by OEIS A202472 and linked to Maillet-type questions. A two-color matching may conceivably exist without that certificate, so the two assertions should **not** be declared equivalent. |
| **P015** | Hold as reserve pending proof comparison; do **not** claim general arbitrary-color connectivity is new | Debrohim–Sasaki–Nunes (arXiv, 26 Aug 2026) Theorem 1.2 proves connectivity for a **cyclic j-coloring c(v_i)=i−1 mod j**, j≥4. P015 permits **arbitrary cyclic sequences** of the four mod-2 vertex colors. The 2026 theorem does **not** directly state this stronger arbitrary-pattern case. The cyclic special case is subsumed; the general case remains unverified here. |

## Primary-source comparison log

**Pages/theorems directly checked rather than inferred solely from search snippets:**
- [Debrohim–Sasaki–Nunes (2026), arXiv:2608.26006](https://arxiv.org/pdf/2608.26006), **Theorem 1.2 and Definition 2.1**: hypothesis is a repeated cyclic j-coloring, not every arbitrary four-color pattern.
- [Hörsch et al. (2024), ICALP PDF](https://drops.dagstuhl.de/storage/00lipics/lipics-vol297-icalp2024/LIPIcs.ICALP.2024.86/LIPIcs.ICALP.2024.86.pdf), **abstract, group-label definitions, Theorem 3.1 and proximity discussion**: existence/avoidance/proximity distinct from within-fiber connectivity.
- [Dwivedi–Grinberg (2022), arXiv:2109.05415](https://arxiv.org/pdf/2109.05415), **Theorem 1.1**: finite-field Hankel rank law, not p-adic Smith invariants.
- [Pomerance (2022), full paper](https://math.dartmouth.edu/~carlp/perm3submit.pdf), **introduction/Theorem 1**: enumerating coprime permutations, not 4-cycle connectivity.
- [Campos–Dahia–Marciano (2024), arXiv:2406.09361](https://arxiv.org/pdf/2406.09361), **definition and Theorem 1.1**: random Cayley sum graph is the established model, and the analyzed observable is independence number.
- [Kahle (2009)](https://doi.org/10.1016/j.disc.2008.02.037) and [Kahle (2014)](https://doi.org/10.4007/annals.2014.179.3.5): ER flag-complex homological regimes; not a theorem for the dependent Cayley sum model.
- [Kohayakawa–Kreuter–Osthus (2000)](https://doi.org/10.1002/%28SICI%291098-2418%28200003%2916%3A2%3C177%3A%3AAID-RSA4%3E3.0.CO;2-9): random Boolean-lattice height; different poset from divisibility on [N].
- [Dyer–Jerrum–Müller (2017)](https://doi.org/10.1145/2822322): 4-cycle switch-chain general theory, not directly a theorem for this coprime host.
- [Gupta–Lee–Li (2021)](https://doi.org/10.1137/1.9781611976465.7): deterministic-host connectivity thresholds.
- [Panma–Rochanakul (2021)](https://thaijmath.com/index.php/thaijmath/article/view/1264): prior prime-graceful path result.
- [Van Peski (2024)](https://doi.org/10.1112/plms.12626): p-adic random matrix limit background, not an identified Hankel cokernel law.

**Still required before publication-level originality statements:** exact specialist citation chaining in MathSciNet/zbMATH; inspect algebraic-statistics Markov bases for P018, structured p-adic recurrence/Smith literature for P020, random arithmetic poset height for P017, and sufficient exchange-chain conditions for P005. **No claim of comprehensive certification is warranted.**

## Editorial freeze and next gate

Keep 20 permanent IDs for traceability. Public-facing *featured research problems*: **P005/P017/P018/P020** with explicit *priority unverified* labels. Two useful reserves: P003/P016. The rest remain searchable but should not be presented as equally well-audited new open problems. P010 stays on the **resolved / submitted manuscript** track, not in the active unsolved shortlist.

A meaningful follow-up should target **one substantial theorem, counterexample or decisive source-level overlap** in the four flagships, rather than creating P021 or extending the list mechanically.
