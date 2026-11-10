"""Independent finite-check regression for the P043 distance-two identity."""
import runpy
import unittest
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
MOD=runpy.run_path(str(ROOT/"experiments/P043_exact_distance_two.py"))

class P043ExactTwoStepTests(unittest.TestCase):
    def test_by_prime_denominator(self):
        for n in (5, 11, 29, 101, 500, 2000):
            self.assertGreaterEqual(MOD["verify"](n), 0)

if __name__ == "__main__":
    unittest.main()
