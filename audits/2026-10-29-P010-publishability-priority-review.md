# P010 publication-readiness assessment (29 October 2026)

**Scope:** inspect the internally published [exact P010 proof](../theorems/P010-exact-coprime-adjacencies.md); examine close historical results, current mathematical significance, and realistic journal routes. **No claim of formal referee verification or certified originality.**

## Verdict

**Mathematically:** credible and complete-looking exact extremal theorem, with explicit optimal constructions and an asymptotic coefficient. The proof uses elementary number theory and a novel-to-this-repository decomposition by largest prime factor, with interclass connections through the factors 2 and 3.

**Significance if historically new:** a **modest but real original note in arithmetic combinatorics**, rather than a major advance on a previously established open problem. The full exact value for every $n$ is more valuable than just the leading constant; the independent construction makes the result expository and reproducible. It concerns one natural, highly structured arithmetic graph family; a general transfer theorem would elevate its significance, but we should not require one before writing a concise note.

**Publishability if novel:** plausible as a focused approximately **4–8 page paper** in a journal that accepts original short contributions. Not ready to submit until a human mathematician has independently checked the theorem and deeper bibliographic verification is complete.

## Statement and the essential mechanism

Let

$$
h(n)=\min_{(a_1,\dots,a_n)\in S_n}
\sum_{i=1}^{n-1}\mathbf{1}_{\gcd(a_i,a_{i+1})=1}.
$$

Then for every $n\ge4$,

$$
h(n)=\pi(n)-\pi(n/2)+
\max\left\{1,
\left\lceil\frac{\pi(n/2)-\pi(n/3)}2\right\rceil\right\},
$$

and $h(1)=0,h(2)=1,h(3)=2$. Hence $h(n)\sim(7/12)n/\log n$.

The lower bound comes from isolated vertex $1$, primes greater than $n/2$, and leaves at primes in $(n/3,n/2]$ in the **noncoprime** graph. The upper bound is the difficult part: partition the integers by their largest prime factor, pair selected blocks through 3-multiples, and join all resulting even-ended paths through 2-multiples. The inequality $\pi(2x)\le2\pi(x)$ ($x\ge3$) supplies enough components for the endpoint capacities.

An informative comparison with general graph theory: the independence number of the noncoprime graph is exactly $\pi(n)+1$ (at most one member with any given smallest prime factor, achieved by the set $\{1\}$ together with all primes). Thus Gallai–Milgram's general path-cover bound gives $\mathrm{pc}(H_n)\le\pi(n)+1$, whereas this arithmetic theorem determines the exact smaller value $\mathrm{pc}(H_n)=h(n)+1$ and the asymptotic ratio $\mathrm{pc}(H_n)/\alpha(H_n)\to7/12$. The general theorem does not automatically yield the refinement.

## Proof audit — what was checked and what was not

1. The identity $h(n)=\mathrm{pc}(H_n)-1$ is correct.
2. Every prime in $(n/3,n/2]$ is a degree-one vertex (with sole neighbor $2q$) in the noncoprime graph. Isolated vertex and leaf counting needs the $\max(1,\lceil B_n/2\rceil)$ correction; this correctly handles $n=9,21$.
3. The largest-prime-factor classes induce cliques; small classes contain suitable even endpoints; intermediate classes have the stated three members when $n\ge12$.
4. The odd number of intermediate classes is repaired by attaching the leftover class to the class of 3 through a 3-divisible edge; no vertex is used twice.
5. The prime-counting inequality ensures there are enough two-even-ended units to absorb all one-ended prime classes.
6. The explicit $n=4,\ldots,11$ witnesses and the dependency-free constructor have passed finite checks through $n=10{,}000$ on repository CI.

These checks strongly support correctness. They **do not constitute independent human refereeing** or a full machine-formalized proof. A separate audit should especially check the statement and range of the prime-counting inequality and the correctness of the path-endpoint accounting.

## Nearest historical results and search outcome

- **Erdős, Freud and Hegyvári**, [*Arithmetical Properties of Permutations of Integers*](https://users.renyi.hu/~p_erdos/1983-02.pdf), *Acta Math. Hung.* 41 (1983), 169–176. Its stated theorems optimize magnitudes of lcm/gcd of adjacent permutation entries, **not** this extremal number of gcd-one adjacencies.
- [OEIS A076220](https://oeis.org/A076220), [A086595](https://oeis.org/A086595): **all-adjacent-coprime** permutation counts, the opposite extreme.
- [Banerjee, *On Structural Properties and Adjacency Spectrum of Coprime Graph of Integers* (published 2026)](https://doi.org/10.1142/S179355712550069X): graph spectra, vertex connectivity and crossing numbers; no exact *complementary* path-cover formula in abstract.
- [Fomin et al., *Path Cover, Hamiltonicity, and Independence Number: An FPT Perspective* (STOC 2026)](https://doi.org/10.1145/3798129.3800747): structural and algorithmic general path covers, not the number-theoretic exact formula.
- [MathOverflow (2019), extremal number of noncoprime pairs in an interval](https://mathoverflow.net/questions/324178/least-and-largest-possible-number-of-non-relatively-prime-pairs-among-consecut): studies the number of noncoprime **unordered pairs** in a set of consecutive integers, *not* the number of noncoprime adjacencies after optimally **permuting** those integers.

Searches using variants of "fewest coprime consecutive pairs", "maximum number of noncoprime neighbors in permutations", "path cover noncoprime graph", and fragments of the exact $\pi(n/2),\pi(n/3)$ formula did **not locate a predecessor**. This is a **targeted negative search result** only; MathSciNet/zbMATH citation-chains and non-English combinatorial literature have **not** been exhausted.

### Publishing-policy review

- [*Discrete Mathematics*](https://shop.elsevier.com/journals/discrete-mathematics/0012-365X) accepts graph theory, combinatorics, and **Notes** (short research contributions). A suitable scope match; significance remains the editorial question.
- [*Journal of Integer Sequences*](https://cs.uwaterloo.ca/journals/JIS/) considers interesting new sequences, combinatorial interpretations, and exact formulas. Its current guidelines prohibit LLM-written manuscript **prose** but explicitly allow LLM-suggested proof approaches **with detailed attribution, human rewriting and checking**. The repository's raw AI-produced prose should not be submitted.
- [*The Electronic Journal of Combinatorics*](https://www.combinatorics.org/ojs/index.php/eljc/about/submissions) has a high substantiality standard; it allows AI-aided arguments only with full independent human verification and human-authored presentation. This specialized theorem alone may not meet its editorial-interest threshold.
- [*INTEGERS*](https://math.colgate.edu/~integers/submit.html) explicitly excludes research in which AI was used to generate mathematical content/code under the current submission policy; **not a suitable target for this project**.

The manuscript must transparently disclose AI involvement according to the target venue's policy. Rewriting alone does not erase mathematical provenance.

## Recommendation

**Preserve P010 as an internally resolved problem and a potential short paper.** Do not promote it to "certified novel" or invest heavily in extending it until an independent specialist has (a) reproduced the proof in their own reasoning and (b) carried out a citation-chain priority audit. The collection's immediate emphasis can remain on posing and screening new high-impact questions.
