"""Finite consistency checks for the generic energy-matching inequality."""
import runpy
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
mod = runpy.run_path(str(ROOT / "experiments/prime_energy_sum_difference_matching.py"))


class EnergyMatchingTests(unittest.TestCase):
    def test_all_short_integer_sets(self):
        for mask in range(1 << 9):
            A = [i for i in range(9) if mask & (1 << i)]
            mod["check"](A)


if __name__ == "__main__":
    unittest.main()
