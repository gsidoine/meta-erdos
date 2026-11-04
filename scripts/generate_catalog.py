#!/usr/bin/env python3
"""Regenerate the single public catalogue and derived browser data.

The previous editorial partition remains an archival data file; it is not a
public ranking and does not govern the publication of individual problems.

Usage:
    python scripts/generate_catalog.py
    python scripts/generate_catalog.py --check
"""
import argparse
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / "data" / "problems.json"
REWARD_TYPES = ROOT / "data" / "rewards.json"
REWARD_COMMITMENTS = ROOT / "data" / "reward-commitments.json"
README = ROOT / "README.md"
BROWSER_DATA = ROOT / "docs" / "problems.json"
BROWSER_REWARDS = ROOT / "docs" / "rewards.json"
CURATION = ROOT / "data" / "curation.json"
BROWSER_CURATION = ROOT / "docs" / "curation.json"  # retained for historical links
START = "<!-- CATALOG:START -->"
END = "<!-- CATALOG:END -->"
DOSSIER_START = "<!-- DOSSIER-SUMMARY -->"
DOSSIER_END = "<!-- /DOSSIER-SUMMARY -->"


def dossier_summary(p):
    root = "../" * len(Path(p["file"]).parent.parts)
    return "\n".join([
        DOSSIER_START,
        f"> **Research question:** {p['question']}  ",
        f"> **Formulation:** {p['status']}. **Novelty:** {p['novelty']}.  ",
        f"> **Verified/known progress:** {p['result']}.  ",
        f"> **Finite evidence:** {p['verification']}.  ",
        f"> **Symbolic prize:** {reward_text(p, {r['id']: r['label'] for r in json.loads(REWARD_TYPES.read_text(encoding='utf-8'))['rewards']})}  ",
        f"> **Navigation:** [Full problem catalogue]({root}README.md#problem-catalogue) · "
        f"[Status and scope]({root}README.md#status-and-scope) · "
        f"[Literature and audits]({root}README.md#literature-and-audits)",
        DOSSIER_END,
    ])


def replace_marked(text, start, end, replacement):
    if text.count(start) != 1 or text.count(end) != 1:
        raise ValueError(f"Expected exactly one marker pair: {start} / {end}")
    a = text.index(start)
    b = text.index(end) + len(end)
    if a >= b:
        raise ValueError("Marker ordering is invalid")
    return text[:a] + replacement + text[b:]


def reward_text(problem, menu):
    prizes = problem["rewards"]
    if not isinstance(prizes, list):
        raise ValueError(f"{problem['id']}: rewards must be a list")
    commitments = json.loads(REWARD_COMMITMENTS.read_text(encoding="utf-8"))
    if commitments.get("schema_version") != 1:
        raise ValueError("Invalid reward commitment ledger")
    records = commitments.get("commitments")
    if not isinstance(records, list):
        raise ValueError("Reward commitment ledger must be a list")
    by_id = {c.get("id"): c for c in records if isinstance(c, dict)}
    if len(by_id) != len(records):
        raise ValueError("Duplicate or malformed reward commitments")
    descriptions = []
    used = set()
    statuses = {"symbolic", "pledged", "funded", "awarded"}
    for prize in prizes:
        if not isinstance(prize, dict):
            raise ValueError(f"{problem['id']}: malformed reward")
        status = prize.get("status")
        expected = {"kind", "condition", "status"}
        if status != "symbolic":
            expected.add("commitment_id")
        if set(prize) != expected or status not in statuses:
            raise ValueError(f"{problem['id']}: reward requires a valid kind, condition and state")
        kind, condition = prize["kind"], prize["condition"]
        if kind not in menu:
            raise ValueError(f"{problem['id']}: unknown reward {kind!r}")
        if not isinstance(condition, str) or not condition.strip() or len(condition) > 300:
            raise ValueError(f"{problem['id']}: reward needs a precise condition")
        if (kind, condition) in used:
            raise ValueError(f"{problem['id']}: duplicate reward")
        used.add((kind, condition))
        if status != "symbolic":
            c = by_id.get(prize["commitment_id"])
            if not c or c.get("problem_id") != problem["id"] or c.get("kind") != kind:
                raise ValueError(f"{problem['id']}: documented reward commitment missing")
            if c.get("status") != status or not all(
                isinstance(c.get(k), str) and c[k].strip()
                for k in ("sponsor", "terms_url", "evidence_url")
            ):
                raise ValueError(f"{problem['id']}: commitment status or evidence missing")
            if not all(c[k].startswith("https://") for k in ("terms_url", "evidence_url")):
                raise ValueError(f"{problem['id']}: commitment evidence must be an https URL")
            if status == "awarded" and not (
                isinstance(c.get("recipient"), str) and c["recipient"].strip()
                and isinstance(c.get("resolution_url"), str)
                and c["resolution_url"].startswith("https://")
            ):
                raise ValueError(f"{problem['id']}: awarded prize needs recipient and resolution")
        label = menu[kind]
        descriptions.append(f"{label} ({status}) — {condition.strip()}")
    return "; ".join(descriptions) if descriptions else "—"

