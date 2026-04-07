---
last-reviewed: 2026-04-05
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
knowledge-type: meta
gap-status: resolved
resolved: 2026-04-05
resolved-by: "[[AI-Assisted Knowledge Management Seed]] (line 1738-1754)"
gap-resolution-note: "Rule added to Seed on 2026-04-05: goal-scope frontmatter for goal-dependent domains"
tags:
  - seed-gap
  - goal-scope
  - utility-testing
  - domain-adaptation
---

# Seed Gap: Goal-Scope Handling

> The Seed lacks explicit handling for goal-dependent knowledge domains where the utility of a note varies based on user goals.

**Date:** 2026-04-05
**Discovery Method:** SEED_STRESS_TEST — Cross-domain stress testing
**Status:** IDENTIFIED — Needs Seed integration

---

## The Gap

The Seed's diminishing returns test asks "Does this improve vault answers?" — but in goal-dependent domains, this question is incomplete. The same knowledge has different utility depending on the user's goal.

### Evidence from Stress Tests

1. **Fitness Knowledge Base** (2026-03-21):
   - "Hypertrophy training" has high utility for muscle-building goals but zero utility for marathon training
   - The test should be: "Does this improve answers FOR THE SPECIFIED GOAL?"
   - Proposed: `goal-scope:` frontmatter

2. **Photography Knowledge Base** (2026-03-22):
   - "When to use shallow depth of field" — utility depends on whether user wants portraits vs. landscapes
   - The Seed's applicability-scope handles "who is this for?" but not "what goal does this serve?"

3. **Woodworking Knowledge Base** (2026-03-22):
   - "Table saw joinery techniques" — utility differs for furniture making vs. shop projects
   - The infrastructure rule handles equipment dependencies but not goal dependencies

4. **Pottery Knowledge Base** (2026-03-25):
   - "Glaze application techniques" — utility differs for functional pottery vs. decorative work
   - Context variables cover technique/material/context but not purpose

---

## Why This Matters

Without goal-scope handling:

1. **False utility assessments** — A note may appear to have low utility when evaluated generically, but high utility for a specific goal

2. **Goal-blind filtering** — The diminishing returns test cannot correctly filter notes without goal context

3. **Inability to prioritize** — Notes serving different goals cannot be correctly prioritized against each other

4. **Cross-goal confusion** — Notes from different goals get mixed, reducing vault usability for any specific goal

---

## Proposed Seed Rule

> **Rule (NEW):** For goal-dependent domains (fitness, finance, career, education, creative projects, photography, woodworking, pottery), add `goal-scope:` frontmatter to capture which goals this knowledge serves.
> 
> **Why:** In domains where the same knowledge has different utility depending on user goals, the Seed's utility test must be goal-contextualized. Without explicit goal-scope, AI agents cannot correctly evaluate whether a note improves vault answers.
> 
> **Test:** For goal-dependent domain notes: (1) Does frontmatter include `goal-scope:`? (2) Can you filter notes by goal? (3) Does the utility test evaluate within goal context, not in abstract?

### Implementation

```yaml
goal-scope: [list of applicable goals]
# Fitness examples:
goal-scope: [strength, hypertrophy, endurance, health, flexibility]
# Photography examples:
goal-scope: [portrait, landscape, street, macro, sports]
# Woodworking examples:
goal-scope: [furniture-making, cabinetry, shop-projects, restoration]
# Pottery examples:
goal-scope: [functional-ware, decorative, sculptural, production]
```

### Modified Utility Test

For goal-dependent domains, the utility test becomes:

1. **Utility (modified):**
   - Does this improve answers FOR THE SPECIFIED GOAL?
   - Does goal-scope match the intended user's goals?

2. **Connection (modified):**
   - Links to 2+ notes WITH SAME GOAL SCOPE
   - Links to goal-specific principles?

---

## Relationship to Existing Seed

This gap intersects with existing rules:

1. **applicability-scope** (line 1104): Handles "who is this for?" but not "what goal does this serve?"
2. **individual-variation** (line 1725): Handles person-specific knowledge but not purpose-specific knowledge
3. **knowledge-type**: Does not capture the goal dimension
4. **Diminishing returns test** (lines 1066-1083): Utility test is goal-blind

The proposed rule supplements these by adding a goal dimension to knowledge context.

---

## Prior Work

- [[Seed Refinement - Goal-Scope Handling]] (2026-04-04) — Proposed rule draft
- [[Seed Stress Test - Fitness Knowledge Base]] — First identification of gap
- [[Seed Stress Test - Photography Knowledge Base]] — Confirms gap
- [[Seed Stress Test - Woodworking Knowledge Base]] — Confirms gap

---

## Test for This Gap

1. Can you identify goal-dependent domains in your vault?
2. Do notes in these domains include `goal-scope:` frontmatter?
3. Does the utility test evaluate within goal context?
4. Can you filter notes by goal?

---

## Related

- [[AI-Assisted Knowledge Management Seed]]
- [[Seed Refinement - Goal-Scope Handling]]
- [[Seed Stress Test - Fitness Knowledge Base]]
- [[Seed Stress Test - Photography Knowledge Base]]
- [[Seed Stress Test - Woodworking Knowledge Base]]
- [[Seed Stress Test - Pottery and Ceramics Knowledge Base]]