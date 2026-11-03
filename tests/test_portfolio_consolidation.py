"""Regression checks for the cross-field P001–P030 consolidation.

A consolidation records an archival set of 30 permanent IDs. Future proposals
may extend it without changing this snapshot; tier assignment is editorial
and is not a claim that a problem is new or open.
"""
from collections import Counter
import json
from pathlib import Path
import re
import unittest

ROOT = Path(__file__).resolve().parents[1]
REPORT = ROOT / "audits/portfolio-consolidation-P001-P030.md"


class PortfolioConsolidationTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.data = json.loads((ROOT / "data/problems.json").read_text(
            encoding="utf-8"))
        cls.problems = cls.data["problems"]
        cls.report = REPORT.read_text(encoding="utf-8")

    def test_all_thirty_ids_in_current_report(self):
        ids = [p["id"] for p in self.problems]
        self.assertEqual(ids[:30], [f"P{i:03d}" for i in range(1, 31)])
        lines = self.report.splitlines()
        rows = [line for line in lines if re.match(r"^\| \[P\d{3}\]", line)]
        self.assertEqual(len(rows), 30)
        matched = re.findall(r"^\| \[(P\d{3})\]", self.report, flags=re.M)
        self.assertEqual(matched, ids[:30])

    def test_tier_metadata_matches_current_report(self):
        expected = {"A": 6, "B": 8, "C": 10, "D": 5, "R": 1}
        observed = Counter(p["portfolio_tier"] for p in self.problems[:30])
        self.assertEqual(dict(observed), expected)
        for p in self.problems[:30]:
            with self.subTest(problem=p["id"]):
                self.assertRegex(
                    self.report,
                    r"(?m)^\| \[" + re.escape(p["id"])
                    + r"\]\([^)]+\) \| \*\*"
                    + re.escape(p["portfolio_tier"]) + r"\*\* \|")

    def test_public_navigation_and_github_browser(self):
        readme = (ROOT / "README.md").read_text(encoding="utf-8")
        html = (ROOT / "docs/index.html").read_text(encoding="utf-8")
        docs = (ROOT / "docs/README.md").read_text(encoding="utf-8")
        self.assertIn("(audits/portfolio-consolidation-P001-P030.md)", readme)
        self.assertIn("portfolio-consolidation-P001-P030.md", html)
        # The portfolio tiers are an archival assessment, not a public filter.
        self.assertNotIn('id="tier"', html)
        self.assertNotIn("p.portfolio_tier", html)
        self.assertIn('id="reward"', html)
        self.assertIn('<th scope="col">Reward</th>', html)
        self.assertIn("portfolio-consolidation-P001-P030.md", docs)
        self.assertNotIn("discovery freeze remains active", readme.lower())
        self.assertNotIn("pdf binary is not included", readme.lower())

    def test_corrected_integers_policy(self):
        readme = (ROOT / "README.md").read_text(encoding="utf-8")
        snapshot = (ROOT / "manuscripts/P010-2026-10-29-submission-snapshot-and-policy-audit.md"
                    ).read_text(encoding="utf-8")
        self.assertIn("permits supporting AI-tool use", readme)
        self.assertIn("Corrected journal AI-use policy", snapshot)
        self.assertNotIn("will **not be considered**", snapshot)
        self.assertNotIn("manuscript appears **incompatible", snapshot)
        self.assertIn("(P010/coprime_adjacencies.pdf)", snapshot)


if __name__ == "__main__":
    unittest.main()
