---
last-reviewed: 2026-04-04
last-updated: 2026-04-04
lifecycle: seed-refinement
confidence: medium
author-type: ai-assisted
verification-status: pending
gap-status: identified
gap-source: seed-stress-test-fitness
gap-severity: useful
tags:
  - seed-refinement
  - goal-scope
  - domain-adaptation
  - fitness
  - utility-test
---

# Seed Refinement - Goal-Scope Handling for Goal-Dependent Domains

> Adding goal-scope frontmatter to the Seed for domains where knowledge utility is goal-dependent
> Date: 2026-04-04

## Gap Identified

From [[Seed Stress Test - Fitness Knowledge Base]] (2026-03-21):

> **Gap Analysis: What's Missing from the Seed**
> ### 1. No Explicit Goal-Scope Handling
> The Seed doesn't address that knowledge utility is goal-dependent. A note has different utility for different goals.
> **Proposed addition to Seed:**
> > For goal-dependent domains (fitness, finance, career), add `goal-scope:` frontmatter. Test utility within goal context, not in abstract.

This gap was identified 14 days ago but has not been resolved.

## Why This Matters

In goal-dependent domains, the same knowledge has different utility depending on the user's goal:

**Fitness example:**
- A note about "hypertrophy training" has HIGH utility for muscle-building goals but ZERO utility for marathon training
- A note about "steady-state cardio" has HIGH utility for endurance goals but may be counterproductive for strength goals

**Finance example:**
- A note about "aggressive growth investing" has high utility for young investors but may be inappropriate for retirees

**Career example:**
- A note about "salary negotiation tactics" has different utility depending on career stage (early vs. mid vs. senior)

Without goal-scope, the Seed's utility test ("Does this improve vault answers?") is incomplete for these domains.

## Proposed Seed Addition

Add to the Foundation rules (around line 200-250) or create a new rule:

> **Rule (NEW - 2026-04-04):** For goal-dependent domains (fitness, finance, career, education, creative projects), add `goal-scope:` frontmatter to capture which goals this knowledge serves.
>
> **Why:** In domains where the same knowledge has different utility depending on user goals, the Seed's utility test must be goal-contextualized. Without explicit goal-scope, AI agents cannot correctly evaluate whether a note improves vault answers.
>
> **Test:** For goal-dependent domain notes: (1) Does frontmatter include `goal-scope:`? (2) Can you filter notes by goal? (3) Does the utility test evaluate within goal context, not in abstract?

### Implementation

```yaml
goal-scope: [list of applicable goals]
goal-context: "Primary goal this note serves"

# Fitness examples:
goal-scope: [strength, hypertrophy]
goal-context: "Muscle-building focused training"

goal-scope: [endurance, health]
goal-context: "General cardiovascular fitness"

# Finance examples:
goal-scope: [retirement, wealth-preservation]
goal-context: "Preservation-focused for near-retirement"

goal-scope: [growth, wealth-building]
goal-context: "Long-term growth for early-career"

# Career examples:
goal-scope: [advancement, negotiation]
goal-context: "Mid-career salary negotiation"

goal-scope: [skill-development, learning]
goal-context: "Early-career skill building"
```

### Modified Utility Test

For goal-dependent domains, the utility test becomes:

**Original:** Does this improve vault answers?

**Modified:** Does this improve vault answers FOR THE SPECIFIED GOAL?

This requires goal-scope to be defined before the utility test can be applied.

## Domains That Need Goal-Scope

| Domain | Common Goals |
|--------|--------------|
| Fitness | strength, hypertrophy, endurance, health, flexibility, weight-loss, performance |
| Finance | retirement, growth, income, preservation, tax-optimization |
| Career | advancement, skill-development, transition, negotiation, leadership |
| Education | certification, skill-acquisition, understanding, research |
| Creative Projects | album, film, novel, game, podcast |

## Relationship to Existing Rules

- **Equipment-scope** (already in Seed): Handles resource dependencies
- **Individual-variation** (already in Seed): Handles person-specific knowledge
- **Goal-scope** (proposed): Handles goal-dependent utility

These three work together:
- Equipment-scope: Can you even DO this?
- Individual-variation: Does this apply to YOU?
- Goal-scope: Does this help you achieve YOUR GOAL?

## Risk Assessment

- **Low risk:** Adds optional frontmatter, doesn't change existing behavior
- **Compatibility:** Works with existing equipment-scope, individual-variation rules
- **Precedent:** Establishes pattern for other goal-dependent domains

## See Also

- [[Seed Stress Test - Fitness Knowledge Base]] (original stress test with detailed analysis)
- [[AI-Assisted Knowledge Management Seed]] (line ~200 for utility test context)
- [[Frontier Exploration - Fitness and Exercise Knowledge Bases]]
- [[Seed Refinement - Fitness Verification Timeline Integration]] (similar domain-specific integration)