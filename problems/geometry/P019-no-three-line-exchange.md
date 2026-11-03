# P019 — Reconfiguration complexity of optimal no-three-in-line sets

<!-- DOSSIER-SUMMARY -->
> **Research question:** Does a universal bound exist on the number of points that must be simultaneously replaced to connect all maximum-size no-three-in-line subsets of an n×n grid?  
> **Formulation:** candidate. **Novelty:** apparent novelty (targeted audit).  
> **Verified/known progress:** When the maximum size is 2n, single-point exchanges are impossible and two-point exchanges are rectangle switches.  
> **Finite evidence:** Exact optimal configuration exchange graphs through n=7; minimal connecting move sizes 2,4,3,5,6 for n=3,...,7.  
> **Symbolic prize:** A bottle of wine — A universal bound on simultaneous replacements in optimal no-three-in-line configurations, or a proof of unboundedness.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

**Area:** discrete geometry and reconfiguration theory  
**Proposed:** 29 October 2026  
**Status:** precise research question, not certified new or unresolved.

## Definition

Let $Q_n=\{0,\dots,n-1\}^2$, and let $m(n)$ be the largest possible cardinality of a subset $A\subseteq Q_n$ with no three distinct selected points collinear over $\mathbb R$. Define

$$
\mathcal O_n=\{A\subseteq Q_n:|A|=m(n),\ A\text{ contains no collinear triple}\}.
$$

For $t\ge1$, let $F_n^{(t)}$ be the graph on $\mathcal O_n$ joining distinct configurations $A,B$ whenever

$$
1\le |A\setminus B|=|B\setminus A|\le t.
$$

The **exchange-connectivity number** is

$$
\tau(n)=\min\{t:F_n^{(t)}\text{ is connected}\}.
$$

Set $\tau(n)=0$ if $\mathcal O_n$ consists of a single configuration.

**P019.** Is $\sup_n\tau(n)$ finite? If not, determine the correct order of $\tau(n)$, and characterize the geometric invariants or rigid components that obstruct small exchanges.

Unlike a conjecture conditional on $m(n)=2n$, this question is meaningful **for every $n$**, even if the classical upper bound $2n$ fails at large sizes.

## Elementary obstruction and exact finite evidence

**Lemma.** If $m(n)=2n$, then no one-point replacement connects two different configurations. Moreover, a nontrivial two-point replacement preserving cardinality and validity must exchange opposite corners of a $2\times2$ rectangle in the **row–column incidence matrix** (the four grid corners need not make a literal unit square).

**Proof.** Since each row and column contains at most two chosen points, any valid $2n$-point configuration has exactly two chosen points in **every** row and column. Replacing one point would have to preserve both its row count and column count, forcing the replacement to occupy its original row **and** original column, hence to be the same point. For a two-point replacement, the multiset of occupied rows and columns of the two removed points must agree with those of the two added points. If the two removed points share a row or column, no distinct replacement respecting both marginals exists. Otherwise their rows and columns can only be recombined by the crossed pairing, i.e. a rectangle switch. The no-three-collinear constraint further restricts which switches are legal. $\square$

Exhaustive finite enumeration gives the following results (distinct **labeled**, not symmetry-quotiented, configurations). All tested $n$ satisfy the previously known $m(n)=2n$.

| $n$ | Number of $2n$-point solutions | Components for at-most-two exchanges | Minimum connecting $t=\tau(n)$ |
|---:|---:|---:|---:|
| 3 | 2 | 1 | 2 |
| 4 | 11 | 7 | 4 |
| 5 | 32 | 12 | 3 |
| 6 | 50 | 46 | 5 |
| 7 | 132 | 92 | 6 |

These finite values show that the naive conjecture **“two switches connect all optimal sets” is already false at $n=4$**. They do **not** show that $\tau(n)$ tends to infinity.

The dependency-free [exact enumerator](../../experiments/P019_no_three_line_exchange.py) independently checks the collinearity determinant for every triple, enumerates two points per row with capacity two per column, builds the exchange graphs, and reports the component sizes and minimal $t$ for $n=3,\dots,7$.

## Why a solution could be structural

The classical no-three-in-line problem concerns **maximum size**. The question here concerns the *geometry of the entire optimum solution space*: can extremal configurations be connected by bounded coordinated changes, or are large-scale changes essential?

A bounded $\tau(n)$ would indicate surprising flexibility of extremal geometric arrangements. Unboundedness would give a quantitative notion of geometric rigidity, potentially leading to invariants that obstruct local rearrangements. Either outcome may connect integer-grid geometry with constrained combinatorial reconfiguration and higher-degree exchange moves.

## Historical overlap and novelty limitations

- **Guy and Kelly**, [*The No-Three-In-Line Problem* (1968)](https://doi.org/10.4153/CMB-1968-062-3), establish the classical context and enumerate small extremal configurations. **The extremal problem itself is not new.**
- **Prellberg**, [*Constraint satisfaction programming for the no-three-in-line problem* (2026/2027)](https://doi.org/10.1016/j.jcta.2026.106244), and [Flammenkamp's maintained database](https://wwwhomes.uni-bielefeld.de/achim/no3in/readme.html) contain current computational extremal solutions. They emphasize **existence and enumeration**, not the exchange-connectedness invariant $\tau(n)$ in their cited abstracts.
- [*The extensible No-Three-In-Line problem* (2023)](https://doi.org/10.1016/j.ejc.2023.103796) treats dense infinite-grid general-position sets, not reconfiguration of finite optimum configurations.

An accessible targeted search for *no-three-in-line reconfiguration*, *switching maximum no-three-in-line sets*, and *exchange graphs of general-position grid arrangements* did not find an exact earlier formulation. This does **not** certify novelty. Geometry reconfiguration and local-search papers require deeper full-text scrutiny.

## Research gate

Before an asymptotic conjecture is promoted, test larger $n$ with symmetry-aware enumeration; look for a universal intermediate-size connecting procedure, and determine whether the component structure has invariants beyond row/column counts. Distinguish **optimal cardinality** from **maximal under inclusion**; the present definition uses *maximum* configurations.
