# Mathematical problem collection — Adversarial proof, computation, and novelty audit of P001–P010

**Date:** 2026-10-28  
**Audited baseline:** The initial P001–P010 repository snapshot (PR #5 merged; PR #4's comprehensive earlier literature audit was still pending at audit start).  
**Method:** independent implementation of finite checks, line-by-line checks of the principal elementary proofs, attempts to find quick obstructions, and targeted source/equivalence searches. This is **not peer review, formal verification, an exhaustive MathSciNet/zbMATH review, or a certification of originality**.

## Executive decision

The ten entries were left unchanged after this review. P007 needs a **mandatory attribution correction**: its fully graceful existence theorem is precisely known from 2021. P008 needs an **open-problem formulation correction**: the phrase "explicit formula for the centering" must define an admissible class of non-tautological expressions. P009 is **higher risk for being essentially a reformulation** of a classical prime-difference challenge, although its exact two-color matching statement was not found in prior sources.

| ID | Main question | Proof audit | Independent finite test | Priority / novelty risk |
|---|---|---|---|---|
| P001 | Bounded distinct-prime deficit in matchings | Interior-prime disjoint partial-matching argument checked; perfect completion absent | Exact maximum-color MILP at n=5,8,10; R(10)=9 | **Retain**, arithmetic rainbow-matching specialization |
| P002 | Four-cycle connectivity of prime-sum perfect matchings | General matching-switch literature does not settle host by inspection | Exhaustive matchings/switch components n=5,8,10; n=10: 12,577 states, 75,259 undirected switches, 1 component | **Retain**, novelty not certified |
| P003 | $\lambda(n)=\delta(P_{2n})$ factor packing | Equivalent k-factor cut condition confirmed | Independent integral max-flow n=100,200,300,500,800,1200,2000,3000; every test saturated min degree | **Retain / high-interest** |
| P004 | Sidon one-mark-exchange connectivity | Sparse-regime $N>2(2k-1)^3$ proof checked, including forbidden-point count and auxiliary set construction | n=N=12,k=5: 4 states/2 comps; N=18,k=6: 8 states/6 comps; N=25,k=6: 3380 states/1 comp | **Retain**, related to known Golomb-ruler moves |
| P005 | Coprime-permutation switch connectivity | Universal row+column alone is insufficient: independent 5×5 counterexample checked | Independent enumeration n≤11; independent C++ exhaustive BFS n=14 reaches **3,459,600** states, matching OEIS A005326 | **Retain / high-interest** |
| P006 | Maximum Sidon set with no prime difference | Dilation argument gives liminf at least $1/\sqrt2$; classical Sidon upper bound checked | Independent SciPy/HiGHS MILP: F(24)=4, F(36)=6, F(48)=7 (status optimal, gap 0); witnesses verified | **Retain**, exact novelty remains uncertain |
| P007 | Max distinct gaps along coprime Hamilton path | Parity bound correct; full-graceful iff n≤5 **previously known** | Independent Hamiltonian-tour MILP attains bound n=10,12,20; status optimal | **Reframe** as quantitative extension; credit 2021 theorem |
| P008 | Arithmetic centering for coprime-graph bond-percolation connectivity | Internally checked threshold + Poisson/Gumbel proof architecture; no obvious gap found; broader general theory may subsume | Exact degree computation and unique-center bisection at n=300,1000,3000 agrees with published finite figures | **Reframe** precise centering question; external expert proof/priority audit mandatory |
| P009 | Two prime values suffice for prime-sum pairing | One-color iff $2n+1$ prime and two-prime-reflection construction checked | Independent sieve supplies q,p=2n+q prime for every **2≤n≤1,000,000**; max least q=619 at n=436349 | **Retain conditionally**, very close to Maillet-type prime differences |
| P010 | Minimum adjacent coprime pairs | $h(n)=pc(H_n)-1$, leaf/isolates lower and largest-prime-factor grouping upper checked | Independent Hamiltonian MILP h(9)=3, h(12)=3, h(21)=5, h(30)=5; small lower-bound exceptions confirmed | **Retain / high-interest**, closest predecessor Erdős–Freud–Hegyvári 1983 |

**Interpretation:** "retained" means "worth further study", **not** "proven new and open". No infinite conjecture is established by the listed computational evidence.

## Proof-audit details and pressure points

### P001 — Representation count is enough for a *partial*, not full matching

For each prime $p\in[\varepsilon n,(4-\varepsilon)n]$, the representations $p=a+b$ with $1\le a<b\le2n$ form $\Omega_\varepsilon(n)$ disjoint edges. There are $O(n/\log n)=o(n)$ target primes, so greedily choosing one edge per prime only excludes $o(n)$ vertices and always works. **The proof is sound for a partial matching.** Nothing establishes that it can be completed to a prime-sum **perfect** matching. A proof must incorporate completion constraints from the start. Beware confusing maximizing the number of distinct colors with the stronger full-rainbow condition.

### P002 and P005 — Same formal switch operation, different arithmetic hosts

In both, edges of the reconfiguration graph correspond to flipping an alternating 4-cycle in a bipartite perfect matching. Standard irreducibility results for chordal-bipartite hosts do not automatically apply to these non-chordal examples. A universal row/column is not enough: the bipartite adjacency matrix with rows

$$
[11111;\ 10110;\ 11010;\ 11100;\ 10000]
$$

has a universal row and column but exactly two isolated perfect matchings, with permutations $(5,3,4,2,1)$ and $(5,4,2,3,1)$. Explicit enumeration confirms **zero valid four-cycle switches from either matching**. Arithmetic-specific structure is necessary.

### P003 — Cut condition and strong falsification attempt

The arithmetic host is bipartite (odd/even vertices). A spanning $k$-factor exists exactly when every $X\subseteq U,\ Y\subseteq V$ satisfies

$$
e(X,V\setminus Y)\ge k(|X|-|Y|).
$$

Integral max-flow with capacity $k$ from source to each odd vertex, capacity 1 along each prime-sum edge, and capacity $k$ from each even vertex to sink certifies whether $k=\delta$ is possible. The largest independently checked case n=3000 has **2,087,452 prime-sum edges**, $\delta=648$, and maximum flow **1,944,000** ($3000\cdot648$). This is an exact computational certificate of feasibility at that finite n, not an infinite proof. An explicit violating cut would refute the conjecture.

### P004 — Sparse connectivity proof and dense counterexamples

A Sidon set of size s has at most

$$
s+2s\binom s2+\binom s2\le s^3
$$

forbidden points for extension (occupied points, new-old difference collisions, midpoint collisions). Given two k-sets A and B, construct a disjoint auxiliary k-set C such that both A∪C and B∪C remain Sidon; N>2(2k-1)^3 suffices. Hence at most 2k feasible one-element moves connect A to B. This is a rigorous **cubic-scale** result, not a proof near the conjectured $N^{1/2}$ scale. Exhaustive small disconnected cases bar an unqualified connectivity statement.

### P006 — Small instances do not identify the asymptotic constant

The doubling construction yields size at least $(1-o(1))\sqrt{N/2}$; deleting at most one pair with difference 1 is essential because 1 is not prime but 2 is. In the exact MILP, each positive difference d has a capacity-one constraint on the selected pairs realizing d; prime differences are forbidden by pair-exclusion constraints. The MILP objective and witnesses were independently checked. Ratios at small N are not interpretable as evidence for $\lim F(N)/\sqrt N=1$ without a structural construction or upper bound.

### P007 — Known theorem vs. remaining extremal conjecture

**Panma–Rochanakul**, *Prime-Graceful Graphs*, *Thai Journal of Mathematics* 19(4), 1685–1697 (2021), [primary journal page](https://thaijmath.com/index.php/thaijmath/article/view/1264), prove **Theorem 2.1**: the path on n vertices is prime-graceful iff n≤5. That is exactly the full-distinct-differences coprime-permutation statement, hence **already solved**. The remaining maximal number of distinct differences under a coprimality constraint is distinct and **not shown resolved** by this theorem.

Moreover, "gracesize" (maximal number of distinct differences under a bijective graph labeling) is established terminology, e.g. Letzter–Pokrovskiy–Williams, [*On the gracesize of trees*](https://arxiv.org/abs/2511.11331) (2025/2026). **Do not describe the statistic itself as a newly invented mathematical object.** Its **prime-labeling restricted version** may be independently interesting.

### P008 — Proof checked, priority and statement still inadequate

For the leading threshold the low-degree primorial multiples provide **independent** isolated-vertex events below $e^\gamma$; the complement cut proof distinguishes small cuts from large cuts controlled by primes >√n. For the implicit-center window, the degree profile plus $b_n\sim e^\gamma\log n\log\log n/n$ gives isolation mean $e^{-t}$, the finite-dimensional factorial moments give Poisson isolates, and a connected-component union bound rules out nontrivial disconnected components. The review identified no immediate invalid inequality in those core steps; **this is not independent peer review or a Lean proof**.

The random host is a known model, and general fixed-host connectivity theory is extensive: Gupta–Lee–Li (SODA 2021), Penrose (2018), Hladký–Viswanathan (2026), alongside arithmetic coprime graph literature. Further review must test whether the stated theorem is a direct specialization of existing machinery.

**Logical formulation issue:** "find an explicit formula" is not yet a sharply determined yes/no statement. The exact equation $\mu_n(b_n)=1$ already defines $b_n$. Fix a class (e.g. finite polylogarithmic/iterated-log expansions with universal coefficients) and state the attainable error $o(\log\log n/n)$; perhaps first ask for the smallest provable error with a specified two-term formula.

### P009 — The million-instance check tests a known *sufficient* condition

For primes q and 2n+q with $3\le q\le2n-1$, reflect $[1,q-1]$ about q and $[q,2n]$ about 2n+q. The resulting perfect matching uses at most two prime sums. The existence of such a q is **exactly a condition counted by OEIS [A202472](https://oeis.org/A202472)**, and is stronger than the general classical prime-difference existence problem because it bounds the smaller prime. **This sufficient condition is not necessary as far as demonstrated**: the exact two-color matching question has not been proved equivalent to it. Seeking a two-color matching outside the certificate class would clarify the independent significance of P009.

### P010 — Check the 7/12 obstruction carefully

Let A=π(n)-π(n/2) count isolated primes >n/2 in the graph $H_n$ with edges gcd>1. Let B=π(n/2)-π(n/3) count prime leaves q with their sole neighbor 2q. Together with isolated vertex 1, every path cover has at least $1+A+\lceil B/2\rceil$ paths; hence $h(n)\ge A+\lceil B/2\rceil\sim (7/12)n/\log n$. Grouping 2..n by **largest prime factor** gives at most π(n) noncoprime blocks, and vertex 1 adds one; therefore $h(n)\le\pi(n)$. Both arguments check out. The finite lower bound is **not identically exact**: n=9 and n=21 require one more coprime adjacent pair. To establish $7/12$, build path covers with $(7/12+o(1))n/\log n$ components or prove stronger asymptotic obstructions.

## Literature and originality assessment — primary and closely related sources

| Problem(s) | Relevant established work and precise overlap |
|---|---|
| P001–P003, P009 | [Greenfield–Greenfield (1998)](https://cs.uwaterloo.ca/journals/JIS/green.html) already prove the prime-sum matching existence theorem; [OEIS A000341](https://oeis.org/A000341) counts matchings. P009's short prime-pair condition is counted by [OEIS A202472](https://oeis.org/A202472). |
| P002, P005 | [Dyer–Jerrum–Müller, *On the switch Markov chain for perfect matchings*](https://eprints.whiterose.ac.uk/id/eprint/111478/1/monotone.pdf); [Bonamy et al., MFCS 2019](https://doi.org/10.4230/LIPIcs.MFCS.2019.80). Exact 4-cycle switch is **not a new operation**. |
| P003 | [Chen–Fu–Guo (2021)](https://doi.org/10.1007/s00373-020-02241-1) study Hamiltonicity of prime-sum graphs; not an identified resolution of minimum-degree k-factor packing. |
| P004, P006 | Golomb rulers are finite Sidon sets; [Dotú–Van Hentenryck (2005)](https://cs.brown.edu/research/pubs/pdfs/2005/Dotu-2005-SHE.pdf) use one-mark changes but permit invalid intermediate states; not the same fixed-size feasible-state connectivity theorem. |
| P005 | [Pomerance (2022)](https://arxiv.org/abs/2203.03085), [Sah–Sawhney (2022)](https://arxiv.org/abs/2203.06268), [OEIS A005326](https://oeis.org/A005326) establish the underlying coprime-permutation objects and counts; the switch-connectivity question is separate. |
| P007 | [Panma–Rochanakul (2021)](https://thaijmath.com/index.php/thaijmath/article/view/1264) fully settle the prime-graceful path existence subquestion; [Letzter–Pokrovskiy–Williams (2025/26)](https://arxiv.org/abs/2511.11331) discuss the older general gracesize concept. |
| P008 | [Gupta–Lee–Li (SODA 2021)](https://epubs.siam.org/doi/book/10.1137/1.9781611976465) analyze independent edge-percolation on fixed graphs; [Penrose (2018)](https://doi.org/10.1017/jpr.2018.9) gives Poisson methods; [Hladký–Viswanathan (2026)](https://doi.org/10.1002/rsa.70098) study graphon-sampled connectivity (not automatically identical to the deterministic coprime host). |
| P010 | [Erdős–Freud–Hegyvári (1983)](https://users.renyi.hu/~p_erdos/1983-02.pdf) examine gcd/lcm values of successive terms in permutations, primarily magnitudes rather than count of gcd=1 transitions; [OEIS A076220](https://oeis.org/A076220) counts the opposite all-coprime extreme. |

**Novelty verdict:** Targeted searches found **no definitive resolution of the ten *full* candidate questions**, but they are **not certified open or original**. Exact prior-art collision confirmed for P007's full-graceful *subquestion*. Originality risk is highest for P007's terminology, P009's prime-pair certificate, and P008's general connectivity machinery.

## Honest limits and next decision gate

- Independently run code and review elementary algebra do not establish a new theorem's publication priority.
- The full 1983 Erdős–Freud–Hegyvári paper and older graph-labeling / Golomb-ruler literature deserve a complete citation-chain audit; some PDF retrievals were inaccessible in this environment, so the whole bibliography was **not** exhaustively read.
- The following questions remained before extending the catalogue: (i) independent specialist novelty check, (ii) code and proof scrutiny on the strong candidates, (iii) precise restatement of P008, and (iv) a choice between consolidating P002/P005 as a common program versus retaining separate hosts.
- Suggested theorem-first focus: **P003**, **P005**, **P010**. Suggested most likely status refinements: **P007**, **P008**, **P009**.
