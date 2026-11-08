"""Deterministic constructive P005 switch theorem checks."""
import runpy
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
P005 = runpy.run_path(str(ROOT / "experiments/P005_canonical_switch_certificate.py"))


class P005CanonicalSwitchTests(unittest.TestCase):
    def test_complete_enumeration_through_nine(self):
        for n in range(1, 10):
            for p in P005["all_coprime_permutations"](n):
                moves = P005["solve"](n, p)
                self.assertLessEqual(len(moves), 3 * (n - 1) // 2)

    def test_reference_permutation(self):
        for n in range(1, 24):
            p = P005["canonical"](n)
            moves = P005["solve"](n, tuple(p[i] for i in range(1, n + 1)))
            self.assertEqual(moves, [])


if __name__ == "__main__":
    unittest.main()
