"""Finite corroboration of the P040 three-prime and compression proofs."""
import importlib.util
from pathlib import Path
import unittest


ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "experiments" / "P040_asymmetric_sieve_compression.py"
SPEC = importlib.util.spec_from_file_location("p040_asymmetric", SOURCE)
P040 = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(P040)


class P040AsymmetricSieveTests(unittest.TestCase):
    def test_exact_prime_support_weights(self):
        P040.check_three_prime_weights()

    def test_all_integral_three_prime_profile_pairs(self):
        self.assertEqual(P040.check_integer_profile_pairs(), 32434)

    def test_fractional_upward_compression_preserves_mass_and_cost(self):
        P040.check_compression()


if __name__ == "__main__":
    unittest.main()
