# P033 — Cyclic step graphs and a sharper three-reflection criterion

**Status:** internally proved deterministic strengthening of the P033 connectivity certificate. This lemma alone does not guarantee the existence of suitable primes. The separate [effective universal theorem](P033-universal-three-prime-sum-connectivity.md) provides that existence and resolves the all-n question. Historical novelty is unverified.

## Lemma 1: the sharp universal length for two coprime steps

Let integers \`1 <= a < b\` satisfy \`gcd(a,b)=1\`. On the integer interval \`{0,...,m-1}\`, connect \`i,j\` when \`|i-j|\` equals \`a\` or \`b\`.

**Claim.** This graph is connected whenever \`m >= a+b-1\`.

**Proof.** Put \`M=a+b\`. On the cyclic group \`Z/MZ\`, the relation \`x -> x+a (mod M)\` forms a *single spanning cycle*, since \`gcd(a,M)=gcd(a,b)=1\`. Each edge of this cycle, represented by residues in \`{0,...,M-1}\`, has ordinary absolute difference either \`a\` (no wrap) or \`M-a=b\` (wrap). Therefore it is exactly the interval step graph at \`m=M\`. Deleting the residue \`M-1\` from a cycle leaves a connected path through the remaining \`M-1=a+b-1\` vertices. Larger intervals contain this connected initial interval and every new vertex \`x>=M-1\` connects back to \`x-a\`, so connectivity continues by induction. QED.

This improves the previous bound \`m>=a+b\` by one. For \`a,b>=2\` it is sharp at \`m=a+b-2\`: deleting both \`M-2\` and \`M-1\` from the cyclic graph disconnects the cycle, because those two residues are not adjacent on it (their difference is 1, whereas the available steps are a,b>=2). No statement of universal sharpness is made for \`a=1\`, as unit steps trivially connect any interval of length >=2.

## Lemma 2: improved three-reflection certificate

Let \`p<q<n<r\` be odd positive integers, and define

$$
a=\frac{q-p}{2},\quad b=\frac{r-p}{2},\quad
\alpha=\min\{x\ge r-n:x\text{ odd}\},\quad
\beta=p-2,\quad
m=\frac{\beta-\alpha}{2}+1.
$$

Suppose \`gcd(a,b)=1\`, \`m>=a+b-1\`, and \`2b<=n\`. Then the graph with vertex set \`[n]\` and edges \`xy\` whenever \`x+y\` is one of \`p,q,r\` is connected.

**Proof.** The central odd interval \`I={alpha,alpha+2,...,beta}\` lies in \`[n]\`. Every reflection \`x -> s-x\` with \`s in {p,q,r}\` sends an odd \`x in I\` to an even vertex in \`[n]\`. The two-edge sequences with sums \`p,q\` and \`p,r\` realize the integer steps \`a,b\` on \`I\`. Lemma 1 connects the core.

For any odd \`x<alpha\`, repeatedly use the forward two-edge translation \`x -> x+2a\` (sum p then q). Since \`x<alpha<=p-2\`, the intermediate even vertex \`p-x\` is positive; and \`p-x<=n\` follows from \`x>=1\` and \`p<=n-1\`. The first iterate entering the core lies no higher than \`alpha+2a-2<=beta\`, because \`m>=a+b-1\` and \`b>=2\`.

For any odd \`x>beta\`, necessarily \`x>=p\`. Repeatedly use the backward translation \`x -> x-2b\` (sum r then p). The intermediate even vertex \`r-x\` lies in \`[n]\` since \`r-n<=x\` and \`r-x<=r-p=2b<=n\`. The first iterate entering the core is at least \`beta+2-2b=alpha+2(a-1)>=alpha\`. Thus all odd vertices are in the same component.

An even \`y<p\` meets the odd vertex \`p-y\`, and an even \`y>=p\` meets the odd vertex \`r-y\`: in the second case \`1<=r-y<=r-p=2b<=n\`. Both partners lie in \`[n]\`, since \`p<n\`, \`r>n\` and \`y>=1\`. Thus every even vertex also attaches. QED.

**Necessity** of \`gcd(a,b)=1\` for a connected graph with three odd edge sums follows from the reflection-residue argument already given in the preceding P033 theorem; it does not depend on the interval hypothesis.

## Corollary: replace n >= 5D with n >= 5D-2

Suppose

$$
n-D\le p<q<n<r\le n+D,\qquad n\ge 5D-2,
$$

with \`D\` a positive integer and \`p,q,r\` odd positive integers. Then the graph with the three edge sums \`p,q,r\` is connected **if and only if**

$$
\gcd\left(\frac{q-p}{2},\frac{r-p}{2}\right)=1.
$$

Indeed, as in the existing P033 density theorem,

$$
m\ge\frac{n-2D-1}{2},\qquad
a+b\le\frac{3D-1}{2},
$$

so \`n>=5D-2\` implies \`m>=a+b-1\`. Also \`2b=r-p<=2D<=n\`, because \`n>=5D-2>=2D\` for \`D>=1\`; the odd inequalities and \`p<q\` ensure the exceptional \`D=1\` case is vacuous. Apply Lemma 2 and the existing necessity argument.

The original fixed-\`delta<1/5\` prime-palette asymptotic is **unchanged**: \`n>=5 ceil(delta*n)-2\` holds for all sufficiently large n, but still does not supply an explicit prime-distribution threshold.

## Audit and limits

* The cyclic proof has no analytic-number-theory prerequisites; it is an observation about the Cayley cycle on \`Z/(a+b)Z\`.
* The additional \`2b<=n\` condition in the general lemma must **not** be omitted without a separate boundary argument. It is automatic in the stated near-\`n\` corollary.
* The improved certificate concerns a *specific* triple, not existence of primes satisfying it for every n.
* A computational sweep over \`D<=20\` and \`5D-2<=n<=5D+1\` checked 6,674 eligible gcd-one synthetic odd-sum triples by full union-find connectivity, without counterexamples. This is a consistency test, not a proof.
* This deterministic note alone establishes neither an effective global threshold nor the all-n result. Those are now obtained in the [effective theorem](P033-universal-three-prime-sum-connectivity.md). Historical novelty is unverified. The classical prime-sum graph literature includes [Chen–Fu–Guo (2021)](https://doi.org/10.1007/s00373-020-02241-1) and [Croot–Jin (2026)](https://doi.org/10.1007/s00373-025-02999-2).

**Continuation:** The effective existence problem was settled by combining explicit prime-progression bounds, a common-divisor union bound, and a finite prime-triple interval certificate; see the [complete proof](P033-universal-three-prime-sum-connectivity.md).
