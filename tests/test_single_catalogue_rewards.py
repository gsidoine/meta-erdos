"""Single-catalogue publication and symbolic reward consistency."""
import json
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))
from generate_catalog import reward_text

class SingleCatalogueRewardTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.records = json.loads((ROOT / "data/problems.json").read_text(encoding="utf-8"))["problems"]
        cls.menu = json.loads((ROOT / "data/rewards.json").read_text(encoding="utf-8"))
        cls.labels = {r["id"]: r["label"] for r in cls.menu["rewards"]}
        cls.readme = (ROOT / "README.md").read_text(encoding="utf-8")
        cls.site = (ROOT / "docs/index.html").read_text(encoding="utf-8")

    def test_single_contiguous_six_column_catalogue(self):
        segment = self.readme.split("<!-- CATALOG:START -->", 1)[1].split(
            "<!-- CATALOG:END -->", 1)[0]
        lines = [line for line in segment.splitlines() if line.startswith("|")]
        self.assertEqual(lines[0],
                         "| ID | Question | Area | Formulation | Novelty | Reward |")
        self.assertEqual(len(lines), len(self.records) + 2)
        self.assertEqual(
            [line.split("](", 1)[0].split("[", 1)[1] for line in lines[2:]],
            [r["id"] for r in self.records],
        )
        for header in ("The Acorns", "The Seedbed", "The Harvest"):
            self.assertNotIn(header, self.readme)
            self.assertNotIn(header, self.site)

    def test_active_vocab_and_historical_records(self):
        self.assertEqual(set(self.labels), {"coffee", "book", "dinner", "research-prize"})
        self.assertEqual(len(self.labels), len(set(self.labels.values())))
        archive = json.loads((ROOT / "data/rewards-historical.json").read_text(encoding="utf-8"))
        self.assertEqual(len(archive["historical_vocabulary"]), 8)
        self.assertEqual([r["id"] for r in archive["previous_assignments"]],
                         [p["id"] for p in self.records])
        rewards_note = (ROOT / "REWARDS.md").read_text(encoding="utf-8")
        for name in self.labels.values():
            self.assertIn(name, rewards_note)
        self.assertIn("no physical prize is presently offered", self.readme.lower())
        self.assertIn("independent of difficulty", rewards_note)
        self.assertEqual(
            self.menu, json.loads((ROOT / "docs/rewards.json").read_text(encoding="utf-8")),
        )

    def test_no_material_offer_without_evidence(self):
        ledger = json.loads((ROOT / "data/reward-commitments.json").read_text(encoding="utf-8"))
        self.assertEqual(ledger["commitments"], [])
        self.assertEqual({state["id"] for state in self.menu["statuses"]},
                         {"symbolic", "pledged", "funded", "awarded"})
        for record in self.records:
            for reward in record["rewards"]:
                self.assertEqual(reward["status"], "symbolic")
                self.assertEqual(set(reward), {"kind", "condition", "status"})

    def test_every_problem_has_a_well_formed_optional_reward(self):
        for r in self.records:
            with self.subTest(problem=r["id"]):
                self.assertIn("rewards", r)
                label = reward_text(r, self.labels)
                self.assertTrue(label)
                if not r["rewards"]:
                    self.assertEqual(label, "—")
        with self.assertRaises(ValueError):
            reward_text({"id": "PTEST", "rewards": [{"kind": "unknown", "condition": "Proof", "status": "symbolic"}]},
                        self.labels)
        with self.assertRaises(ValueError):
            reward_text({"id": "PTEST", "rewards": [{"kind": "research-prize", "condition": "", "status": "symbolic"}]},
                        self.labels)
        example = {"id": "PTEST", "rewards": [{"kind": "coffee", "condition": "For a counterexample", "status": "symbolic"}]}
        self.assertEqual(reward_text(example, self.labels),
                         "A Coffee (symbolic) — For a counterexample")

    def test_unsubstantiated_pledges_are_rejected(self):
        candidate = {"id": "PTEST", "rewards": [
            {"kind": "book", "condition": "A proof", "status": "pledged",
             "commitment_id": "unverified"}]}
        with self.assertRaises(ValueError):
            reward_text(candidate, self.labels)

    def test_web_catalogue_uses_only_reward_status_and_area_filters(self):
        for term in ('id="area"', 'id="status"', 'id="reward"',
                     'id="catalogue"', 'fetch("./rewards.json")',
                     '<th scope="col">Reward</th>'):
            self.assertIn(term, self.site)
        self.assertNotIn('id="tier"', self.site)
        self.assertNotIn('id="collection"', self.site)
        self.assertNotIn("portfolio_tier", self.site)

    def test_no_emoji_in_public_introduction_or_prizes(self):
        paths = (ROOT / "README.md", ROOT / "docs/index.html",
                 ROOT / "REWARDS.md", ROOT / "docs/README.md")
        for path in paths:
            s = path.read_text(encoding="utf-8")
            self.assertFalse(
                any(ord(ch) >= 0x1F000 for ch in s),
                f"Symbol pictograms are not part of the public mathematical typography: {path}",
            )

if __name__ == "__main__":
    unittest.main()
