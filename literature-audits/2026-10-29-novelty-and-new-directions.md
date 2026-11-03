# Novelty review and research-generation gate — P001–P013

**Review date:** 29 October 2026.  
**Scope:** targeted publication / arXiv / OEIS / terminology searches for P001–P010, plus initial predecessor audit for P011–P013. This review aims to identify **direct mathematical equivalences**, not merely similar titles.

## What "apparent novelty" means

**Apparent novelty — targeted audit** = *no source establishing this exact question or answering it was found in the listed accessible sources and synonym searches*. It does **not** mean a claim has been proved new, nor that the mathematical community has never posed it, nor that the question remains open in October 2026. The word "apparent" is epistemic: a description of the present search, **not a theorem about the literature**.

These independent axes must be tracked:
1. **Mathematical state:** candidate, needs specification/reframing, internally proved, previously known, disproved.
2. **Priority state:** apparent novelty after a targeted search; known overlap; under-specified; originality unverified for an internal theorem.
3. **Structural significance:** would a solution explain a mechanism, lead to a classification/phase diagram, or connect mathematically distant theories?

A specialist's full bibliography audit is still required before labels such as *genuinely new open problem* or *previously unknown theorem*.

## Review matrix of the first ten

| ID | Nearest exact primary tradition | Specific question after the audit | Label and next action |
|---|---|---|---|
| P001 | Greenfield–Greenfield (1998) prime-sum perfect matchings; rainbow matching theory | Maximum distinct prime-sum palette in a *perfect* matching | **Apparent novelty (targeted)**; completion issue not settled by partial matching |
| P002 | Dyer–Jerrum–Müller (2017), Bonamy et al. (2019) matching-switch chain | Four-cycle connectivity in the **specific** prime-sum host | **Apparent novelty (targeted)**; operation itself known |
| P003 | Ore's bipartite k-factor cut criterion; Greenfield–Greenfield prime graphs | Saturate prime-sum host **minimum degree** with disjoint perfect matchings | **Apparent novelty (targeted)**; do not confuse flow equivalence with a proof |
| P004 | Golomb rulers; Dotú–Van Hentenryck (2005) one-mark moves | Connectivity using **only Sidon-valid intermediate states** | **Apparent novelty (targeted)**; known optimization can move through invalid rulers |
| P005 | Pomerance and Sah–Sawhney (2022) coprime permutations; 4-cycle switching | Whether all coprime permutations lie in one 4-switch component | **Apparent novelty (targeted)**; enumerating perfect matchings does not settle connectivity |
| P006 | Sidon/Golomb extremal theory and prime-distance graph independent sets | Maximal Sidon **independent** sets in the prime-distance graph | **Apparent novelty (targeted)**; two known constraints, joint extremum not located |
| P007 | Panma–Rochanakul (2021), **prime-graceful path theorem** | Maximize **number** of differences, not full graceful existence | **Known subproblem / extension not verified**; mandatory attribution |
| P008 | Gupta–Lee–Li (2021) fixed-host percolation; Penrose (2018) Poisson isolates | Finite universal-coefficient expansion of coprime-graph connectivity center | **Needs precise formulation**; "explicit" without an allowed expression class is tautological |
| P009 | Greenfield–Greenfield (1998); Maillet-type prime differences; **OEIS A202472** | Two-prime palette perfect matching; short prime-pair criterion only sufficient | **Strong known overlap**; do not claim prime-pair condition new |
| P010 | Erdős–Freud–Hegyvári (1983), adjacent gcd/lcm extremal permutations; general path covers | Exact minimum number of coprime consecutive entries | **Internally proved / priority unverified**; independent proof referee and broad historical search before publication |

## Literature anchors and precision of overlap

