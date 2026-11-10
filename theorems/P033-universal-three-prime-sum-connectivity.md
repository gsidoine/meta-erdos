# P033 — Three prime-sum matchings connect every initial interval

**Status:** unconditional computer-assisted theorem. The analytic portion is effective; the bounded range is covered by exact finite certificates. Historical priority is not established.

For $n\ge3$, let $\kappa(n)$ be the minimum cardinality of a set $S$ of primes such that the graph on $[n]=\{1,\dots,n\}$ with edges $\{x,y\}$ satisfying $x\ne y$ and $x+y\in S$ is connected.

## Theorem

For every integer $n\ge3$,

$$
\boxed{\kappa(n)\le3.}
$$

More precisely, for all $n\ge3$,

$$
\boxed{
\kappa(n)=
\begin{cases}
2,&\text{if }p,p+2\text{ are prime for some }p\in\{n-1,n,n+1\},\\
3,&\text{otherwise}.
\end{cases}}
$$

The second assertion uses the exact two-color characterization proved in the [P033 dossier](../problems/graph-theory/P033-prime-sum-three-palette.md). The three-color upper bound is proved below, with a fully explicit analytic threshold.

## 1. Deterministic connectivity lemma

Let $p<q<n<r$ be three odd positive integers. Define

$$
a=\frac{q-p}{2},\qquad
b=\frac{r-p}{2},\qquad
D=\max\{n-p,r-n\}.
$$

**Lemma.** If

$$
\gcd(a,b)=1,\qquad n\ge5D-2,
$$

then the edges with sums $p,q,r$ connect $[n]$.

**Proof.** The graph on $m$ consecutive integers joining points at distance $a$ or $b$ is connected when $\gcd(a,b)=1$ and $m\ge a+b-1$. Indeed, on $\mathbb Z/(a+b)\mathbb Z$, addition by $a$ is a spanning cycle whose edges, represented in $\{0,\dots,a+b-1\}$, have absolute difference $a$ or $b$. Deleting one vertex leaves a spanning path on $a+b-1$ points. Any subsequent vertex $j$ is joined to the preceding vertex $j-a$.

Let $I$ be the interval of odd integers

$$
I=\{x:r-n\le x\le p-2,\ x\text{ odd}\}.
$$

Its length $m=|I|$ satisfies

$$
m\ge\frac{n-2D-1}{2},\qquad
a+b\le\frac{3D-1}{2}.
$$

Consequently $m\ge a+b-1$. Every reflection $x\mapsto s-x$, $s\in\{p,q,r\}$, sends $I$ to even vertices of $[n]$. The two-edge paths using first $p$ and then $q$, or first $p$ and then $r$, realize the steps $2a$ and $2b$ among odd vertices of $I$. The preceding interval lemma connects the entire core $I$.

For an odd $x$ below $I$, repeatedly take the two-edge step $x\mapsto x+2a$ using sums $p,q$. The intermediate even vertex belongs to $[n]$, and the first step entering $I$ does not overshoot because $m\ge a+b-1$ and $b>a\ge1$. An odd $x$ above $I$ similarly reaches it by steps $x\mapsto x-2b$ using sums $r,p$. The intermediate even vertices lie in $[n]$ since $2b=r-p\le2D\le n$; the first descending step does not undershoot since $m\ge a+b-1$. Thus all odd vertices are connected.

An even $y<p$ attaches to the odd vertex $p-y$; an even $y\ge p$ attaches to the odd vertex $r-y$. Both lie in $[n]$. Hence all vertices are connected. $\square$

The lemma is the [sharpened P033 reflection criterion](P033-cyclic-step-sharp-core.md), stated here with the actual value of $D$.

## 2. Effective existence above ten billion

Put

$$
N_0=10^{10},\quad L=\frac n6,\quad
T=\log n,\quad H=\frac L T,\quad
I_-=(5n/6,n),\quad I_+=(n,7n/6].
$$

**Proposition.** For every integer $n\ge N_0$ there are primes $p<q$ in $I_-$ and a prime $r$ in $I_+$ satisfying

$$
\gcd\left(\frac{q-p}{2},\frac{r-p}{2}\right)=1.
$$

**Proof.** Write $A$ for the number of primes in $I_-$ and $B$ for the number in $I_+$. There are exactly $\binom A2 B$ admissible ordered-by-size triples. A triple fails the displayed coprimality condition only if either all three primes agree modulo $4$, or all three agree modulo some odd prime $\ell$. We bound the proportions of these obstructions separately.

The explicit prime-in-progressions estimate of Bennett, Martin, O'Bryant, and Rechnitzer (Theorem 1.2) is

$$
\left|\vartheta(x;m,c)-\frac{x}{\varphi(m)}\right|
<\frac{x}{840\log x}
\quad
(x\ge8\cdot10^9,\ 3\le m\le10^4,\ \gcd(c,m)=1).
\tag{1}
$$

