# P008 — Arithmetic centering of the random coprime graph's connectivity window

<!-- DOSSIER-SUMMARY -->
> **Research question:** Can the critical connectivity center be approximated by a specified non-tautological arithmetic expansion?  
> **Formulation:** needs specification. **Novelty:** needs precise formulation.  
> **Verified/known progress:** Internal threshold/Gumbel arguments require external proof and priority audit.  
> **Finite evidence:** Finite degree-profile and center checks.  
> **Symbolic prize:** A Coffee (symbolic) — A specified non-tautological expansion of the arithmetic connectivity threshold with a proved error term.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->


**Area:** probabilistic number theory, arithmetic random graphs  
**Status:** *explicit arithmetic centering* is a candidate question; leading transition and Gumbel law are proved below. **Novelty of the theorem and the open question is not certified.**

## Setup

Let $C_n$ be the coprime graph on $\{1,\ldots,n\}$, with distinct $a,b$ adjacent iff $\gcd(a,b)=1$. Independently retain each permitted edge with probability $p$, obtaining $C_n(p)$. This is bond percolation on the arithmetic graph, **not** an Erdős–Rényi $G(n,p)$ graph.

Let $\gamma$ be the Euler–Mascheroni constant, let $d_n(v)$ be the degree of vertex $v$ in $C_n$, and put

$$
\mu_n(p)=\sum_{v=1}^n(1-p)^{d_n(v)}.
$$

This is the exact expected number of isolated vertices.

For $n\ge2$, there is a unique $b_n\in(0,1)$ satisfying

$$
\boxed{\mu_n(b_n)=1}.
$$

Define the window scale

$$
a_n=e^\gamma\frac{\log\log n}{n}.
$$

## Main results: fully stated mathematical claims, requiring independent audit

**Theorem 1 (leading connectivity threshold).** Fix $c>0$ and set

$$
p_n=c\frac{\log n\log\log n}{n}.
$$

Then

$$
\Pr(C_n(p_n)\text{ connected})\to
\begin{cases}
0,&c<e^\gamma,\\
1,&c>e^\gamma.
\end{cases}
$$

For $c<e^\gamma$ there are isolated vertices with high probability; for $c>e^\gamma$ the graph is connected with high probability.

**Theorem 2 (Poisson and Gumbel critical window).** The center and width satisfy

$$
b_n\sim e^\gamma\frac{\log n\log\log n}{n},
\qquad a_n=e^\gamma\frac{\log\log n}{n}.
$$

For each fixed $t\in\mathbb R$, at $p=b_n+t a_n$ the number of isolated vertices converges in distribution to $\mathrm{Poisson}(e^{-t})$, and

$$
\boxed{
\Pr(C_n(b_n+t a_n)\text{ connected})
\longrightarrow \exp(-e^{-t}).
}
$$

In particular, the probability of having *no* isolated vertices and yet being disconnected tends to zero throughout this window.

Theorem 2 concerns **the implicitly defined exact center $b_n$**; finding its explicit number-theoretic asymptotics to the width $a_n$ is the remaining question.

## Proof of Theorem 1

### Number theory

Uniformly for $1\le v\le n$, the standard Möbius inversion identity gives

$$
d_n(v)=n\frac{\varphi(v)}v+O(2^{\omega(v)}+1).
$$

Since $\max_{v\le n}2^{\omega(v)}=n^{o(1)}$, and the classical minimal-order estimate for the Euler totient ratio is

$$
\min_{v\le n}\frac{\varphi(v)}v
 =(e^{-\gamma}+o(1))/\log\log n,
$$

we obtain

$$
\delta(C_n)\ge (e^{-\gamma}-o(1))n/\log\log n. \tag{1}
$$

### Below the threshold: independent low-degree vertices

Put $y=\log n/(\log\log n)^2$ and $Q=\prod_{q\le y,\ q\ {\rm prime}}q$. By the prime number theorem, $Q=\exp((1+o(1))y)=n^{o(1)}$; by Mertens' product theorem,

