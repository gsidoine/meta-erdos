# P043 — Exact distance-two neighborhoods and shifted prime factors

**Status:** proved exact formula and unconditional asymptotic; historical priority unverified.

Let F_N be the graph of reduced fractions a/q with q prime, 1 ≤ a < q ≤ N, and edge relation |ar−bq|=1 between a/q and b/r. Let D_2(N) be the number of vertices at distance exactly two from 1/2. Let ω(k) denote the number of distinct prime factors of k (with ω(1)=0).

## Theorem

For every N ≥ 3,

$$
D_2(N)=2\sum_{\substack{3\le q\le N\\q\text{ prime}}}
\left(\omega(q-2)+\omega(q+2)
-\mathbf1_{\mathbb P}(q-2)-\mathbf1_{\mathbb P}(q+2)\right).
$$

Moreover,

$$
\boxed{D_2(N)=(4+o(1))\frac{N\log\log N}{\log N}.}
$$

Consequently, if C(N) is the largest component size,

$$
\boxed{\liminf_{N\to\infty}\frac{C(N)\log N}{N\log\log N}\ge4.}
$$

These assertions do not determine the asymptotic order of C(N).

## Proof of the exact formula

For each odd prime p, the two neighbors of 1/2 with denominator p have numerators (p−1)/2 and (p+1)/2. For a vertex b/q with q an odd prime, an edge from one of these two neighbors gives

$$
aq-bp=\varepsilon,\qquad \varepsilon\in\{-1,1\}.
$$

Reducing modulo p shows that p divides q−2 or q+2. Conversely, each odd prime p<q dividing q−2 or q+2 yields precisely two vertices b/q adjacent to these central fractions. Explicitly, take a=(p+1)/2 when p divides q−2, otherwise a=(p−1)/2, and set b=(aq−1)/p. The complementary fractions (p−a)/p and (q−b)/q supply the other vertex.

Distinct odd primes p,r<q cannot lead to the same b/q. If aq−bp=ε and cq−br=δ, and ε=δ, then q divides p−r; if ε=−δ, then q divides p+r. The first is impossible because 0<|p−r|<q; the second would require p+r=q, impossible for three odd primes. Here gcd(b,q)=1 is automatic.

If q−2 itself is prime, the intermediary p=q−2 contributes the two fractions already adjacent directly to 1/2; these must be excluded. If p>q, divisibility forces p=q+2 prime, again producing only direct neighbors of 1/2. When q+2 is composite, all its prime divisors are smaller than q. Thus the number of distance-two vertices with denominator q is exactly

$$
2\left(\omega(q-2)+\omega(q+2)
-\mathbf1_{\mathbb P}(q-2)-\mathbf1_{\mathbb P}(q+2)\right).
$$

Summation establishes the identity.

## Analytic proof

Fix s in {−2,2}. Since q+s≤N+2, for sufficiently large N it has at most three distinct prime factors larger than N^{1/3}: four such primes would have product exceeding N^{4/3}>N+2. Therefore

$$
\sum_{\substack{3\le q\le N\\q\text{ prime}}}\omega(q+s)
=
\sum_{\substack{3\le p\le N^{1/3}\\p\text{ prime}}}
\pi(N;p,-s)+O(\pi(N)).
$$

For either reduced residue class −s modulo an odd prime p, the Bombieri–Vinogradov theorem gives, for any fixed A>0,

$$
\sum_{\substack{3\le p\le N^{1/3}\\p\text{ prime}}}
\pi(N;p,-s)
=\mathrm{Li}(N)
\sum_{\substack{3\le p\le N^{1/3}\\p\text{ prime}}}
\frac1{p-1}
+O_A\left(\frac{N}{(\log N)^A}\right).
$$

The prime harmonic sum is log log N+O(1), and Li(N)∼N/log N. Consequently each shifted-prime-factor sum is asymptotic to N log log N/log N. The two primality correction sums are O(π(N))=O(N/log N), and so are lower order. This gives the stated coefficient 4.

Every counted vertex lies in the component of 1/2, proving the lower bound for C(N).

## Scope and verification

The independent program [P043_exact_distance_two.py](../experiments/P043_exact_distance_two.py) checks the full distance-two layer by Farey determinants and independently evaluates the shifted-prime-factor identity. Its finite checks are not used in the proof.

The previous [restricted two-step theorem](P043-two-step-prime-denominator-growth.md) gave the lower coefficient 2 by counting only some vertices with large denominators. The present exact formula determines the entire distance-two layer and strengthens that coefficient to 4.

The analytic input is classical. No historical originality is asserted without specialist prior-art comparison.

## References

- D. E. Welch, *Farey fractions with prime denominators*, Acta Arithmetica 134 (2008), 93–99, https://doi.org/10.4064/aa134-1-7.
- Bombieri–Vinogradov theorem, e.g. J. Maynard, *Counting primes*, https://ems.press/content/book-chapter-files/33121.
- H. Montgomery and R. Vaughan, *Multiplicative Number Theory I*, Chapter 2 (Mertens' theorem).
- [P043 structural theorem](P043-prime-denominator-farey-structure.md).
