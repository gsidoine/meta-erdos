# P007 — The difference spectrum of a coprime Hamiltonian path

<!-- DOSSIER-SUMMARY -->
> **Research question:** Can a coprime Hamiltonian path attain the parity upper bound for distinct adjacent differences?  
> **Formulation:** reframe. **Novelty:** known subproblem; extension unverified.  
> **Verified/known progress:** Full graceful existence iff n≤5 is a published 2021 theorem; extremal extension unverified.  
> **Finite evidence:** Exact finite MILP checks in selected sizes.  
> **Symbolic prize:** A bottle of whisky of positive measure — A proof or disproof of eventual attainment of the parity upper bound for coprime paths.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->


**Area:** graph labeling, number theory, extremal paths  
**Status:** reframed candidate; historical originality and unresolved status of the extremal extension are not certified

## Definition

A **coprime ordering** of $[n]$ is a permutation $(a_1,\ldots,a_n)$ with $\gcd(a_i,a_{i+1})=1$ for $1\le i<n$. This is a Hamiltonian path of the coprime graph on $[n]$.

Define

$$
D(n)=\max_{\text{coprime orderings}}
  \left|\{|a_{i+1}-a_i|:1\le i<n\}\right|.
$$

A path is **graceful** if all its $n-1$ differences are distinct. Classical graceful permutations exist for every $n$, but the coprimality condition changes the situation fundamentally.

## Important prior art: the fully graceful question is previously known

**Established predecessor:** The statement "a coprime graceful permutation of $[n]$ exists if and only if $n\le5$" is **not a newly discovered theorem**. It is **Theorem 2.1** of:

Sayan Panma and Penying Rochanakul, *Prime-Graceful Graphs*, **Thai Journal of Mathematics** 19(4), 1685–1697 (2021), [journal page](https://thaijmath.com/index.php/thaijmath/article/view/1264). Their "prime-graceful labeling of $P_n$" exactly matches our full-distinct-gap condition. The independent parity argument below is a rederivation of their established theorem, not a priority claim.

Older literature also studies *weaker* prime-graceful labelings with a larger label range; those positive path results are not contradictory because they use more labels than $[n]$. This terminology is essential when searching for P007's precise **maximum number of distinct differences** variant.

## Complete elementary obstruction (previously known, reproduced here)

**Proposition 1.** There exists a coprime graceful permutation of $[n]$ if and only if $1\le n\le5$.

**Proof.** All adjacent even–even pairs are forbidden by coprimality. Every edge whose difference is even must therefore join two odd integers. Write $o=\lceil n/2\rceil$, $e=\lfloor n/2\rfloor$. The $e$ even integers occur in the path as nonadjacent vertices. Their positions force at least $e-1$ distinct odd-vertex runs, so the number of odd–odd adjacent pairs is at most $o-(e-1)$: at most one if $n$ is even, and at most two if $n$ is odd. A graceful permutation must realize *all* even differences in $\{1,\ldots,n-1\}$: there are $\lfloor(n-1)/2\rfloor$ of them. For even $n\ge6$, this requires at least two odd–odd edges, contradiction; for odd $n\ge7$, it requires at least three, contradiction. The cases $n=1,\ldots,5$ have witnesses, e.g. for $n=5$, $(2,3,5,1,4)$, with differences $1,2,4,3$ and all adjacent pairs coprime. Smaller cases follow by direct examples. $\square$

**Proposition 2 (sharp candidate upper bound).** For every $n\ge2$,

$$
D(n)\le \min\left\{n-1,\left\lfloor\frac{n+3}{2}\right\rfloor\right\}.
$$

**Proof.** The number of different odd differences cannot exceed the number of odd integers in $[1,n-1]$, which is $n/2$ for even $n$ and $(n-1)/2$ for odd $n$. The number of different even differences is bounded by the number of odd–odd edges, at most one or two respectively by Proposition 1. Also there are only $n-1$ path edges. Add these bounds. $\square$

## Main candidate conjecture

**Is the upper bound always attained?**

$$
\boxed{D(n)=\min\left\{n-1,\left\lfloor\frac{n+3}{2}\right\rfloor\right\}
\quad\text{for every } n\ge2.}
$$

A positive answer would determine the exact maximum number of distinct gaps along a Hamiltonian path of the coprime graph.

## Reproducible exact optimization

[The MILP implementation](../../experiments/coprime_gap_milp.py) searches for a Hamiltonian path maximizing the number of distinct adjacent differences. It constructs an undirected Hamiltonian cycle on vertices $0,1,\ldots,n$, where $0$ is a dummy vertex joined to every actual vertex. On $\{1,\ldots,n\}$, only coprime edges are permitted. Degree-2 constraints and iterative subtour-elimination cuts enforce a **single Hamiltonian cycle**. Binary difference indicators $z_d$ satisfy $z_d\le\sum_{\{i,j\}:\,|i-j|=d}x_{\{i,j\}}$. Maximizing $\sum z_d$ returns the exact maximum when the MILP solver reports status **optimal** and the final solution is a connected tour. The two dummy edges have **no** difference labels.

This optimizer found equality in Proposition 2 for **every $n=3,\ldots,30$**, and for additional $n=32,35,40,45,50,60,70,71,79,80,89,90,99,100,120$, with status 0 (optimal). The finite checks, including the larger selected instances, do not imply the conjecture.

Example at $n=12$:

$$
(8,3,4,7,6,5,12,1,11,2,9,10).
$$

All neighboring numbers are coprime, and there are 7 distinct differences, attaining the upper bound $\lfloor15/2\rfloor=7$.

## Research directions

- Seek an explicit family of extremal paths, ideally compatible with induction $n\mapsto n+2$.
- Determine whether every possible **odd** difference can be simultaneously realized in one coprime Hamiltonian path.
- Identify stability: how rigid are upper-bound attaining paths?
- Try to falsify the equality at larger $n$, or prove a weaker all-$n$ lower bound $D(n)\ge (1/2-o(1))n$.

## Revised novelty assessment

**The existence/fully graceful result is conclusively previously known (2021).** The extremal parameter $D(n)$ may still be an original quantitative extension, but overlaps an established named subfield, and no peer-reviewed novelty claim should be made before checking the graph-labeling surveys for equivalent "partial graceful"/"maximum distinct edge labels" parameters.

## Novelty warning

Graceful path labelings and prime labelings of paths are classical topics, and the coprime graph is well studied. A targeted search found no exact statement of this **maximum-distinct-difference** parameter, but no exhaustive synonym/equivalence audit has been performed. It may already be known. Related sources are recorded in the dated literature audit.


## Relation to existing results

The existence of prime-graceful paths was determined by Panma–Rochanakul (2021). The remaining question concerns the extremal number of distinct differences, whose relation to partial graceful labeling remains to be determined.


