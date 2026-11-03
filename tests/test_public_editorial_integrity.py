"""Public editorial and local-reference integrity checks.

Historical audits retain their dates and contemporaneous mathematical conclusions,
but public prose must be self-contained and must not depend on private dialogue.
All checks operate locally without contacting network services.
"""
from pathlib import Path
import json
import re
import unittest
from urllib.parse import unquote

ROOT = Path(__file__).resolve().parents[1]
LINK = re.compile(r"!?(?<!\\)\[[^\]\n]*\]\(([^)\s]+)")
HTML_LINK = re.compile(r"""(?:href|src)=["']([^"'#]+)["']""")


class PublicEditorialIntegrityTests(unittest.TestCase):
    def test_no_private_conversation_artefacts(self):
        banned = (
            "the user's original PDF",
            "the user supplied",
            "our previous discussion",
            "our chat",
            "as we agreed",
            "as requested by the user",
            "next focus session",
            "the research rhythm",
            "weekend shortlist target",
            "Beyond Erdős",
        )
        # Contribution instructions may quote prohibited expressions as
        # examples of what authors should avoid; these are not disclosures.
        for path in ROOT.rglob("*.md"):
            if path.name == "CONTRIBUTING.md":
                continue
            text = path.read_text(encoding="utf-8").casefold()
            for phrase in banned:
                with self.subTest(path=str(path.relative_to(ROOT)), phrase=phrase):
                    self.assertNotIn(phrase.casefold(), text)

    def test_all_local_markdown_targets_exist(self):
        failures = []
        for path in ROOT.rglob("*.md"):
            fenced = False
            for line_number, line in enumerate(path.read_text(encoding="utf-8").splitlines(), 1):
                if line.lstrip().startswith(("~~~", "```")):
                    fenced = not fenced
                    continue
                if fenced:
                    continue
                for target in LINK.findall(line):
                    target = target.strip("<>")
                    if target.startswith(("https://", "http://", "mailto:", "#", "data:")):
                        continue
                    target = unquote(target.split("#", 1)[0].split("?", 1)[0])
                    if not target:
                        continue
                    # Expressions such as [f_i(z)](x) are mathematical notation,
                    # not file links. Local file paths have an extension or slash.
                    if not (Path(target).suffix or '/' in target or target.startswith('.')):
                        continue
                    resolved = (path.parent / target).resolve()
                    if not resolved.is_relative_to(ROOT) or not resolved.exists():
                        failures.append(f"{path.relative_to(ROOT)}:{line_number} -> {target}")
        for path in (ROOT / "README.md", ROOT / "docs/index.html"):
            for target in HTML_LINK.findall(path.read_text(encoding="utf-8")):
                if target.startswith(("https://", "http://", "mailto:", "#", "data:")):
                    continue
                target = unquote(target.split("#", 1)[0])
                if target and not (path.parent / target).resolve().exists():
                    failures.append(f"{path.relative_to(ROOT)} -> {target}")
        self.assertFalse(failures, "Broken local references:\\n" + "\\n".join(failures))

    def test_live_collection_counts_match_canonical_allocation(self):
        data = json.loads((ROOT / "data/problems.json").read_text(encoding="utf-8"))
        curation = json.loads((ROOT / "data/curation.json").read_text(encoding="utf-8"))
        ids = [p["id"] for p in data["problems"]]
        self.assertEqual(ids, [f"P{i:03d}" for i in range(1, len(ids) + 1)])
        allocations = curation["primary"] + curation["secondary"] + curation["resolved"]
        self.assertEqual(sorted(allocations), sorted(ids))
        self.assertEqual(len(set(allocations)), len(ids))
        docs = (ROOT / "docs/index.html").read_text(encoding="utf-8")
        guide = (ROOT / "docs/README.md").read_text(encoding="utf-8")
        readme = (ROOT / "README.md").read_text(encoding="utf-8")
        for label, key in (("Acorns", "primary"), ("Seedbed", "secondary"), ("Harvest", "resolved")):
            n = len(curation[key])
            self.assertIn(f"{n} {label}", docs)
            self.assertIn(f"{n} {label}", guide)
        self.assertIn(f"Complete archive ({len(ids)})", docs)
        self.assertIn(f"**{len(ids)} numbered research entries", readme)
        self.assertIn(f"complete archival index of all {len(ids)} IDs", readme)
        self.assertIn("[Searchable browser](https://gsidoine.github.io/meta-erdos/)", readme)
        self.assertIn("literature-comparison-P001-P041.md", readme)


    def test_scottish_book_and_submission_links(self):
        page = (ROOT / "docs/index.html").read_text(encoding="utf-8")
        self.assertIn("<h1>The Problem Café</h1>", page)
        self.assertIn("The Scottish Book", page)
        self.assertIn("human and AI collaboration", page)
        self.assertIn("issues/new?template=propose-problem.yml", page)
        self.assertIn("The Acorns (15)", page)
        self.assertIn("The Seedbed (30)", page)
        self.assertNotIn('src="./assets/erdos-portrait.jpg"', page)
        self.assertTrue((ROOT / "docs/assets/erdos-portrait.jpg").is_file())



if __name__ == "__main__":
    unittest.main()
