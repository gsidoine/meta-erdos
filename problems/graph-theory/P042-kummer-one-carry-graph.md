# P042 — Hamiltonian paths in one-carry graphs

<!-- DOSSIER-SUMMARY -->
> **Research question:** For every m>=4, does the graph on 1,...,2^m-1 joining a,b when v_2(binomial(a+b,a))=1 have a Hamiltonian path?  
> **Formulation:** candidate. **Novelty:** unverified; Kummer's theorem and digital carry combinatorics are classical, precise Hamiltonian question requires specialist review.  
> **Verified/known progress:** Internally proved connectivity for all m>=4, precisely two forced leaves, and |E|=((m+2)3^(m-2)-m)/2; Hamiltonicity remains open.  
> **Finite evidence:** Complete edge and connectivity checks for m=2..8; explicit Hamiltonian paths for m=4..8 checked against carries and binomial valuations.  
> **Symbolic prize:** One kilogram of bacon — Hamiltonian paths in every one-carry graph of dimension at least four, or an infinite obstruction family.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

For $m\ge2$, form the graph on $\{1,\ldots,2^m-1\}$, joining distinct $a,b$ if

$$
v_2\binom{a+b}{a}=1.
$$

By Kummer's theorem, the condition says that **adding $a$ and $b$ in binary produces exactly one carry**.

**Question.** Does this graph have a Hamiltonian path for every $m\ge4$?

## Known results

The [structural theorem](../../theorems/P042-kummer-one-carry-graph.md) establishes that the graph is connected for all $m\ge4$, has exactly two leaves, and has

$$
\frac{(m+2)3^{m-2}-m}{2}
$$

edges. Its only degree-one vertices are $2^{m-1}-1$ and $2^m-1$, necessarily the endpoints of any Hamiltonian path. In particular, a Hamiltonian *cycle* is impossible.

The cases $m=2,3$ are disconnected; complete paths are certified for $4\le m\le8$. The finite computation does not establish Hamiltonicity for every $m$.

## Computation

The [verifier](../../experiments/P042_kummer_carry_graph.py) checks the exact edge formula, connectivity, and degree-one vertices for $2\le m\le8$, plus complete Hamiltonian paths for $4\le m\le8$.

The longer paths are recorded in [machine-checkable form](../../experiments/P042_one_carry_hamiltonian_witnesses.json).

## Prior art

Kummer's theorem identifies $v_2\binom{a+b}{a}$ with the number of binary carries, and the zero-carry case is exactly disjointness of binary supports. These are classical facts, not new results. See A. Granville, *Arithmetic properties of binomial coefficients. I* (1997), [author's publication list](https://dms.umontreal.ca/~andrew/1997.php), and [Kummer's theorem](https://www.cecm.sfu.ca/organics/papers/granville/paper/binomial/html/node3-an.shtml).

The one-carry Hamiltonian problem has not been identified in the targeted searches. Historical novelty and unresolved status are **unverified**.
