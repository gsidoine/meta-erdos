# P033 — A linear packing of six-cycles from three prime sums

**Status:** internally proved exact combinatorial theorem. Structural consequence of the three-reflection setup; does not itself imply the all-n result, which is now proved in the [effective universal theorem](P033-universal-three-prime-sum-connectivity.md). **Historical novelty unverified**: affine-reflection identities and bounded-degree cycle packing are classical tools.

## Exact six-cycle construction

Let $n\ge 3$, $D\ge 1$ integers. Let $p<q<n<r$ be **three odd integers** satisfying

$$
n-D\le p<q<n<r\le n+D.
$$

Write $G_n(p,q,r)$ for the simple graph on $[n]$ whose edges $uv$ ($u\ne v$) have $u+v\in\{p,q,r\}$.

**Theorem 1 (explicit six-cycles).** For every odd integer $x$ in

$$
3D+2\le x\le n-3D-2,
$$

the six vertices in this cyclic order

$$
\boxed{
x,\quad p-x,\quad x+q-p,\quad p+r-q-x,\quad x+q-r,\quad r-x
}
$$

are distinct, lie in $[n]$, and form a six-cycle with successive edge sums

$$
p,\ q,\ r,\ p,\ q,\ r.
$$

**Proof.** Since $p,q,r$ are odd, the three vertices $x,x+q-p,x+q-r$ are odd, while the other three are even. The three odd vertices are pairwise distinct because $p,q,r$ are distinct. Likewise the three even vertices $p-x$, $p+r-q-x$, $r-x$ are pairwise distinct. The parity separation makes all six distinct.

The three odd vertices differ from $x$ by at most $2D$, so they lie in $[D+2,n-D-2]$, hence in $[n]$. For the even vertices, the constants $p$, $p+r-q$, $r$ all lie in $[n-3D,n+3D]$; subtracting $x\in[3D+2,n-3D-2]$ puts each of them in $[2,n-2]$. All six vertices therefore belong to $[n]$. Directly summing successive pairs proves the displayed $p,q,r,p,q,r$ color pattern, including the closing edge. QED.

This is the involution identity $(R_r R_q R_p)^2=\mathrm{id}$, with $R_s(t)=s-t$, realized without truncated boundary edges. Notice that **no gcd hypothesis** and **no primality hypothesis** are needed for the existence of these cycles.

## Linear vertex-disjoint packing

**Theorem 2.** If $n\ge 6D+5$ and the three odd sums satisfy the above inequalities, then $G_n(p,q,r)$ contains at least

$$
\boxed{\left\lfloor \frac{n-6D-4}{36}\right\rfloor}
$$

pairwise *vertex-disjoint* six-cycles. More precisely, if $X$ is the set of admissible odd $x$ in Theorem 1, the packing has at least $\lceil |X|/18\rceil$ cycles.

**Proof.** Let $O_x=\{x,x+q-p,x+q-r\}$ and $E_x=\{p-x,p+r-q-x,r-x\}$ be respectively the sets of odd and even vertices of the cycle indexed by $x$. The odd set is a translate of a three-element pattern, and the even set is a *reflected* translate of a (possibly different) three-element pattern.

For a fixed $x$, there are at most $3\cdot3=9$ indices $y$ with $O_x\cap O_y\ne\emptyset$: every intersection determines one of nine ordered choices of offsets. Likewise there are at most nine indices $y$ with $E_x\cap E_y\ne\emptyset$. As the graph is bipartite, cycles indexed by $x$ and $y$ overlap only if one of these two intersections occurs. Thus at most **18** candidate indices $y$ (including $x$) conflict with a given cycle.

Greedily select a cycle and discard all overlapping candidate cycles; each choice discards at most 18 candidates, so we obtain at least $\lceil |X|/18\rceil$ vertex-disjoint cycles. The interval $[3D+2,n-3D-2]$ contains $n-6D-3$ integers and at least $\lfloor(n-6D-3)/2\rfloor$ odd integers. The conservative displayed lower bound follows. QED.

**Corollary 3 (prime palette with both global and local structure).** Fix $0<\delta<1/6$. Every triple of primes in the P033 short-interval family

$$
(1-\delta)n<p<q<n<r<(1+\delta)n
$$

has, for sufficiently large $n$, at least

$$
\left(\frac{1-6\delta}{36}+o(1)\right)n
$$

vertex-disjoint six-cycles. By the [prime-palette density theorem](P033-prime-palette-density-and-reflection-criterion.md), an asymptotic fraction

$$
\mathfrak C=\frac34\prod_{\ell\ge3\text{ prime}}\left(1-\frac{1}{(\ell-1)^2}\right)\approx0.49512138
$$

of these prime triples **also connect the full graph**. Thus a positive proportion of the palettes simultaneously connect $[n]$ and exhibit a linear six-cycle packing.

**Proof.** Take $D=\lceil\delta n\rceil$. Apply Theorem 2 for all sufficiently large $n$. The event that a triple has the six-cycle packing holds for *all* triples in the family, while the parent P033 theorem supplies the connected fraction. QED.

### What this does not establish

* Cycles are disjoint as **graph vertices** within one selected palette. The result does not say cycles belonging to different palettes are mutually disjoint.
* This does not show Hamiltonicity or expansion: linear numbers of short cycles alone do not imply either property.
* The packing coefficient is a safe explicit lower bound and is not asserted optimal.
* This six-cycle theorem by itself supplies no prime-triple existence threshold. The independent [effective P033 theorem](P033-universal-three-prime-sum-connectivity.md) provides one and settles the all-n bound.
* The parent asymptotic connected-palettes theorem still awaits independent specialist verification and the novelty of the present affine hexagon observation is **unverified**.

### Independent finite consistency check

A standard-library Python enumeration checked **289,989** individual six-cycle witnesses for synthetic odd palettes, across $40\le n<160$, $2\le D\le\min(9,\lfloor n/7\rfloor)$, and admissible odd starting vertices. Every witness had six different vertices within $[n]$ and the required successive sums.

The proof itself is symbolic and does not rely on these computations.

### Research direction

The new hexagon identity suggests studying the *short-cycle spectrum* of fixed prime-sum palettes and the effect of boundary truncation. Because six-cycles are forced even without coprimality, they cannot by themselves resolve P033 connectivity. The next meaningful step would connect this plentiful local structure to a global invariant (e.g. a quantitative expansion profile) under a verified additional hypothesis, rather than claiming expansion from cycle counts alone.
