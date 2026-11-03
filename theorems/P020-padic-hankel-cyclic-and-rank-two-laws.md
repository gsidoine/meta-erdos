# Exact cyclic and two-generator cokernel laws for Haar p-adic Hankel matrices

**Research status (29 October 2026): internally proved, targeted literature comparison only.** This is a theorem note supporting [P020](../problems/number-theory/P020-random-hankel-padic-cokernels.md), **not** a certified-original publication or a proof of the full limiting distribution. The mod-p Hankel rank law used here is classical (Dwivedi–Grinberg and earlier authors). The new-to-this-project content is an explicit *conditional lifting argument* and its group probabilities, not the rank enumeration.

## Setup

Fix a prime $p$. For $n\ge1$, let

$$
H_n=(X_{i+j})_{0\le i,j<n},\qquad
X_0,\ldots,X_{2n-2}\stackrel{\mathrm{iid}}{\sim}\mathrm{Haar}(\mathbb Z_p),\qquad
C_n=\mathrm{coker}_{\mathbb Z_p}H_n.
$$

Almost surely $C_n$ is finite. Write $\nu_p(G)=\dim_{\mathbb F_p}(G/pG)$, the minimum number of generators.

The **known** finite-field Hankel count yields, for $1\le k\le n$,

$$
\Pr(\mathrm{corank}(\bar H_n)\ge k)=p^{-(2k-1)}.
$$

Thus for $n\ge3$, the probability of $k=0,1,2,\ge3$ generators is respectively

$$
1-p^{-1},\quad \rho_1=p^{-1}-p^{-3},\quad
\rho_2=p^{-3}-p^{-5},\quad p^{-5}.
$$

The exact $\rho_2$ at $n=2$ is instead $p^{-3}$.

## Theorem 1: complete cyclic probabilities

For every $n\ge2$ and $j\ge1$,

$$
\boxed{\Pr(C_n\simeq\mathbb Z/p^j\mathbb Z)
=(p^{-1}-p^{-3})(1-p^{-1})p^{-(j-1)}
=(1-p^{-1})(1-p^{-2})p^{-j}.}
$$

Also $\Pr(C_n=0)=1-p^{-1}$. For $n=1$, the different one-entry formula is $\Pr(C_1\simeq\mathbb Z/p^j)=(1-p^{-1})p^{-j}$.

## Theorem 2: full law of groups with exactly two generators

For every $n\ge3$ and $1\le a\le b$, put $\rho_2=p^{-3}-p^{-5}$. Then

$$
\boxed{
\Pr\!\left(C_n\simeq\mathbb Z/p^a\mathbb Z\oplus\mathbb Z/p^b\mathbb Z\right)
=\begin{cases}
\rho_2\,p^{-3(a-1)}(1-p^{-1}),&b=a,\\[2mm]
\rho_2\,p^{-3(a-1)}(p^{-1}-p^{-3})(1-p^{-1})p^{-(b-a-1)},&b>a.
\end{cases}}
$$

For $n=2$ the same conditional formula holds after replacing $\rho_2$ by $p^{-3}$.

**Corollary (exact stable mass).** Every individual finite abelian $p$-group with $\le2$ generators has an $n$-independent probability for all $n\ge3$. The mass of these groups is exactly $1-p^{-5}$. Consequently, for **any** $m,n\ge3$,

$$
d_{\mathrm{TV}}(\mathcal L(C_n),\mathcal L(C_m))\le p^{-5}.
$$

This **does not establish convergence**: the residual $p^{-5}$ probability on $\ge3$-generator groups might be redistributed with $n$.

### The key lifting lemma

**Lemma.** Fix any residue vector $\bar x\in\mathbb F_p^{2n-1}$ for which the corresponding symmetric Hankel matrix $\bar H$ has corank $k\in\{1,2\}$. Conditional on $X_i\bmod p=\bar x_i$, the cokernel of $H_n$ has the distribution of $\mathrm{coker}(pS_k)$, where $S_k$ is Haar-uniform on symmetric $k\times k$ matrices over $\mathbb Z_p$. The distribution does not depend on $\bar x$.

**Proof.** Choose a constant $P\in\mathrm{GL}_n(\mathbb Z_p)$ whose last $k$ columns reduce to a basis $v_1,\ldots,v_k$ of the radical of the symmetric form $\bar H$, and whose first $n-k$ columns lift a complement. In block form,

$$
P^\top HP=\begin{pmatrix}A&B\\B^\top&D\end{pmatrix},
$$

where $A$ is invertible modulo $p$, while $B,D\equiv0\pmod p$. By elementary invertible congruences,

$$
\mathrm{coker}H\simeq\mathrm{coker}T,\qquad
T=D-B^\top A^{-1}B\in p\,\mathrm{Sym}_k(\mathbb Z_p).
$$

Fix integer representatives $x^{(0)}$ of the residue class and write $x=x^{(0)}+py$. Then $T/p$ is an integral $p$-adic analytic function of $y$. Its reduction modulo $p$ is an affine linear map whose component indexed by $i,j$ is the linear functional

$$
y\longmapsto \sum_{s=0}^{2n-2}y_s[z^s](f_i(z)f_j(z)),\qquad
f_i(z)=\sum_{\ell=0}^{n-1}(v_i)_\ell z^\ell.
$$

Indeed the correction $B^\top A^{-1}B$ is divisible by $p^2$, and variations of the fixed basis contribute no first-order term.

For $k=1$, the single polynomial $f_1^2$ is nonzero. For $k=2$, the three polynomials $f_1^2,f_1f_2,f_2^2$ are linearly independent over $\mathbb F_p$: otherwise $f_1/f_2$, which is nonconstant because $v_1,v_2$ are independent, would be algebraic over the constant field $\mathbb F_p$, an impossibility in $\mathbb F_p(z)$. This argument is valid also in characteristic $2$.