### Prime-sum matchings P001–P003, P009
- L. E. and S. J. Greenfield, [*Some Problems of Combinatorial Number Theory Related to Bertrand's Postulate* (1998)](https://cs.uwaterloo.ca/journals/JIS/green.html): existence of prime-sum perfect matchings. This is foundational **prior art**, not a general result on color-spectrum optimization, 4-cycle flip connectivity, or min-degree factors.
- Dyer, Jerrum, Müller, [*On the switch Markov chain for perfect matchings* (2017)](https://doi.org/10.1145/2822322): established four-cycle switching, hereditary connectivity results.
- Bonamy et al., [*The Perfect Matching Reconfiguration Problem* (2019)](https://doi.org/10.4230/LIPIcs.MFCS.2019.80): strongly nontrivial, sometimes PSPACE-hard, reconfiguration of perfect matchings.
- Chen, Fu, Guo, [*Hamiltonicity in Prime Sum Graphs* (2021)](https://doi.org/10.1007/s00373-020-02241-1): exact host graph, different global property.
- [OEIS A202472](https://oeis.org/A202472): P009's *sufficient short-prime-pair certificates* are already explicitly tabulated. The two-prime matching **necessity** has not been established.

### Sidon constraints P004, P006
- [Sidon Set — MathWorld](https://mathworld.wolfram.com/SidonSet.html): equivalence to Golomb rulers and existing extremal density results.
- Dotú and Van Hentenryck, [*A Memetic Approach to Golomb Rulers* (2005)](https://cs.brown.edu/research/pubs/pdfs/2005/Dotu-2005-SHE.pdf): one-mark moves, but not a theorem about the valid-only state graph.
- [Prime-distance graph coloring (1990)](https://research.ibm.com/publications/colouring-prime-distance-graphs) and [Carraher et al. (2016), *On the independence ratio of distance graphs*](https://doi.org/10.1016/j.disc.2016.05.018): forbidding prime differences creates an independent-set condition in a known graph; P006 combines it with Sidon uniqueness. **This combination is not automatically a new mathematical object**, but its extremal behavior was not found settled.

### Coprime matchings P005, arithmetic probabilities P008
- [Pomerance (2022), *Coprime permutations*](https://arxiv.org/abs/2203.03085) and [Sah–Sawhney (2022), *Enumerating coprime permutations*](https://doi.org/10.1112/mtk.12159): enumeration / matching estimates, not 4-switch connectivity.
- [Gupta–Lee–Li, *The Connectivity Threshold for Dense Graphs* (SODA 2021)](https://epubs.siam.org/doi/book/10.1137/1.9781611976465): general percolation on deterministic host graphs. Arithmetic specializations require careful novelty checks.
- [Penrose (2018), *Inhomogeneous random graphs, isolated vertices, and Poisson approximation*](https://doi.org/10.1017/jpr.2018.9): general Poisson techniques, not an exact arithmetic-center formula.

### The known subtheorem and internally proved theorem
- [Panma–Rochanakul, *Prime-Graceful Graphs* (2021), Theorem 2.1](https://thaijmath.com/index.php/thaijmath/article/view/1264): the P007 full-graceful iff existence subproblem was **previously known**. Only the restricted maximum-distinct-difference extension is a candidate.
- [Erdős–Freud–Hegyvári, *Arithmetical properties of permutations of integers* (1983)](https://users.renyi.hu/~p_erdos/1983-02.pdf): closest historical predecessor to P010, but the reviewed statements optimize neighboring gcd/lcm **sizes**, not the number of gcd-one transitions. The exact P010 formula is internally proved, not yet certified original.

## New problem-generation batch: three research-first questions

### P011 — Random sum-diagonal matching/factor transitions

- **Definition:** Independently retain *sum labels*, not edges, in a bipartite graph on $[n]\times[n]$. This gives strongly correlated anti-diagonals.
- **Structural implication:** could distinguish additive correlation from Erdős–Rényi matching universality and predict cut/factor obstructions.
- **Closest prior art:** Campos–Dahia–Marciano, [random Cayley sum graphs (2024)](https://doi.org/10.1112/jlms.70041), and recent random Cayley sum graph subgraph thresholds [KolKom 2026](https://kolkom26.zib.de/). The random-sum *paradigm is known*; the nonperiodic **matching/factor** observables were not located in our targeted audit.
- **Adversarial check:** factor saturation at the current minimum degree is **not monotone** under addition of sum labels. The P011 dossier gives an explicit $n=3$ example. Only the perfect-matching existence event is unambiguously monotone.

### P012 — Switch-space geometry under random thinning of the coprime graph

- **Definition:** Percolate edges of the arithmetic $\gcd=1$ bipartite host independently. Conditional on at least two perfect matchings, study connectedness of the **4-cycle matching flip graph**.
- **Structural implication:** probes separation between the onset of *certificates* and the onset of *local coordination between certificates*, potentially a new universality class of random solution spaces.
- **Closest prior art:** [Dyer–Jerrum–Müller (2017)](https://doi.org/10.1145/2822322); [Bonamy et al. (2019)](https://doi.org/10.4230/LIPIcs.MFCS.2019.80); [Sah–Sawhney (2022)](https://doi.org/10.1112/mtk.12159); [Balachandran–Kush (2021)](https://doi.org/10.37236/9148).
- **Adversarial check:** one-matching cases are vacuously connected, and adding edges need not preserve reconfiguration connectivity. No unjustified monotone-threshold conjecture is asserted.

### P013 — Random-site Sidon exchange geometry

- **Definition:** Retain sites in $[N]$ independently and study the valid one-mark-exchange graph on Sidon $k$-sets contained in the retained subset.
- **Structural implication:** possible separation between the existence of additive configurations and a connected state space, combining extremal additive combinatorics with random CSP clustering.
- **Closest prior art:** [Luque–Torre–Lacasa (2013)](https://doi.org/10.1103/PhysRevE.88.052119) studied random Sidon decision phase transitions, and [Dotú–Van Hentenryck (2005)](https://cs.brown.edu/research/pubs/pdfs/2005/Dotu-2005-SHE.pdf) studied local Golomb-ruler optimization. The *feasible-state reconfiguration* statistic was not found in the targeted review.
- **Adversarial check:** $k=2$ is trivial (a Johnson graph). Meaningful regimes require larger $k$, and conditional connectivity is not automatically monotone.

## Search integrity and an instructive warning

A [2026 PNAS paper by Alexeev and Mixon](https://doi.org/10.1073/pnas.2531760123) reports finding that Marshall Hall, Jr. had published a counterexample decades before a supposedly longstanding open Erdős question was posed. This is a concrete reminder that even historical *open-problem status* can be misleading. The collection therefore uses **apparent novelty — targeted audit**, not "new/open certified", for unresolved entries without external bibliography review.

**Decision:** do not resume trying to prove all 13 entries. Focus the next passes on generating, filtering and clearly stating mathematically consequential problems. P010 and the interval-sum factor lemma remain preserved as internally proved results with external priority still to be checked.


## Additional candidate P014 — Random Cayley-sum flag-complex homology

**Added 29 October 2026.** Instead of independent graph edges, retain each group **sum label** independently and take the clique complex of the resulting random Cayley sum graph on an odd cyclic prime group. Determine whether the homology-vanishing exponents agree with independent-edge random flag complexes.

**Nearest mathematics:**
- [Kahle (2009)](https://doi.org/10.1016/j.disc.2008.02.037): homology phase regimes of Erdős–Rényi flag complexes.
- [Newman (2024)](https://doi.org/10.1112/jlms.12872): refined one-sided sharp topological thresholds.
- [Conlon–Fox–Pham–Yepremyan (2024/25)](https://arxiv.org/abs/2412.21194): repeated group-derived sum colors change clique combinatorics; the Cayley-sum graph model is *not new*.
- [Simplicial complexes defined on groups (2025)](https://doi.org/10.1515/math-2025-0171): further general background for group-related homological structures. It does not directly settle the proposed random sum-flag homology exponents in the material located.

**Mathematical screening:** the triangle count has mean $\binom q3p^3$ as in Erdős–Rényi, but the four-clique count has exact mean

$$
\binom q4p^6+\frac{q(q-1)(q-3)}8(p^5-p^6).
$$

The correction comes from additive parallelograms; it was independently derived and exhaustively verified at small odd orders. This establishes nontrivial correlated local structure, but **does not settle or predict the homology exponents**. A targeted search did not reveal the exact homology-window question. Its genuine novelty remains unresolved and it should not be described as an entirely new random graph model.

See [P014](../problems/topology/P014-random-cayley-sum-flag-homology.md) for the precise question, proof of the local motif identity, and limitations.
