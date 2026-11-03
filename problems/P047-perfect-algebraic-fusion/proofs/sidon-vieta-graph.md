# The Vieta graph of a perfect Sidon set

Let $R=\mathbb F_4[[T]]$, with absolute value $|x|=4^{-v_T(x)}$. A subset $P\subset R$ is *four-point additive Sidon* if $a+b\ne c+d$ for every four pairwise distinct members of $P$.

For a compact such $P$, put

$$
S_P=\{a+b:a,b\in P,\ a\ne b\}.
$$

Cancellation shows that every $s\in S_P$ has a unique representation by an unordered distinct pair. Define

$$
F_P:S_P\to R,\qquad F_P(a+b)=ab.
$$

**Proposition.** If $s=\dim_H P>0$, the graph $\Gamma_P$ of $F_P$ satisfies

$$
\dim_H\Gamma_P=\dim_H(P\times P)\ge 2s,
$$

where $P\times P$ carries the maximum product metric and $R^2$ the maximum coordinate metric. In particular, if $F_P$ is $\alpha$-Hölder for $0<\alpha\le1$, then

$$
2s\le\frac1\alpha.
$$

Thus a four-point additive Sidon set of dimension $s>1/2$ cannot have a locally Lipschitz pair-sum-to-product map. If $s=1$, this map cannot be $\alpha$-Hölder for any $\alpha>1/2$.

**Proof.** Let

$$
V(a,b)=(a+b,ab)
$$

and let $D=\{(a,a):a\in P\}$ be the diagonal. The map $V$ takes $(P\times P)\setminus D$ onto $\Gamma_P$. It is globally Lipschitz since $P\subset R$.

To prove local bi-Lipschitzness, fix $(a,b)$ with $a\ne b$, and write $\delta=|a-b|>0$. Restrict both variables to sufficiently small balls about $a$ and $b$, of radius strictly less than $\delta$. For two ordered pairs $(x,y),(x',y')$ in this product neighborhood, put $\Delta s=x'+y'-(x+y)$ and $\Delta u=x'y'-xy$. Since the characteristic is two,

$$
\Delta u+x\Delta s=(x'-x)(x+y'),\qquad
\Delta u+y\Delta s=(y'-y)(x'+y).
$$

The ultrametric inequality gives $|x+y'|=|x'+y|=\delta$. As $|x|,|y|\le1$, it follows that

$$
\max(|x'-x|,|y'-y|)
\le \delta^{-1}\max(|\Delta s|,|\Delta u|).
$$

The opposite inequality holds with constant one by the Lipschitzness of $V$. Hence $V$ is bi-Lipschitz on each such small neighborhood. Second countability gives a countable covering of the off-diagonal domain by these neighborhoods. Therefore

$$
\dim_H\Gamma_P=\dim_H((P\times P)\setminus D).
$$

The standard product lower bound $\dim_H(P\times P)\ge2\dim_H P=2s$ follows, for example, by taking products of Frostman measures with exponent arbitrarily close to $s$. The diagonal has dimension $s$, whereas the product has dimension at least $2s>s$. Removing the diagonal therefore preserves product dimension and proves the equality above.

If $F_P$ is $\alpha$-Hölder, the graph embedding $t\mapsto(t,F_P(t))$ from $S_P\subset R$ to $R^2$ is also $\alpha$-Hölder, since $S_P$ is bounded. Hence

$$
\dim_H\Gamma_P\le\frac{\dim_H S_P}{\alpha}\le\frac1\alpha.
$$

Finally, a locally Lipschitz map on the separable metric domain $S_P$ has a countable cover by Lipschitz restrictions. Its graph therefore has Hausdorff dimension at most one. This contradicts $\dim_H\Gamma_P\ge2s>1$ when $s>1/2$. $\square$

**Further consequence.** If $P$ is also four-point multiplicative Sidon and contains no zero, the map $F_P:S_P\to\{ab:a,b\in P,\ a\ne b\}$ is bijective. The same graph-dimension obstruction applies to Hölder regularity of its inverse (viewed as a map from product values to pair sums).

The proposition is a regularity obstruction, not an upper bound for $\dim_H P$. A higher-dimensional construction must allow a sufficiently irregular correspondence between pair sums and pair products. No priority claim is made for the elementary Vieta-map argument.
