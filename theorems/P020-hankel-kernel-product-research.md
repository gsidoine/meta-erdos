# P020 — Exact Hankel kernel-product structure (a corollary of existing finite-field theory)

**29 October 2026; mathematical status: proved using Yiasemides (2024), Theorem 2.4.4 and Remark 2.4.6.** The kernel classification itself and the finite-field rank laws are **previously published**, not original to this collection. The extension to first-order p-adic lifting and elementary abelian cokernels is treated separately in [the elementary-cokernel note](P020-elementary-abelian-cokernel-laws.md).

## Known finite-field kernel classification, specialized to square Hankel matrices

Let F be a finite field, and let

$$
H=(h_{i+j})_{0\le i,j<n}\in F^{n\times n},\qquad
k=\dim_F\ker H\ge1.
$$

Identify vectors $(v_0,\ldots,v_{n-1})$ with polynomials $f(z)=\sum_{i=0}^{n-1}v_i z^i$.

**Proposition (direct consequence of Yiasemides).** There is a nonzero polynomial $A(z)\in F[z]$ with degree at most $n-k$ such that

$$
\boxed{\ker H=\{A(z)B(z):B\in F[z],\ \deg B\le k-1\}.}\tag{1}
$$

**Derivation from the source.** In [Yiasemides, Theorem 2.4.4 and Remark 2.4.6](https://doi.org/10.1007/s40687-023-00418-7), the Hankel sequence has length parameter $m=2n-2$, its first characteristic degree is its middle rank $r=n-k$, and its second characteristic degree is $m-r+2=n+k$. In the article's notation, take the Hankel rectangle to be $n$ rows by $n$ columns (we use $n$ for the dimension and $m$ only for the sequence index, to avoid a clash with the source). Since the number of columns is $n$ and

$$
r=n-k<n<n+k,
$$

we are in the *middle* case of Remark 2.4.6: the second characteristic polynomial does not contribute, and the kernel consists exactly of multiples of the first polynomial by factors of degree at most $n-r-1=k-1$. The source's $k=0$ rank case is excluded here; if $H=0$, choose $A=1$. The polynomial $A$ is nonzero and satisfies the degree bound because its multiple $Az^{k-1}$ fits in the $n$ coefficient positions. This proves (1). No new finite-field kernel theorem is claimed.

## Exact product-space dimension for *every* finite-field square Hankel matrix

**Corollary.** With $V=\ker H$ as above, for every finite field and every $k\ge1$,

$$
\boxed{
\dim_F\mathrm{span}\{fg:f,g\in V\}=2k-1.
}\tag{2}
$$

**Proof.** Equation (1) gives $V=A F[z]_{\le k-1}$. The products span

$$
A^2F[z]_{\le2k-2},
$$

because every monomial $z^t$, $0\le t\le2k-2$, is a product $z^iz^j$ with $0\le i,j<k$. Multiplication by nonzero $A^2$ is injective in the polynomial ring, yielding dimension $2k-1$. $\square$

For context, the general inequality $\dim(V\cdot V)\ge 2k-1$ holds for **any** $k$-dimensional polynomial subspace: choose a basis $f_1,\ldots,f_k$ with strictly increasing degrees and note that the $2k-1$ products $f_1f_1,\ldots,f_1f_k,f_2f_k,\ldots,f_kf_k$ have distinct degrees. This inequality is elementary and not claimed new.

## What the equality means for p-adic lifting

For a Hankel matrix over $\mathbb Z_p$ whose reduction has corank $k$, choose kernel basis $A,Az,\ldots,Az^{k-1}$ over $\mathbb F_p$. The linearized first-order map from the $2n-1$ independent anti-diagonal perturbations to forms on the kernel has the $2k-1$ coefficient functionals of $A(z)^2z^t$ for $0\le t\le2k-2$. Thus, in the polynomial-shift basis, the first-order random form is **uniform among k-by-k Hankel forms**, not all symmetric forms when $k\ge3$. For $k=1,2$, the two form spaces coincide.

**Important:** this is a first-order mod-$p$ assertion. The Schur-complement correction may affect higher p-power invariants, so equation (2) **does not imply** the full conditional residual matrix is Haar p-adic Hankel at all orders. The exact consequence for elementary abelian cokernels is proved separately.

## Exact independent verification

The program [P020 kernel-product dimension](../experiments/P020_kernel_product_dimension.py) independently exhausts all binary Hankel matrices of sizes 3–6 and ternary Hankel matrices of sizes 3–5, recovers their kernels, and verifies equality (2) using finite-field rank elimination. These **checks support** the proof and are not its basis.

## Primary source / priority

[Yiasemides, *The variance and correlations of the divisor function in F_q[T], and Hankel matrices*, Research in the Mathematical Sciences 11 (2024), article 11, Theorem 2.4.4 and Remark 2.4.6](https://doi.org/10.1007/s40687-023-00418-7).

This is the closest source for the kernel assertion. **The classification is credited to the published article**, and the product equality is recorded as its elementary corollary. The remaining open part of P020 concerns complete higher-exponent group laws and a limit distribution for all finite abelian p-groups.
