#!/usr/bin/env python3
"""Convert a structured GitHub issue form into a reviewable data-only proposal.

No untrusted content is executed, interpreted as a filesystem path, or compiled.
GitHub Actions separately creates a draft PR after a maintainer applies a label.
"""
import argparse
import json
import re
from pathlib import Path

FIELDS = (
    "Problem title", "Mathematical field", "Statement format",
    "Problem statement", "Mathematical motivation", "Closest existing literature",
    "Known evidence or examples", "Suggested reward",
    "Reward details and proposed sponsor", "AI involvement",
    "Contributor attribution", "Submission understanding",
)
SUBJECTS = {
    "Number theory", "Combinatorics", "Graph theory", "Probability",
    "Geometry", "Topology", "Algebra", "Analysis", "Other",
}
FORMATS = {"Markdown", "LaTeX"}
REWARDS = {
    "None", "Virtual coffee (symbolic)", "Virtual goose (symbolic)",
    "Other symbolic reward",
    "Material reward proposal (requires named willing sponsor)",
}
AI_ROLES = {
    "Human-only", "Human-AI collaboration",
    "AI-generated candidate, human reviewed", "Other or not specified",
}
LIMITS = {
    "Problem title": 140,
    "Problem statement": 15000,
    "Mathematical motivation": 3500,
    "Closest existing literature": 3500,
    "Known evidence or examples": 5000,
    "Reward details and proposed sponsor": 500,
    "Contributor attribution": 250,
}

def parse_form(body):
    if not isinstance(body, str) or len(body) > 40000:
        raise ValueError("Invalid issue body")
    result = {}
    current = None
    for line in body.splitlines(keepends=True):
        m = re.fullmatch(r"### (.+)\s*", line.rstrip("\n\r"))
        if m and m.group(1) in FIELDS:
            current = m.group(1)
            if current in result:
                raise ValueError("Repeated field: " + current)
            result[current] = ""
        elif current is not None:
            result[current] += line
    result = {k: v.strip() for k, v in result.items()}
    for k in FIELDS:
        result.setdefault(k, "")
        if result[k] == "_No response_":
            result[k] = ""
    for k in ("Problem title", "Mathematical field", "Statement format",
              "Problem statement", "Mathematical motivation",
              "Suggested reward", "AI involvement"):
        if not result[k]:
            raise ValueError("Required field absent: " + k)
    for k, length in LIMITS.items():
        if len(result[k]) > length:
            raise ValueError("Field too long: " + k)
    if "\n" in result["Problem title"] or "\r" in result["Problem title"]:
        raise ValueError("Invalid title")
    if result["Mathematical field"] not in SUBJECTS:
        raise ValueError("Unknown mathematical field")
    if result["Statement format"] not in FORMATS:
        raise ValueError("Unknown format")
    if result["Suggested reward"] not in REWARDS:
        raise ValueError("Unknown reward")
    if result["AI involvement"] not in AI_ROLES:
        raise ValueError("Unknown AI role")
    if "I understand that submissions are unreviewed" not in result["Submission understanding"]:
        raise ValueError("Submission understanding not confirmed")
    return result

def render(issue, root):
    if not isinstance(issue, dict) or not isinstance(issue.get("number"), int):
        raise ValueError("Invalid issue number")
    number = issue["number"]
    if number < 1:
        raise ValueError("Invalid issue number")
    if not str(issue.get("title", "")).startswith("[Problem proposal]"):
        raise ValueError("Issue is not a problem proposal")
    fields = parse_form(issue.get("body", ""))
    user = issue.get("user", {})
    author = user.get("login", "") if isinstance(user, dict) else ""
    if not re.fullmatch(r"[A-Za-z0-9-]{1,39}", author):
        raise ValueError("Invalid contributor login")
    dest = Path(root) / "submissions" / f"issue-{number}"
    if dest.exists():
        raise ValueError("Proposal directory already exists")
    dest.mkdir(parents=True, exist_ok=False)
    fmt = fields["Statement format"]
    title = fields["Problem title"]
    lines = [
        f"# {title}",
        "",
        f"**Unreviewed proposal:** issue #{number}, by @{author}  ",
        f"**Field:** {fields['Mathematical field']}  ",
        f"**Statement format:** {fmt}  ",
        f"**Suggested reward:** {fields['Suggested reward']} (not yet offered)  ",
        f"**AI involvement:** {fields['AI involvement']}",
        "",
        "## Problem",
        "",
    ]
    if fmt == "Markdown":
        lines.extend([fields["Problem statement"], ""])
    else:
        (dest / "statement.tex").write_text(
            fields["Problem statement"] + "\n", encoding="utf-8")
        lines.extend([
            "The original statement is preserved verbatim in "
            "[statement.tex](statement.tex). It is not compiled or executed.",
            "",
        ])
    for heading, key in (
        ("Mathematical motivation", "Mathematical motivation"),
        ("Closest known literature", "Closest existing literature"),
        ("Evidence and examples", "Known evidence or examples"),
        ("Proposed reward details", "Reward details and proposed sponsor"),
        ("Attribution", "Contributor attribution"),
    ):
        if fields[key]:
            lines.extend([f"## {heading}", "", fields[key], ""])
    lines.extend([
        "## Editorial status", "",
        "This is an unreviewed submission, **not** a numbered entry. "
        "No proof, historical priority, reward, or AI role has been certified.",
        "",
    ])
    (dest / "README.md").write_text("\n".join(lines), encoding="utf-8")
    meta = {
        "source_issue": number,
        "contributor": author,
        "status": "unreviewed",
        "mathematical_field": fields["Mathematical field"],
        "statement_format": fmt,
        "suggested_reward": fields["Suggested reward"],
        "reward_details": fields["Reward details and proposed sponsor"],
        "ai_involvement": fields["AI involvement"],
        "attribution": fields["Contributor attribution"],
    }
    (dest / "submission.json").write_text(
        json.dumps(meta, indent=2, ensure_ascii=False) + "\n",
        encoding="utf-8")
    return dest

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--event", required=True, type=Path)
    parser.add_argument("--root", default=".", type=Path)
    args = parser.parse_args()
    event = json.loads(args.event.read_text(encoding="utf-8"))
    dest = render(event["issue"], args.root)
    print(f"Prepared unreviewed proposal: {dest}")

if __name__ == "__main__":
    main()
