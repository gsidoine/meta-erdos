# Mathematical problem collection — Novelty and quality gate (P001–P010)

**Date:** 2026-10-28  
**Scope:** all ten existing candidates. **No new problem IDs.**  
**Standard:** closest *primary* literature, exact overlap, mathematical validity versus empirical evidence, and whether a question is publication-ready. This is a targeted, substantive open-web and source-reading audit; **not** an exhaustive review of every MathSciNet/zbMATH record, not specialist refereeing, not a formal Lean proof, and not an originality certificate.

## Read this first

The central defect in the previous repository was not just presentation: the README's ten entries became **split across multiple Markdown tables**, and chronological research commentary made them hard to browse. The new `data/problems.json` is the source of truth for a single ten-entry README table and a static searchable browser. **The number of candidate questions is frozen at ten.**

Neither a published theorem nor the existence of many exact computations means that the full candidate is original. In the table, *not found settled* means exactly that: an accessible literature search did not find a settling source.

| ID | Exact question located in cited references? | Firm prior work | Current decision |
|---|---|---|---|
| P001 | Not located | Greenfield–Greenfield prime-sum pairings (1998), OEIS A000341 | Retain as a color-spectrum *specialization*; completion gap |
| P002 | Not located | Dyer–Jerrum–Müller (2017); Bonamy et al. (2019) | Retain; the 4-cycle move is established, arithmetic connectivity is not confirmed |
| P003 | Not located | General bipartite k-factor theorems, Greenfield–Greenfield (1998), prime-sum Hamiltonicity | Retain; strong finite max-flow evidence, no infinite arithmetic cut proof |
| P004 | Not located | Golomb-ruler one-mark local search; classical Sidon theory | Retain; valid-intermediate-state condition is essential |
| P005 | Not located | Pomerance/Sah–Sawhney coprime permutations (2022); switch chain theory | Retain; count does not determine reconfiguration |
| P006 | Not located | Classical Sidon extremal bounds; prime-distance graph theory | Retain; no nontrivial asymptotic constant determined |
| P007 | **Yes for full graceful existence**, not for proposed extremal refinement | Panma–Rochanakul (2021), Theorem 2.1; gracesize literature | **Reframe and explicitly attribute** the known component |
| P008 | General model/theoretical machinery already exist; exact arithmetic centering not located | Gupta–Lee–Li (2021), Penrose (2018), arithmetic graphon literature | **Needs a formally restricted asymptotic-expansion class**, external proof audit |
| P009 | Sufficient prime-pair criterion explicitly tabulated; two-color matching assertion not located | Greenfield–Greenfield (1998), **OEIS A202472**, Maillet-type prime differences | Retain conditionally; **high overlap risk** |
| P010 | Not located | Erdős–Freud–Hegyvári (1983), adjacent gcd/lcm extrema; general path-cover theory | Retain; correct lower and upper order bounds, leading constant unresolved here |

## Primary references and exactly what they do

### P001, P002, P003, P009 — prime-sum graph

**Greenfield and Greenfield, *Some Problems of Combinatorial Number Theory Related to Bertrand's Postulate*, J. Integer Sequences 1 (1998), Article 98.1.2:** https://cs.uwaterloo.ca/journals/JIS/green.html . **Theorem 1** proves the existence of a prime-sum perfect matching of $[2n]$ for all $n$. Their paper does **not** assert that a maximum number of different sums are used (P001), that perfect matchings form a connected 4-switch space (P002), that $\delta$ disjoint perfect matchings can be packed (P003), or that only two different sums always suffice (P009). It is a mandatory historical citation for **all four**.

**OEIS A000341:** https://oeis.org/A000341 counts prime-sum perfect matchings, not the spectrum or switch components.

**Dyer, Jerrum and Müller, *On the switch Markov chain for perfect matchings*, J. ACM 64(2) (2017):** https://doi.org/10.1145/2822322 ; see also **Bonamy et al., *The Perfect Matching Reconfiguration Problem*, MFCS 2019:** https://doi.org/10.4230/LIPIcs.MFCS.2019.80 . The 4-cycle *operation*, connectivity questions, and hereditary class criteria are established. A host outside chordal bipartite need not itself have disconnected switch space; the arithmetic host requires a separate argument.

