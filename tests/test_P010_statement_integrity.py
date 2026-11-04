"""Static regression checks for the independent P010 statement and proof."""

import json
import re
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
PROJECT = ROOT / "formal/P010"


class P010StatementIntegrityTests(unittest.TestCase):
    def test_statement_is_independent_of_proof(self):
        statement = (PROJECT / "P010Statement.lean").read_text(encoding="utf-8")
        proof = (PROJECT / "P010.lean").read_text(encoding="utf-8")
        self.assertTrue(statement.startswith("module\n\npublic import Mathlib\n"))
        self.assertTrue(proof.startswith("module\n\npublic import P010Statement\n"))
        self.assertIn("def ExactStatement (n : ℕ) : Prop := 4 ≤ n → h n = target n", statement)
        self.assertIn("theorem P010_exact (n : ℕ) (hn : 4 ≤ n)", proof)
        self.assertIn("theorem P010_statement_valid (n : ℕ) : ExactStatement n", proof)
        for name in ("IsPermutation", "adjacentCount", "pi", "target", "Attained", "h"):
            self.assertRegex(statement, rf"(?m)^(?:noncomputable )?def {name} ")
            self.assertNotRegex(proof, rf"(?m)^(?:noncomputable )?def {name} ")
        self.assertNotRegex(statement, r"(?m)^\s*(?:axiom|opaque|constant)\b|\bsorry\b")
        self.assertIn("#print axioms P010_exact", proof)
        self.assertIn("#print axioms P010_statement_valid", proof)

    def test_lockfile_pins_dependencies(self):
        manifest = json.loads((PROJECT / "lake-manifest.json").read_text(encoding="utf-8"))
        packages = manifest["packages"]
        self.assertEqual(manifest["name"], "p010")
        self.assertEqual(len(packages), len({p["name"] for p in packages}))
        mathlib = next(p for p in packages if p["name"] == "mathlib")
        self.assertEqual(mathlib["inputRev"], "v4.35.0")
        self.assertRegex(mathlib["rev"], r"^[0-9a-f]{40}$")
        self.assertEqual(
            (PROJECT / "lean-toolchain").read_text(encoding="utf-8").strip(),
            "leanprover/lean4:v4.35.0",
        )
        self.assertGreaterEqual(len(packages), 2)
        for package in packages:
            self.assertEqual(package["type"], "git")
            self.assertRegex(package["rev"], r"^[0-9a-f]{40}$")

    def test_public_documentation_separates_verification_and_priority(self):
        audit = (PROJECT / "STATEMENT_AUDIT.md").read_text(encoding="utf-8")
        readme = (PROJECT / "README.md").read_text(encoding="utf-8")
        self.assertIn("ExactStatement", audit)
        self.assertIn("historical originality", audit)
        self.assertIn("AI-assisted Lean drafting", audit)
        self.assertIn("P010Statement.lean", readme)
        self.assertIn("lake-manifest.json", readme)


if __name__ == "__main__":
    unittest.main()
