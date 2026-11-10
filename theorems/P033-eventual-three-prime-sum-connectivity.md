# P033 — Three prime-sum matchings connect all sufficiently large intervals

**Status:** complete internal proof of an earlier eventual theorem, preserved as an independent argument. The [effective all-order theorem](P033-universal-three-prime-sum-connectivity.md) now proves the statement for every $n\ge3$ by a separate sieve bound and finite certificate. This earlier proof uses PNT and Siegel–Walfisz and has an ineffective threshold. Historical priority is unverified.

**Stronger continuation.** The [prime-palette density theorem](P033-prime-palette-density-and-reflection-criterion.md) improves the deterministic condition to $n\ge5D$ and proves that **asymptotically 49.5121%** of nearby three-prime palettes connect $[n]$. It uses fixed-modulus prime equidistribution and Brun–Titchmarsh rather than this note's growing-modulus Siegel–Walfisz argument. This earlier proof is preserved as an independent historical proof route.

## Theorem

For every sufficiently large integer $n$, there exist **three distinct odd primes** $p<q<n<r$ such that the graph on $[n]$ whose edges have sums in $\{p,q,r\}$ is connected.

Equivalently, the prime-sum connectivity palette number from [P033](../problems/graph-theory/P033-prime-sum-three-palette.md) satisfies

$$
\boxed{\kappa(n)\le3\qquad(n\ge n_0)}
$$

for some **ineffective** constant $n_0$. This is not the Hamiltonicity of the three-color graph, nor a proof for *every* $n\ge3$.

The proof has two logically independent steps: a deterministic statement about any three odd edge sums, and an analytic-number-theoretic construction of a qualifying prime triple.

## Lemma 1 — Connectedness of two step sizes on an interval

For positive coprime integers $a,b$ and $m\ge a+b$, the graph on $\{1,\dots,m\}$ joining integers differing by $a$ or $b$ is connected.

**Proof.** On the first $a+b$ vertices, map each $j$ to $j+b$ if $j\le a$, and to $j-a$ otherwise. These are edges of the given graph, and this map is addition by $b$ modulo $a+b$. Since $\gcd(b,a+b)=1$, it traverses all $a+b$ vertices in one cycle. For each $j>a+b$, the edge $j\leftrightarrow j-a$ connects it to an earlier vertex. Induction proves the claim. $\square$

## Necessary arithmetic condition for any three-color connection

There is also a simple *necessary* condition, with no near-$n$ assumption. Let $p,q,r$ be three distinct odd edge sums and set

$$
g=\gcd\!\left(\frac{q-p}{2},\frac{r-p}{2}\right).
$$

If their sum-color graph is connected on $[n]$ for $n\ge3$, then **$g=1$**. Indeed, all three sums are congruent to $p$ modulo $2g$. Every edge sends a vertex residue $x$ to $p-x$ modulo $2g$, so a component visits at most the two residue classes $\{x,p-x\}$. If $g>1$, the three vertices $1,2,3$ lie in three distinct residue classes modulo $2g\ge4$ and cannot share one component. Thus the coprime half-difference condition in Lemma 2 is **necessary in every case** and, for sums sufficiently close to $n$, is also sufficient.

## Lemma 2 — A three-reflection connectivity criterion

Suppose $D\ge1$ and $n\ge 12D+10$. Let $p<q<n<r$ be **odd integers**, not necessarily primes, such that

$$
n-D\le p<q<n<r\le n+D,\qquad
\gcd\!\left(\frac{q-p}{2},\frac{r-p}{2}\right)=1.
$$

Then the graph on $[n]$ joining distinct $x,y$ whenever $x+y\in\{p,q,r\}$ is connected.

### Proof

Set $a=(q-p)/2$ and $b=(r-p)/2$. Then $1\le a<b\le D$ and $\gcd(a,b)=1$. Define the *odd core*

$$
I=\{x\in[n]:x\text{ odd},\ 2D+1\le x\le n-2D\}.
$$