**Chen–Fu–Guo, *Hamiltonicity in Prime Sum Graphs* (2021):** https://doi.org/10.1007/s00373-020-02241-1 ; **Croot–Jin, *Prime Sum Graphs and the Induced Trees They Contain* (2026):** https://doi.org/10.1007/s00373-025-02999-2 . Both study exactly the prime-sum adjacency relation, not the full factor-packing statement.

**OEIS A202472:** https://oeis.org/A202472 explicitly counts primes $q<2n$ for which $q+2n$ is prime. It therefore counts **the sufficient P009 two-prime pairing certificates**, subject to $q\ge3$ (the only even prime 2 cannot satisfy the odd-sum certificate because $2n+2$ is composite for $n\ge1$). The existence of this arithmetic pair is **old**, not an original conjecture. Whether two-color perfect matchings exist *without* such a pair remains a distinct structural question; no equivalence has been proved here.

### P004 and P006 — Sidon/Golomb rulers

**MathWorld, *Sidon Set*:** https://mathworld.wolfram.com/SidonSet.html verifies the exact equivalence of Sidon sum uniqueness and uniqueness of positive differences, the identification with finite Golomb rulers, and classical $\sqrt N$ asymptotics. **Carter–Hunter–O'Bryant, *On the diameter of finite Sidon sets* (2025):** https://doi.org/10.1007/s10474-024-01499-8 is about numerical span, **not** the diameter of the reconfiguration graph. Avoid this frequent terminology collision.

**Dotú and Van Hentenryck, *A Memetic Approach to Golomb Rulers* (2005):** https://cs.brown.edu/research/pubs/pdfs/2005/Dotu-2005-SHE.pdf uses single-mark relocation, but the optimization's search space may include violating configurations. It is not a proof that every *valid* Sidon set can be reconfigured to every other with a fixed interval bound.

**Prime-distance graphs:** https://research.ibm.com/publications/colouring-prime-distance-graphs (1990) considers exclusion of prime differences in graph colorings. A prime-difference-free **Sidon** set is a Sidon set that is also an independent set in this classical prime-distance graph. Thus P006 is an intersection of *two established constraint systems*, not a novel definition of prime-difference exclusion. The joint **extremal size** was not located in this audit. This is a more exact conceptual framing than the earlier audits.

### P005 — coprime permutations and switching

**Pomerance, *Coprime Permutations* (2022):** https://arxiv.org/abs/2203.03085 ; **Sah and Sawhney, *Enumerating coprime permutations* (2022):** https://doi.org/10.1112/mtk.12159 ; **OEIS A005326:** https://oeis.org/A005326 establish the underlying permutations and counts. Counting is distinct from switch connectivity.

The 4-cycle switch of their bipartite $\gcd(i,j)=1$ graph is a standard matching/Markov-basis operation. **Additional important audit axis:** algebraic statistics for structural-zero contingency tables; investigate whether a preexisting quadratic Markov basis already implies this *one-degree* fiber is connected. The absence of an obvious theorem in the above papers is **not proof of novelty**.

### P007 — a definitive 2021 priority collision

**Panma and Rochanakul, *Prime-Graceful Graphs*, Thai Journal of Mathematics 19(4), 1685–1697 (2021):** https://thaijmath.com/index.php/thaijmath/article/view/1264 (full article available from the journal's PDF download). **Theorem 2.1 states precisely that $P_n$ is prime-graceful iff $n\le5$.** Its definition requires vertex labels $[n]$, gcd one along each path edge, and **distinct** absolute edge differences. Our initial "coprime graceful permutation iff $n\le5$" is the **same theorem** and must be credited, *not* presented as newly proved.

The later paper **Letzter–Pokrovskiy–Williams, *On the gracesize of trees* (2025):** https://arxiv.org/abs/2511.11331 demonstrates that *gracesize*, the maximum number of distinct edge differences under bijective labeling, is established terminology. Our possible niche is specifically the **coprime-restricted gracesize of a path** and its exact optimum, not the generic statistic.

### P008 — general connectivity theory materially limits novelty

