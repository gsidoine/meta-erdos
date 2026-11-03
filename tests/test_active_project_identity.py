"""Current public-project identity and link audit.

Historical audits and submitted manuscripts are archival records and are
intentionally excluded from the living-document rebrand checks.
"""
from pathlib import Path
import json
import unittest

ROOT = Path(__file__).resolve().parents[1]
NEW_REPO = "https://github.com/gsidoine/the-scottish-book/"
NEW_PAGES = "https://gsidoine.github.io/the-scottish-book/"
OBSOLETE = ("Meta Erdős", "The Problem Café", "gsidoine/meta-erdos", "github.io/meta-erdos")

class ActiveProjectIdentityTests(unittest.TestCase):
    @staticmethod
    def active_documents():
        fixed = (
            "README.md", "CONTRIBUTING.md", "PROVENANCE.md",
            "REWARDS.md", "PROBLEM_TEMPLATE.md", "docs/README.md",
            "docs/index.html", "data/problems.json", "docs/problems.json",
            "assets/README.md", "problems/README.md",
            ".github/ISSUE_TEMPLATE/config.yml",
            ".github/ISSUE_TEMPLATE/propose-problem.yml",
        )
        return (
            [ROOT / path for path in fixed]
            + sorted((ROOT / "problems").rglob("*.md"))
            + sorted((ROOT / "theorems").rglob("*.md"))
            + sorted((ROOT / "formal").rglob("*.md"))
            + sorted((ROOT / "submissions").rglob("*.md"))
        )

    def test_active_files_do_not_reintroduce_legacy_brand(self):
        for path in self.active_documents():
            with self.subTest(path=str(path.relative_to(ROOT))):
                s = path.read_text(encoding="utf-8")
                for legacy in OBSOLETE:
                    self.assertNotIn(legacy, s, f"Stale project identity in {path}")

    def test_public_entrypoints_and_browser_use_current_urls(self):
        readme = (ROOT / "README.md").read_text(encoding="utf-8")
        page = (ROOT / "docs/index.html").read_text(encoding="utf-8")
        contrib = (ROOT / "CONTRIBUTING.md").read_text(encoding="utf-8")
        issue_config = (ROOT / ".github/ISSUE_TEMPLATE/config.yml").read_text(encoding="utf-8")
        self.assertTrue(readme.startswith("# The Scottish Book\n"))
        self.assertIn("The Scottish Book", page)
        self.assertIn(NEW_REPO + "issues/new?template=propose-problem.yml", readme)
        self.assertIn(NEW_REPO + "issues/new?template=propose-problem.yml", page)
        self.assertIn(NEW_REPO, contrib)
        self.assertIn(NEW_REPO, issue_config)
        self.assertIn(NEW_PAGES, readme)
        self.assertIn('const base="' + NEW_REPO + 'blob/main/"', page)

    def test_unchanged_problem_set_and_archive_source(self):
        data = json.loads((ROOT / "data/problems.json").read_text(encoding="utf-8"))
        browser = json.loads((ROOT / "docs/problems.json").read_text(encoding="utf-8"))
        self.assertEqual(data, browser)
        entries = data["problems"]
        self.assertEqual([p["id"] for p in entries],
                         [f"P{i:03d}" for i in range(1, len(entries) + 1)])
        self.assertTrue((ROOT / "manuscripts/P010/coprime_adjacencies.pdf").is_file())
        self.assertEqual(
            data["source"],
            "The Scottish Book: independently curated mathematical questions, proofs, and research candidates",
        )

if __name__ == "__main__":
    unittest.main()
