"""Lightweight exact finite checks for P048, P049 and P050."""

import importlib.util
from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[1]


def load(relpath, name):
    spec = importlib.util.spec_from_file_location(name, ROOT / relpath)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


P048 = load("experiments/P048_coprime_squarefree_permutations.py", "p048")
P049 = load("experiments/P049_random_coprimality_rank.py", "p049")
P050 = load("experiments/P050_prime_hamming_cube.py", "p050")


class NewCandidatesFiniteTests(unittest.TestCase):
    def test_P048_small_permutations(self):
        self.assertTrue(P048.check(range(1, 61)))

    def test_P049_full_rank_squarefree_formula(self):
        for n in (1, 2, 20, 60):
            count, rank = P049.sample_rank(n, 1.0, 0)
            self.assertEqual(count, n)
            self.assertEqual(rank, P049.squarefree_count(n))

    def test_P049_sample_rank_bounds(self):
        for seed in range(4):
            size, rank = P049.sample_rank(80, 0.5, seed)
            self.assertLessEqual(rank, size)

    def test_P050_prime_cube_coloring_and_clique(self):
        for n in range(4, 8):
            P050.check(n)


if __name__ == "__main__":
    unittest.main()
