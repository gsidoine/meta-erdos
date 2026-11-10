# P043 — A two-step prime-denominator Farey layer

**Status:** unconditional asymptotic theorem. The proof combines elementary Farey adjacency with the classical Bombieri–Vinogradov theorem. The complete asymptotic order of the largest component and the historical novelty of the present two-step formulation are not established.

Let $F_N$ have the reduced fractions $a/p$, $1\le a<p\le N$, with prime denominator $p$ as vertices, and edges when $|aq-bp|=1$. Let $C(N)$ be its largest connected-component size.

Put $Y=\lfloor N^{1/3}\rfloor$, defined as the largest integer with $Y^3\le N$. For all sufficiently large $N$ assume $2Y<N/2$.

Let $\mathcal L_N$ be the set of vertices $b/q$ with $q$ prime and $N/2<q\le N$ that can be reached from $1/2$ by a path of length two through a vertex of prime denominator $p$, $3\le p\le Y$.

For coprime residues $a$ and $p$, write $\pi(x;p,a)$ for the number of primes $q\le x$ satisfying $q\equiv a\pmod p$.

## Theorem — Exact count and asymptotic growth

For every sufficiently large integer $N$,

$$
\begin{aligned}
|\mathcal L_N|
={}&2\sum_{\substack{3\le p\le Y\\p\ {\rm prime}}}
\bigl(
\pi(N;p,2)-\pi(N/2;p,2)\\
&\hspace{39mm}+
\pi(N;p,-2)-\pi(N/2;p,-2)
\bigr).
\end{aligned}
\tag{1}
$$

Moreover,

$$
\boxed{
|\mathcal L_N|=(2+o(1))\frac{N\log\log N}{\log N},
\qquad
\liminf_{N\to\infty}
\frac{C(N)\log N}{N\log\log N}\ge2.
}
\tag{2}
$$

The fractions in $\mathcal L_N$ have graph distance *exactly two* from $1/2$. The lower bound for $C(N)$ is unconditional.

### Proof of the exact identity

A fraction with odd prime denominator $p$ is adjacent to $1/2$ precisely when it equals

$$
\frac{p-1}{2p}
\quad\hbox{or}\quad
\frac{p+1}{2p},
$$

since its determinant with $1/2$ is $\pm1$.

Fix a larger odd prime $q>2Y$ and an odd prime $p\le Y$. A vertex $b/q$ can be adjacent to either of these two fractions only if

$$
\frac{p\pm1}{2}q-bp=\pm1,
$$

hence $q\equiv\pm2\pmod p$. Conversely, when $q\equiv2\pmod p$, choose $a=(p+1)/2$ and $b=(aq-1)/p$. When $q\equiv-2\pmod p$, choose $a=(p-1)/2$ and the same expression for $b$. These are integers satisfying $0<b<q$, and their complements $(p-a)/p$ and $(q-b)/q$ give the opposite determinant sign. Thus there are **exactly two** such vertices of denominator $q$ for this $p$. The residues $2$ and $-2$ are distinct modulo odd $p$ except when $p=2$, which is excluded.

It remains to show that the contributions from different $p\le Y$ do not overlap. Suppose a vertex $b/q$ is adjacent to distinct fractions $a/p$ and $c/r$, where $p,r\le Y$ are distinct primes. Write

$$
aq-bp=\varepsilon,\qquad
cq-br=\delta,\qquad
\varepsilon,\delta\in\{-1,1\}.
$$

If $\varepsilon=\delta$, subtraction and $\gcd(b,q)=1$ give $q\mid p-r$, contradicting $0<|p-r|<q$. If $\varepsilon=-\delta$, addition and $\gcd(b,q)=1$ give $q\mid p+r$, contradicting $0<p+r\le2Y<q$. Hence no vertex is counted by two different smaller prime denominators. The two vertices associated with a fixed pair $(p,q)$ are distinct, since $q$ is odd and their numerators sum to $q$.

Finally, no member of $\mathcal L_N$ is already adjacent to $1/2$. Indeed, were $b/q$ adjacent to $1/2$ as well as to $(p\pm1)/(2p)$, the determinant identity would force $|q-p|=2$ or $q+p=2$, both impossible for $q>2Y\ge2p$. Thus all the constructed vertices have distance exactly two. This proves (1).

### Analytic proof of (2)

For every fixed $A>0$, the Bombieri–Vinogradov theorem, in its prime-counting version, yields for $Y\le N^{1/3}$

$$
\sum_{p\le Y}
\max_{\substack{a\bmod p\\(a,p)=1}}
\max_{x\le N}
\left|\pi(x;p,a)-\frac{\mathrm{Li}(x)}{p-1}\right|
\ll_A\frac{N}{(\log N)^A}.
$$

Only prime moduli appear on the left, so this is an immediate restriction of the classical estimate over all moduli. Applying it at $N$ and $N/2$ to both reduced residue classes $\pm2$ and using (1) gives

$$
|\mathcal L_N|
=
4\bigl(\mathrm{Li}(N)-\mathrm{Li}(N/2)\bigr)
\sum_{\substack{3\le p\le Y\\p\ {\rm prime}}}\frac1{p-1}
+O_A\left(\frac{N}{(\log N)^A}\right).
$$

The prime harmonic sum obeys

$$
\sum_{3\le p\le Y}\frac1{p-1}
=\log\log Y+O(1)
=\log\log N+O(1),
$$

because $1/(p-1)=1/p+O(1/p^2)$ and $\log Y=\frac13\log N+o(1)$. Also

$$
\mathrm{Li}(N)-\mathrm{Li}(N/2)
\sim\frac{N}{2\log N}.
$$

Taking $A>2$ yields the first asymptotic in (2). Every vertex of $\mathcal L_N$ is connected to $1/2$, so the component containing $1/2$, and therefore the largest component, has at least $|\mathcal L_N|$ vertices. This proves the second assertion. $\square$

## Consequences and limitations

The previously recorded elementary bound $C(N)\ge2\pi(N)-1\sim2N/\log N$ improves by a factor of order $\log\log N$. More precisely, this theorem determines the exact leading constant for a naturally defined **large-denominator, small-intermediate-denominator layer**, not for the entire component.

The full asymptotic order of $C(N)$, whether the $1/2$ component is always largest, and any corresponding upper bound remain open within P043. Bombieri–Vinogradov and the prime harmonic-sum estimate are classical input, not new analytic-number-theoretic results.

The [independent verifier](../experiments/P043_two_step_prime_layer.py) checks the exact finite identity, coprimality, determinant edges, uniqueness, and graph-distance-two property for selected finite $N$. Finite verification plays no role in the asymptotic proof.

## Literature

1. D. E. Welch, *Farey fractions with prime denominators*, *Acta Arithmetica* **134** (2008), 93–99. https://doi.org/10.4064/aa134-1-7. This paper studies distribution and approximation by prime-denominator Farey fractions, rather than the specific two-step graph layer.
2. J. Maynard, *Counting primes*, Theorem 13 (Bombieri–Vinogradov theorem), European Mathematical Society Press, https://ems.press/content/book-chapter-files/33121.
3. Classical Mertens theorem for reciprocal primes, e.g. H. Montgomery and R. Vaughan, *Multiplicative Number Theory I*, Chapter 2.
4. [Prime-denominator Farey structural theorem](P043-prime-denominator-farey-structure.md): forest and component identities.

The particular component-growth formulation has not undergone a complete historical priority audit; this theorem is not represented as a verified novel analytic result.