For any $x\in I$ and $s\in\{p,q,r\}$, the reflected neighbor $s-x$ lies in $[1,n]$ and is even: indeed, $s-x\ge n-D-(n-2D)=D\ge1$ and $s-x\le n+D-(2D+1)<n$.

If two odd vertices $x,x+2a$ lie in $I$, then

$$
x\xrightarrow{\ p\ }p-x\xrightarrow{\ q\ }x+2a
$$

is a valid two-edge path. Likewise, if $x,x+2b\in I$,

$$
x\xrightarrow{\ p\ }p-x\xrightarrow{\ r\ }x+2b.
$$

The consecutive odd vertices of $I$, after dividing their differences by $2$, therefore contain the step-$a$, step-$b$ interval graph of Lemma 1. The core contains at least $(n-4D-1)/2\ge a+b$ odd vertices, since $n\ge12D+10$ and $a+b\le2D$. Hence **all odd vertices of $I$ lie in one connected component**.

Every odd vertex $x<2D+1$ is connected to this core by repeatedly following the two-edge move $x\mapsto x+2a$: the intermediate even number $p-x$ and the endpoint both lie in $[n]$, and the final move crosses into $I$ without skipping across it because $2a\le2D$. The inequalities $n\ge12D+10$ ensure these moves remain valid throughout. Similarly, every odd $x>n-2D$ reaches $I$ by repeatedly using the two-edge move

$$
x\xrightarrow{\ r\ }r-x\xrightarrow{\ p\ }x-2b.
$$

Here $r-x\in[1,n]$ and each new odd vertex is positive; $2b\le2D$ prevents skipping the core. Thus **all odd vertices are connected**.

Finally, each even $y\in[n]$ has an odd neighbor: if $y<p$, use $p-y\in[1,n]$; if $y\ge p$, use $r-y\in[1,n]$, since $r>n$ and $r-p\le2D<n$. Thus every even vertex joins the odd component, completing the proof. $\square$

**Remark:** The constant 12 is deliberately generous; the goal is a clean uniform lemma, not an optimized threshold. The odd-integer assumption is sufficient: primality is needed only for the theorem's final construction.

## Lemma 3 — Three primes satisfying the criterion

Fix $\delta=1/100$. For every sufficiently large integer $n$, there are odd primes

$$
(1-\delta)n<p<q<n<r<(1+\delta)n
$$

such that

$$
\gcd\!\left(\frac{q-p}{2},\frac{r-p}{2}\right)=1.
$$

### Proof

By the prime number theorem, the interval $((1-\delta)n,n)$ contains $\gg_\delta n/\log n$ primes for all large $n$. By pigeonholing successive prime gaps in this interval, choose odd primes $p<q$ with

$$
q-p\le C_\delta\log n
$$

for a constant depending only on $\delta$. Put $g=(q-p)/2$, so $1\le g\ll_\delta\log n$.

We construct a reduced residue class modulo $2g$. For each odd prime $\ell\mid g$, choose a residue $k\bmod\ell$ avoiding both $0$ and $-p\,2^{-1}\bmod\ell$; these residues are distinct because $p>\ell$ is prime, and at least one admissible residue remains for every $\ell\ge3$. If $2\mid g$, require $k\equiv1\pmod2$. The Chinese remainder theorem gives an integer $k$ satisfying

$$
\gcd(k,g)=\gcd(p+2k,g)=1.
$$

Since $p+2k$ is odd, it is coprime to $2g$. The Siegel–Walfisz theorem, in the uniform range $2g\ll\log n$, implies that for all sufficiently large $n$, the interval $(n,(1+\delta)n)$ contains a prime $r$ in the **reduced residue class**

$$
r\equiv p+2k\pmod{2g}.
$$

Explicitly, the expected main term for this class is of order $\delta n/(\varphi(2g)\log n)\gg_\delta n/\log^2n$, while the uniform Siegel–Walfisz remainder is $O_A(n/\log^A n)$ for any fixed $A>3$ (using any fixed logarithmic-modulus range containing $2g$). Thus the class is represented by a prime in that interval.

