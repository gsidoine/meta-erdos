# P012 — When does a random coprime graph have a connected matching space?

<!-- DOSSIER-SUMMARY -->
> **Research question:** At what densities do the perfect matchings of a thinned coprime graph form one four-cycle reconfiguration component?  
> **Formulation:** reframe. **Novelty:** model and switch chain have known predecessors; no arithmetic-specific fragmentation regime established.  
> **Verified/known progress:** The conditional connectivity observable is defined, but no distinguished density window or arithmetic-specific obstruction has been established; frozen-edge obstructions are generic.  
> **Finite evidence:** Frozen-edge obstruction identified; unique-matching and nonmonotonicity caveats.  
> **Symbolic prize:** A Book (symbolic) — A proved asymptotic law for switch-space connectivity in a specified nontrivial thinning regime, or an explicit arithmetic fragmentation obstruction.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

**Fields:** probability, arithmetic graph theory, graph reconfiguration  
**Research status:** reframe; the exact conditional observable is defined, but no specific arithmetic fragmentation regime is yet established.

## Model

Let $B_n$ have two copies of $[n]$ with edge $(i,j)$ precisely when $\gcd(i,j)=1$. Independently retain every permitted edge with probability $p$, giving $B_n(p)$.

Let $\mathcal M_n(p)$ be the set of all perfect matchings of $B_n(p)$. Define the **switch-space graph** $\mathcal F_n(p)$ whose vertices are $\mathcal M_n(p)$, with an edge whenever one matching can be obtained from another by replacing two matched edges with the two crossed edges of an alternating 4-cycle that is present in the thinned graph.

The original P005 is the deterministic endpoint $p=1$.

## Main structural question

Study the probability

$$
\Pr\!\left(\mathcal F_n(p)\text{ is connected}\ \middle|\ |\mathcal M_n(p)|\ge2\right)
$$

as $n\to\infty$, and determine the **separation of scales** between (i) existence of perfect matchings, (ii) existence of multiple perfect matchings, and (iii) four-cycle connectivity of **all** perfect matchings.

One possible outcome is a phase diagram with a substantial regime where perfect matchings exist in abundance but their switch space is fragmented. Identify arithmetic causes for such fragmentation and compare with $G(n,n,p)$ and other deterministic host graph families.

This statement asks for the phase diagram **without asserting that the connectivity event is monotone or has a sharp threshold**.

## Mathematical scope

The conditional event is well-defined, but an unrestricted request for its full nonmonotone phase diagram is not yet a separate sharp conjecture. General switch-chain fragmentation and frozen alternating edges are established phenomena. A stronger statement must specify an asymptotic density regime and isolate a mechanism genuinely caused by the coprimality host graph, rather than by arbitrary bipartite matching spaces.

## Why a separate problem?

Perfect-matching existence is a property of the base graph. Connectedness of its **space of certificates** is a strictly higher-level property and can differ strongly between hosts with similar minimum degree and matching counts. This tests the local-to-global phenomenon of *certificate coordination* and links the fixed-host coprime model (P005) to arithmetic random graph behavior (P008).

## Important elementary obstruction

A matched edge that lies on **no alternating four-cycle** cannot be changed by a permitted switch. If two perfect matchings differ on such a frozen edge, the switch space is disconnected.

A matching space with a **single** matching is trivially connected, so we condition on having at least two. Even after this conditioning, switch connectivity need not be monotone in the edge set: adding new edges can create a new perfect matching in a different component. We therefore do not claim a conventional increasing-event threshold.

## Prior literature

- Dyer–Jerrum–Müller, [*On the switch Markov chain for perfect matchings* (2017)](https://doi.org/10.1145/2822322), studies the fixed-host switch chain and hereditary connectivity classes.
- Bonamy et al., [*The Perfect Matching Reconfiguration Problem* (2019)](https://doi.org/10.4230/LIPIcs.MFCS.2019.80), establishes broad computational difficulty, including bipartite examples.
- Pomerance, [*Coprime permutations* (2022)](https://arxiv.org/abs/2203.03085), and Sah–Sawhney, [*Enumerating coprime permutations* (2022)](https://doi.org/10.1112/mtk.12159), treat the underlying deterministic matching family.
- Balachandran–Kush, [*The Normalized Matching Property in Random and Pseudorandom Bipartite Graphs*](https://doi.org/10.37236/9148), studies a different matching threshold for independent-edge random bipartite hosts.

The operation and the arithmetic host graph are individually established. The **specific percolated switch-space phase diagram** was not found in the cited targeted source search, but may be implicit in general switching or random graph theory.

## Proposed tests

1. Enumerate every perfect matching of tiny thinned hosts and construct their four-cycle reconfiguration graph exactly.
2. Check whether the trivial one-matching regime distorts initial probability estimates.
3. Attempt an invariant/certificate for disconnected components based on frozen edges or isolated alternating cycles.
4. Search for direct results on switching chains for random bipartite host graphs before promoting any claimed novelty.
