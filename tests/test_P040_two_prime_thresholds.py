"""Small-prime exact-rational checks for the P040 two-prime theorem."""
import importlib.util
from pathlib import Path
import unittest


ROOT = Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location(
    "p040_two_prime",
    ROOT / "experiments" / "P040_two_prime_thresholds.py",
)
P040 = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(P040)


class TwoPrimeThresholdTests(unittest.TestCase):
    def test_fractional_exceptional_certificate(self):
        P040.check_fractional_exception()

    def test_indicator_profiles(self):
        from fractions import Fraction
        for primes, bound in [
            ((3,), Fraction(1, 2)),
            ((3, 5), Fraction(4, 9)),
            ((3, 7), Fraction(1, 2)),
            ((5, 7), Fraction(1, 2)),
        ]:
            self.assertGreater(P040.check_all_binary_profiles(primes, bound), 0)

    def test_universal_half_mass_approximation(self):
        for primes in ((3,), (3, 5), (5, 7)):
            P040.check_constant_approximation(primes)


if __name__ == "__main__":
    unittest.main()
