"""Verify the P005 parity decomposition against direct matching enumeration."""
import runpy
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
mod = runpy.run_path(str(ROOT / "experiments/P005_parity_matching_decomposition.py"))


class P005ParityDecompositionTests(unittest.TestCase):
    def test_even_and_odd_counts_through_15(self):
        for n in range(2, 16):
            with self.subTest(n=n):
                self.assertEqual(mod["direct_count"](n), mod["parity_formula"](n))


if __name__ == "__main__":
    unittest.main()
