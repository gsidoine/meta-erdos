# P006 — How large can a Sidon set with no prime differences be?

<!-- DOSSIER-SUMMARY -->
> **Research question:** What is the asymptotic maximum size of a Sidon set whose positive differences avoid all primes?  
> **Formulation:** candidate. **Novelty:** not certified; targeted literature comparison only.  
> **Verified/known progress:** Asymptotic lower constant at least 1/√2 and upper at most 1.  
> **Finite evidence:** Small exact MILP optima through N=60.  
> **Symbolic prize:** A Dinner (symbolic) — The sharp leading constant in the maximum size of a prime-difference-free Sidon set.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->


**Area:** additive number theory, extremal combinatorics  
**Status:** candidate, exact novelty and unresolved status **unverified**

## Definition

A finite set $A\subseteq[1,N]$ is Sidon if all differences $b-a>0$ with $a<b\in A$ are distinct. This is equivalent to the usual distinct-unordered-pair-sums definition.

Call $A$ *prime-difference-free* if no positive difference between its elements is prime. Define

$$
F_{\neg\mathbb P}(N)=
\max\{|A|: A\subseteq[1,N] \text{ is Sidon and }
(A-A)\cap\mathbb P=\varnothing\}.
$$

Here $\mathbb P$ denotes the positive primes, and only **positive** differences matter.

## Main question

**Determine the asymptotic order and leading constant of $F_{\neg\mathbb P}(N)$.** In particular,

$$
\text{is } F_{\neg\mathbb P}(N)=(1+o(1))\sqrt N\;?
$$

This is a **question**, not an asserted conjecture. It may be false; even existence of a limiting leading constant is unverified.

## Elementary lower bound (rigorous)

**Proposition.**

$$
\frac{1}{\sqrt2}\le
\liminf_{N\to\infty}\frac{F_{\neg\mathbb P}(N)}{\sqrt N}
\le \limsup_{N\to\infty}\frac{F_{\neg\mathbb P}(N)}{\sqrt N}
\le 1.
$$

**Proof.** Let $M=\lfloor N/2\rfloor$. Classical finite Sidon constructions give a Sidon set $S\subseteq[1,M]$ of cardinality $(1-o(1))\sqrt M$. As $S$ is Sidon, at most one pair in $S$ has difference $1$. Delete one endpoint of that pair if it exists, leaving $S'$ with at least $|S|-1$ elements and no difference $1$. The set $A=2S'\subseteq[1,N]$ is Sidon and all its positive differences are even and at least $4$, hence composite. Thus $|A|\ge(1-o(1))\sqrt{N/2}$. The upper bound follows immediately from the standard $(1+o(1))\sqrt N$ upper bound for Sidon sets. $\square$

## Certified small computations

The maximum problem can be formulated as a **mixed integer linear program**. Binary $x_a$ indicates $a\in A$. Prime differences forbid $x_a=x_b=1$. For every composite difference $d$, auxiliary $y_{a,a+d}$ must equal $1$ whenever both endpoints are selected, and the sum of these auxiliary variables is at most $1$. Translation invariance permits fixing $x_1=1$.

All entries below were solved with status **optimal** (status 0, zero MIP gap); these are **finite values only**.

| $N$ | $F_{\neg\mathbb P}(N)$ |
|---:|---:|
| 12 | 3 |
| 18 | 4 |
| 24 | 4 |
| 30 | 5 |
| 36 | 6 |
| 42 | 6 |
| 48 | 7 |
| 54 | 7 |
| 60 | 7 |

One seven-element witness at $N=48$ is

$$
A=\{1,7,21,25,37,46,47\}.
$$

Its positive differences are distinct and composite (or $1$); this witness is not presented as a new record for ordinary Sidon sets.

Reproducibility: [`experiments/prime_avoiding_sidon_milp.py`](../../experiments/prime_avoiding_sidon_milp.py) (requires NumPy + SciPy).

```sh
python experiments/prime_avoiding_sidon_milp.py --N 48 --seconds 60
```

Use only status 0 as an optimality certificate; status 1 can represent a time limit, in which case a feasible witness is merely a lower bound.

## Adversarial and literature notes

The lower bound arises simply from scaling classical Sidon sets; the new issue is whether one can mix residue classes while forbidding **all** prime differences without sacrificing a positive proportion of maximum cardinality.

This connects Sidon/Golomb-ruler extremal theory to prime-difference-avoiding sets. A targeted web search did not identify this exact extremal function, but many adjacent topics exist:

- Standard Sidon bounds and Golomb rulers: https://mathworld.wolfram.com/SidonSet.html
- Carter, Hunter and O'Bryant (2025), finite Sidon diameters: https://doi.org/10.1007/s10474-024-01499-8
- Erdős problem #42, avoidance of another Sidon set's differences, **different condition**: https://www.erdosproblems.com/42
- Croot et al. (2026), combinatorial large-sieve techniques in Sidon problems: https://arxiv.org/abs/2606.17487

**No comprehensive novelty audit or proof of the proposed asymptotic has been completed.**

## Next work

1. Seek an upper bound strictly below $(1+o(1))\sqrt N$ or construct sets breaking $1/\sqrt 2$ asymptotically.
2. Replace the generic MILP with an exact combinatorial search that scales to larger $N$.
3. Investigate modular constructions (Bose–Chowla, Singer, Ruzsa) under prime-gap exclusions.
4. Audit additive-combinatorics literature for forbidden-difference Sidon families.

## Related literature

Classical Sidon extremal theory gives benchmarks; no direct prime-difference-free extremal asymptotic was located in the targeted audit. This is **not a certification of novelty or of unresolved status**. Read the [full P001–P008 audit](../../literature-audits/2026-10-28-comprehensive-P001-P008.md) before citing this question in a mathematical publication.
## Additional literature comparison

Further searches found no direct asymptotic formula under the names 'prime-free Golomb ruler', 'Sidon no prime differences' or 'composite Golomb-ruler distances'. This absence of a hit is **not** evidence of novelty. The current lower constant 1/sqrt(2) comes from an elementary dilation; the next substantive objective should be a genuinely stronger asymptotic bound. See the [archived literature audit](../../literature-audits/2026-10-28-pass-4.md).