$$
\rho=\frac{\varphi(Q)}Q
=\frac{e^{-\gamma}+o(1)}{\log\log n}.
$$

There are $m=\lfloor n/Q\rfloor=n^{1-o(1)}$ multiples of $Q$ among the vertices. Every such vertex $v$ has degree at most the number of integers coprime to $Q$, bounded by $n\rho+Q$ by periodicity modulo $Q$. Distinct multiples of $Q$ cannot be adjacent to one another, so their incident-edge sets are pairwise disjoint. Their isolated-vertex events in $C_n(p_n)$ are consequently **independent**, each having probability at least

$$
(1-p_n)^{n\rho+Q}=n^{-c e^{-\gamma}+o(1)}.
$$

If $c<e^\gamma$, their expected isolated count grows at least as $n^{1-c e^{-\gamma}-o(1)}\to\infty$; independence shows that the probability none is isolated tends to zero.

### Above the threshold: two cut ranges

Fix $c>e^\gamma$. A disconnected graph has a nonempty $S\subset[n]$, $|S|=s\le n/2$, with no retained edges crossing to its complement.

For $s\le s_1=\lceil n/\sqrt{\log n}\rceil$, the minimum-degree bound (1) and the trivial internal-edge bound imply

$$
e_{C_n}(S,S^c)\ge s\bigl(\delta(C_n)-(s-1)\bigr)
\ge(e^{-\gamma}-o(1))sn/\log\log n.
$$

Thus the probability the cut is empty is at most $n^{-(1+\eta)s}$ for some $\eta>0$. There are at most $n^s$ choices of $S$; a union bound gives $o(1)$.

For $s_1\le s\le n/2$, let $H$ be the primes in $(\sqrt n,n]$. The prime number theorem gives $h=|H|\sim n/\log n$. **Every integer at most $n$ is coprime to all but at most one member of $H$**, since it cannot have two prime factors greater than $\sqrt n$. If at least half of $H$ lies in $S^c$, each vertex in $S$ has at least $h/2-1$ neighbors there; otherwise each vertex in $S^c$ has at least $h/2-1$ neighbors in $S$. Therefore

$$
e_{C_n}(S,S^c)\ge s(h/2-1)
 =(1/2-o(1))sn/\log n.
$$

At $p_n=c\log n\log\log n/n$, an empty cut has probability at most $\exp(-(c/2-o(1))s\log\log n)$. But

$$
{n\choose s}\le(en/s)^s
\le\exp(s(1+\tfrac12\log\log n))
$$

because $s\ge n/\sqrt{\log n}$. Since $c>e^\gamma>1$, the union bound again gives $o(1)$. This proves Theorem 1. $\square$

## Proof of Theorem 2

**Step 1: center.** Since $\mu_n(p)$ is strictly decreasing, the subcritical argument above implies $\mu_n(c\log n\log\log n/n)\to\infty$ when $c<e^\gamma$. Conversely (1) yields

$$
\mu_n(p)\le n\exp(-p\delta(C_n))\to0
$$

when $c>e^\gamma$. Hence $b_n\sim e^\gamma\log n\log\log n/n$.

**Step 2: window normalization.** Write $q_v=(1-b_n)^{d_n(v)}$, so $\sum_v q_v=1$. For fixed $\varepsilon>0$, the total $q_v$-weight of vertices with

$$
d_n(v)\ge(1+\varepsilon)e^{-\gamma}n/\log\log n
$$

is at most $n\cdot n^{-(1+\varepsilon)+o(1)}=o(1)$. On the complementary vertices, (1) gives

$$
a_n d_n(v)=1+O(\varepsilon)+o(1).
$$

For each fixed $t$, comparing $(1-b_n-t a_n)^{d_n(v)}$ with $q_v$ therefore yields $\mu_n(b_n+t a_n)\to e^{-t}$, first on the complementary vertices and then for all vertices by letting $\varepsilon\downarrow0$. The discarded high-degree vertices remain negligible even for $t<0$, since the change multiplies each $q_v$ by at most $\exp(O(\log\log n))=(\log n)^{O(1)}$.

