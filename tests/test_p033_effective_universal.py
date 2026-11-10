"""Regression suite for P033 full three-prime connectivity certificate."""
import runpy
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
CERT = runpy.run_path(str(ROOT / "experiments/P033_effective_universal.py"))


class P033UniversalTests(unittest.TestCase):
    def test_complete_small_orders(self):
        self.assertEqual(CERT["verify_small"](), (28, 90))

    def test_prime_certificate_contiguous_intervals(self):
        count, end = CERT["verify_intervals"]()
        self.assertEqual(count, 103)
        self.assertGreater(end, 10**10)

    def test_exact_rational_analytic_budget(self):
        a, b, c = CERT["verify_analytic_constants"]()
        self.assertLess(a + b + c, 1)


if __name__ == "__main__":
    unittest.main()
