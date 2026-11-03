# Specialist priority gates for selected problems

The comparison below treats **historical priority**, **mathematical validity**, and **open status** as separate questions. A cited source is not an equivalence unless the specific theorem entails the catalogue statement. The publication details and assertions below have been checked against accessible source records; complete manuscript-level scrutiny and exhaustive priority certification are not claimed.

## P020 — Random $p$-adic Hankel cokernels

**Predecessors.** [Dwivedi–Grinberg (2022)](https://doi.org/10.1016/j.laa.2022.02.014) address finite-field Hankel ranks. [Yiasemides (2024)](https://doi.org/10.1007/s40687-023-00418-7) provides kernel information used in the dossier. [Cheong–Kaplan (2022)](https://doi.org/10.1016/j.jalgebra.2022.03.035) study polynomial transforms of *entrywise Haar-random* matrices. [Jang–Kaplan–Lee–Yu (2026)](https://arxiv.org/abs/2606.06993) prove mod-$p$ criteria for *independent random entries with prescribed zero patterns*.

**Comparison.** A Hankel ensemble has only $2n-1$ independent random coefficients, each repeated along an antidiagonal. It is not a full independent-entry ensemble with a deterministic zero pattern, and none of the located statements directly establishes its full limiting cokernel law. The finite-field rank law and associated imported kernel classification are established prior art. The complete higher-exponent limiting law remains a candidate, with priority **unverified**.

**Established negative consequence.** Since the trivial-group probability for the Hankel cokernel is always $1-p^{-1}$, while that of the ordinary Cohen–Lenstra law is $\prod_{j\ge1}(1-p^{-j})$, these two laws remain separated in total variation by a positive constant. This excludes the ordinary Cohen–Lenstra limit but does not determine the actual limiting law.

**Gate.** Compare random Hankel/Toeplitz Smith-normal-form results directly, especially any theorem about repeated rather than independent entries; audit all internally derived group probabilities beyond the mod-$p$ corank law. This source review does not certify a new limit theorem.

## P027 — Maximum primitive-set heat-bath dynamics

**Predecessors.** [Liu–Pach–Palincza (2021)](https://doi.org/10.1017/S0963548321000018) study the number of maximum primitive sets. The dyadic-chain representation is therefore not new. General heat-bath sampling, order-ideal chains and distributive-lattice dynamics provide important abstract predecessors; see also [heat-bath random walks with Markov bases](https://doi.org/10.1016/j.aam.2017.08.002).

**Comparison.** The specific transition rule randomly updates an entire dyadic-chain coordinate under arithmetic divisibility inequalities. Neither the primitive-set enumeration theorem nor the cited general heat-bath title alone determines the mixing time of this particular walk. The claimed isolated 23-state factors and rational spectral witness are internally proved results, not externally priority-certified. A complete comparison with monotone order-ideal Glauber dynamics has not been established.

**Sharpened spectral certificate.** The same 23-state heat-bath factor has an independently checked rational Rayleigh value $66083/243852$ and yields the full-chain mixing lower coefficient $121926/66083$, improving the earlier $363/202$. This does not determine the full-chain mixing time. [Propp (1997)](https://doi.org/10.37236/1330) develops sampling on finite distributive lattices, a closer general conceptual predecessor.

**Gate.** Identify whether a known general mixing/spectral theorem specializes to the exact coordinate-selection measure and arithmetic poset. Preserve the distinction between the projected product cutoff and a cutoff for the full chain. Status remains *candidate*.

## P031 — Pairwise-coprime Sidon extremum

**Predecessors.** [Bailleul–Riblet (2026)](https://arxiv.org/abs/2605.03181) prove that every $m$-element integer set contains a Sidon subset of size at least $(1/(3\sqrt3)+o(1))\sqrt m$. Applied to primes in $(N/2,N]$, this gives the recorded order $\sqrt{N/\log N}$ lower bound. The general Sidon upper asymptotic and recent refinements by [Carter–O'Bryant–Tao (2026)](https://arxiv.org/abs/2610.36207) concern unrestricted Sidon sets.

**Comparison.** Neither arbitrary-set extraction nor the unrestricted upper bound proves that *pairwise-coprime* Sidon subsets of $[N]$ have size $(1+o(1))\sqrt N$. The near-optimal constant is a separate claim requiring targeted comparison with Sidon sets contained in the primes and multiplicatively restricted Sidon constructions.

**Gate.** Search for a prime-supported near-optimal Sidon construction, or a multiplicative obstruction to leading constant one. Status *candidate*; novelty unverified.

## P033 — Prime-sum connectivity using three labels

**Predecessor.** [Chen–Fu–Guo (2021)](https://doi.org/10.1007/s00373-020-02241-1), *Hamiltonicity in Prime Sum Graphs*, prove the classical even-order prime-sum graph is Hamiltonian for infinitely many orders. Their work uses finite sets of prime-sum labels, including explicit three-label constructions under prime-pair hypotheses.

**Comparison.** A Hamiltonian cycle for infinitely many orders is not an eventual theorem that **three labels connect $[n]$ for every sufficiently large $n$**, and does not imply the all-$n$ conjecture. Conversely, connecting all $n$ vertices with three sums does not imply Hamiltonicity. The dossier's unconditional eventual-connectivity result and arithmetic prime-triple density theorem require independent line-by-line proof and priority review before publication.

**Gate.** Compare the full reflection-group connectivity criterion and prime-triple asymptotics with prior work on prime-colored Hamiltonian sets, not merely the host prime-sum graph. Status *candidate*; significant source-overlap risk, but no equivalence established.

## P040 — Degree-relative resilience of coprime matchings

**Predecessor.** [Pomerance (2021)](https://arxiv.org/abs/2111.07157) proves coprime matchings between certain intervals; [Sah (2022)](https://doi.org/10.1112/mtk.12159) counts coprime permutations. General local resilience and adversarial Hall obstructions are classical.

**Comparison.** Existence of an undeleted matching does not determine the *maximum relative degree of removed edges* needed to destroy every perfect matching. The dossier already disproves its former half-resilience prediction and retains a sharpened limiting-constant problem. The claimed lower bound and finite-prime fractional obstruction are internal results; their specialist priority and proof verification remain outstanding.

**Three-prime optimality.** The exact infimum of the conditional deletion cost on $\{3,5,7\}$ is $5/12$ for **all fractional pairs**, without symmetry. An elementary two-case proof combines support masses and conditional deletion estimates. More generally, coordinatewise upward compression preserves the masses of any two fractional profiles and never increases the maximum conditional cost. Thus the unrestricted finite-prime infimum may be investigated using increasing profiles; additional primes and non-finite-prime Hall cuts remain unresolved. These reductions are compared with the established biased-family compression literature of [Keevash–Lifshitz–Long–Minzer (2023)](https://doi.org/10.1112/jlms.12801). Historical priority of the particular formulation is unverified.

**Gate.** Compare the exact finite-prime variational parameter with extremal nonuniform product-measure disjointness and Hall-resilience theorems. No claim that its bounds are historically new is warranted. Status *candidate*.

## P047 — Full-dimensional simultaneous Sidon sets

**Predecessors.** [Mycielski (1964)](https://doi.org/10.4064/fm-55-2-139-147) establishes qualitative perfect-set avoidance; [Fraser (2016)](https://arxiv.org/abs/1612.08231) gives quantitative local-field configuration avoidance, including the known degree-two dimension-$1/2$ baseline. [Pach–Zakharov (2025)](https://doi.org/10.1007/s00493-025-00151-5) investigate finite additive and multiplicative bi-Sidon sets.

**Comparison.** The explicit dimension-$1/2$ construction in the dossier does not improve Fraser's existence exponent. The Vieta graph argument proves an exact *regularity-constrained* threshold and cannot be used as a universal dimension bound. Neither this argument nor the located results settle simultaneous dimension one. A precise full-dimensional local-field polynomial-avoidance theorem would supersede the proposed question and must be excluded before priority certification.

**Gate.** Search theorem statements (not only titles) for simultaneous polynomial avoidance at full Hausdorff dimension in positive characteristic, especially results allowing meager but Hausdorff-large exceptional configurations. Status *candidate*; historical open status not certified.

## P048 — Coprime permutations with squarefree sums

**Established predecessor.** [Greenfield–Greenfield (1998)](https://cs.uwaterloo.ca/journals/JIS/green.html), Theorem 1 and its prime-reflection proof, construct prime-sum pairings of initial even intervals from Bertrand's postulate.

**Resolution.** Repeatedly choose a prime $n<p<2n$ and reflect the terminal interval $[p-n,n]$ by $i\mapsto p-i$. Recurse on the remaining prefix. This produces a permutation of $[n]$ with all index sums prime. For every pair, $\gcd(i,p-i)=1$ automatically, and a prime sum is squarefree. Hence the P048 existence conjecture is **true for every $n$ by known methods**. It is not open and the former reward condition is already achieved.

**Status.** *Known result*, retained under its permanent identifier. No new theorem is claimed.

## P049 — Bernoulli principal-submatrix rank of the coprimality matrix

**Predecessors.** [OEIS A013928](https://oeis.org/A013928), comment by Sharon Sela (2002), records that the full $n\times n$ coprimality matrix has rank equal to the count of squarefree integers at most $n$ (sequence value $a(n+1)$). [Hilberdink (2014)](https://doi.org/10.1016/j.laa.2014.05.037) studies arithmetical matrix factorizations. [Coja-Oghlan et al. (2023)](https://doi.org/10.1002/rsa.21085) obtain normalized rank laws for an entrywise sparse random matrix with prescribed degree statistics.

**Comparison.** The random principal submatrix is induced by sampling integers. All its entries are then *deterministic* coprimality indicators with strongly dependent arithmetic structure, not independent sparse entries. The full-matrix rank and basic bounded-differences concentration are known/elementary inputs; neither proves convergence of the randomly thinned normalized rank. The source-level novelty of this exact random model remains unverified.

**Gate.** Search arithmetic random induced-submatrix rank literature and investigate whether the normalized mean rank has a limit. Status *candidate*.

## P050 — Prime-Hamming cube colorings

**Predecessors.** [Östergård (2004)](https://doi.org/10.1016/j.jcta.2004.06.010) proved $\chi(Q_n^{(2)})\sim n$ and $\chi(Q_n^{(3)})\sim 2n$ for standard cube distance-at-most-$k$ colorings. See also the [square-of-hypercube problem history](https://www.openproblemgarden.org/op/coloring_squares_of_hypercubes). The prime-Hamming graph is a different distance graph; its first-order asymptotic already follows by splitting into parity classes.

**Internal finite result.** An elementary independent-set argument establishes $\chi(H_8)=16$: an independent set mixing both parities has at most two vertices, and a single-parity independent set has radius-one sphere-packing bound $|A|\le16$. The existing algebraic coloring attains 16. Together with $\chi(H_4)=8$, this leaves $n=16$ as the first unproved dyadic case in the dossier.

**Gate.** Compare the exact prime-distance graph (not just the distance-two cube graph) with association-scheme/Delsarte and coding-theoretic results. Neither the known $\sim2n$ asymptotic nor the small cases establishes the dyadic formula. Status *candidate*, with high historical overlap risk.

## Assessment

This source audit **settles P048 only**. No other status change is justified solely by similarity of topics or a search that fails to find an equivalent paper. All other selected problems require more detailed historical or mathematical verification before being presented as novel contributions.

The 50 permanent identifiers remain unchanged. The active statuses are 42 candidates, five requiring reformulation, one needing specification, one internally proved, and one known result.
