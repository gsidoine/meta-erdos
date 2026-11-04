# Mathematical problem dossiers

All 50 permanent identifiers are listed in the [canonical catalogue](../README.md#problem-catalogue). Each problem belongs to a mathematical subject directory inside `problems/`. Entries may use a single dossier file or a more detailed `Pxxx-.../` folder.

The detailed dossiers presently include [P015 — geometry](geometry/P015-odd-area-triangulations/README.md), [P020 — number theory](number-theory/P020-padic-hankel-cokernels/README.md), and [P047 — topology](topology/P047-perfect-algebraic-fusion/README.md). Their supplementary materials are organized by purpose: proofs, exploration, references, reproducible verification, and formalization where present. The older single-file dossiers for P015 and P020 remain as historical views.

Each folder's `metadata.yaml` records provenance and formalization status. The authoritative mathematical status, relevant sources, and symbolic reward designations are stored in [`data/problems.json`](../data/problems.json); a missing reward field in folder metadata does not mean that no catalogue reward is assigned.

[P010 — the formally verified coprime-adjacency theorem](graph-theory/P010-minimum-coprime-adjacencies.md) has a separate [Lean 4 certificate](../formal/P010/README.md). The submitted manuscript is preserved independently.

To submit a problem, use the [submission form](https://github.com/gsidoine/the-scottish-book/issues/new?template=propose-problem.yml). Proposed questions receive no permanent identifier before mathematical review.
