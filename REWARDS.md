# Symbolic prizes

The Scottish Book recorded prizes offered for solutions to particular problems. The collection preserves this convention as an optional annotation. All prizes in the present catalogue are **symbolic**, unless a named sponsor separately makes and documents an actual offer.

No prize is a measure of difficulty, priority, originality or mathematical importance. The presence, absence or choice of prize has no bearing on the editorial assessment. A prize may be assigned to a complete solution, a specified partial result, an exact calculation, or a counterexample, provided the condition is stated in advance.

## Historical vocabulary

The following names are drawn from recorded Scottish Book prizes. They are retained as textual designations, without illustrations or pictograms.

| Designation | Historical context |
|---|---|
| A small black coffee | An alternative prize in Hugo Steinhaus's Problem 152 |
| One small beer | Offered for a particular outcome of Problem 152, among other instances |
| Five small beers | Recorded among the prizes in the original notebook |
| A bottle of wine | Recorded for several questions, including Problem 6 |
| A bottle of whisky of positive measure | Recorded in the historical collection and discussed in Mauldin's preface |
| One hundred grams of caviar | Offered for a calculation in Problem 152 |
| One kilogram of bacon | Recorded among the prizes in the original notebook |
| A live goose | Offered by Stanisław Mazur for Problem 153 and awarded to Per Enflo in 1972 |

The case of Problem 152 is instructive: different results were associated with different prizes. There was no uniform historical scale converting these rewards into numerical estimates of difficulty.

**Reference.** R. Daniel Mauldin (ed.), [*The Scottish Book: Mathematics from the Scottish Café, with Selected Problems from the New Scottish Book*](https://link.springer.com/book/10.1007/978-3-319-22897-6), second edition, Springer, 2015; especially the preface and Problems 6, 152 and 153.

## Recording a prize

The canonical problem index contains a `rewards` array for each entry. An empty array denotes **no assigned prize**, printed as a dash. Each approved entry has a designation from [the controlled vocabulary](data/rewards.json) and an explicit mathematical condition:

```json
{
  "rewards": [
    {
      "kind": "coffee",
      "condition": "A complete counterexample to the stated claim"
    }
  ]
}
```

This example is a **schema illustration**, not an offer for any numbered problem. Different conditions may have distinct prizes. Only the editorially approved terms appear in the public catalogue.

A newly submitted problem may suggest a prize, but no obligation is created by the suggestion. The proposer may choose none. Material prizes require a named, willing sponsor, a documented commitment, conditions and eligibility rules; none is implied by the historical labels or promised by the repository.

Mathematical credit is independent of a prize. Established predecessors, proofs, partial results, reproducible counterexamples and verified corrections must be attributed on their merits.
