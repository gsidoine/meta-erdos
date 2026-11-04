"""Exact checks of P027 finite-volume spectral-factor inheritance."""
import importlib.util
from pathlib import Path
import unittest


ROOT = Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location(
    "p027_gap_inheritance",
    ROOT / "experiments" / "P027_gap_inheritance_check.py",
)
P027 = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(P027)


class P027GapInheritanceTests(unittest.TestCase):
    def test_even_volume_factor(self):
        self.assertEqual(P027.verify(24), (34, 17))

    def test_odd_volume_factor(self):
        self.assertEqual(P027.verify(25), (34, 17))


if __name__ == "__main__":
    unittest.main()
