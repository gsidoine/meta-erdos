# P033 — Nearly half of short-interval prime triples connect the whole graph

**Status:** internally proved quantitative strengthening of P033. This result is an asymptotic, not an explicit threshold by itself. The separate [effective universal theorem](P033-universal-three-prime-sum-connectivity.md) now settles all-order three-prime connectivity using an explicit bound and exact certificate. Historical priority remains unverified.

## Statements

For integers n≥3 and a set S of odd primes, let G_n(S) be the graph on [n] joining distinct x,y when x+y∈S. Fix a real δ with

$$
0<\delta<\frac15.
$$

Let $\mathcal T_\delta(n)$ consist of **ordered by size** triples of primes

$$
(1-\delta)n<p<q<n<r<(1+\delta)n.
$$

Write $C_\delta(n)$ for the number of such triples for which G_n({p,q,r}) is connected.

**Theorem 1 (short-interval prime palette density).** The limiting proportion of *all* triples in $\mathcal T_\delta(n)$ whose three sum-matchings connect [n] is

$$
\boxed{\lim_{n\to\infty}
\frac{C_\delta(n)}{|\mathcal T_\delta(n)|}
=\mathfrak C
=\frac34\prod_{\substack{\ell\ge3\\\ell\ \mathrm{prime}}}
\left(1-\frac1{(\ell-1)^2}\right)
\approx0.49512138.}
$$

More precisely,

$$
\boxed{
C_\delta(n)\sim
\frac{\delta^3\mathfrak C}{2}\,
\frac{n^3}{(\log n)^3}.
}
$$

The odd-prime product is the *classical twin-prime constant* (about 0.6601618); the factor 3/4 comes from congruences modulo 4. This theorem does **not** assume or imply the twin-prime conjecture. The same singular product appears because both settings condition on prime residues; no prime pair with gap 2 is required.

There are two ingredients: a sharper exact *deterministic graph criterion*, and an asymptotic count of triples with coprime half-differences using only PNT in **fixed** progressions and the **Brun–Titchmarsh upper bound**.

## Lemma 2 — An exact finite-interval connectivity criterion

Let $p<q<n<r$ be **odd positive integers**, with n≥3, and define

$$
a=\frac{q-p}{2},\qquad b=\frac{r-p}{2},\qquad
\alpha=\min\{x\ge r-n:x\text{ odd}\},
\qquad
m=\#\{x\text{ odd}:r-n\le x\le p-1\}.
$$

If $\gcd(a,b)=1$ and $m\ge a+b$, then the graph G_n({p,q,r}) is connected.

In particular, suppose

$$
n-D\le p<q<n<r\le n+D,\qquad n\ge5D.
$$

Then G_n({p,q,r}) is connected **if and only if** $\gcd(a,b)=1$. Necessity holds in *every* three-odd-color connected graph on [n], whether or not the sums are near n, as already proved in the [preceding P033 theorem](P033-eventual-three-prime-sum-connectivity.md).

### Proof

The odd core

$$
I=\{x\in[n]:x\text{ odd},\ r-n\le x\le p-1\}
$$

contains m consecutive odd integers. Every reflection $x\mapsto s-x$ for $s\in\{p,q,r\}$ sends x∈I to an **even vertex in [n]**. If x and x+2a belong to I, the two-edge path

$$
x\xrightarrow{\ p\ }p-x\xrightarrow{\ q\ }x+2a
$$

