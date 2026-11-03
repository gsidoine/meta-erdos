"""Check the first two Scottish Book folders and their preserved legacy links."""
import json
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

class ProblemFolderPrototypeTests(unittest.TestCase):
    def test_two_pilot_folders_are_canonical(self):
        records = {r["id"]: r for r in json.loads(
            (ROOT / "data/problems.json").read_text(encoding="utf-8")
        )["problems"]}
        expected = {
            "P015": "problems/P015-odd-area-triangulations",
            "P020": "problems/P020-padic-hankel-cokernels",
        }
        for pid, folder in expected.items():
            with self.subTest(problem=pid):
                base = ROOT / folder
                self.assertEqual(records[pid]["file"], f"{folder}/README.md")
                for part in ("README.md", "metadata.yaml", "proofs", "exploration",
                             "references", "verification", "formal"):
                    self.assertTrue((base / part).exists(), (pid, part))
                meta = (base / "metadata.yaml").read_text(encoding="utf-8")
                self.assertIn(f"id: {pid}", meta)
                self.assertIn("kind: none", meta)
                self.assertIn("human-ai-collaboration", meta)
                self.assertIn("formal_status: unformalized", meta)
        self.assertTrue((ROOT / "problems/geometry/P015-odd-area-lattice-triangulations.md").exists())
        self.assertTrue((ROOT / "problems/number-theory/P020-random-hankel-padic-cokernels.md").exists())

    def test_verifiers_are_exact_legacy_copies(self):
        for pid, original, new in (
            ("P015", "experiments/P015_odd_area_flip_graph.py",
             "problems/P015-odd-area-triangulations/verification/P015_odd_area_flip_graph.py"),
            ("P020", "experiments/P020_hankel_finite_field_ranks.py",
             "problems/P020-padic-hankel-cokernels/verification/P020_hankel_finite_field_ranks.py"),
        ):
            with self.subTest(problem=pid):
                self.assertEqual((ROOT / original).read_bytes(), (ROOT / new).read_bytes())

    def test_submission_form_and_workflow_explain_review(self):
        form = (ROOT / ".github/ISSUE_TEMPLATE/propose-problem.yml").read_text(encoding="utf-8")
        workflow = (ROOT / ".github/workflows/issue-to-draft-pr.yml").read_text(encoding="utf-8")
        for label in ("Problem statement", "Mathematical field", "Statement format",
                      "Suggested reward", "AI involvement"):
            self.assertIn(label, form)
        self.assertIn("types: [labeled]", workflow)
        self.assertIn("prepare-draft-pr", workflow)
        self.assertIn("gh pr create --draft", workflow)

if __name__ == "__main__":
    unittest.main()
