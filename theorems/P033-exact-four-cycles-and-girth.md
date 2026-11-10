# P033 — Exact four-cycle count and girth dichotomy for prime-sum palettes

**Status:** internally proved, elementary structural theorem. Historical originality has **not** been established; this is an additive-reflection identity and should not be represented as a new general technique. The independent [all-order connectivity theorem](P033-universal-three-prime-sum-connectivity.md) is established separately.

## Theorem — exact four-cycle count

Let `n >= 3` and let `p<q<n<r` be three distinct **odd positive integers**. Let `G_n(p,q,r)` be the graph on `[n]` with distinct vertices adjacent when their sum is in `{p,q,r}`.

Then the number `c_4(G_n(p,q,r))` of (unoriented, unrooted) simple 4-cycles is **exactly**

$$
\boxed{c_4(G_n(p,q,r))=
\begin{cases}
(p-1)/2,&p+r=2q,\\
0,&p+r\ne2q.
\end{cases}}
$$

Thus the presence of a four-cycle is **equivalent** to the three edge-sum labels forming an arithmetic progression. The count is independent of `n` and `r` once the displayed inequalities and progression relation hold.

### Proof: necessity

Every sum edge joins vertices of opposite parity, so the graph is bipartite and has no odd cycles.

Let `x_0,x_1,x_2,x_3,x_0` be any 4-cycle and set `s_i=x_{i-1}+x_i` for `i=1,2,3,4` (indices modulo 4). The alternating-sum identity gives

$$
s_1+s_3=s_2+s_4.
$$

Adjacent edge sums are different: at a given vertex, specifying a sum `s` uniquely determines the other endpoint `s-x`; a simple cycle cannot use the same sum on its two incident edges.

If `s_1=s_3` then the equality requires `s_2=s_4=s_1` or `s_2,s_4` distinct with average `s_1`. The first alternative is forbidden by adjacency. If `s_1\ne s_3`, with only three available values, one can similarly enumerate the possible multiset equalities. A simpler direct argument is to set `s_1,s_2,s_3,s_4` as a closed walk of length four on the three labels with adjacent labels distinct. If only two labels appear, the sequence alternates them and the alternating-sum identity forces the two labels to coincide, a contradiction. If all three appear, the repeated label must be on opposite edges, and the equality says twice that label equals the sum of the other two. Therefore `2q=p+r`, and the repeated label is `q`.

### Proof: sufficiency and the exact enumeration

Suppose `p+r=2q`, put `d=q-p=r-q>0`, and note `d` is even. For every **odd** `x` with `1<=x<=p-1`, consider

$$
\boxed{x,\quad p-x,\quad x+d,\quad q-x,\quad x.}
$$

Its four edge sums, in cyclic order, are `p,q,r,q`. The four vertices are distinct (the two odd vertices differ by `d>0`; the two even vertices differ by `d>0`, and opposite parity precludes other coincidences). They lie in `[n]`:

- `1<=x<=p-1`;
- `1<=p-x<=p-1<n`;
- `x+d<=p-1+q-p=q-1<n`;
- `1<=q-x<=q-1<n`.

This gives `(p-1)/2` distinct 4-cycles. Conversely, the necessity analysis shows every 4-cycle has the color pattern `p,q,r,q` (up to rotation and reversal). Its two odd vertices differ by `d`. If `x` is the **smaller odd vertex**, its adjacent even vertices must be `p-x` and `q-x` (the other odd vertex is `x+d`), so `1<=x<=p-1`. Hence every four-cycle is represented by exactly one displayed odd `x`. QED.

## Corollary — girth of sufficiently central three-prime palettes

Suppose, in addition, that

$$
n-D\le p<q<n<r\le n+D,\qquad n\ge6D+5.
$$

Then [the explicit six-cycle construction](P033-linear-six-cycle-packing.md) guarantees a six-cycle. The graph is bipartite. Thus its girth is

$$
\boxed{\mathrm{girth}(G_n(p,q,r))=
\begin{cases}
4,&p+r=2q,\\
6,&p+r\ne2q.
\end{cases}}
$$

**In particular, for three odd primes**, the arithmetic-progression branch is very rare in a striking elementary sense: an arithmetic progression of three odd primes has a middle prime `q` and common difference divisible by 6 whenever `p>3` (the three primes would otherwise cover a multiple of 3). This divisibility does not prevent progression triples from existing, e.g. `5,11,17`.

## Exact computational audit

A dependency-free brute-force check independently counted all 4-cycles by summing $\binom{|N(u)\cap N(v)|}{2}/2$ over unordered vertex pairs, for all `20<=n<100`, odd `p`, and even steps `2<=d<20` such that `p<q=p+d<n<r=p+2d`. Every instance had exactly `(p-1)/2` 4-cycles. A separate sweep for `15<=n<105` over near-n odd triples with `n>=6D+5` found the existence of a four-cycle equivalent to `p+r=2q`.

These are consistency checks only; the theorem is established by the direct symbolic proof above.

## Research and novelty boundary

The result is a structural **classification**, rather than an ingredient needed to prove the now-resolved connectivity statement. It requires no PNT, sieve argument, gcd-one hypothesis, or conjecture concerning prime gaps. The four-cycle count is exact even when the graph is disconnected; the girth conclusion does use the existing six-cycle theorem's near-n hypothesis.

The reflection identity and the additive relation $p+r=2q$ are elementary. The occurrence of this exact four-cycle formula in earlier prime-sum graph literature has not been determined. Main adjacent references: Chen–Fu–Guo (2021), *Hamiltonicity in Prime Sum Graphs*, and Croot–Jin (2026), *Prime Sum Graphs and the Induced Trees They Contain*.

### P031 parallel investigation

A separate comparison of pairwise-coprime Sidon sets with classical dense Sidon constructions and recent additive/multiplicative Sidon literature yielded no rigorous asymptotic improvement. In particular, **multiplicative Sidon is weaker than pairwise coprimality**; no result about bi-Sidon sets should be transferred to P031 without a separate argument. No unsupported P031 claim is added to the catalogue.
