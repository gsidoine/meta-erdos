"""Check the P047 polynomial construction over finite F_2[T] families.

These exhaustive finite checks supplement, but do not replace, the proof.
"""
import importlib.util
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
CODE = ROOT / "problems/P047-perfect-algebraic-fusion/verification/P047_sidon.py"

spec = importlib.util.spec_from_file_location("p047_sidon_check", CODE)
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)


class P047FiniteChecks(unittest.TestCase):
    def test_pair_map_injectivity_for_truncated_inputs(self):
        for m in range(3, 9):
            with self.subTest(m=m):
                count, pairs = module.check(m)
                self.assertEqual(count, 1 << (m - 2))
                self.assertEqual(pairs, count * (count - 1) // 2)

    def test_problem_and_proof_record_scope(self):
        problem = (ROOT / "problems/P047-perfect-algebraic-fusion/README.md").read_text(encoding="utf-8")
        proof = (ROOT / "problems/P047-perfect-algebraic-fusion/proofs/half-dimensional-construction.md").read_text(encoding="utf-8")
        self.assertIn("dimension \\(1/2\\)", problem)
        self.assertIn("compact perfect", proof)
        self.assertIn("unverified", problem)

if __name__ == "__main__":
    unittest.main()
