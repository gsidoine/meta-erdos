# Prime-denominator Farey graphs

**Status:** internally proved structural identities. Their historical originality is unverified.

For $N\ge2$, let $F_N$ be the graph with vertices

$$
V_N=\left\{\frac ap: p\le N\text{ prime},\ 1\le a<p\right\},
$$

where $a/p$ and $b/q$ are adjacent when $|aq-bp|=1$. Write $c(N)$ for its number of connected components and $T_2(N)$ for the number of pairs of primes $p,p+2\le N$.

## Theorem

For every integer $N\ge2$:

1. The graph obtained from $F_N$ by deleting $1/2$ is a forest.
2. The number of triangles of $F_N$ is $2T_2(N)$, and every triangle contains $1/2$.
3. The numbers of vertices, edges, and components satisfy

$$
|V_N|=\sum_{\substack{p\le N\\p\text{ prime}}}(p-1),
\quad
|E_N|=\pi(N)(\pi(N)-1),
$$

$$
\boxed{
c(N)=\sum_{p\le N}(p-1)-\pi(N)(\pi(N)-1)+2T_2(N).
}
$$

### Proof

Fix distinct primes $p<q$. The congruence $aq\equiv1\pmod p$ has a unique solution $a\in\{1,\ldots,p-1\}$, and $b=(aq-1)/p$ lies in $\{1,\ldots,q-1\}$. This yields one edge with determinant $1$. Its complement $(p-a,q-b)$ yields the unique edge with determinant $-1$. Hence there are precisely two edges between the $p$- and $q$-denominator vertex classes, and no edges within one class. This proves the asserted vertex and edge counts.

For any reduced fraction $a/q$ with $1\le a<q$, the two congruences $ar\equiv\pm1\pmod q$ have exactly two solutions $r\in\{1,\ldots,q-1\}$, which sum to $q$. Thus, among Farey fractions of *smaller* denominator, $a/q$ has precisely two neighbors, say $b/r$ and $c/s$, with

$$
r+s=q,\qquad b+c=a,\qquad |bs-cr|=1.
$$

These are its Farey parents. In the prime-denominator induced graph, some or both parents may be absent, but any two that are present are adjacent.

Insert vertices of $F_N$ in increasing denominator order. No two vertices with the same denominator are adjacent. Each new vertex has zero, one or two neighbors among earlier vertices, and in the last case those neighbors are already joined by an edge. Consequently each insertion either creates an isolated component, attaches a leaf, or completes a triangle along an existing edge. In particular, the full graph is chordal: every cycle of length at least four has a chord, as seen by choosing a largest-denominator vertex on the cycle and considering its two adjacent cycle vertices.

If a vertex of prime denominator $q$ has two prime-denominator parents, their prime denominators $r,s$ satisfy $r+s=q$. Since $q$ is prime, one parent denominator is $2$ and the other is $q-2$, which must also be prime. The first parent is necessarily $1/2$. Conversely, if $q$ and $q-2$ are prime, the two fractions

$$
\frac{(q-1)/2}{q},\qquad
\frac{(q+1)/2}{q}
$$

have parents with denominators $2$ and $q-2$, and hence give exactly two triangles. Every triangle arises at the insertion of its largest-denominator vertex, so there are exactly $2T_2(N)$.

A chordal graph containing no triangle has no cycle. Because all triangles contain $1/2$, deleting that vertex leaves a triangle-free chordal graph, hence a forest. Finally, the insertion argument shows that the quantity $|V|-|E|+\#\{\text{triangles}\}$ is unchanged by inserting a vertex with one or two earlier neighbors, and increases by one when an isolated component is created. It therefore equals the number of connected components. Substitution of the vertex, edge and triangle counts finishes the proof. $\square$

## Question

Let $C(N)$ denote the number of vertices in the largest connected component of $F_N$.

**Determine the asymptotic order of $C(N)$.** In particular, does the component of $1/2$ eventually have the maximum size, and how rapidly does its size grow?

The theorem gives the simple unconditional bounds

$$
2\pi(N)-1\le C(N)\le |E_N|+1
=\pi(N)(\pi(N)-1)+1,
$$

because $1/2$ is adjacent to precisely two fractions of every other prime denominator, whereas any connected component has at most one more vertex than its edges. These bounds are not asserted sharp.

The [two-step layer theorem](P043-two-step-prime-denominator-growth.md) improves the largest-component lower bound unconditionally to $C(N)\ge(2+o(1))N\log\log N/\log N$ using the Bombieri–Vinogradov theorem. The precise asymptotic order of $C(N)$ is still unresolved.

The [exact verifier](../experiments/P043_prime_farey_components.py) independently constructs the graphs and checks the identities and the deletion-forest assertion for all $N\le101$. Finite component-size observations do not constitute an asymptotic theorem.

## References and priority

- The classical Farey graph, Stern–Brocot parents, and triangle structure are established objects; see the [Farey graph overview](https://web.sas.upenn.edu/miguellopez/2021/07/11/farey/) and [Stern–Brocot background](https://oeis.org/stern_brocot.html).
- D. E. Welch, *Farey fractions with prime denominators*, *Acta Arithmetica* **134** (2008), 93–99, https://doi.org/10.4064/aa134-1-7, studies approximation and distribution of prime-denominator fractions (rather than the component-size theorem).
- Kushwaha and Sarma, [*Farey-subgraphs and Continued Fractions*](https://arxiv.org/abs/2106.14856), investigate a differently defined family of Farey subgraphs.

The component formula is a direct combination of classical Farey parent structure and the elementary prime-sum observation. It does not establish the twin-prime conjecture. The absence of an identical theorem in targeted searches is not proof of its historical originality.