def generate():
    obj = json.loads(DATA.read_text(encoding="utf-8"))
    records = obj["problems"]
    ids = [r["id"] for r in records]
    if ids != [f"P{i:03d}" for i in range(1, len(ids) + 1)]:
        raise ValueError("Problem identifiers must remain permanent and consecutive")
    catalog = json.loads(REWARD_TYPES.read_text(encoding="utf-8"))
    labels = {r["id"]: r["label"] for r in catalog["rewards"]}
    if len(labels) != len(catalog["rewards"]):
        raise ValueError("Duplicate reward names in the symbolic menu")
    old_allocation = json.loads(CURATION.read_text(encoding="utf-8"))
    archived_ids = [id for key in ("primary", "secondary", "resolved")
                    for id in old_allocation[key]]
    # The old editorial partition is a frozen historical snapshot, not an
    # admission requirement for newly numbered problems.
    if (len(archived_ids) != len(set(archived_ids))
            or sorted(archived_ids) != [f"P{i:03d}" for i in range(1, 47)]
            or any(old_id not in ids for old_id in archived_ids)):
        raise ValueError("Archived editorial allocation has been altered")
    lines = [
        "| ID | Question | Area | Formulation | Novelty | Reward |",
        "|---|---|---|---|---|---|",
    ]
    for r in records:
        reward = reward_text(r, labels).replace("|", r"\|").replace("\n", " ")
        lines.append(
            f"| [{r['id']}]({r['file']}) | {r['title']} | "
            f"{r['area']} | {r['status']} | {r['novelty']} | {reward} |"
        )
    old = README.read_text(encoding="utf-8")
    readme = replace_marked(old, START, END,
                            START + "\n" + "\n".join(lines) + "\n" + END)
    browser = json.dumps(obj, ensure_ascii=False, indent=2) + "\n"
    historical = json.dumps(old_allocation, ensure_ascii=False, indent=2) + "\n"
    return readme, browser, historical


def dossier_views():
    for record in json.loads(DATA.read_text(encoding="utf-8"))["problems"]:
        path = ROOT / record["file"]
        original = path.read_text(encoding="utf-8")
        desired = replace_marked(original, DOSSIER_START, DOSSIER_END,
                                 dossier_summary(record))
        yield path, desired


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true",
                        help="Exit nonzero if generated content is stale")
    args = parser.parse_args()
    readme, browser, historical = generate()
    menu_view = json.dumps(
        json.loads(REWARD_TYPES.read_text(encoding="utf-8")),
        ensure_ascii=False, indent=2
    ) + "\n"
    views = [(README, readme), (BROWSER_DATA, browser),
             (BROWSER_CURATION, historical),
             (BROWSER_REWARDS, menu_view)] + list(dossier_views())
    if args.check:
        stale = [str(p.relative_to(ROOT)) for p, expected in views
                 if p.read_text(encoding="utf-8") != expected]
        if stale:
            parser.exit(1, "Outdated generated file(s): " + ", ".join(stale) + "\n")
        print("The catalogue, reward menu and dossier summaries are current.")
    else:
        for path, expected in views:
            path.write_text(expected, encoding="utf-8")
        print("Regenerated public catalogue and browser data.")