Here $\vartheta(x;m,c)$ sums $\log p$ over primes $p\le x$ in the residue class $c\bmod m$. For the moduli $m=4$ and every odd prime $\ell\le1000$, the corresponding weighted counts in the intervals $(5n/6,n]$ and $(n,7n/6]$ therefore differ from $L/\varphi(m)$ by less than

$$
E_-=\frac{11n}{5040\log(5n/6)},\qquad
E_+=\frac{13n}{5040\log n}.
$$

The left endpoint is at least $8\cdot10^9$ for $n\ge N_0$, as required by (1).

The following elementary estimates hold uniformly for $n\ge N_0$:

$$
\log(5n/6)>0.99T,\quad
\log(7n/6)<1.01T,\quad
\log(\sqrt n/6)>0.42T,\quad
H>10^7.
\tag{2}
$$

Consequently both $E_-$ and $E_+$ are smaller than $\varepsilon L$ for

$$
\varepsilon=\frac7{10000}.
$$

The modulus $4$ has two reduced residue classes. Summing their lower bounds, then dividing by the largest logarithm in the interval, gives $A>(1-2\varepsilon)H-1$; the subtraction accounts for a possible prime equal to $n$, which is not in $I_-$. Similarly,

$$
B>\frac{1-2\varepsilon}{1.01}H,\qquad
A<\frac{1+2\varepsilon}{0.99}H.
$$

Using $H>10^7$ gives

$$
A>0.998H,\quad A-1>0.998H,\quad
B>0.988H,\quad A<1.02H,
$$

and hence

$$
A(A-1)B>0.98H^3.
\tag{3}
$$

For a modulus $m$ in the preceding finite collection, set $k=\varphi(m)$. In any reduced residue class modulo $m$, the prime counts in $I_-$ and $I_+$ are bounded above, respectively, by

$$
U_k=\frac{H(1/k+\varepsilon)}{0.99},
\qquad
V_k=H(1/k+\varepsilon).
$$

Thus the fraction of triples whose primes agree in one of the $k$ classes is at most

$$
\frac{kU_k^2V_k}{A(A-1)B}
<
\frac{(1+k\varepsilon)^3}
{0.98\,(0.99)^2k^2}.
\tag{4}
$$

### Small common prime divisors

For the obstruction $2$ use $m=4$, $k=2$. For odd primes $3\le\ell\le1000$, use $m=\ell$, $k=\ell-1$, which is even and at most $998$. Applying (4) and enlarging the sum to every even $k=2,4,\dots,1000$ gives an upper bound

$$
\frac1{0.98(0.99)^2}
\left[
\frac{(1+2\varepsilon)^3}{4}
+\sum_{j=1}^{500}\frac{(1+2j\varepsilon)^3}{(2j)^2}
\right].
$$

Using $\sum_{j\ge1}j^{-2}<2$, $\sum_{j=1}^{500}j^{-1}<8$, and $\sum_{j=1}^{500}j=500\cdot501/2$, the bracket is smaller than

$$
\frac{(1+2\varepsilon)^3}{4}+
\frac12+12\varepsilon+1500\varepsilon^2+
250500\varepsilon^3<0.762.
$$

The fraction of triples obstructed by $2$ or some odd prime not exceeding $1000$ is therefore strictly smaller than

$$
\boxed{\frac45}.
\tag{5}
$$

### Intermediate common prime divisors

Let $1000<\ell\le\sqrt n$ be prime. The Montgomery–Vaughan form of the Brun–Titchmarsh inequality states that in an interval of length $L>\ell$, each reduced residue class modulo $\ell$ contains at most

$$
\frac{2L}{(\ell-1)\log(L/\ell)}
<
\frac{2H}{0.42(\ell-1)}
$$

primes, by (2). Summing over $\ell-1$ reduced classes as in (4), using (3), and then summing over all integers in place of the primes gives a proportion bounded above by

$$
\frac8{0.98(0.42)^3}
\sum_{\ell>1000}\frac1{(\ell-1)^2}
<
\frac8{0.98(0.42)^3\cdot999}
<
\boxed{\frac3{25}}.
\tag{6}
$$

### Large common prime divisors

For a prime $\ell>\sqrt n$, fix the first prime $p\in I_-$. There are at most $L/\ell$ possible integers $q>p$ in $I_-$ congruent to $p\bmod\ell$, and at most $L/\ell+1$ possible integers $r\in I_+$ in the same class. In particular, primality of $q,r$ may be discarded. Summing over integers $\sqrt n<\ell\le L$, the total number of obstructed triples is at most

$$
A\left(
\frac{L^2}{\sqrt n-1}
+L(1+\log L)
\right).
$$

By (3), $A<1.02H$, and $H=L/T$, the resulting proportion is at most

