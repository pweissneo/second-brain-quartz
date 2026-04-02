---
last-reviewed: 2026-04-01
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
gap-status: proposed
gap-priority: medium
gap-phase: implementation
gap-review-date: 2026-04-30
discovered: 2026-04-01
proposed: 2026-04-02
tags:
  - seed-gap
  - compound-knowledge
  - multi-condition
---

# Seed Gap: Compound Condition Knowledge Handling

## Observed Gap

The Seed has rules for single-condition knowledge and compound-conditions frontmatter, but lacks guidance for notes where multiple conditions interact in complex ways beyond simple AND/OR logic.

## What the Seed Covers

- [[Rule: Compound Condition Knowledge]] — Tags knowledge with `compound-conditions:` frontmatter listing dependencies
- [[Rule: Distinguishing Prescriptive from Descriptive Knowledge]] — Different resolution for prescriptive vs descriptive
- [[Rule: Handling Framework-Dependent Knowledge]] — Framework tagging for different paradigms

## What's Missing

### 1. Multi-Layer Condition Stacking

When conditions nest (A applies when B applies when C applies), the current single-layer compound-conditions doesn't capture the hierarchy.

**Example:**
- Note: "Winter camping insulation layer order"
- Conditions: Temperature below X AND humidity above Y AND wind speed above Z
- Each condition has thresholds that interact non-linearly

### 2. Temporal Condition Stacks

Some knowledge depends on conditions that change over time, not just static states.

**Example:**
- Note: "Herbicide application timing"
- Conditions: Temperature >X for Y consecutive days AND soil moisture <Z% AND plant growth stage = A OR B

### 3. Condition Confidence Weighting

Different conditions have different reliability — some are "hard constraints" while others are "soft guidelines."

**Example:**
- Note: "Bread baking hydration levels"
- Hard constraint: hydration >50% for structural integrity
- Soft guideline: hydration 65-80% for different styles
- Current rule doesn't distinguish

## Proposed Rules

### Condition Hierarchy Frontmatter

```yaml
condition-stack:
  - condition: "Primary condition"
    type: hard-constraint|soft-guideline|preference
    weight: 0.8
  - condition: "Secondary condition"
    type: hard-constraint|soft-guideline|preference  
    weight: 0.5
```

### Temporal Condition Metadata

```yaml
temporal-conditions:
  - condition: "Temperature > 70F"
    duration-required: 3  # days
    temporal-type: consecutive|accumulated|threshold
    active-window: spring|fall|summer|winter|any
```

### Condition Interaction Documentation

```yaml
condition-interaction:
  type: additive|subtractive|multiplicative|threshold
  interaction-formula: "Description of how conditions combine"
  example: "At high humidity, increase cooking time by 1.5x"
```

## Test

For notes with multiple applicability conditions:
1. Can you identify which conditions are hard vs soft?
2. Do conditions have temporal components (duration, timing)?
3. Is there explicit documentation of how conditions interact?

## See Also

- [[Frontier Exploration - Compound Context Knowledge]]
- [[Seed Refinement - Compound Condition Frontmatter]] (proposed)
- [[Frontier Exploration - Multi-Condition Knowledge Verification]]