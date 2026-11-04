# Prizes

The Scottish Book occasionally associated a specific reward with a mathematical question. This collection retains that convention in a contemporary form. A prize designation is independent of difficulty, originality, priority, and the status of the associated problem. Its mathematical condition must be stated explicitly.

**Every prize currently displayed in the catalogue is symbolic. No payment, object, sponsorship, or other material reward is presently promised.**

## Active designations

| Designation | Possible material interpretation, if independently sponsored |
|---|---|
| A Coffee | A coffee or an equivalent modest gift |
| A Book | A mathematical book chosen by the recipient |
| A Dinner | A meal or an equivalent gift |
| A Research Prize | An explicitly funded monetary award or contribution toward mathematical research |

These are four forms of recognition, **not a ranked system**. No amount, eligibility, recipient, or delivery obligation is implied by a designation. A Research Prize in symbolic state is no more a monetary commitment than a symbolic Coffee.

## States and evidence

| State | Requirements |
|---|---|
| **Symbolic** | A designation and mathematical condition only; no actual reward is offered |
| **Pledged** | A willing, named sponsor and a verifiable public commitment specifying terms and eligibility; funding is not yet verified |
| **Funded** | An explicit commitment with public terms and independent evidence that the promised resources are secured |
| **Awarded** | A verified qualifying result, identified recipient, and recorded award, including the agreed fulfillment |

The public catalogue states the status next to each assigned designation. Non-symbolic states require a matching record in [the commitment ledger](data/reward-commitments.json), including the sponsor and public documentary links; an awarded record additionally identifies the recipient and qualifying result. The ledger is currently empty. A proposed sponsorship does not change the published status. Sponsor claims are reviewed before any update, and the collection does not guarantee an outside sponsor's performance.

A proof, counterexample, and other mathematical work must be assessed and attributed independently of whether a prize exists. Awards do not constitute publication, refereeing, or historical novelty certification.

## Historical Scottish Book vocabulary

The original designations remain documented separately from the active catalogue.

| Historical designation | Recorded context |
|---|---|
| A small black coffee | One alternative in Hugo Steinhaus's Problem 152 |
| One small beer | Among the outcomes specified in Problem 152 |
| Five small beers | Recorded in the original notebook |
| A bottle of wine | Offered for several problems, including Problem 6 |
| A bottle of whisky of positive measure | Discussed in Mauldin's preface |
| One hundred grams of caviar | Included in Problem 152 |
| One kilogram of bacon | Recorded in the original notebook |
| A live goose | Offered by Stanisław Mazur for Problem 153 and awarded to Per Enflo in 1972 |

**Source.** R. Daniel Mauldin (ed.), [*The Scottish Book: Mathematics from the Scottish Café, with Selected Problems from the New Scottish Book*](https://link.springer.com/book/10.1007/978-3-319-22897-6), 2nd ed., Springer, 2015; particularly its preface and Problems 6, 152, and 153. See also [MacTutor's biography of Mazur](https://mathshistory.st-andrews.ac.uk/Biographies/Mazur/).

## Continuity of the catalogue

The former symbolic assignments have been transferred to the four active designations as follows. This is an **editorial replacement of labels**, not a historical exchange rate or a ranking of prizes.

| Former designation | Current designation |
|---|---|
| A small black coffee; one small beer | A Coffee |
| Five small beers; a bottle of wine | A Book |
| A bottle of whisky; one kilogram of bacon | A Dinner |
| One hundred grams of caviar; a live goose | A Research Prize |

The complete original list of designations, mathematical conditions, and problem-by-problem assignments is retained in [the archival migration record](data/rewards-historical.json). These earlier assignments were symbolic choices made by this collection, **not** awards offered in the historical Scottish Book. Permanent problem numbers and mathematical prize conditions are preserved.

## Recording a prize

The source of truth is [data/problems.json](data/problems.json). Every entry has a `rewards` array. An empty array denotes no assigned prize. A symbolic entry has the following form:

```json
{
  "rewards": [
    {
      "kind": "coffee",
      "condition": "A complete counterexample to the stated conjecture",
      "status": "symbolic"
    }
  ]
}
```

This is a schema example, not an offer for a numbered problem. The controlled vocabulary and states are defined in [data/rewards.json](data/rewards.json). Non-symbolic entries require a matching `commitment_id` and documented terms in the commitment ledger. The catalogue generator rejects unsupported states.

A problem proposal may suggest a designation or no prize. The proposal does not create an obligation. Each reward condition is determined editorially, independently of the research question's novelty or importance. An award can be recorded only after verifying the qualifying mathematical result and the applicable terms.
