"""Exact checks for universal primitive-set finite factors (P027)."""
import importlib.util
from pathlib import Path
import unittest


ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "experiments" / "P027_universal_finite_pattern_factors.py"
SPEC = importlib.util.spec_from_file_location("p027_factors", SOURCE)
P027 = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(P027)


class P027UniversalFactorTests(unittest.TestCase):
    def test_base_state_counts(self):
        for C, expected in [(8, 5), (12, 6), (16, 10),
                            (20, 26), (24, 34), (54, 2208), (56, 3616)]:
            self.assertEqual(P027.maximum_primitive_count(C), expected)

    def test_independent_direct_subset_count(self):
        for C in (8, 12, 16):
            self.assertEqual(P027.count_by_primitive_subsets(C),
                             P027.maximum_primitive_count(C))

    def test_rough_root_external_constraints(self):
        for C, u in ((20, 251), (24, 251), (54, 733)):
            self.assertEqual(
                P027.check_isolated_block(C, u, C * u + 100),
                (C + 1) // 2,
            )


if __name__ == "__main__":
    unittest.main()
