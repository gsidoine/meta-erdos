"""Check current public-facing catalogue claims against canonical metadata.

Historical audit files are intentionally excluded: their statements describe
archived research snapshots rather than the current state of the catalogue.
"""
from collections import Counter
import json
from pathlib import Path
import re
import unittest

ROOT = Path(__file__).resolve().parents[1]


class PublicCatalogueConsistencyTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.entries = json.loads((ROOT / "data/problems.json").read_text(
            encoding="utf-8"))["problems"]
        cls.readme = (ROOT / "README.md").read_text(encoding="utf-8")
        cls.browser = (ROOT / "docs/index.html").read_text(encoding="utf-8")
        cls.docs = (ROOT / "docs/README.md").read_text(encoding="utf-8")

    def test_public_entry_count_matches_index(self):
        n = len(self.entries)
        self.assertGreaterEqual(n, 25)
        self.assertIn(f"**{n} numbered research entries", self.readme)
        self.assertIn(f"**{n} current research entries**", self.docs)
        last_id = f"P{n:03d}"
        self.assertIn(f"P001–{last_id}", self.browser)
        self.assertIn("Contributions are welcome", self.readme)
        self.assertNotIn("Do not add P026", self.readme)

    def test_public_status_breakdown(self):
        counts = Counter(p["status"] for p in self.entries)
        section = self.readme.split("## Status and scope", 1)[1].split(
            "## P010", 1)[0]
        expected = {
            "Candidate": counts["candidate"],
            "Reframe": counts["reframe"],
            "Needs specification": counts["needs specification"],
            "Proved internally": counts["proved internally"],
            "Known result": counts["known result"],
        }
        for name, count in expected.items():
            with self.subTest(status=name):
                m = re.search(r"^\| " + re.escape(name)
                              + r" \| (\d+)\b", section, re.MULTILINE)
                self.assertIsNotNone(m, f"Missing status count: {name}")
                self.assertEqual(int(m.group(1)), count)
        self.assertEqual(sum(expected.values()), len(self.entries))

    def test_p010_publication_status_is_consistent(self):
        dossier = (ROOT / "problems/graph-theory/P010-minimum-coprime-adjacencies.md"
                   ).read_text(encoding="utf-8")
        manuscript = (ROOT / "manuscripts/P010/README.md").read_text(
            encoding="utf-8")
        p010 = next(p for p in self.entries if p["id"] == "P010")
        self.assertEqual(p010["status"], "proved internally")
        self.assertIn("submitted to Integers", p010["result"])
        for source in (self.readme, dossier, manuscript, self.browser):
            self.assertIn("Integers", source)
        self.assertIn("**Submitted**", manuscript)
        self.assertIn("(manuscripts/P010/coprime_adjacencies.pdf)", self.readme)
        self.assertTrue((ROOT / "manuscripts/P010/coprime_adjacencies.pdf").is_file())
        certificate = (ROOT / "formal/P010/P010.lean").read_text(encoding="utf-8")
        readme = (ROOT / "formal/P010/README.md").read_text(encoding="utf-8")
        self.assertIn("kernel-checked in Lean 4", p010["result"])
        self.assertIn("formal/P010/README.md", self.readme)
        self.assertIn("theorem P010_exact (n : ℕ) (hn : 4 ≤ n)", certificate)
        self.assertIn("#print axioms P010_exact", certificate)
        self.assertIn("Verification status: complete", readme)


    def test_noncanonical_historical_audits_are_labeled(self):
        self.assertIn("Historical source reviews", self.readme)
        audits = (ROOT / "audits/README.md").read_text(encoding="utf-8")
        self.assertIn("research records", audits)
        self.assertIn("current catalogue", audits)


if __name__ == "__main__":
    unittest.main()
