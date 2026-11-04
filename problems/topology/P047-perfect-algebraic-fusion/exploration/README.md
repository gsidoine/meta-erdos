# Perfect-set fusion and a failed cardinal formulation

In the usual Banach–Mazur or Choquet game, nested neighborhoods retain at least one point. In a relational fusion construction, one instead builds a perfect tree with the property that every tuple of distinct branches avoids prescribed relations.

For $R=\mathbb F_4[[T]]$, the four-variable relations

$$
\mathcal R_+=\{(a,b,c,d):a+b=c+d\},\qquad
\mathcal R_\times=\{(a,b,c,d):ab=cd\}
$$

are closed and nowhere dense in $R^4$. The latter assertion follows because a nonzero polynomial over the infinite integral domain $R$ cannot vanish identically on a product of nonempty open residue balls. By Mycielski's theorem there is a perfect set avoiding both relations on tuples of distinct points. This is a known existence result.

The dimension-one problem asks for considerably more: quantitative control over the surviving perfect tree under simultaneous additive and multiplicative restrictions. The direct construction proves a Hausdorff-dimension lower bound of $1/2$.

## A rejected cardinal-invariant question

An initial possibility was to count forbidden XOR differences needed to meet the difference set of **every** perfect subset of $2^\mathbb N$. It has an exact, elementary resolution, so it is **not** recorded as an open problem.

**Proposition.** Let $G=2^\mathbb N$, with coordinatewise addition modulo two. If $D\subseteq G\setminus\{0\}$ and $|D|<2^{\aleph_0}$, there exists a closed perfect subgroup $H\subseteq G$ with $H\cap D=\varnothing$.

**Proof.** Identify $G$ additively with $A\times A$, where $A=\mathbb F_2[[T]]$. For each $t\in A$, set

$$
H_t=\{(x,tx):x\in A\}.
$$

Every $H_t$ is a closed perfect additive subgroup. If $s\ne t$, then $H_s\cap H_t=\{(0,0)\}$, because $A$ is an integral domain. There are $2^{\aleph_0}$ distinct parameters, and each nonzero element of $G$ belongs to at most one $H_t$. Consequently fewer than $2^{\aleph_0}$ forbidden nonzero elements cannot meet all of the $H_t$. $\square$

Thus the least cardinality of a set meeting the nonzero difference set of every perfect subset of $G$ is exactly $2^{\aleph_0}$. No conjecture about its equality with a smaller Baire covering invariant survives.

This example shows why a purely cardinal version of perfect-set fusion is too weak for the proposed problem. The quantitative issue must constrain the size of the surviving perfect set beyond its cardinality.
