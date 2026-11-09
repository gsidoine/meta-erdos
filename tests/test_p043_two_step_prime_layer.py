"""Tests for the P043 prime-denominator two-step Farey layer."""
import runpy
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
MOD = runpy.run_path(str(ROOT / "experiments/P043_two_step_prime_layer.py"))

class P043TwoStepTests(unittest.TestCase):
    def test_exact_layers(self):
        for n in (100, 199, 499, 1000, 2000):
            self.assertGreater(MOD["verify"](n), 0)

if __name__=="__main__":
    unittest.main()
