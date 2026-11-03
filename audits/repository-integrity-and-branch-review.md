# Repository integrity and legacy-branch review

This is a **repository maintenance review**, not an additional mathematical novelty or proof audit. It covers the 30-entry public catalogue, its generated browser, the submitted P010 document and the branch inventory.

## Branch disposition

GitHub comparisons were made against the latest main branch. They identify these five remaining legacy branch references:

| Branch | Relative to main | Decision |
|---|---|---|
| research/initial-four-problems | 0 ahead | Fully merged; safely retire |
| research/pass-2-coprime-sidon | 0 ahead | Fully merged; safely retire |
| research/pass-4-prime-palettes-noncoprime-paths | 0 ahead | Fully merged; safely retire |
| research/P026-P030-arithmetic-combinatorics | 0 ahead | Fully merged; safely retire |
| research/pass-3-coprime-differences-percolation | 12 ahead, 0 behind | PR #29 closed without merge; retire **without merging** |

[PR #29](https://github.com/gsidoine/the-scottish-book/pull/29) adds largely duplicated literature-audit passages, duplicate Markdown headings, anachronistic homepage text and unsupported mathematical delimiters. The established Panma–Rochanakul result for P007, the P008 arithmetic-percolation source discussion and the cited predecessor studies already appear on main. No independent theorem, certificate, or current research result requires that PR's patch to be carried into the canonical catalogue.

The resulting clean [main research portfolio](portfolio-consolidation-P001-P030.md) remains the authoritative entry point.

## Safe retirement mechanism

The connected GitHub tools do not expose a direct branch-delete operation. The maintenance pull request adds [a narrowly scoped GitHub Actions workflow](../.github/workflows/retire-legacy-branches.yml):

- Trigger once when the workflow file is introduced on main by merging the maintenance PR, or when manually dispatched.
- Require contents-write permission for branch deletion; if repository settings prevent it, the workflow will fail rather than claim success.
- Delete **only** a fixed allowlist of five legacy names, each checked against its **exact reviewed commit SHA**.
- For the four fully merged branches, recheck that each has **zero** commits ahead of main before deletion.
- For the abandoned fifth branch, require the same 12-commit comparison and 11-file list, and verify PR #29 is still closed and unmerged. No unseen new work is discarded.
- If the maintenance pull request itself is confirmed merged, retire its source branch as well.
- Skip changed/missing refs; no wildcard or deletion of main is permitted.

The deletion is not complete until the workflow succeeds on main and the GitHub branch listing shows **only main**.

## Main-branch consistency findings

The canonical data has exactly **30 consecutive, unique IDs P001–P030**. It records 26 candidate statuses, two reframes, one needs-specification status and the resolved P010 entry. The synchronized docs JSON, 30-row README catalogue and the public tier filter reflect the same underlying data. The latest successful main-branch Actions validation covered the catalogue, Markdown links/rendering guards, submitted P010 binary checksum and all numerical mathematical verification experiments.

A source scan of **all 70 Markdown files** identified no duplicate active catalogue sections or out-of-date freeze/absence claims in the current README or problem dossiers. It did find **superseded binary-upload instructions** in an archived P001–P025 review and literal escaped backtick formatting in an archival P010 snapshot. Those have been corrected, with historical scope retained.

The manuscript [P010 PDF](../manuscripts/P010/coprime_adjacencies.pdf) is committed and has SHA-256:

`3aae034589f58b9593891a53ee5d54ea20f1106c774364e1ff564df417837737`

The mathematical manuscript remains unchanged and **submitted**, not reported accepted or published. The original P010 submission-policy interpretation was already corrected in the historical source record; no old categorical AI prohibition is reinstated.

The only repository content adjustments in this maintenance pass are the branch-retirement workflow, corrections to stale *historical* documentation, and test names/docstrings that contradicted the present state. **No research problem, mathematical proof, catalogue ID, theorem claim, or PDF is changed.**

## Reproducible validation

```sh
python scripts/generate_catalog.py --check
python -m unittest discover -s tests -v
```

This maintenance audit is separate from source-level mathematical priority checks and independent referee verification.

## Completion verification

The reviewed legacy branches have now been retired. The [first cleanup run](https://github.com/gsidoine/the-scottish-book/actions/runs/41017240538) removed the four fully merged refs and the first maintenance ref. The [final cleanup run](https://github.com/gsidoine/the-scottish-book/actions/runs/41017544914) removed the abandoned, closed PR #29 ref and its own temporary maintenance ref. Both runs succeeded, and a fresh GitHub branch listing confirms **main is the only remaining branch**. PR #29 remains closed and unmerged. The [post-cleanup catalogue and mathematical CI run](https://github.com/gsidoine/the-scottish-book/actions/runs/41017544984) also succeeded. No numbered mathematical statements or manuscript PDF files were changed during cleanup.
