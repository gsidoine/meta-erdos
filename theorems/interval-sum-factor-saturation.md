# Interval-sum bipartite graphs always have minimum-degree factors

**Status:** Full constructive proof recorded in this collection, 2026-10-29. **Novelty is unverified.** This is a resolved incubator theorem, not a new numbered problem and **not** a proof of P003.

## Theorem

Let $n\ge1$ and let $a\le b$ be integers. Write $G_{n;a,b}$ for the bipartite graph with a row class $R=\{r_0,\dots,r_{n-1}\}$ and a column class $C=\{c_0,\dots,c_{n-1}\}$, where

$$
r_i c_j\in E(G_{n;a,b})\quad\Longleftrightarrow\quad a\le i+j\le b.
$$

If $\lambda(G)$ is the maximum number of **pairwise edge-disjoint perfect matchings** and $\delta(G)$ the minimum vertex degree, then

$$
\boxed{\lambda(G_{n;a,b})=\delta(G_{n;a,b}).}
$$

Equivalently, $G_{n;a,b}$ contains a spanning $\delta(G_{n;a,b})$-regular subgraph.

The result is trivial if $\delta=0$, so the proof below treats $\delta\ge1$.

## Step 1: reverse one bipartition to obtain a band matrix

Truncate $[a,b]$ to $[0,2n-2]$, which does not change the graph. If $n-1\notin[a,b]$, then either $r_0$ or $r_{n-1}$ is isolated and $\delta=0$. Otherwise put

$$
u=n-1-a,\qquad v=b-(n-1),\qquad
k=\min\{n,u+1,v+1\}.
$$

After reversing column indices $j\mapsto n-1-j$, the edge condition becomes

$$
-u\le i-j\le v.
$$

The minimum degree in this graph is exactly $k$: its row/column neighborhoods are intersections of an integer interval of length $u+v+1$ with $[0,n-1]$; the smallest are at the boundary rows/columns, with endpoint degrees $\min(n,u+1)$ and $\min(n,v+1)$.

Because $k-1\le\min(u,v)$, the reversed graph contains the **symmetric band graph**

$$
B_{n,k}:=\{(i,j):0\le i,j<n,\ |i-j|\le k-1\}.
$$

Its own minimum degree is $k$. We will explicitly construct a spanning $k$-factor of $B_{n,k}$.

## Step 2: the block lemma

**Lemma.** For every pair of integers $n\ge k\ge1$, the bipartite graph $B_{n,k}$ contains a spanning $k$-regular subgraph.

**Proof.** Write $n=qk+r$, where $q\ge1$ and $0\le r<k$. Partition each vertex class into the **same consecutive blocks** of sizes

$$
\underbrace{k,\ldots,k}_{q-1\text{ blocks}},\quad k+r.
$$

Build the subgraph separately inside each aligned block; no selected edge joins different blocks.

For a block of size $k$, retain all $k^2$ edges. Every selected edge has index displacement at most $k-1$ and every vertex has degree $k$.

It remains to handle the final block of size $m=k+r$. Index its two sides by $0,\ldots,m-1$, and begin with two edge sets:

$$
E_1=\{(i,j):0\le i<k,\ 0\le j<k\},\qquad
E_2=\{(i,j):k\le i<k+r,\ r\le j<k+r\}.
$$

Each of the first $k$ rows is incident to exactly $k$ edges of $E_1$, and each of the last $r$ rows is incident to exactly $k$ edges of $E_2$. All edges lie within the band $|i-j|\le k-1$.

Column degrees are initially:
- $k$ in columns $0,\ldots,r-1$;
- $k+r$ in columns $r,\ldots,k-1$;
- $r$ in columns $k,\ldots,k+r-1$.

For **each** pair of integers $0\le t<r$, $0\le s<k-r$, perform the edge exchange

$$
\boxed{
(t+s+1,\ r+s)\ \longmapsto\ (t+s+1,\ k+t).
}
$$

The removed edge belongs to $E_1$ since $1\le t+s+1\le k-1$, $r\le r+s\le k-1$. The added edge belongs to the band since

$$
|(k+t)-(t+s+1)|=k-s-1\le k-1.
$$

Every removed edge is distinct and every added edge is distinct and was not present initially. Each exchange preserves the degree of its row.

For a fixed old column $r+s$, the $r$ values of $t$ remove **exactly $r$** edges, reducing its degree $k+r$ to $k$. For a fixed new column $k+t$, the $k-r$ values of $s$ add **exactly $k-r$** edges, increasing its degree from $r$ to $k$. Columns $0,\ldots,r-1$ remain degree $k$. All rows stay degree $k$.