**Step 3: Poisson isolates.** Let $I_n$ count isolated vertices at $p=b_n+t a_n$. Then $\mu_n(p)\to\lambda=e^{-t}$, and $\max_v(1-p)^{d_n(v)}\to0$ by (1). For distinct fixed vertices $v_1,\ldots,v_k$,

$$
\Pr(\text{all }v_i\text{ isolated})
=\prod_{i=1}^k(1-p)^{d_n(v_i)}\,(1-p)^{-e_{C_n}(\{v_1,\ldots,v_k\})}.
$$

The correction factor is uniformly $1+o(1)$ for fixed $k$, since the induced graph has at most $\binom k2$ edges and $p\to0$. Summing over distinct tuples gives the factorial moments $\mathbb E[(I_n)_k]\to\lambda^k$. Therefore $I_n\Rightarrow\mathrm{Poisson}(\lambda)$.

**Step 4: no nontrivial disconnected components.** Still let $p=b_n+t a_n$, so $p\sim e^\gamma\log n\log\log n/n$ and $\mu_n(p)=O(1)$.

For $2\le s\le s_0=\lfloor n/(\log n)^3\rfloor$, sum over vertex sets $S$ of size $s$ that could form an isolated **connected** component. By Cayley's tree count and a union bound over internal spanning trees,

$$
\Pr(S\text{ is a component})
\le s^{s-2}p^{s-1}(1-p)^{e_{C_n}(S,S^c)}.
$$

Put $q_v(p)=(1-p)^{d_n(v)}$. Since $e_{C_n}(S,S^c)=\sum_{v\in S}d_n(v)-2e_{C_n}(S)$ and $2e_{C_n}(S)\le s(s-1)$,

$$
\sum_{|S|=s}\Pr(S\text{ is a component})
\le \frac{s^{s-2}}{s!}\,p^{s-1}(1-p)^{-s(s-1)}\mu_n(p)^s.
$$

For $s\le s_0$, $p\,s=O(\log\log n/(\log n)^2)=o(1)$, so the right side is bounded by $e^{O(s)}p^{s-1}\mu_n(p)^s$, uniformly; summing over $s\ge2$ gives $O(p)=o(1)$.

For $s_0\le s\le s_1=\lceil n/\sqrt{\log n}\rceil$, the small-cut estimate from Theorem 1 gives

$$
p\,e_{C_n}(S,S^c)=(1-o(1))s\log n.
$$

Since $\log(en/s)\le1+3\log\log n$, a union bound excludes every empty cut in this range.

For $s_1\le s\le n/2$, the prime-hub large-cut estimate from Theorem 1 still applies, with $c=e^\gamma+o(1)>1$, and excludes every empty cut.

Thus with high probability **there is no connected component of size between 2 and $n/2$**. A disconnected graph with no isolated vertices must have such a component. Therefore

$$
\Pr(C_n(p)\text{ connected})=\Pr(I_n=0)+o(1)\to e^{-\lambda}=\exp(-e^{-t}).
$$

This completes the proof. $\square$

## The remaining candidate open problem: explicit centering

The implicit function $b_n$ is **exactly computable** from the degrees but not expressed by a simple asymptotic formula beyond leading order.

**Problem P008 (asymptotic-evaluation task; admissible expansion class still to be specified precisely).** Determine an explicit, number-theoretic formula $B(n)$, ideally as an asymptotic expansion in ordinary and iterated logarithms, satisfying

$$
\boxed{b_n-B(n)=o\left(\frac{\log\log n}{n}\right).}
$$

Here **explicit** must mean a non-tautological expression in standard arithmetic functions and/or finitely many ordinary and iterated logarithms with universal coefficients, **not** another name for the unique root of the same degree-sum equation. A fully formal conjecture should first fix the allowable family of expansions. Such a formula would locate the **entire Gumbel transition** without first enumerating the coprime graph's degree profile and numerically solving $\mu_n(b_n)=1$.

Is a finite deterministic expansion of this accuracy possible, or are secondary arithmetic oscillations on the scale of the window unavoidable?

## Finite checks of the critical-window scaling

