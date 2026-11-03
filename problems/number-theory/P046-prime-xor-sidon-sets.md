# P046 — Sidon sets of primes under binary XOR

<!-- DOSSIER-SUMMARY -->
> **Research question:** Can the primes in every sufficiently large dyadic interval contain an XOR-Sidon subset of size at least a constant times the square root of the interval length?  
> **Formulation:** candidate. **Novelty:** unverified; binary Sidon sets and APN functions are classical, prime-restricted extremal size needs comparison.  
> **Verified/known progress:** Internally proved 2^(m/2)/m << s_m <= 2^(m/2)+O(1) for primes in [2^m,2^(m+1)).  
> **Finite evidence:** Finite XOR Sidon/APN constructions and exhaustive translate-intersection checks for small m.  
> **Symbolic prize:** Five small beers — A constant-factor square-root lower bound for XOR-Sidon sets of primes in all sufficiently large dyadic intervals.; One small beer — An improvement of the current 1/m factor in the dyadic XOR-Sidon lower bound.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

Let $s_m$ be the maximum cardinality of a set $A$ of primes in $[2^m,2^{m+1})$ such that no four distinct members satisfy

$$
a\oplus b\oplus c\oplus d=0,
$$

where $\oplus$ denotes bitwise XOR.

**Question.** Is $s_m\gg 2^{m/2}$?

## Known results

The [supporting theorem](../../theorems/P046-xor-sidon-prime-intervals.md) establishes

$$
\frac{2^{m/2}}m\ll s_m\le2^{m/2}+O(1).
$$

The upper bound is the classical pair-counting inequality in $\mathbb F_2^{m-1}$. The lower bound translates a known APN-function Sidon set into a prime-rich position, then applies the prime number theorem. Thus $\log_2 s_m=(1/2+o(1))m$ is already proved, while the remaining logarithmic factor is unresolved here.

## Related literature

The unrestricted binary Sidon problem and its APN constructions are well established; see [Czerwinski–Pott (2026)](https://doi.org/10.1016/j.jcta.2025.106129) and [binary Sidon and nonlinearity (2025)](https://doi.org/10.1016/j.jcta.2024.106001). This problem imposes **primality** in each dyadic interval. The [finite verifier](../../experiments/P046_prime_xor_sidon.py) checks the elementary construction on small instances. Historical originality and unresolved status of the stronger lower bound are not certified.
