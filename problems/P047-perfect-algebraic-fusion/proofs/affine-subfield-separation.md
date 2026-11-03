# Affine separation of additive and multiplicative collisions

**Lemma.** Let $L\subsetneq K$ be fields, let $S\subset L$ contain no four pairwise distinct elements $x,y,z,w$ with $x+y=z+w$, and choose $\lambda\in K\setminus L$. Then $P=\lambda+S$ contains no four pairwise distinct elements $a,b,c,d$ satisfying either $a+b=c+d$ or $ab=cd$.

**Proof.** Translation preserves the four-point additive condition. If instead

$$
(\lambda+x)(\lambda+y)=(\lambda+z)(\lambda+w)
$$

for pairwise distinct $x,y,z,w\in S$, then

$$
\lambda(x+y-z-w)=zw-xy.
$$

The additive Sidon hypothesis makes $x+y-z-w\ne0$. Both the numerator and denominator on the right are in $L$, so the equality implies $\lambda\in L$, a contradiction. $\square$

For $K=\mathbb F_4((T))$ and $L=\mathbb F_2((T))$, this gives a direct conceptual relation between the two Sidon conditions: any additive four-point Sidon set in $\mathbb F_2[[T]]$ becomes simultaneously additive and multiplicative Sidon after translation by $\alpha\in\mathbb F_4\setminus\mathbb F_2$. Since the metric induced from $K$ is the square of the usual binary local-field metric, its Hausdorff dimension in $K$ is half its dimension in $L$. The dimension-one additive-avoidance set supplied by Fraser's theorem therefore also gives a simultaneous avoiding set of dimension $1/2$ in $K$ (without an additional regularity assertion).

The elementary lemma does not settle the dimension-one question in P047. It is included as a structural explanation of the natural half-dimensional construction, not as a novelty claim.
