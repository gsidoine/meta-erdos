"""Consistency checks for the original twenty-entry audit and expanded 25-entry collection.

This checks editorial coverage, not mathematical correctness or historical
novelty. Source files and external literature still need expert scrutiny.
"""
from pathlib import Path
import json
import re
import unittest

ROOT=Path(__file__).resolve().parents[1]
AUDIT=ROOT/"audits/2026-10-29-P001-P020-first-collection-consolidation.md"
AUDIT25=ROOT/"audits/2026-10-29-P001-P025-literature-source-gate.md"


class PortfolioConsolidationTests(unittest.TestCase):
    def test_archived_audit_coverage(self):
        records=json.loads((ROOT/"data/problems.json").read_text(encoding="utf-8"))["problems"]
        ids=[p["id"] for p in records]
        self.assertGreaterEqual(len(ids),25)
        self.assertEqual(ids,[f"P{i:03d}" for i in range(1,len(ids)+1)])
        audit=AUDIT.read_text(encoding="utf-8")
        self.assertIn("P001–P020",audit)
        for pid in ids[:20]:
            with self.subTest(problem=pid):
                self.assertRegex(audit,rf"\b{re.escape(pid)}\b")
        self.assertIn("**P007**",audit)
        self.assertIn("**P008**",audit)
        self.assertIn("**P009**",audit)
        self.assertIn("**P010**",audit)
        audit25=AUDIT25.read_text(encoding="utf-8")
        for pid in ids[:25]:
            with self.subTest(second_collection=pid):
                self.assertRegex(audit25,rf"\b{re.escape(pid)}\b")

    def test_research_status_distinct_from_historical_novelty(self):
        records=json.loads((ROOT/"data/problems.json").read_text(encoding="utf-8"))["problems"]
        status={p["id"]:p["status"] for p in records}
        self.assertIn("P010",status)
        self.assertTrue((ROOT/"manuscripts/P010/coprime_adjacencies.pdf").is_file())
        audit=AUDIT.read_text(encoding="utf-8")
        self.assertIn("not",audit.lower())
        self.assertIn("independent",audit.lower())

    def test_public_navigation_to_audit(self):
        md=(ROOT/"README.md").read_text(encoding="utf-8")
        html=(ROOT/"docs/index.html").read_text(encoding="utf-8")
        self.assertIn(AUDIT.name,md)
        self.assertIn("P010",html)
        self.assertIn("Integers",md)
        self.assertIn(AUDIT25.name,md)


if __name__=="__main__":
    unittest.main()
