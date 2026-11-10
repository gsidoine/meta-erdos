"""Regression test for the P040 exact five-prime Hall certificate."""
import runpy
import unittest
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
M=runpy.run_path(str(ROOT/"experiments/P040_five_prime_sharpness.py"))

class FivePrimeHallCertificateTests(unittest.TestCase):
    def test_integer_support_certificate(self):
        checked, remaining, slack=M["verify"]()
        self.assertEqual(checked,15586)
        self.assertEqual(remaining,24)
        self.assertGreaterEqual(slack,0)

if __name__=="__main__":
    unittest.main()
