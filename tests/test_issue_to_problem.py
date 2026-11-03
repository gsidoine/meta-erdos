"""Security and fidelity checks for issue-form-to-PR proposal conversion."""
import json
import sys
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))
from issue_to_problem import parse_form, render

def example(statement="Let $n$ be an integer. Does ...?", fmt="Markdown"):
    fields = {
        "Problem title": "A difficult arithmetic question",
        "Mathematical field": "Number theory",
        "Statement format": fmt,
        "Problem statement": statement,
        "Mathematical motivation": "Connects multiplicative and additive structure.",
        "Closest existing literature": "_No response_",
        "Known evidence or examples": "_No response_",
        "Suggested reward": "A live goose (symbolic)",
        "Reward details and proposed sponsor": "_No response_",
        "AI involvement": "Human-AI collaboration",
        "Contributor attribution": "Contributor",
        "Submission understanding": "- [x] I understand that submissions are unreviewed, and any reward requires separate approval.",
    }
    body = "\n".join(f"### {k}\n\n{v}\n" for k, v in fields.items())
    return {"issue": {"number": 123, "title": "[Problem proposal] A difficult arithmetic question",
                      "body": body, "user": {"login": "example-user"}}}

class ProposalConversionTests(unittest.TestCase):
    def test_markdown_preserved_and_not_published_as_canonical(self):
        issue = example()["issue"]
        with tempfile.TemporaryDirectory() as tmp:
            path = render(issue, tmp)
            readme = (path / "README.md").read_text(encoding="utf-8")
            self.assertIn("Let $n$ be an integer", readme)
            self.assertIn("unreviewed", readme.lower())
            meta = json.loads((path / "submission.json").read_text(encoding="utf-8"))
            self.assertEqual(meta["source_issue"], 123)
            self.assertFalse((path / "metadata.yaml").exists())

    def test_tex_preserved_verbatim_without_execution(self):
        statement = r"\input{secrets} % remains untrusted text"
        issue = example(statement, fmt="LaTeX")["issue"]
        with tempfile.TemporaryDirectory() as tmp:
            path = render(issue, tmp)
            self.assertEqual((path / "statement.tex").read_text(encoding="utf-8"), statement + "\n")
            self.assertNotIn(statement, (path / "README.md").read_text(encoding="utf-8"))

    def test_unknown_fields_and_missing_consent_rejected(self):
        issue = example()["issue"]
        bad = issue["body"].replace("### Mathematical field\n\nNumber theory",
                                   "### Mathematical field\n\n../../etc/passwd")
        with self.assertRaises(ValueError):
            parse_form(bad)
        bad = issue["body"].replace(
            "- [x] I understand that submissions are unreviewed, and any reward requires separate approval.",
            "_No response_")
        with self.assertRaises(ValueError):
            parse_form(bad)

    def test_path_uses_numeric_issue_number(self):
        issue = example()["issue"]
        issue["number"] = "../outside"
        with tempfile.TemporaryDirectory() as tmp:
            with self.assertRaises(ValueError):
                render(issue, tmp)

if __name__ == "__main__":
    unittest.main()
