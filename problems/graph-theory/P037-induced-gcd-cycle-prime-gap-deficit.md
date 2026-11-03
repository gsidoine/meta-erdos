# P037 — Prime gaps and induced cycles in the non-coprime graph

<!-- DOSSIER-SUMMARY -->
> **Research question:** What is the maximal growth order of 2π(sqrt(N)) minus the longest induced-cycle length in the gcd>1 graph, for N≤X?  
> **Formulation:** candidate. **Novelty:** unverified; unboundedness follows from Pintz (2015), general threshold-cycle theory is classical.  
> **Verified/known progress:** Proved H(N)~2π(sqrt(N)) and exact saturation criterion; D(N) unbounded by Pintz (2015); quantitative maximal order unresolved.  
> **Finite evidence:** Constructive prime-product cycles and finite saturation certificates.  
> **Symbolic prize:** A small black coffee — The maximal-order growth of the induced-cycle prime-gap deficit.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

Let $G_N$ be the graph on $[N]$ with $ab$ an edge precisely when $\gcd(a,b)>1$. Write $H(N)$ for the greatest length of an **induced cycle** in $G_N$ (a cycle with no chords), taking $H(N)=0$ when none exists.

## Research question

**What is the asymptotic order of the maximal deficit $\mathcal D(X)=\max_{4\le N\le X}\bigl(2\pi(\sqrt N)-H(N)\bigr)$?**

Here $\pi(x)$ is the number of primes at most $x$. This question is asked for sufficiently large $N$; unlike ordinary circumference, induced-cycle lengths depend on prime-factor compatibility.

## Proved structure

The [structural reduction and asymptotic theorem](../../theorems/P037-induced-gcd-cycles.md) establish

$$
\boxed{H(N)=(2+o(1))\pi(\sqrt N)
\sim\frac{4\sqrt N}{\log N}.}
$$

They also determine exactly when $H(N)=2\pi(\sqrt N)$ using inequalities between primes immediately below and above $\sqrt N$.

Thus the leading asymptotic is **settled internally**. Only the finer deficit problem is proposed as new research. In particular, the non-coprime graph's ordinary longest-cycle problem is different and is not asserted to be open here.

## Prime-gap interface

Let $m=\pi(\sqrt N)$, let $p_1<\cdots<p_m$ be the primes at most $\sqrt N$, and let $q_1<\cdots<q_m$ be the first $m$ primes strictly greater than $\sqrt N$.

For $m\ge2$, the [exact criterion](../../theorems/P037-induced-gcd-cycles.md) is

$$
\boxed{H(N)=2m\quad\Longleftrightarrow\quad
p_jq_{m-j+2}\le N\quad(2\le j\le m).}
$$

For example, the final inequality is $p_mq_2\le N$. This is sensitive to the local distribution of primes on either side of $\sqrt N$. More generally, if $q_1$ is the first prime above $\sqrt N$, put

$$
r(N)=\#\{p\le\sqrt N:\ p\text{ prime},\ pq_1>N\}.
$$

Then $D(N)\ge r(N)$, since those $r(N)$ small prime witnesses cannot be adjacent to any large prime witness in an alternating maximal-length cycle; for an arbitrary cycle with $h$ large witnesses, they force $h\le m-r(N)$.

The deficit is **unbounded**, by the theorem of Pintz (2015) and the elementary deduction recorded below. The open issue is its **maximal growth order** and how sharply it is controlled by local prime-gap asymmetry.

## Known unboundedness consequence of prime-gap theory

Pintz, [*On the ratio of consecutive gaps between primes*](https://doi.org/10.1007/978-3-319-22240-0_17) (2015), Theorem 1, proves that a prime gap can be arbitrarily large compared with each of the preceding $k$ gaps, for every fixed $k$. Setting $N=p^2$ at the prime $p$ immediately preceding that unusually large gap gives $r(N)\ge k$ and therefore $D(N)\ge k$. See the [complete deduction](../../theorems/P037-induced-gcd-cycles.md).

Accordingly, **unboundedness is not asserted as a new problem**. The remaining question concerns the asymptotic growth of $\mathcal D(X)$ and the precision of known prime-gap bounds as transferred through the prime-product graph.

## Finite prime-gap witnesses

The simple obstruction $D(N)\ge r(N)$ already gives the certified examples below, with $N=x^2$:

| $x$ | First prime $q_1>x$ | $r(x^2)$ | Consequence |
|---:|---:|---:|---|
| 113 | 127 | 5 | $D(113^2)\ge5$ |
| 1327 | 1361 | 7 | $D(1327^2)\ge7$ |
| 15683 | 15727 | 9 | $D(15683^2)\ge9$ |

These finite inequalities are independently reproducible; unboundedness follows instead from Pintz's theorem as shown below. The [verifier](../../experiments/P037_induced_gcd_cycles.py) recomputes the prime counts independently.

## Novelty assessment and sources

- Mahadev–Peled, [*Longest cycles in threshold graphs*](https://doi.org/10.1016/0012-365X(93)E0077-H), *Discrete Mathematics* 135 (1994), 169–176, already give longest-cycle algorithms for arbitrary threshold graphs. The auxiliary prime-product graph belongs to this classical graph class.
- Harary–Peled, [*Hamiltonian threshold graphs*](https://doi.org/10.1016/0166-218X(87)90050-3), *Discrete Applied Mathematics* 16 (1987), 11–15, provide closely related nested-neighborhood Hamiltonicity criteria.
- Rilwan–Sameema–Oli, [*Non-Coprime Graph of Integers*](https://doi.org/10.14445/22315373/IJMTT-V66I2P513) (2020), study **ordinary circumference**, girth and other parameters of precisely this non-coprime graph, but the located discussion does not give this induced-hole asymptotic.
- Erdős–Sárközy, [*On cycles in the coprime graph of integers*](https://doi.org/10.37236/1323), *Electronic Journal of Combinatorics* (1997), investigate a different graph, whose edges correspond to coprime rather than non-coprime pairs.
- Work on induced cycles in unitary Cayley graphs of residue classes concerns $\gcd(a-b,n)$, a different adjacency rule.

**Historical novelty remains unverified** after searches using *non-coprime graph induced cycles*, *gcd graph holes*, *prime-product threshold graph* and *longest induced cycles arithmetic graphs*. The asymptotic theorem is a short combination of known ingredients; the fine deficit question appears mathematically distinct but may already follow from results on prime gaps or threshold graph Hamiltonicity. The maximal-deficit formulation remains a **candidate** in the single numbered catalogue. No publication or priority claim is made.