Hence the differential of $T/p$ with respect to the $2n-1$ coordinates $y_s$ is surjective modulo $p$ onto $\mathrm{Sym}_k(\mathbb F_p)$. Select $k(k+1)/2$ coordinates on which the corresponding square Jacobian minor is a unit. With all other coordinates fixed, the selected input-output map is of the form

$$
u\mapsto c+Lu+pR(u),\qquad L\in\mathrm{GL}_{k(k+1)/2}(\mathbb Z_p),
$$

where $R$ is integral $p$-adic analytic with Lipschitz constant at most one (this follows by expanding the invertible-block rational formulas in $p$-adically convergent power series). Hensel lifting shows this map is a measure-preserving bijection of $\mathbb Z_p^{k(k+1)/2}$. Therefore $T/p$ is exactly Haar-uniform on $\mathrm{Sym}_k(\mathbb Z_p)$. The block elimination establishes the claim. $\square$

### Proof of Theorem 1

The mod-$p$ corank must be $1$, whose probability for $n\ge2$ is $\rho_1=p^{-1}-p^{-3}$. Given that event, the lemma makes the sole nonunit Smith entry equal to $pU$, with $U$ Haar-uniform in $\mathbb Z_p$. Therefore
$\Pr(v_p(pU)=j)=(1-p^{-1})p^{-(j-1)}$, as claimed. $\square$

### Proof of Theorem 2

The mod-$p$ corank must be $2$, which has probability $\rho_2$ for $n\ge3$. By the lemma, the two nonunit Smith factors are those of $pS$, where

$$
S=\begin{pmatrix}u&v\\v&w\end{pmatrix}
$$

has three independent Haar-uniform entries.

The reduction of $S$ modulo $p$ has rank $2,1,0$ with probabilities $1-p^{-1},\,p^{-1}-p^{-3},\,p^{-3}$, respectively: the determinant $uw-v^2$ vanishes for exactly $p^2$ of the $p^3$ triples, and the zero matrix is a single triple.

If the rank is $2$, both exponents of $S$ are zero. If the rank is $1$, exactly one exponent is zero; the other has geometric distribution $(1-p^{-1})p^{-(j-1)}$, by the $k=1$ lifting argument (or by the unit gradient of $uw-v^2$ at a nonzero singular symmetric matrix). If the rank is $0$, then $S=pS'$ where $S'$ is an independent Haar symmetric $2\times2$ matrix. Repeating this branch $a-1$ times gives factor $p^{-3(a-1)}$, then taking either rank $2$ or rank $1$ with second exponent $b-a$ gives exactly the displayed cases. $\square$

## Exact independent finite checks

A dependency-free verification script, [P020 mod-prime-power checks](../experiments/P020_padic_rank_two_lifts.py), exhausts $(\mathbb Z/p^2)^{2n-1}$, checks the prescribed Smith-rank events by integral modular elimination, and (optionally) exhausts modulo $p^3$.

| $p,n$ | $C_n\simeq(\mathbb Z/p)^2$ | Theory | Exact enumerator |
|---|---:|---:|---:|
| $2,3$ | 48/1024 | 0.046875 | 0.046875 |
| $2,4$ | 768/16384 | 0.046875 | 0.046875 |
| $3,3$ | 1296/59049 | 0.0219478738 | 0.0219478738 |

At $p=2,n=3$, exhaustive enumeration of all $8^5=32768$ Hankel matrices modulo $8$ also gives exactly $576$ of type $(p,p^2)$ and $192$ of type $(p^2,p^2)$, in agreement with the two-generator formula. The same enumeration gives the predicted geometric determinant-valuation bins for corank-one residues.

## Prior-art boundary and unresolved work

1. **The finite-field rank formula is classical**: [Dwivedi–Grinberg, *On the rank of Hankel matrices over finite fields*](https://doi.org/10.1016/j.laa.2022.02.014), Theorem 1.1 and references to Daykin/Elkies/García Armas–Ghorpade–Ram. This is an established result, not a contribution of this collection.
2. The general **p-adic Smith-form / cokernel setting is established**, including [Wang–Stanley (2017)](https://doi.org/10.1137/16M1098140), [Wood (2019)](https://doi.org/10.1353/ajm.2019.0008), [Van Peski (2024)](https://doi.org/10.1112/plms.12626), and [Cheong–Kaplan (2022)](https://doi.org/10.1016/j.jalgebra.2022.03.035). Those cited results do **not**, in the source material reviewed, state these specific Haar-Hankel rank-two formulas. This is a **bounded negative search**, not novelty certification.
3. For a mod-$p$ kernel of dimension $k\ge3$, the products $f_if_j$ need **not** be independent. For example, on $\mathrm{span}\{1,z,z^2\}$ there is the relation $z^2\cdot1=z\cdot z$. Therefore the surjective-Jacobian argument above **does not extend automatically to $k\ge3$**.
4. Finite computations at $p=2$, $n=2,\ldots,6$ found that the first-order image for every Hankel kernel of corank $k$ has dimension $2k-1$ and, after a polynomial-basis change, the apparent nondegenerate fraction is $1-p^{-1}$. This is **an experimental pattern**, not a proved universal recursion. In particular, higher-order nonlinear corrections can prevent a Haar-Hankel conditional law.
5. The full P020 question—existence, tightness and explicit formula for all finite $p$-groups—**remains unsolved**. The $1-p^{-5}$ exact mass and total-variation bound are significant but cannot by themselves establish the remaining limit.
