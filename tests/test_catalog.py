"""Dependency-free checks for the research catalogue.

Run: python -m unittest discover -s tests -v
"""
import json
import re
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))
from generate_catalog import generate, dossier_views, README, BROWSER_DATA, BROWSER_CURATION  # noqa: E402


class CatalogueTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.data = json.loads((ROOT / "data" / "problems.json").read_text(encoding="utf-8"))
        cls.problems = cls.data["problems"]

    def test_consecutive_unique_ids(self):
        ids = [r["id"] for r in self.problems]
        self.assertEqual(ids, [f"P{i:03d}" for i in range(1, len(ids) + 1)])
        self.assertEqual(len(ids), len(set(ids)))
        self.assertGreaterEqual(len(ids), 25, "Previously catalogued problem IDs must be preserved")

    def test_every_problem_has_a_dossier_and_sources(self):
        required = {"id", "title", "area", "file", "question", "status",
                    "novelty", "result", "verification", "priority", "sources"}
        for r in self.problems:
            with self.subTest(problem=r["id"]):
                self.assertTrue(required.issubset(r))
                self.assertTrue((ROOT / r["file"]).is_file())
                self.assertGreater(len(r["question"]), 20)
                self.assertGreaterEqual(len(r["sources"]), 1)
                self.assertEqual(
                    sorted(s["name"] for s in r["sources"]),
                    sorted(set(s["name"] for s in r["sources"])))
                for source in r["sources"]:
                    self.assertRegex(source["url"], r"^https://")

    def test_explicit_quality_statuses(self):
        allowed = {"candidate", "reframe", "needs specification", "proved internally"}
        for r in self.problems:
            self.assertIn(r["status"], allowed)

    def test_generated_views_current(self):
        readme, browser, curation = generate()
        self.assertEqual(README.read_text(encoding="utf-8"), readme)
        self.assertEqual(BROWSER_DATA.read_text(encoding="utf-8"), browser)
        self.assertEqual(BROWSER_CURATION.read_text(encoding="utf-8"), curation)

    def test_every_dossier_summary_matches_canonical_data(self):
        views = list(dossier_views())
        self.assertEqual(len(views), len(self.problems))
        for path, generated in views:
            with self.subTest(dossier=str(path)):
                self.assertEqual(path.read_text(encoding="utf-8"), generated)

    def test_current_public_links_use_renamed_repository(self):
        readme = (ROOT / "README.md").read_text(encoding="utf-8")
        self.assertTrue(readme.startswith("# The Scottish Book"))
        for path in [ROOT / "docs" / "index.html", ROOT / "docs" / "README.md"]:
            text = path.read_text(encoding="utf-8")
            self.assertIn("the-scottish-book", text)
            self.assertNotIn("meta-erdos", text)

    def test_single_contiguous_table(self):
        readme = README.read_text(encoding="utf-8")
        marker = readme.split("<!-- CATALOG:START -->", 1)[1].split(
            "<!-- CATALOG:END -->", 1)[0]
        rows = [ln for ln in marker.splitlines() if ln.startswith("|")]
        self.assertEqual(len(rows), len(self.problems) + 2)
        self.assertEqual(sum(1 for ln in rows if re.match(r"^\| \[P\d{3}\]", ln)), len(self.problems))


if __name__ == "__main__":
    unittest.main()