Therefore the final-block subgraph is $k$-regular and lies in $B_{k+r,k}$. Together with the complete blocks of size $k$, this produces a spanning $k$-regular subgraph of $B_{n,k}$. $\square$

## Step 3: decompose the factor into perfect matchings

By the classical 1-factorization theorem for regular bipartite graphs (König's line-coloring theorem), every finite $k$-regular bipartite graph decomposes into $k$ edge-disjoint perfect matchings. The constructed $k$-factor of $B_{n,k}$, carried through the column reversal, lies inside $G_{n;a,b}$.

Hence $\lambda(G_{n;a,b})\ge k=\delta(G_{n;a,b})$. The reverse inequality is trivial since every perfect matching uses an edge at each vertex. This proves the theorem. $\square$

## Reproducibility and adversarial scope

The dependency-free script [`experiments/interval_sum_factor_construct.py`](../experiments/interval_sum_factor_construct.py) implements exactly the block lemma, checks every row and column has degree $k$, checks every edge lies in the permitted band, and reverses columns to return a factor in the original sum graph. A separate SciPy [integral max-flow verifier](../experiments/test_interval_sum_factors.py) has tested all intervals through $n=40$.

The new block construction has also been checked for every $1\le k\le n\le69$, and the translated interval theorem for every interval through $n=25$. These finite checks **do not** replace the proof.

## Important relationship to P003

**Do not conclude P003 from this theorem.** P003 allows only prime sums. The consecutive-interval assumption forces a very strong collection of neighboring band diagonals that is absent from the prime-sum graph.

The related "arbitrary allowed sums" statement is false: on two copies of $\{0,1,2\}$, choose the allowed sum set $S=\{1,3\}$. Then

$$
A=\begin{pmatrix}0&1&0\\1&0&1\\0&1&0\end{pmatrix}
$$

has minimum degree 1 but no perfect matching, because rows 0 and 2 both have only column 1 available.

The proven result is a **structural control case**: full consecutive bands saturate minimum degree, sparse nonconsecutive sum sets need not, and prime-supported sets remain an arithmetic question.

## The theorem is stronger than a generic convex-neighborhood assumption

Even a bipartite graph whose adjacency matrix has **consecutive 1s in every row and every column** need not have a factor of its minimum degree. Consider

$$
M=\begin{pmatrix}
1&1&0&0&0\\
1&1&0&0&0\\
1&1&0&0&0\\
1&1&1&1&1\\
1&1&1&1&1
\end{pmatrix}.
$$

This matrix is **biconvex** in the displayed ordering: every row and column has a consecutive block of 1s. Its minimum row/column degree is 2. But the first three rows collectively see only the first two columns, violating Hall's condition. Thus it has **no perfect matching**, let alone two. The extra aligned *constant-diagonal interval* structure of $G_{n;a,b}$ is essential to the proof, rather than arbitrary biconvexity alone.

## Novelty and research-priority warning

This theorem has a complete proof within this research notebook, but its **publication priority has not been established**. General $k$-factor existence, Toeplitz and consecutive-ones matrices, convex bipartite graphs, bounded-displacement permutations and banded matrix decompositions are classical topics. Nearby sources include:

- [D. R. Fulkerson, *The Maximum Number of Disjoint Permutations Contained in a Matrix of Zeros and Ones*, Canadian Journal of Mathematics 16 (1964), 729–735](https://doi.org/10.4153/CJM-1964-069-0): a **direct historical predecessor for the packing parameter itself**, treating disjoint permutation matrices in arbitrary 0–1 supports. Whether this paper already implies the special consecutive-band formula by a short corollary must be checked before any novelty claim.
- [Liu, *Bipartite Toughness and k-Factors in Bipartite Graphs* (2008)](https://doi.org/10.1155/2008/597408): standard necessary/sufficient $k$-factor cut inequalities.
- [A linear time algorithm for maximum matchings in convex, bipartite graphs (1996)](https://doi.org/10.1016/0898-1221(96)00079-X): convex bipartite matching algorithms, but not this exact constructive factor statement in the accessible abstract.
- [Bipartite finite Toeplitz graphs (2013)](https://doi.org/10.1016/j.dam.2013.05.020): Toeplitz-pattern graphs; not established as the same graph/result.
- [Hao–Li–Yu, *Bipartite binding number, k-factor and spectral radius* (2025)](https://doi.org/10.1016/j.disc.2025.114511): general factor criteria.

**Publication judgment:** This is an elegant elementary lemma, but likely less intrinsically substantial than P010 and may well be a known special case of regular-factor results. Keep it as a proved unnumbered incubator result until a much deeper novelty audit, not as a new open problem.
