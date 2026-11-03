# P014 — Homology transitions in random Cayley sum flag complexes

<!-- DOSSIER-SUMMARY -->
> **Research question:** Do clique complexes of random Cayley sum graphs over cyclic prime groups have the same homology-vanishing exponents as Erdős–Rényi flag complexes?  
> **Formulation:** candidate. **Novelty:** apparent novelty (targeted audit).  
> **Verified/known progress:** Exact triangle expectation matches Erdős–Rényi; four-clique expectation has an additive-parallelogram correction.  
> **Finite evidence:** Exact enumeration of K4 motif moments for odd cyclic orders 5, 7, 9.  
> **Symbolic prize:** A bottle of whisky of positive measure — A proof or disproof that the specified Cayley-sum flag-complex homology thresholds match the independent-edge model.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

**Area:** probabilistic topology, additive combinatorics, random graph theory  
**Status:** exploratory candidate; mathematical novelty and unresolved status **not certified**.

## Model and precise question

For odd prime $q$, let $S_q(p)\subseteq\mathbb Z/q\mathbb Z$ include each group element independently with probability $p$. Form an **undirected simple graph** $G_q^+(p)$ on $\mathbb Z/q\mathbb Z$, with an edge between distinct $x,y$ if and only if $x+y\in S_q(p)$. Loops are excluded, even when $2x\in S_q(p)$.

Let $X_q(p)$ be its **clique (flag) complex**. For each fixed $k\ge1$, and $p=q^{-\alpha}$, determine the asymptotic regimes for

$$
\Pr\bigl(\widetilde H_k(X_q(p);\mathbb F_2)\ne0\bigr).
$$

**Main question.** Does the sequence of homology-emergence and homology-vanishing power-law exponents agree with the Erdős–Rényi flag-complex model $X(G(q,p))$, or can additive dependence change the exponents or the shape of the transition windows?

A second question asks how these thresholds change when the ambient groups have substantial $2$-torsion. The main question is restricted to odd primes to make additive coincidences transparent.

**No assertion of coincident thresholds is made.** Unlike individual edges in an Erdős–Rényi graph, all edges sharing a sum label are perfectly correlated.

## An exact elementary difference from Erdős–Rényi

**Proposition (small-clique expectations).** Write $T_q$ and $K_q$ for the numbers of triangles and copies of $K_4$ in $G_q^+(p)$, and suppose $q\ge5$ is an odd prime. Then

$$
\mathbb E T_q=\binom q3 p^3
$$

and

$$
\boxed{
\mathbb E K_q
=\binom q4 p^6
+\frac{q(q-1)(q-3)}8\,(p^5-p^6).
}
$$

The first expectation **coincides** with the Erdős–Rényi graph on $q$ vertices with edge probability $p$. The second contains an extra contribution from arithmetic parallelograms.

**Proof.** For three distinct vertices $x,y,z$, their edge sums $x+y,x+z,y+z$ are three different elements, so the triangle probability is $p^3$.

For four distinct vertices, any equality between two edge sums involves disjoint edges, as otherwise cancellation forces two vertices equal. There are three possible pair partitions. At most one of those equalities can hold, because if $a+b=c+d$ and $a+c=b+d$, subtracting gives $2(b-c)=0$, impossible for distinct vertices in a group of odd prime order. Therefore an ordinary four-vertex set requires six independent sum labels (probability $p^6$), but a parallelogram four-set requires only five (probability $p^5$).

To count special unordered four-sets, choose ordered distinct $a,b$, then choose $c$ distinct from $a,b,(a+b)/2$; put $d=a+b-c$. This gives $q(q-1)(q-3)$ ordered choices. Every special four-set has exactly one admissible equality and is represented eight times (two orders of each pair and two ways to swap the equal-sum pairs). Hence the number of special four-sets is $q(q-1)(q-3)/8$. Summing $p^5$ and $p^6$ proves the formula. $\square$

This proposition is **elementary and not claimed to be a new published theorem**. Its purpose is to establish a concrete mechanism by which additive graph dependence affects even the local clique statistics that feed higher-dimensional topology.

For example, at $q=7,p=1/2$, the formula gives $\mathbb E K_7=7/8$, whereas for Erdős–Rényi it is $35/64$. Exact enumeration over all $2^7$ possible sum-label sets reproduces $7/8$.

## A necessary asymptotic sanity check

The excess expected number of four-cliques, relative to the Erdős–Rényi baseline, has **relative size**

$$
\frac{\mathbb E K_q-\binom q4p^6}{\binom q4p^6}
=\frac{3(1-p)}{(q-2)p}
\qquad(q\ge5,\ p>0).
$$

Indeed,

$$
\frac{q(q-1)(q-3)/8}{\binom q4}=\frac{3}{q-2}.
$$

Consequently the relative excess is **$o(1)$ whenever $qp\to\infty$**. The exact four-clique correction is real, but **does not by itself demonstrate a different leading threshold**, and at some natural topological scales the first-order four-clique expectations coincide. The open problem remains whether *higher-order correlations*, local-link structure or torsion effects produce genuinely different homological behavior. This observation is part of the adversarial case against promoting a premature topological conjecture.

## Why the open question could be structural

Kahle's classical work identifies regimes where homology of **independent-edge random flag complexes** appears and disappears. Those arguments use intricate control of cliques and local links. Sum-generated edge dependence changes the joint law of those objects, and exact small-clique calculations do not determine whether the leading **power-law exponents** are preserved.

A positive result would identify a new universality principle for correlated random topology. A negative result would expose an additive-geometric obstruction invisible in independent-edge models. Either could connect additive energy, graph links, and topological phase transitions.

## Literature and novelty caveats

- [Matthew Kahle, *Topology of random clique complexes*, Discrete Mathematics (2009)](https://doi.org/10.1016/j.disc.2008.02.037) establishes the benchmark Erdős–Rényi flag-complex homology regimes; the flag-complex construction is not new.
- [Newman, *One-sided sharp thresholds for homology of random flag complexes* (2024)](https://doi.org/10.1112/jlms.12872) refines homological threshold results for the independent-edge setting.
- [Conlon–Fox–Pham–Yepremyan, *On the clique number of random Cayley graphs and related topics* (2024/2025)](https://arxiv.org/abs/2412.21194) studies precisely the phenomenon of repeated group-derived edge colors and their effect on cliques; random Cayley graphs and arithmetic clique statistics are established.
- [Hino–Kanazawa, *Asymptotic behavior of lifetime sums for random simplicial complex processes* (2019)](https://doi.org/10.2969/jmsj/79777977) develops stochastic-topological lifetime statistics, although in different random-complex models.

A targeted search of the terms *random Cayley sum graph homology*, *random Cayley flag complex Betti*, *additive random clique complex homology*, and *group-colored random graph topology* did **not** reveal the exact prime-cyclic sum-graph homology threshold problem. This **does not certify novelty**; adjacent Cayley-complex and random-group-complex literature requires further scrutiny.

## Test and review programme

The dependency-free program [`experiments/P014_sum_flag_cliques.py`](../../experiments/P014_sum_flag_cliques.py) exhaustively verifies the four-clique expectation for small odd cyclic groups. It does not test asymptotic homology, so it cannot justify claims about homology phase transitions.

Before promoting a specific threshold conjecture, compare topological statistics with Erdős–Rényi graphs **at matched density**, control for excess edge-count variance in the sum model, and test whether clique-dependence survives relevant normalizations. Document counterexamples instead of extrapolating from finite simulations.