[`experiments/coprime_window.py`](../../experiments/coprime_window.py) computes all degrees **exactly** by Möbius inversion, solves $\mu_n(b_n)=1$ by bisection, then independently samples the percolated graph at $b_n+t a_n$. Illustrative fixed-seed runs:

| $n$ | Numerically computed $b_n$ | $b_n / (\log n\log\log n/n)$ | Connected at $t=0$ (40 trials) |
|---:|---:|---:|---:|
| 300 | 0.0452942 | 1.368 | 16/40 |
| 1000 | 0.0177003 | 1.326 | 14/40 |
| 3000 | 0.0071887 | 1.295 | 15/40 |
| 10000 | 0.0025903 | 1.267 | 15/40 |

The Gumbel limit at $t=0$ is $e^{-1}\approx0.3679$. The coefficient $b_n/(\log n\log\log n/n)$ converges **very slowly** at these small-to-moderate values and is not close to its asymptotic limit $e^\gamma\approx1.7811$. The exact center is essential in finite simulations. Monte Carlo counts are illustrative, not proofs.

```sh
python experiments/coprime_window.py --n 3000 --trials 40 --seed 90215
```

## Reproducibility, evidence, novelty

[`experiments/coprime_percolation.py`](../../experiments/coprime_percolation.py) samples independent edge retention by geometric waiting times in the complete graph, accepting a sampled edge only when its endpoints are coprime. It records connectivity and isolates for finite $n$; these simulations illustrate the theory but do **not** prove it.

- Xiang Qi, *Random Meta-Structure: A Random Graph Model Based on Abstract Binary Relations* (2026 preprint), DOI [10.5281/zenodo.21737868](https://doi.org/10.5281/zenodo.21737868), explicitly considers independent thinning of the coprime graph as an example. Its threshold estimate concerns a heuristic *giant component*, not the Gumbel connectivity law stated here.
- [Bollobás–Borgs–Chayes–Riordan, *Percolation on dense graph sequences* (2010)](https://doi.org/10.1214/09-AOP478) develops general dense-host percolation theory.
- [Erdős–Sárközy, *On cycles in the coprime graph of integers*](https://doi.org/10.37236/1323) is part of the host graph's classical literature.

**Essential general prior art uncovered on 2026-10-28:**

- Gupta, Lee and Li, *The Connectivity Threshold for Dense Graphs* (SODA 2021), [SIAM proceedings](https://epubs.siam.org/doi/book/10.1137/1.9781611976465), study the **same general operation**—independent edge retention on a fixed deterministic host graph—and develop sharp connectivity thresholds based on approximate mincuts. The extent to which their theorem subsumes the arithmetic leading threshold is not yet assessed.
- Penrose, *Inhomogeneous random graphs, isolated vertices, and Poisson approximation* (2018), [DOI 10.1017/jpr.2018.9](https://doi.org/10.1017/jpr.2018.9), studies Poisson isolates in broader nonuniform random graph settings.
- Hladký and Viswanathan, *Connectivity of Inhomogeneous Random Graphs II* (2026), [DOI 10.1002/rsa.70098](https://doi.org/10.1002/rsa.70098), study connectivity and low-degree profiles for graphon-sampled random graphs. This is not automatically the same as our deterministic $[n]$ host.
- Martineau, *On coprime percolation, the visibility graphon, and the local limit of the GCD profile* (2022), [DOI 10.1214/21-ECP381](https://doi.org/10.1214/21-ECP381), deals with gcd-defined lattice colorings/visibility structures; despite the title, it does **not** define our independent-edge percolation question.

See [the complete eight-problem literature audit](../../literature-audits/2026-10-28-comprehensive-P001-P008.md).

The proof is recorded in the repository; its historical priority has not been established. The dated audit contains the comparison with known percolation and visibility-graph results.

## Relation to existing results

The recorded connectivity and Gumbel arguments have not been independently refereed. A further arithmetic approximation question requires a specified class of expressions for F(n) and an error target such as b_n-F(n)=o(a_n); without such conditions, the question is underdetermined.


