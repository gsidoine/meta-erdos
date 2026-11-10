"""Source-level consistency checks after integrating historical GitHub branches.

These assertions do not contact GitHub, delete refs, or certify mathematical
novelty. Remote branch deletion is safely performed by a separate one-off,
SHA-pinned GitHub Actions workflow after the maintenance PR is merged.
"""
from pathlib import Path
import json
import unittest

ROOT = Path(__file__).resolve().parents[1]


class IntegrationConsistencyTests(unittest.TestCase):
    def test_unchanged_thirty_entry_catalogue(self):
        data = json.loads((ROOT / "data/problems.json").read_text(encoding="utf-8"))
        browser = json.loads((ROOT / "docs/problems.json").read_text(encoding="utf-8"))
        ids = [p["id"] for p in data["problems"]]
        self.assertEqual(ids[:30], [f"P{i:03d}" for i in range(1, 31)])
        self.assertEqual(ids, [f"P{i:03d}" for i in range(1, len(ids) + 1)])
        self.assertEqual(data, browser)
        self.assertEqual([p["id"] for p in data["problems"] if p["status"] == "proved internally"], ["P005", "P010", "P033"])

    def test_no_stale_public_documentation(self):
        readme = (ROOT / "README.md").read_text(encoding="utf-8")
        self.assertIn(f"**{len(json.loads((ROOT / 'data/problems.json').read_text(encoding='utf-8'))['problems'])} numbered research entries", readme)
        self.assertIn("submitted to the journal _Integers_", readme)
        for bad in ("P001–P020 discovery freeze remains",
                    "PDF binary is not included",
                    "not yet checked into this GitHub branch"):
            self.assertNotIn(bad, readme)

    def test_archival_pdf_documentation_matches_upload(self):
        archive = (ROOT / "audits/2026-10-29-P001-P025-literature-source-gate.md"
                   ).read_text(encoding="utf-8")
        snapshot = (ROOT / "manuscripts/P010-2026-10-29-submission-snapshot-and-policy-audit.md"
                    ).read_text(encoding="utf-8")
        for source in (archive, snapshot):
            self.assertIn("3aae034589f58b9593891a53ee5d54ea20f1106c774364e1ff564df417837737", source)
            self.assertNotIn("coprime_adjacencies_integers_submitted_2026-10-29.pdf", source)
            self.assertNotIn(r"\`", source)
        self.assertIn("P010/coprime_adjacencies.pdf", archive)
        self.assertIn("P010/coprime_adjacencies.pdf", snapshot)

    def test_explicit_allowlisted_one_time_cleanup(self):
        workflow = (ROOT / ".github/workflows/retire-legacy-branches.yml"
                    ).read_text(encoding="utf-8")
        self.assertIn("permissions:\n  contents: write", workflow)
        self.assertIn("paths:\n      - '.github/workflows/retire-legacy-branches.yml'", workflow)
        self.assertIn("github.ref == 'refs/heads/main'", workflow)
        self.assertIn("cmp.data.ahead_by !== 0", workflow)
        self.assertIn("PR #29", workflow)
        self.assertIn("pr.data.state !== 'closed'", workflow)
        self.assertIn("github.rest.git.deleteRef", workflow)
        self.assertIn("core.setFailed", workflow)
        names = (
            "research/initial-four-problems",
            "research/pass-2-coprime-sidon",
            "research/pass-4-prime-palettes-noncoprime-paths",
            "research/P026-P030-arithmetic-combinatorics",
            "research/pass-3-coprime-differences-percolation",
            "maintenance/retire-final-unmerged-branch",
        )
        for name in names:
            self.assertIn(name, workflow)
        self.assertNotIn("deleteRef({ owner, repo, ref: 'heads/main' })", workflow)


if __name__ == "__main__":
    unittest.main()
