# P013 — Reconfiguration of Sidon sets in a random ambient set

<!-- DOSSIER-SUMMARY -->
> **Research question:** Can Sidon-set existence and feasible one-element-exchange connectivity have different transition regimes inside a random subset of [N]?  
> **Formulation:** candidate. **Novelty:** not certified; targeted literature comparison only.  
> **Verified/known progress:** Random Sidon decision phase behavior is known; feasible exchange components form a distinct proposed observable.  
> **Finite evidence:** k=2 degenerate connectivity checked conceptually; no large-case claim.  
> **Symbolic prize:** A small black coffee — A sequence of site probabilities where Sidon configurations exist with high probability but the exchange graph is disconnected with high probability.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

**Fields:** additive combinatorics, random discrete structures, reconfiguration  
**Research status:** candidate, unproved, not certified novel.

## Model

Choose a binomial random subset $W_N(q)\subseteq[N]$, retaining each integer independently with probability $q$.

Let $\mathsf{Sid}_{N,k}(W)$ be the family of **k-element Sidon sets** $A\subseteq W$, where Sidon means that every positive difference between two elements of $A$ occurs at most once (equivalently, unordered pair sums are distinct).

Define an exchange graph $\mathcal E_{N,k}(W)$ with this family as vertices. Join two states $A,B$ precisely when $|A\setminus B|=|B\setminus A|=1$.

## Main question

For scaling regimes $k=k(N)$, particularly $k$ approaching a nonzero fraction of $\sqrt N$, study the random variables

$$
X_{N,k}(q)=|\mathsf{Sid}_{N,k}(W_N(q))|,\qquad
C_{N,k}(q)=\mathrm{number\ of\ components\ of\ }\mathcal E_{N,k}(W_N(q)).
$$

**Can the appearance of Sidon states and the emergence of a single feasible exchange component occur at parametrically different scales of $q$?** Determine meaningful scaling limits and/or transition regimes when the expected number of states becomes large.

To avoid trivial conventions, condition on $X_{N,k}(q)\ge2$ when discussing connectivity. Neither this conditional event nor the connectedness of the state graph is assumed monotone in $q$.

## Structural implications

This asks whether a *randomly diluted arithmetic constraint space* can exhibit a fragmented phase, analogous to clustering in random constraint satisfaction and the solution geometry of hard-core models. The $q=1$ endpoint is the deterministic Sidon exchange problem P004. The random-site model may reveal an intrinsic **reconfiguration threshold** distinct from ordinary Sidon-set existence.

## Adversarial notes

When $k=2$, every two-element set is Sidon, and the exchange graph is a Johnson graph on the selected sites, hence connected whenever it is nonempty. This is a degenerate case, not evidence for higher-$k$ behavior.

A Sidon set cannot be arbitrarily close to $\sqrt N$ without strong global constraints; at high $k$, frozen isolated states or no states can dominate the ensemble. The problem should be studied with clear conditioning and fixed $k(N)$ regimes.

## Literature context

- Luque, Torre and Lacasa, [*Phase transitions in number theory: from the birthday problem to Sidon sets* (2013)](https://doi.org/10.1103/PhysRevE.88.052119), studies a random Sidon **decision** problem and statistical-physics phase behavior, **not** this graph of feasible exchanges.
- Dotú–Van Hentenryck, [*A Memetic Approach to Golomb Rulers* (2005)](https://cs.brown.edu/research/pubs/pdfs/2005/Dotu-2005-SHE.pdf), uses local mark changes in optimization but permits intermediate constraint violations.
- [P004](../number-theory/P004-sidon-exchange-connectivity.md) addresses the full ambient set $W=[N]$, not random availability.

The random Sidon model and the swap operation have separately appeared in the literature. A direct analysis of this **random feasible-state exchange graph** was not found in the targeted search. Broader random-constraint reconfiguration work may imply results, so no originality certificate is claimed.

## Initial falsification programme

1. Enumerate small random $W$ and exact size-$k$ Sidon states; compute component count.
2. Identify arithmetic cut/frozen-state invariants that survive random dilution.
3. Compare with random independent-set reconfiguration on the hypergraph of repeated-difference constraints.
4. Check known random hypergraph independent-set clustering/reconfiguration theory before making universal claims.
