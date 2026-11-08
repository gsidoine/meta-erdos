# P030 — Perfect matchings with prime sums and prime differences

<!-- DOSSIER-SUMMARY -->
> **Research question:** Are there perfect matchings of all sufficiently large even initial intervals when both the sum and absolute difference of every matched pair must be prime? **No.**
> **Formulation:** disproved. **Novelty:** historical priority of the obstruction not certified.
> **Proved result:** For \(n\ge4\), the maximum matching size satisfies \(\nu(D_n)\le\lfloor n/3\rfloor+\pi(2n-3)-2=n/3+o(n)\).
> **Exact counterexamples:** A Hall cut at \(n=51872\) and a global matching bound at \(n=240158\), verified by an integer sieve.
> **Navigation:** [Catalogue](../../README.md#problem-catalogue) · [Literature](#literature-and-priority)
<!-- /DOSSIER-SUMMARY -->

**Area:** additive number theory, extremal graph theory. **Status:** disproved by an elementary congruence obstruction.

## Definition and original conjecture

Let \(D_n\) be the simple graph on \([n]=\{1,\ldots,n\}\) with an edge \(\{a,b\}\), \(a\ne b\), precisely when both \(a+b\) and \(|a-b|\) are prime. Write \(\nu(D_n)\) for its maximum matching size.

The original conjecture was \(\nu(D_n)=n/2\) for every even \(n\ge8\). This conjecture is false. Every edge joins an odd integer to an even integer: the only possible even prime sum is \(2\), which requires \(a=b=1\).

## Theorem — Modular obstruction

**Theorem.** For every \(n\ge4\),

$$
\boxed{\nu(D_n)\le\left\lfloor\frac n3\right\rfloor+\pi(2n-3)-2.}
$$

Consequently,

$$
\limsup_{n\to\infty}\frac{\nu(D_n)}n\le\frac13,
$$

and no sufficiently large even \(n\) admits a perfect matching of \(D_n\).

**Proof.** Let \(\{a,b\}\) be an edge with \(a<b\). If neither endpoint is divisible by \(3\), there are two cases modulo \(3\).

If \(a\equiv b\pmod3\), then \(3\mid(b-a)\); since \(b-a\) is prime, \(b-a=3\).

If \(a\not\equiv b\pmod3\), both are nonzero residues, so \(3\mid(a+b)\). Since \(a+b\) is prime, \(a+b=3\), forcing \(\{a,b\}=\{1,2\}\), for which \(b-a=1\) is not prime. This case is impossible.

Thus every edge either meets a multiple of \(3\) or has difference \(3\). In any matching, at most \(\lfloor n/3\rfloor\) edges meet multiples of \(3\), as their endpoints divisible by \(3\) must be distinct.

Every remaining edge has the form

$$
\left\{\frac{p-3}{2},\frac{p+3}{2}\right\},
\qquad 5\le p\le 2n-3,\quad p\text{ prime}.
$$

There is at most one such edge for each of the \(\pi(2n-3)-2\) eligible primes. Adding the two bounds proves the inequality. The prime number theorem gives \(\pi(2n-3)=o(n)\), hence the asymptotic statement. A perfect matching of an even-order graph has \(n/2\) edges, greater than \(n/3+o(n)\) for all sufficiently large \(n\). \(\square\)

## Explicit Hall obstruction

Let \(n=51872\) and consider the odd vertices

$$
S=\{a\in[n]: a\equiv1\pmod2,\ 3\nmid a\}.
$$

Every neighbor of \(S\) is even. By the preceding residue argument, an even neighbor \(b\) belongs to the following explicitly computable superset \(T\) of \(N_{D_n}(S)\):

$$
\begin{aligned}
T=\{b\in[n]:\, &2\mid b,\ \text{and at least one of}\\
&3\mid b;\\
&b\ge4\ \text{and } 2b-3\text{ is prime};\\
&b+3\le n\ \text{and }2b+3\text{ is prime}\}.
\end{aligned}
$$

Indeed, a neighbor \(b\) not divisible by \(3\) must satisfy \(a=b-3\) or \(a=b+3\), respectively giving the prime sum \(2b-3\) or \(2b+3\).

The exact sieve in [the certificate program](../../experiments/P030_mod3_matching_obstruction.py) gives

$$
|S|=17291,\qquad |T|=17290.
$$

Therefore \(|N(S)|\le17290<|S|\), violating Hall's condition. In particular, \(D_{51872}\) has no perfect matching. This is a finite, reproducible integer certificate, not a claim that \(51872\) is the least counterexample.

Independently, for \(n=240158\), \(\pi(480313)=40028\), so the theorem yields

$$
\nu(D_{240158})\le80052+40026=120078<120079=n/2.
$$

## Relation to Goldbach

An edge \(\{a,b\}\), \(a<b\), supplies the representation

$$
2b=(b-a)+(b+a)
$$

as a sum of two primes. The converse requires the prime pair to have a positive smaller endpoint \(a\), which excludes an equal-prime representation. The graph thus encodes restricted Goldbach representations, but the original global perfect-matching conjecture cannot serve as a route to Goldbach: it is false for all sufficiently large even orders.

## Verified finite cases

The pre-existing [matching verifier](../../experiments/P030_double_prime_matchings.py) reports perfect matchings for every even \(n\) between \(8\) and \(400\), with failures at \(2,4,6\). These observations are consistent with the asymptotic obstruction; they do not establish an eventual positive statement.

## Literature and priority

- [OEIS A227050](https://oeis.org/A227050) records Hamiltonian circular arrangements with prime adjacent sums and differences. An even-order Hamiltonian cycle implies a perfect matching, so the obstruction also rules out such arrangements at sufficiently large even orders.
- [Sykora, *On Neighbor-Property Cycles* (2014)](https://doi.org/10.3247/SL5Math14.002) is a direct predecessor on simultaneous prime-neighbor constraints.

The congruence bound and finite Hall certificate are established here mathematically, but their historical originality has not been independently certified. The permanent identifier is retained for the disproved conjecture. The former prize condition is no longer an active open challenge; the historical symbolic designation is preserved in the archival reward records.
