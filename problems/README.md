# Problem folders

Every accepted question has a permanent identifier. The canonical catalogue still records all 46 existing IDs and their mathematical status. The per-problem layout is being introduced incrementally, beginning with [P015](P015-odd-area-triangulations/README.md) and [P020](P020-padic-hankel-cokernels/README.md).

The primary README should fit on approximately one screen: exact question, best known result, nearest literature, reward (if offered), and links to supporting files.

Files are grouped by purpose: proofs, exploration, references, verification, formalization. Empty directories are unnecessary. A `metadata.yaml` file currently records reward, provenance and formalization information; ID and mathematical status remain authoritative in [data/problems.json](../data/problems.json) to avoid divergent sources during migration.

Earlier dossier URLs remain available as historical detailed views. Existing theorem and experiment archives are not silently deleted or duplicated as canonical sources. Later migrations may move supporting files with compatibility links and accompanying tests.

To propose a new problem, use the [submission form](https://github.com/gsidoine/the-scottish-book/issues/new?template=propose-problem.yml).
