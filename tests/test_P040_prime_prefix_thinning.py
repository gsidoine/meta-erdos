"""Exact transport and bias monotonicity checks for P040."""
import importlib.util
from pathlib import Path
import unittest


ROOT = Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location(
    "p040_prime_prefix",
    ROOT / "experiments" / "P040_prime_prefix_thinning.py",
)
MOD = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(MOD)


class PrimePrefixThinningTests(unittest.TestCase):
    def test_exact_fractional_transport(self):
        MOD.check_thinning_identities()

    def test_monotone_profiles_under_bias_increase(self):
        MOD.check_random_monotone_profiles()


if __name__ == "__main__":
    unittest.main()
