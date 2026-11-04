# P028 — Random divisor-complex Euler characteristics and a Möbius deformation

<!-- DOSSIER-SUMMARY -->
> **Research question:** What are the asymptotic mean and fluctuations of the Euler characteristic of Bernoulli-thinned integer divisibility order complexes?  
> **Formulation:** candidate. **Novelty:** not certified; arithmetic Dirichlet convolution and order-complex Möbius theory are classical.  
> **Verified/known progress:** Internally derived exact Euler-characteristic expectation with Dirichlet series p(zeta−1)/(1+p(zeta−1)); p=1 recovers the Mertens function.  
> **Finite evidence:** Exact enumerative small-N checks and independent coefficient recurrence.  
> **Symbolic prize:** A Dinner (symbolic) — A nondegenerate fluctuation law for the random Euler characteristic after explicit centering and scaling.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

**Area:** analytic number theory, combinatorial topology, probability. **Status:** candidate.

## The random complex

Independently retain each integer 2≤m≤N with probability p∈(0,1). Form the partially ordered set P_N(p) under divisibility, and its order complex Δ_N(p): a face is a finite nonempty *strict divisibility chain* of retained integers. Exclude 1: otherwise its presence makes the complex a cone, introducing a trivial obstruction. Use the augmented reduced Euler characteristic convention, in which the empty complex has reduced Euler characteristic −1.

**P028.** Find a sharp asymptotic or meaningful cancellation bounds for

$$
E_p(N)=\mathbb E\bigl[\widetilde\chi(\Delta_N(p))\bigr]
$$

for fixed p∈(0,1), and characterize the order of fluctuations of the random Euler characteristic around its mean. Does this exhibit a change of asymptotic regime as p approaches 1?

## Exact elementary expectation identity

Let f_r(m) count ordered factorizations m=a_1\cdots a_r with every a_j≥2. Put

$$
\phi_p(m)=\sum_{r\ge1}(-1)^{r-1}p^r f_r(m).
$$

Every strict chain starting at an integer ≥2 and ending at m corresponds bijectively to such an ordered factorization. Linearity of expectation therefore gives

$$
\boxed{E_p(N)=-1+\sum_{m=2}^N\phi_p(m).}
$$

For real s sufficiently large that the resulting geometric series converges absolutely,

$$
\boxed{\sum_{m\ge2}\frac{\phi_p(m)}{m^s}
=\frac{p(\zeta(s)-1)}{1+p(\zeta(s)-1)}.}
$$

At p=1, the Dirichlet series is 1−1/ζ(s), so φ_1(m)=−μ(m) for m≥2 and

$$
\widetilde\chi(\Delta_N(1))=-\sum_{m\le N}\mu(m).
$$

This is an **exact known-style Möbius/chain-enumeration identity**, not a claimed original theorem. The problem is the asymptotic arithmetic behaviour and random fluctuations for 0<p<1. The denominator is an analytic issue: do **not** infer cancellation from the formula without controlling its zeros.

## Closest primary sources

- [DLMF, Dirichlet convolution and Möbius inversion](https://dlmf.nist.gov/27.5): standard formal framework.
- [Bolognini–Macchia–Ventura–Welker, *The Poset of Proper Divisibility* (2017)](https://doi.org/10.1137/15M1049142): direct divisibility-poset topology, but a different poset.
- [Brown, *The Coset Poset and Probabilistic Zeta Function of a Finite Group* (2000)](https://doi.org/10.1006/jabr.1999.8221): independent interface between poset Euler characteristics and probabilistic zeta functions.
- [Non-trivial divisor functions and ordered factorisations (2019)](https://doi.org/10.1007/s11139-018-0093-9): **closest algebraic predecessor for the factorization counts**.

**Priority risk high:** algebraic identity may already be textbook material. The random-thinning asymptotic is the intended open research question.

## Falsification

Compute φ_p via the exact recurrence φ_p(m)=p(1−∑_{d|m, 1<d<m}φ_p(d)) for m>1, valid because φ is the negative of the Dirichlet inverse coefficients of δ+p 1_{m≥2}. Verify on small complexes by independent chain counts; compare p=0, p=1, and the empty-complex convention explicitly.
