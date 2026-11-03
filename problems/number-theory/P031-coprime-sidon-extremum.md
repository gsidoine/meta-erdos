# P031 — How large can a pairwise-coprime Sidon set be?

<!-- DOSSIER-SUMMARY -->
> **Research question:** Can [N] contain a pairwise-coprime Sidon set of size (1−o(1))sqrt(N)?  
> **Formulation:** candidate. **Novelty:** not certified; Sidon sets of primes and additive-multiplicative restrictions require a specialist search.  
> **Verified/known progress:** Classical Sidon bound gives upper (1+o(1))sqrt(N); Sidon-subsets-of-primes results give a lower bound of order sqrt(N/log N).  
> **Finite evidence:** Exact strong-Sidon and pairwise gcd enumeration for N≤30.  
> **Symbolic prize:** A bottle of wine — A sharp asymptotic for the maximum size of a pairwise-coprime Sidon subset of an initial interval.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

**Area:** additive and multiplicative number theory. **Status:** research candidate, not historically certified open or original.

## The question

A set A⊆[N] is **Sidon** if all sums a+b with a,b∈A and a≤b are distinct. It is **pairwise coprime** if gcd(a,b)=1 for all distinct a,b∈A. Put

$$
s_{\mathrm{cp}}(N)=\max\{|A|:A\subseteq[N]\text{ is Sidon and pairwise coprime}\}.
$$

**P031.** Is it true that

$$
\boxed{s_{\mathrm{cp}}(N)=(1+o(1))\sqrt N\ ?}
$$

This asks whether the *multiplicative* constraint asymptotically costs nothing in the optimal *additive* packing constant. The conjectured constant 1 is a hypothesis, not a proved result.

## Proven baseline

The classical Erdős–Turán Sidon upper bound, sharpened many times, gives s_cp(N)≤(1+o(1))√N. A set of distinct primes is pairwise coprime. The interval (N/2,N] contains (1+o(1))N/(2log N) primes by the prime number theorem. The [Bailleul–Riblet arbitrary-set Sidon theorem](https://arxiv.org/abs/2605.03181) gives a Sidon subset of any m-element integer set of size at least (1/(3√3)+o(1))√m. Applying it to these primes proves

$$
\boxed{s_{\mathrm{cp}}(N)\ge
\left(\frac1{3\sqrt6}+o(1)\right)\sqrt{\frac N{\log N}}.}
$$

Thus the growth exponent 1/2 up to logarithmic factors is **already known by combining established results**. A meaningful advance must improve the logarithmic loss or approach the sharp leading constant.

The small-N verifier [P031_coprime_sidon.py](../../experiments/P031_coprime_sidon.py) checks the exact definition, with diagonal sums included.

## Prior-art gate

- [Erdős–Turán Sidon set upper bounds; modern review](https://mathworld.wolfram.com/SidonSet.html): classical sharp leading constant and constructions.
- [Bailleul–Riblet (2026), largest Sidon subset in any finite set of integers](https://arxiv.org/abs/2605.03181): direct bound for the prime subset; this reduction is **not** an original theorem.
- [Carter–O'Bryant–Tao (2026), Sidon diameter and distribution](https://arxiv.org/abs/2610.36207): contemporary refinements of the usual upper bounds.
- [Liu–Pach–Palincza primitive-set counting](https://doi.org/10.1017/S0963548321000018): separate multiplicative-antichain setting; pairwise coprime is stronger and the Sidon condition is different.

**Novelty risk:** search for studies explicitly named *coprime Sidon sets*, *Sidon sets of primes*, and additive combinatorics of multiplicative Sidon restrictions. A failure to find an exact title is not proof of novelty.

## Falsification

Seek a fixed δ>0 such that all pairwise-coprime Sidon sets have size ≤(1−δ)√N infinitely often, or give a construction of size (1−o(1))√N. A random or greedy lower bound that merely recovers √(N/log N) is not a resolution.
