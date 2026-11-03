# A half-dimensional simultaneous four-point Sidon set

Let $A=\mathbb F_2[[T]]$ and $\mathbb F_4=\mathbb F_2(\alpha)$, where $\alpha^2+\alpha+1=0$. Let $R=\mathbb F_4[[T]]$. For $x\ne y$ set $d_R(x,y)=4^{-v_T(x-y)}$.

**Proposition.** The set

$$
P=\{f(x)=x+\alpha x^3:x\in T+T^2A\}\subset R
$$

is compact, perfect, has Hausdorff dimension $1/2$, and contains no four pairwise distinct elements $a,b,c,d$ satisfying either $a+b=c+d$ or $ab=cd$.

**Proof.** Write $B=T+T^2A$. It is a compact perfect coset of the ideal $T^2A$; every $x\in B$ is nonzero. The decomposition $R=A\oplus\alpha A$ is unique. Moreover,

$$
f(x)+f(y)=(x+y)+\alpha(x^3+y^3),
$$

and $x^3+y^3$ is divisible by $x+y$. Consequently

$$
v_T(f(x)-f(y))=v_T(x-y),
$$

so $f$ is an isometry from $B$ into $R$. At level $T^n$, $n\ge2$, the set $B$ has exactly $2^{n-2}$ residue classes of diameter $4^{-n}$. The uniform measure on $B$ gives these classes mass $2^{-(n-2)}$. The elementary covering and mass-distribution bounds therefore give $\dim_H P=\log_4 2=1/2$. Compactness and perfection follow. More precisely, push forward the uniform probability measure on $B$ under $f$. For each $x\in B$ and integer $n\ge2$, the closed ball of radius $4^{-n}$ about $f(x)$ has measure

$
\mu\bigl(\overline B_R(f(x),4^{-n})\bigr)=2^{-(n-2)}=4(4^{-n})^{1/2}.
$

Comparison with neighboring discrete radii shows that $P$ is $1/2$-Ahlfors regular. In particular, $0<\mathcal H^{1/2}(P)<\infty$.

For distinct $x,y\in B$, put $s=x+y\ne0$ and $u=xy\ne0$. In characteristic two,

$$
f(x)+f(y)=s+\alpha(s^3+us).
$$

The two coefficients determine $s$, and then $u$. The unordered pair $\{x,y\}$ is the root multiset of $Z^2+sZ+u$, so it is uniquely determined by its image sum.

For products, use $\alpha^2=\alpha+1$ to obtain

$$
f(x)f(y)=(u+u^3)+\alpha(us^2+u^3).
$$

The map $u\mapsto u+u^3$ is injective on $T^2A$: if $u+u^3=v+v^3$, then

$$
(u+v)(1+u^2+uv+v^2)=0.
$$

The second factor is a unit, since its constant term is $1$. Hence $u=v$. Equality of the second coefficients now gives $u(s^2+t^2)=0$. Since $u\ne0$ and Frobenius is injective on the integral domain $A$, one obtains $s=t$. The unordered pair is again determined by its sum and product $s,u$. Thus both maps on unordered distinct pairs are injective, proving the assertion. $\square$

The construction is a finite-extension analogue of the familiar characteristic-two cubic Sidon graph. Historical originality of this particular simultaneous property has not been established.
