"""Exact exhaustive support-family verification for the P040 four-prime case."""
import importlib.util
from pathlib import Path
import unittest


ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "experiments" / "P040_four_prime_sharpness.py"
SPEC = importlib.util.spec_from_file_location("four_prime", SOURCE)
MOD = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(MOD)


class FourPrimeTests(unittest.TestCase):
    def test_product_measure(self):
        MOD.weight_check()

    def test_all_upward_closed_support_pairs(self):
        self.assertEqual(MOD.enumerate_exceptions(), MOD.EXPECTED_EXCEPTIONS)

    def test_exceptional_cases(self):
        from fractions import Fraction
        self.assertEqual(MOD.exceptional_case_closure(), Fraction(2227, 2310))


if __name__ == "__main__":
    unittest.main()
