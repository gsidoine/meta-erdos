# P018 — Conserved-XOR basis exchange and random matroid fibers

<!-- DOSSIER-SUMMARY -->
> **Research question:** What exchange size is necessary to connect vector-space bases with a fixed XOR total, and how does connectivity change under random deletion of available vectors?  
> **Formulation:** candidate. **Novelty:** apparent novelty (targeted audit).  
> **Verified/known progress:** Single-element moves cannot preserve XOR; two-exchange fibers are connected for all W at d=4 but can be disconnected at d=5.  
> **Finite evidence:** All 32,768 available sets at d=4 checked, plus explicit ten-vector d=5 counterexample with components 4 and 2.  
> **Symbolic prize:** One hundred grams of caviar — The least uniform exchange size connecting every feasible conserved-XOR basis fiber.  
> **Navigation:** [Full problem catalogue](../../README.md#problem-catalogue) · [Status and scope](../../README.md#status-and-scope) · [Literature and audits](../../README.md#literature-and-audits)
<!-- /DOSSIER-SUMMARY -->

**Area:** matroid theory, algebraic combinatorics, random discrete structures  
**Proposed:** 29 October 2026  
**Status:** open-ended structural question; priority not independently certified.

## A conservation law on matroid bases

For $d\ge2$, let $V_d=\mathbb F_2^d$ and fix a nonzero vector $s\in V_d$. Take a set $W\subseteq V_d\setminus\{0\}$ of available vectors. Define

$$
\mathcal B(W,s)=
\left\{B\subseteq W:
|B|=d,\ \mathrm{span}(B)=V_d,\
\bigoplus_{v\in B}v=s\right\}.
$$

Every $B\in\mathcal B(W,s)$ is an **unordered vector-space basis** with the same XOR total. Define the exchange graph $\mathcal X_2(W,s)$ on this family by connecting $B$ and $B'$ precisely when $|B\setminus B'|=|B'\setminus B|=2$.

A single-element replacement cannot preserve the XOR unless the new vector equals the deleted vector, so a simultaneous **two-element** exchange is the first possible nontrivial move.

**P018 (structural part).** Classify which vector sets $W$ have a connected $\mathcal X_2(W,s)$ whenever at least two bases with total XOR $s$ exist. More generally, for $t\ge2$, let $\mathcal X_{\le t}(W,s)$ allow exchanges replacing between 2 and $t$ basis elements. What is the least universal $t=t(d)$ such that $\mathcal X_{\le t}(W,s)$ is connected for every $W$ and every nonzero $s$ with $|\mathcal B(W,s)|\ge2$? Is $\sup_d t(d)$ finite?

**P018 (probabilistic part).** If every nonzero vector is independently included in $W_d(p)$ with probability $p$, study the conditional probability

$$
\Pr\left(
\mathcal X_2(W_d(p),s)\text{ is connected}
\ \middle|\ |\mathcal B(W_d(p),s)|\ge2
\right).
$$

Does the emergence of multiple conserved-sum bases separate from the emergence of a single exchange component? No conventional monotone threshold is assumed: adding vectors may create previously inaccessible new bases.

The nonzero restriction on $s$ is essential. XORing all $d$ independent basis vectors can **never** give zero, since that would be a nontrivial linear dependence.

## Exact finite falsification: dimension four versus five

**Dimension four.** Up to linear automorphism all nonzero labels $s$ are equivalent. For $s=1$, there are **56** unordered bases of the full $\mathbb F_2^4$ with the prescribed XOR. A full enumeration over all $2^{15}=32,768$ possible $W\subseteq\mathbb F_2^4\setminus\{0\}$ found **no disconnected nontrivial fiber**. This establishes a finite assertion by exhaustive computation, not a published conceptual proof.

**Dimension five.** Identify vectors with their positive integer binary encodings. Set

$$
W=\{2,5,8,11,21,22,24,26,27,30\},\qquad s=1.
$$

There are **exactly six** XOR-$1$ bases contained in $W$. The two-exchange graph splits into components

$$
\begin{aligned}
\mathcal C_1={}&\bigl\{
\{2,5,8,21,27\},
\{2,5,8,22,24\},\\
&\{2,5,11,21,24\},
\{2,5,11,22,27\}
\bigr\},\\
\mathcal C_2={}&\bigl\{
\{8,21,24,26,30\},
\{11,22,24,26,30\}
\bigr\}.
\end{aligned}
$$

Both components contain valid full-rank bases with identical XOR sum $1$. **No edge joins the two components**, because no pair of bases from different components shares three vectors. This is a genuine negative result: *two-element conservative exchange is not universally sufficient*.

**Sharper exact finite conclusion (independently checked, 29 October 2026).** Although the two-exchange fiber has two components, exchanges replacing **at most three** vectors connect all six bases. In particular,

$$
\{2,5,8,21,27\}\longrightarrow\{8,21,24,26,30\}
$$

is a valid **three-vector** exchange across the components: the bases have XOR $1$ and share exactly the vectors $8$ and $21$. Hence the least exchange size connecting **this specific restricted fiber** is exactly $3$. This does not imply $t(5)=3$ universally over all $W$.

These facts were obtained independently before writing the reproducer, which is [`experiments/P018_conserved_xor_bases.py`](../../experiments/P018_conserved_xor_bases.py).

### Exact exchange distance of the displayed six-basis example

Of the six bases listed above, every pair of bases in opposite two-exchange components requires replacing **at least 3** vectors, and some opposite-component pairs differ by **exactly 3** vectors. Since each two-exchange component is internally connected, permitting replacements of **up to 3** basis vectors reconnects this particular fiber. Its minimum connecting exchange size is therefore **exactly 3**.

This is a finite statement **only for the displayed ten-vector $W$**, not a claim that three-exchange connectivity holds for every available set in dimension 5.
See the [second-pass source/obstruction audit](../../audits/2026-10-29-P008-P015-P018-P020-source-obstruction-pass.md) for the independent check and caveats.

## Structural significance

Ordinary bases of a matroid are connected under one-element exchange. Imposing a conserved group label removes that classical connectivity guarantee. This problem asks for the **local move complexity of algebraic conservation laws** on solution spaces.

A solution could lead to a characterization of when small moves suffice, obstructions analogous to Markov-basis degrees in algebraic statistics, or a random phase diagram for the transition from feasible bases to a connected space of feasible bases.

The dimension-five obstruction makes the program materially different from a conjecture that "everything is connected." The main question concerns the **minimum larger move set and its structural classification**.

## Mandatory prior art

- **Hörsch, Imolay, Mizutani, Oki, Schwarcz**, [*Problems on Group-labeled Matroid Bases* (2024)](https://arxiv.org/abs/2402.16259): precisely the general **group-label-sum constraint on matroid bases**, with algorithms and proximity results. The concept of constrained bases **is not original to this project**; their published questions do not evidently give the two-replacement fiber component classification for the special vector-as-label model.
- [*Towards the Proximity Conjecture on Group-Labeled Matroids* (ICALP 2025)](https://doi.org/10.4230/LIPIcs.ICALP.2025.85): proximity of label-avoiding bases under exchanges; not automatically connectivity of *one fixed sum fiber* using only intermediate bases of the same sum.
- **Lubiw and Pathak**, [*Reconfiguring Ordered Bases of a Matroid* (2016)](https://arxiv.org/abs/1612.00958): base exchange with **position labels**, a different labeling constraint.
- [*Reconfiguration of basis pairs in regular matroids* (2026)](https://doi.org/10.1016/j.jctb.2025.10.009): White's conjecture, symmetric exchanges between **two bases**, and toric-ideal generators. The states considered here are **one basis with fixed vector XOR**, but this is a serious conceptual near-predecessor.

**Novelty classification:** exact constrained fiber question and exhibited d=5 obstruction appear distinct in the targeted sources, but may follow from algebraic statistics/toric ideals of binary matroids. No claim of newness or unresolved status without expert source-level audit.

## Adversarial next questions

1. Can the dimension-four exhaustive result be reduced to a short intrinsic theorem (rather than enumeration)?
2. Does a constant exchange size $t$ connect *every* nonempty fixed-XOR basis fiber in all dimensions? If not, give explicit growing lower bounds.
3. Is the random connectivity event highly nonmonotone? Locate meaningful conditional phases rather than asserting an increasing-event threshold.
4. Compare with Markov bases of **linear codes** and binary matroid toric ideals before claiming original methodology.