The congruence implies $(r-p)/2\equiv k\pmod g$, and hence

$$
\gcd\!\left(g,\frac{r-p}{2}\right)=1.
$$

The chosen primes have the required order and bounds. $\square$

## Completion of the theorem

Set $D=\lceil\delta n\rceil$. Lemma 3 provides primes satisfying Lemma 2. For sufficiently large $n$,

$$
n\ge 12\lceil n/100\rceil+10.
$$

Thus their three prime-sum matchings connect the entire vertex set $[n]$. $\square$

## Corollary — Exact classification for large n, and density one

Combine the eventual three-color theorem with the exact two-color characterization from the [P033 dossier](../problems/graph-theory/P033-prime-sum-three-palette.md). For every sufficiently large $n$,

$$
\boxed{
\kappa(n)=
\begin{cases}
2,&\text{if some }p\in\{n-1,n,n+1\}\text{ has }p,p+2\text{ prime},\\
3,&\text{otherwise}.
\end{cases}}
$$

In particular, the set of $n\le X$ with $\kappa(n)\ne3$ has size $O(X/(\log X)^2)$: outside the finite exceptional set, each two-color instance is associated with one of the three values of $n$ neighboring a twin-prime pair, and the classical [sieve upper bound for twin primes](https://kskedlaya.org/ant/chap-brun.html) gives $\pi_2(X)=O(X/\log^2X)$. Thus

$$
\boxed{\#\{3\le n\le X:\kappa(n)=3\}
=X+O\!\left(\frac{X}{(\log X)^2}\right).}
$$

This does **not** assume the twin prime conjecture. The error expression absorbs a fixed number of small exceptional integers. The asymptotic and exact-for-large-$n$ classification are internally proved consequences of the theorem and known sieve estimates.

## What is proved and what is not

- **Proved (internally):** $\kappa(n)\le3$ for all sufficiently large $n$.
- **Proved previously in P033:** $\kappa(n)=2$ if and only if there is a twin-prime pair $p,p+2$ with $p\in\{n-1,n,n+1\}$, for $n\ge3$.
- **Exact finite checks:** The P033 palette enumerator verifies $\kappa(n)\le3$ for every $3\le n\le120$, but this cannot bridge the **ineffective** threshold from Siegel–Walfisz.
- **Not proved by this earlier argument:** the all-order bound, an explicit effective threshold, or three-color Hamiltonicity. The first two are established separately in the [complete P033 theorem](P033-universal-three-prime-sum-connectivity.md); three-color Hamiltonicity is not claimed.

The source [Chen–Fu–Guo, *Hamiltonicity in Prime Sum Graphs*](https://doi.org/10.1007/s00373-020-02241-1) defines *Hamiltonian prime sets* and proves particular three-color results for twin-prime situations and infinitely many graph orders. A three-color **connected** graph is weaker than a three-color Hamiltonian cycle. Their results are important prior art, but the theorem above does not follow directly from their stated results. Related prime-sum structure appears in [Croot–Jin (2026)](https://doi.org/10.1007/s00373-025-02999-2). This is a **targeted source comparison, not exhaustive novelty certification**.

References for the analytic inputs: [PNT background (DLMF)](https://dlmf.nist.gov/27.2) and [Kedlaya, *Error bounds for primes in arithmetic progressions*, Siegel–Walfisz theorem](https://kskedlaya.org/ant/chapter-11.html).

## Reproducible adversarial checks

The [P033 eventual-connectivity verifier](../experiments/P033_eventual_connectivity.py) tests Lemma 2 for **all** qualifying triples with $D\le40$ at the threshold $n=12D+10$, independently checks the interval step-graph lemma, and finds prime triples satisfying Lemma 2 for finite test cases. These are finite falsification attempts; the proof is independent of the experiment.

**Next research decision:** The mathematically remaining statement is the small-exception elimination problem. Any attempt to turn eventual connectivity into all-$n$ connectivity must produce an **effective bound plus finite certification**, or a different elementary induction that does not require ineffective analytic number theory.