is valid; similarly, whenever x,x+2b∈I, use the reflection sequence with sums p and r. On dividing the odd-core differences by 2, these edges contain precisely the interval step graph with steps a and b. The [coprime-step interval lemma](P033-eventual-three-prime-sum-connectivity.md#lemma-1--connectedness-of-two-step-sizes-on-an-interval) says that such a graph is connected whenever the interval has at least a+b consecutive integer points. Thus all vertices of I lie in one component.

For any odd x below I, repeat the two-edge move x↦x+2a. The intermediate p−x is in [n], because x<p, and the move first enters I without overshooting: the last x before I is at most α−2, whereas the top of I is β=p−2≥α+2a (as m≥a+b≥a+1). For any odd x above I, repeat x↦x−2b by using sums r then p. Such a high x is at least p, so r−x≥r−n≥1 and r−x≤r−p=2b≤n; moreover the first step enters I without undershooting, since β−α=2(m−1)≥2b. Hence **all odd vertices belong to the same component**.

Each even y<p has an odd neighbor p−y∈[n]; each even y≥p has an odd neighbor r−y∈[n]. The latter upper bound follows from $2b\le2(m-1)\le n-1$, since $a\ge1$, $m\ge a+b$, and an interval in $[n]$ contains at most $\lceil n/2\rceil$ odd vertices. So the whole graph is connected.

Now suppose n≥5D and p,q,r lie in the displayed interval. Since q≤n−1, the half-difference sum satisfies

$$
a+b=\frac{q+r-2p}{2}\le\frac{3D-1}{2}.
$$

The core begins at α≤r−n+1 and ends at β=p−2, so

$$
m=\frac{p-\alpha}{2}\ge\frac{n-2D-1}{2}
\ge\frac{3D-1}{2}\ge a+b.
$$

The gcd condition is therefore sufficient. Its necessity is the reflection-residue obstruction: modulo $2g$, where g=gcd(a,b), every edge sends a residue x to p−x. If g>1, a component visits at most two residue classes modulo $2g\ge4$, so vertices 1,2,3 cannot all be connected. □

**Improvement:** This lowers the uniform interval-separation condition from $n\ge12D+10$ in the earlier theorem to $n\ge5D$, while also giving the more general exact criterion involving the actual core length m.

## Lemma 3 — A positive density of primitive triples of primes

Let $\mathcal U_\delta(n)$ be the subset of $\mathcal T_\delta(n)$ with

$$
\gcd\left(\frac{q-p}{2},\frac{r-p}{2}\right)=1.
$$

Then

$$
\boxed{\frac{|\mathcal U_\delta(n)|}{|\mathcal T_\delta(n)|}
\longrightarrow\mathfrak C.}
$$

### Proof: finite local obstructions

Fix any real $R\ge3$, and impose the absence of common prime divisors ℓ≤R from the two half-differences.

For an odd prime ℓ, both half-differences are divisible by ℓ **precisely when** the three primes p,q,r are all congruent modulo ℓ. A uniformly distributed reduced residue class has ℓ−1 possibilities, so the probability of this coincidence is $1/(\ell-1)^2$. For ℓ=2, both half-differences are even precisely when p,q,r have the **same residue modulo 4**, which has probability 1/4 among the two reduced residue classes. The corresponding local survival factors are $1-1/(\ell-1)^2$ for odd ℓ and 3/4 for ℓ=2.

The Chinese remainder theorem makes the local congruence restrictions independent over the fixed modulus

$$
M_R=4\prod_{\substack{3\le\ell\le R\\\ell\text{ prime}}}\ell.
$$

By the prime number theorem in arithmetic progressions for this **fixed** modulus, every reduced residue class contributes the same leading density of primes to each of the two proportional intervals. Restricting p<q divides the ordered-pair main term by 2; diagonals p=q are negligible. Consequently

$$
|\mathcal U_{\delta,R}(n)|
=(\mathfrak C_R+o_R(1))|\mathcal T_\delta(n)|,
\quad
\mathfrak C_R=
\frac34\prod_{\substack{3\le\ell\le R\\\ell\text{ prime}}}
\left(1-\frac1{(\ell-1)^2}\right).
$$

### Proof: remove the large-prime obstruction

It remains to show that triples with a common prime divisor ℓ>R of both half-differences make up at most an $O_\delta(1/R)$ proportion, in the limit n→∞.

When R<ℓ≤√n, all three primes must lie in one residue class mod ℓ. The Brun–Titchmarsh inequality applied to each interval of length δn gives, uniformly in each nonzero residue c mod ℓ,

$$
\#\{p\in((1-\delta)n,n):p\equiv c\pmod\ell\}
\ll_\delta\frac{n}{(\ell-1)\log n},
$$

and the same for the upper interval. The restriction ℓ≤√n guarantees the logarithm in Brun–Titchmarsh has order log n. Summing the products of the three class counts over the ℓ−1 reduced residue classes gives

$$
\#\{\text{triples obstructed by a fixed }\ell\}
\ll_\delta\frac{n^3}{\ell^2(\log n)^3}.
$$

Summing over all primes R<ℓ≤√n is bounded by

$$
O_\delta\left(\frac1R\frac{n^3}{(\log n)^3}\right).
$$

For √n<ℓ≤δn, it suffices to ignore primality for q and r. For every prime p in the left interval there are at most δn/ℓ integers q>p in the same residue class mod ℓ, and at most δn/ℓ+1 integers r in the upper interval. Since there are $O_\delta(n/\log n)$ possible p, summing even over **all integers** ℓ>√n yields

$$
O_\delta\left(\frac n{\log n}
\sum_{\sqrt n<\ell\le\delta n}
\left(\frac{n^2}{\ell^2}+\frac n\ell\right)\right)
=O_\delta\left(\frac{n^{5/2}}{\log n}+n^2\right)
=o_\delta\left(\frac{n^3}{(\log n)^3}\right).
$$

Every common prime divisor of the half-differences is at most δn, since it divides $(q-p)/2$. Therefore **all** possible obstructions have been covered.

First let n→∞ with R fixed, then R→∞. The finite Euler products converge to the strictly positive constant $\mathfrak C$, and the discarded fraction tends to zero. This proves Lemma 3. □

## Generalization — Visible tuples of any fixed number of primes

The Euler-product argument is not specific to three primes or to the prime-sum graph. It yields a general *prime visibility* law.

**Theorem 4.** Fix an integer $k\ge3$ and intervals $(\alpha_i,\beta_i)$ with $0<\alpha_i<\beta_i$, for $i=1,\ldots,k$. For each n, independently choose primes $p_i\in(\alpha_i n,\beta_i n)$, uniformly from their respective sets. Then

$$
\boxed{
\lim_{n\to\infty}
\Pr\left(\gcd\left(
\frac{p_2-p_1}{2},\ldots,\frac{p_k-p_1}{2}
\right)=1\right)
=
\mathfrak C_k
=
\left(1-2^{-(k-1)}\right)
\prod_{\substack{\ell\ge3\\\ell\ \mathrm{prime}}}
\left(1-(\ell-1)^{-(k-1)}\right).
}
$$

**Proof.** For a fixed odd prime ℓ, the condition that ℓ divides *all* the half-differences means all k primes have the same reduced residue modulo ℓ. PNT for fixed progressions makes the limiting probability $(\ell-1)^{-(k-1)}$. For ℓ=2, the condition is congruence of all primes modulo 4, with probability $2^{-(k-1)}$. CRT gives the product across any fixed finite set of prime obstructions.

The large-ℓ remainder vanishes uniformly in the three **first** selected primes by the same Brun–Titchmarsh argument as in Lemma 3: for ℓ≤√n, three primes all in one residue class contribute $O(n^3/(\ell^2\log^3 n))$; for ℓ>√n, fixing the first prime and counting all integers in the matching residue classes for the second and third contributes $O(n^{5/2}/\log n+n^2)$ after summation. The three intervals need only have fixed positive lengths and endpoints proportional to n; their mutual positions are irrelevant. Any k-tuple obstructed by ℓ also has its first three primes obstructed, while the remaining k−3 primes are unrestricted. Therefore the same $O(1/R)+o(1)$ **relative** tail bound holds for each fixed k≥3. Let n→∞ at fixed R, then R→∞. $\square$

For orientation, $\mathfrak C_3\approx0.49512138$ and $\mathfrak C_4\approx0.74846809$; for fixed k the constants increase to 1 as k→∞. By contrast, for **two** independently selected primes, the lone half-difference has gcd 1 only when the primes differ by exactly 2; this event has limiting probability zero by the PNT and the trivial bound of one candidate partner per prime. This is a threshold between two and three primes in the *asymptotic visibility statistic*—not a solution of the twin-prime conjecture.

This generalized number-theoretic law is presented as a **consequence of classical methods**, with historical priority unverified. Only the k=3 case is needed for P033.

## Completion of Theorem 1

For fixed δ<1/5, choose D=ceil(δn). Then n≥5D for all sufficiently large n. By Lemma 2, **a prime triple from $\mathcal T_\delta(n)$ connects [n] if and only if it belongs to $\mathcal U_\delta(n)$**.

By the ordinary PNT,

$$
|\mathcal T_\delta(n)|\sim
\binom{\delta n/\log n}{2}\frac{\delta n}{\log n}
\sim\frac{\delta^3n^3}{2(\log n)^3}.
$$

Apply Lemma 3 to obtain both asymptotics. □

## Finite certificates and the remaining open statement

The accompanying [dependency-free verifier](../experiments/P033_prime_palette_density.py) checks:

- the improved $n\ge5D$ reflection lemma on more than 70,000 admissible artificial triples;
- the exact proportion of admissible prime triples for n=1000, 3000, 10000 and 20000, against the predicted constant;
- an efficiently certified prime palette for **every 60≤n≤1,000,000**, using at most the 12 closest primes on either side and **the proved deterministic lemma**, rather than running a global graph traversal each time.

The existing exact P033 verifier covers the smaller cases n=3,…,120. Thus the repository obtains a reproducible complete finite verification of the original $\kappa(n)\le3$ statement for **every 3≤n≤1,000,000**. This is **not** a universal proof.

This density argument alone gives no explicit threshold and its accompanying million-case verification cannot bridge an ineffective bound. The later [effective theorem](P033-universal-three-prime-sum-connectivity.md) independently provides the missing threshold and certificate, so P033's all-n connectivity statement is now resolved internally.

## Sources and originality boundary

The proof uses standard, cited analytic inputs rather than assuming twin primes or unproved uniform prime-gap conjectures:

- [Prime number theorem in fixed arithmetic progressions](https://kskedlaya.org/ant/chapter-11.html). **Unlike the previous P033 proof, this argument does not require Siegel–Walfisz uniform in a logarithmically growing modulus**: for every fixed R, the modulus M_R is fixed before n→∞.
- [Montgomery–Vaughan Brun–Titchmarsh bound for arbitrary intervals](https://jtnb.centre-mersenne.org/item/10.5802/jtnb.1024.pdf), Lemma 2.6, an essential uniform *upper* bound controlling large common prime divisors.
- [Chen–Fu–Guo (2021), Hamiltonicity in Prime Sum Graphs](https://doi.org/10.1007/s00373-020-02241-1), the established prime-sum host graph and the related three-color Hamiltonian-prime-set questions.
- [Croot–Jin (2026), Prime Sum Graphs and the Induced Trees They Contain](https://doi.org/10.1007/s00373-025-02999-2), additional prime-sum graph structure.

The local Euler product is a consequence of classical prime equidistribution and Brun–Titchmarsh. **Do not call the prime-factor singular series, these prime-distribution tools, or the original host graph inventions of this project.** A targeted keyword search did not locate this exact *connected-palette proportion*, but the historical novelty of the assembled counting theorem is **not certified**. An independent analytic-number-theory referee should check the tail estimates and uniformity before any publication claim.
