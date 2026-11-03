# Contributing to The Problem Café

This is an open mathematical problem book for human-only and human–AI collaborative work. The mathematics must stand independently of how it was formulated.

## Propose a new problem — no Git knowledge required

Open the [structured proposal form](https://github.com/gsidoine/meta-erdos/issues/new?template=propose-problem.yml), then:

1. Enter a concise title and choose a mathematical field.
2. Select Markdown or LaTeX and supply the exact problem statement.
3. Describe mathematical motivation, nearby literature, and any known evidence.
4. Choose no reward, a **symbolic** coffee or virtual goose, or a proposed reward subject to separate sponsorship approval.
5. Report AI involvement and contributor attribution. Submit the form.

The submission creates a **GitHub issue**, not an automatically accepted problem. After initial moderation, a maintainer applies the `prepare-draft-pr` label; the [conversion workflow](.github/workflows/issue-to-draft-pr.yml) treats the text as data and opens a **draft PR** containing the proposal. GitHub's repository settings must allow Actions to create PRs. If this permission is unavailable, the issue remains intact for a maintainer to prepare the PR manually.

The resulting PR is reviewed for mathematical precision, close predecessors, and evidence before acceptance. A permanent P-number is assigned **only after acceptance**; contributors do not choose an unused ID. No prize is offered merely by selecting a reward in the form.

GitHub's [issue forms](https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/syntax-for-issue-forms) do not directly create pull requests, which is why the moderated conversion is a separate step.

## Contribute to an existing problem

Open the problem's README. Attach or edit a proof in its `proofs/` folder, a source in `references/`, a counterexample or reduction in `exploration/`, reproducible code in `verification/`, or a checked Lean statement/proof in `formal/`. Propose a pull request with the [contribution template](.github/PULL_REQUEST_TEMPLATE.md). Smaller corrections may be filed as issues.

In the migration period some theorems and experiments remain in their established global locations; existing links must remain valid. New PRs should not rewrite historical submitted manuscripts.

## Mathematical quality

A candidate must state its definitions, quantified claims and exceptional cases precisely. Distinguish internally proved propositions, computations, conditional statements, and conjectures. Identify the closest known theorem and explain the exact distinction; failure to find a similar title is not an originality certificate.

Finite computation requires an algorithm, parameters, reproducibility conditions and explicit uncertainty about what it establishes. For Markdown use GitHub math syntax with inline `$...$` and display `$$...$$` on their own lines. Raw TeX can be preserved as a separate .tex file; it is never compiled by the issue intake workflow.

A Lean **formal statement** is not a Lean-verified **proof**. Claim formal verification only when a pinned toolchain checks the exact declaration and dependencies.

## Attribution and collaboration

Human contributors should be credited for their documented mathematical contributions. Disclose substantial AI involvement in formulation, programming, literature research, or verification when relevant. AI-generated mathematical text and references must be independently checked. A collaboration claim does not itself establish mathematical originality or authorship. See [Provenance](PROVENANCE.md).

## Rewards

All default prizes are symbolic. A material reward requires a named, willing sponsor, verified terms, and a separate explicit commitment; the collection does not fund or guarantee any material award. See [Rewards](REWARDS.md).

## Catalogue and tests

The existing canonical catalogue remains in [data/problems.json](data/problems.json) and current allocation in [data/curation.json](data/curation.json). The new per-problem metadata documents rewards, provenance and formal status during migration; canonical IDs and mathematical statuses are not separately editable in those files.

Regenerate derived views and run checks:

```bash
python scripts/generate_catalog.py
python scripts/generate_catalog.py --check
python -m unittest discover -s tests -v
```

The [problem template](PROBLEM_TEMPLATE.md) describes the compact entry-page format. The submitted [P010 PDF](manuscripts/P010/coprime_adjacencies.pdf) and its original disclosure remain unchanged.
