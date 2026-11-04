# P040 — The exact finite-prime threshold for two coordinates

Let $P$ be a finite set of odd primes, and let $\mu_P$, $m_P$,
$Q_P$ and $R_P$ be the product measure, mass, conditional disjointness
probability, and two-profile deletion cost defined in
[the fractional sieve theorem](P040-fractional-sieve-variational.md).
Write

$$
\alpha(P)=
\inf_{\substack{f,g:2^P\to[0,1]\\m_P(f)+m_P(g)>1}}R_P(f,g).
$$

The infimum is over **fractional**, possibly asymmetric profiles.

## Theorem — Two-prime classification

For every set $P$ containing at most two distinct odd primes,

$$
\boxed{
\alpha(P)=
\begin{cases}
4/9,&P=\{3,5\},\\
1/2,&P\ne\{3,5\}.
\end{cases}
}
$$

In particular, using the previously proved three-prime theorem,

$$
\alpha(\{3\})=\frac12,\qquad
\alpha(\{3,5\})=\frac49,\qquad
\alpha(\{3,5,7\})=\frac5{12}.
$$

These are three distinct **restricted finite-prime variational values**,
not lower bounds for the unrestricted coprime-matching resilience.

### Proof

For any finite $P$ the constant profiles $f=g=1/2+\delta$
have total mass greater than one and cost $1/2+\delta$.
Thus $\alpha(P)\le1/2$.

Suppose $P=\{p,q\}$ with odd primes $p<q$, and put

$$
a=\frac1p,\qquad b=\frac1q,\qquad
D=(1-a)(1-b)=\mu_P(\varnothing).
$$

One has $D\ge8/15>1/2$. Unless $\{p,q\}=\{3,5\}$,
one also has

$$
D\ge\frac{1+b}{2},
$$

because $q\ge7$ and $a\le1/3$.

**Case $P\ne\{3,5\}$.** Assume for contradiction that
$m_P(f)+m_P(g)>1$ and $R_P(f,g)\le1/2$.
If both profiles vanish at $\varnothing$, their total masses
are at most $2(1-D)<1$. Interchanging profiles if necessary,
assume $f(\varnothing)>0$. Then

$$
m_P(g)\le\frac12,\qquad m_P(f)>\frac12.
$$

In particular $g(\varnothing)=0$, since otherwise the reverse
conditional constraint forces $m_P(f)\le1/2$.
Therefore $m_P(g)\le1-D$, whence $m_P(f)>D$.

For every support $S$, the elementary inequality

$$
m_P(h)\le
1-\left(1-Q_P(h\mid S)\right)
\prod_{r\in S}\left(1-\frac1r\right)
$$

holds for $0\le h\le1$. If $g(\{q\})>0$, the constraint
$Q_P(f\mid\{q\})\le1/2$ would imply

$$
m_P(f)\le\frac{1+b}{2}\le D,
$$

a contradiction. Hence $g(\{q\})=0$, so $m_P(g)\le a$ and
$m_P(f)>1-a$.

If $g(\{p\})>0$, the analogous inequality gives

$$
m_P(f)\le\frac{1+a}{2}\le1-a,
$$

again a contradiction, since $a\le1/3$.
Consequently $m_P(g)\le ab$ and $m_P(f)>1-ab$.
As $m_P(f)\le1$, the strict mass condition forces
$g(\{p,q\})>0$. It follows that

$$
m_P(f)\le1-\frac{D}{2}<1-ab,
$$

because $D>2ab$ for $a\le1/3$ and $b\le1/5$.
This final contradiction proves $\alpha(P)\ge1/2$.

**Exceptional case $P=\{3,5\}$.**
Here the four support weights, in the order
$\varnothing,\{3\},\{5\},\{3,5\}$, are

$$
\left(\frac8{15},\frac4{15},\frac2{15},\frac1{15}\right).
$$

Suppose $m_P(f)+m_P(g)>1$ but $R_P(f,g)\le4/9$.
Again at least one profile selects $\varnothing$, since otherwise
the total mass is at most $14/15$.
Assume $f(\varnothing)>0$. Thus $m_P(g)\le4/9$ and
$m_P(f)>5/9$. Consequently $g(\varnothing)=0$.
If $g(\{5\})>0$, the preceding mass inequality applied
at $\{5\}$ gives $m_P(f)\le5/9$, a contradiction.
Therefore

$$
m_P(g)\le\frac5{15}=\frac13,
\qquad m_P(f)>\frac23.
$$

If $g(\{3\})>0$, the same inequality at $\{3\}$ yields
$m_P(f)\le17/27<2/3$. Thus $g(\{3\})=0$.
Now $m_P(g)\le1/15$, so $m_P(f)>14/15$.
The profile $g$ cannot vanish identically, hence
$g(\{3,5\})>0$. But then

$$
m_P(f)\le\frac{19}{27}<\frac{14}{15},
$$

the final contradiction. Hence every admissible pair has
$R_P(f,g)>4/9$.

For the reverse inequality, take the two profiles

$$
f=(0,1,5/6,1),\qquad
g=(1/6,1,1,1)
$$

in the displayed support order. Exact arithmetic gives

$$
m_P(f)=\frac49,\qquad
m_P(g)=\frac59,\qquad
R_P(f,g)=\frac49.
$$

Increasing $g(\varnothing)$ by $\delta>0$ raises the total
mass strictly above one and changes every conditional cost by
at most $\delta$. Therefore $\alpha(\{3,5\})\le4/9$.
The exceptional case is proved.

Finally, if $P$ is empty or consists of a single odd prime,
extend each profile to a two-prime space by adjoining enough new
odd-prime coordinates and ignoring them. This preserves both masses and all conditional costs,
so $\alpha(P)\ge\alpha(P\cup\{q\})=1/2$ for an appropriate
second prime $q$ with $P\cup\{q\}\ne\{3,5\}$.
The universal constant-profile upper bound gives equality.
$\square$

## Scope

This theorem identifies the first genuinely nontrivial
prime-support improvement over the universal $1/2$ cutoff.
The already established $5/12$ value for $\{3,5,7\}$
is smaller still. The full finite-prime infimum over
arbitrarily many primes, and the limiting resilience of
the arithmetic matching graph, remain unresolved.

The proof is elementary and self-contained; historical
originality relative to biased cross-intersecting-family
and product-measure extremal results is **not certified**.