**Gupta, Lee and Li, *The Connectivity Threshold for Dense Graphs*, SODA 2021:** https://doi.org/10.1137/1.9781611976465.7 explicitly studies independent edge retention on **any fixed host graph** and thresholds in terms of approximate mincuts. This is the closest general predecessor.

**Penrose, *Inhomogeneous random graphs, isolated vertices, and Poisson approximation* (2018):** https://doi.org/10.1017/jpr.2018.9 proves Poisson criteria in a related **random-point** model, not automatically the same deterministic labeled host. **Hladký–Viswanathan (2026):** https://doi.org/10.1002/rsa.70098 also studies random graph connectivity, but its graphon/vertex-sampling setting is not automatically equivalent.

The internal proof of the leading $e^\gamma\log n\log\log n/n$ transition and implicit-center Gumbel result is **not independently refereed** and may be subsumed by fixed-host theory. The remaining request for an "explicit" center is **not presently a crisply quantified conjecture**: $\mu_n(b_n)=1$ already defines an exact implicit answer. The next revision must prescribe admissible finite expansions (for instance, a specified algebra of ordinary and iterated logarithms with universal coefficients), state an error $o(\log\log n/n)$, and explain why it is not a tautological restatement.

### P010 — the closest historical source read against its precise assertions

**Erdős, Freud and Hegyvári, *Arithmetical properties of permutations of integers*, Acta Math. Hung. 41(1–2), 169–176 (1983):** https://users.renyi.hu/~p_erdos/1983-02.pdf . In particular, their **Theorem 1** optimizes the *maximum adjacent least-common multiple* over permutations; **Theorems 3–5** give infinite-permutation estimates for lcm and gcd. Their abstract and theorem statements do **not** formulate the minimum **number** of adjacent gcd-one pairs that defines P010. This distinction matters; simply citing the same 1983 gcd theme does not make the quantities identical.

**General minimum path covers** are established and generally hard: Gómez and Wakabayashi, *Nontrivial path covers of graphs* (2020): https://doi.org/10.1007/s10878-019-00488-w . P010's exact graph reduction is to the minimum path cover of the **specific** noncoprime integer graph, not a new definition of path covers. **OEIS A076220:** https://oeis.org/A076220 counts permutations with **every** adjacent pair coprime, the *opposite extremal direction*.

The leaf/isolated-prime lower bound $7/12$ and largest-prime-factor-block upper bound $1$ check mathematically as stated, but **no proof of the leading constant** has emerged.

## Mathematical red-team checkpoints still required

- **P001:** greedy partial rainbow edge selection does not imply extendability to a *perfect* matching.
- **P002/P005:** a count of perfect matchings or a connected finite switch graph does not settle infinite connectivity; search for permanent obstructions. An induced 6-cycle blocks a naive chordal-bipartite proof, but does not prove disconnection.
- **P003:** the k-factor min-cut condition is a known max-flow theorem. A violation for **any** set pair is enough to disprove the conjecture. Larger finite flows are evidence, not proof.
- **P004:** the $N>2(2k-1)^3$ auxiliary Sidon-set argument gives a legitimate sparse regime, **not** the conjectured $k$ near $\sqrt N$.
- **P006:** the $1/\sqrt2$ lower constant is from elementary scaling and not known to be optimal.
- **P007:** mandatory earlier-author attribution and distinct upper-bound attainment question.
- **P008:** external audit of the fixed-host cut and Poisson arguments; formulate exactly what "explicit" means.
- **P009:** demonstrate that two-color matchings are not simply equivalent to OEIS A202472's short-prime-difference condition.
- **P010:** test whether degree-one leaves are the only asymptotically significant obstruction, rather than infer sharp $7/12$ from small MILP cases.

## Promotion and demotion decision

**Do not promote any entry to "verified open" yet.** Prior literature audits were substantial but did not check every specialized source, and original research priority is not independently validated. P003, P005 and P010 offer the clearest next *theorem-first* directions; P006 remains a concrete additive-combinatorics project. Reframe P007, specify P008, and investigate P009's dependence on prime-pair conjectures before deciding whether to demote them.

**No problem is silently removed.** All ten remain discoverable, with individually stated risk; a decision to archive will require a dated source or rigorous reduction.