$$
\frac{1.02}{0.49}
\left[
\frac{T^2}{\sqrt n-1}
+\frac{T^2(1+\log L)}{L}
\right].
$$

Both functions $T^2/(\sqrt n-1)$ and $T^2(1+T)/n$ are decreasing for $n\ge N_0$. Since $\log L<T$ and $\log N_0<24$, the preceding expression is smaller than

$$
\frac{1.02}{0.49}
\left[
\frac{24^2}{10^5-1}
+\frac{6\cdot24^2\cdot25}{10^{10}}
\right]
<
\boxed{\frac1{50}}.
\tag{7}
$$

The three ranges (5)–(7) cover every prime divisor of the two half-differences. Their total upper bound is

$$
\frac45+\frac3{25}+\frac1{50}
=\frac{47}{50}<1.
$$

There must therefore be at least one triple with coprime half-differences. This establishes the proposition. $\square$

For that triple, $D=\max(n-p,r-n)\le\lceil n/6\rceil$, and $n\ge5D-2$ follows for $n\ge N_0$. The deterministic lemma gives a connected graph on $[n]$ with exactly three available prime sums. Thus

$$
\boxed{\kappa(n)\le3\qquad(n\ge10^{10}).}
\tag{8}
$$

All numerical inequalities above are strict; their rational coefficient comparisons are checked independently by the [certificate program](../experiments/P033_effective_universal.py). Neither the prime number theorem in an unspecified asymptotic range nor an ineffective Siegel–Walfisz constant is used.

## 3. Exact finite certification below ten billion

The [independent certificate verifier](../experiments/P033_effective_universal.py) covers all $3\le n<10^{10}$ in two parts.

For $3\le n\le120$, an exhaustive search over every prime-sum palette of size at most three constructs a connected spanning graph using union-find. It finds 28 two-color and 90 three-color instances.

For $n\ge121$, the program contains **103 explicit triples of primes** $(p_i,q_i,r_i)$, each associated with a consecutive integer interval $[L_i,U_i]$. Every triple satisfies

$$
p_i<q_i\le L_i-1,\quad
\gcd\left(\frac{q_i-p_i}{2},\frac{r_i-p_i}{2}\right)=1,
$$

and

$$
L_i\ge\max\left\{
q_i+1,\left\lceil\frac{5r_i-2}{6}\right\rceil
\right\},\qquad
U_i\le\min\left\{
r_i-1,\left\lfloor\frac{5p_i+2}{4}\right\rfloor
\right\}.
$$

The last two inequalities imply $n\ge5\max(n-p_i,r_i-n)-2$ for **every** integer $n\in[L_i,U_i]$, not merely at sampled points. Primality of all labels is checked by trial division up to their integer square roots. Successive intervals are adjacent, the first begins at $121$, and the final interval ends at

$$
10\,034\,390\,380>10^{10}.
$$

The complete list of triples and interval endpoints is part of the permanent source of the verifier. No third-party libraries, floating-point primality tests, or unproved primality assumptions are used.

Combining this finite certificate with (8) establishes the theorem for every $n\ge3$. $\square$

## References and scope

1. M. A. Bennett, G. Martin, K. O'Bryant, and A. Rechnitzer, [*Explicit bounds for primes in arithmetic progressions*](https://personal.math.ubc.ca/~gerg/papers/downloads/EBPAP.pdf), *Illinois Journal of Mathematics* **62** (2018), 427–532, Theorem 1.2. The constant $1/840$ and threshold $8\cdot10^9$ are as stated in the original theorem.
2. H. L. Montgomery and R. C. Vaughan, Brun–Titchmarsh short-interval inequality in the explicit form recorded by H. E. Richert, [*Lectures on Sieve Methods*](https://mathweb.tifr.res.in/Documents/Publications/Lectures/tifr55.pdf) (1976), Section 8, equation (8.20).
3. H.-B. Chen, H.-L. Fu, and J.-Y. Guo, [*Hamiltonicity in Prime Sum Graphs*](https://doi.org/10.1007/s00373-020-02241-1), *Graphs and Combinatorics* **37** (2021), 209–219.
4. Y.-F. She, [*Hamiltonicity in graphs defined by primes and primitive elements*](https://arxiv.org/abs/2609.19114) (2026). This establishes eventual Hamiltonicity with unrestricted prime sums; it does not by itself bound the number of distinct prime-sum labels.
5. [P033 sharpened reflection criterion](P033-cyclic-step-sharp-core.md); [P033 two-color classification](../problems/graph-theory/P033-prime-sum-three-palette.md).

The published analytic estimates are used with their explicit constants; their authorship is not claimed here. The current theorem concerns **connectivity** with three prime-sum colors, not three-color Hamiltonicity. Its historical originality is unverified and requires specialist comparison with the full prior literature. The finite certificate is an essential component of the unconditional all-integer conclusion.
