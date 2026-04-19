---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-04-04
last-updated: 2026-04-04
lifecycle: seed-refinement
confidence: emerging
gap-status: resolved
gap-phase: integrated-into-seed
replaces: [[Seed Gap - Compound Condition Knowledge Handling]]
resolution-date: 2026-04-04
resolution-note: Enhanced compound-condition frontmatter added to Seed Section 7 (Applicability Boundaries)
tags:
  - seed-refinement
  - compound-condition
  - condition-hierarchy
  - temporal-conditions
---

# Seed Refinement: Enhanced Compound Condition Handling

**Replaces:** [[Seed Gap - Compound Condition Knowledge Handling]]

**Rule:** Extend compound condition metadata to include condition hierarchy, temporal stacks, and interaction documentation — enabling AI agents to handle complex multi-condition knowledge beyond simple AND/OR logic.

**Why:** The current compound-conditions frontmatter captures what conditions apply but not their relative importance, temporal dynamics, or interaction patterns. This limits AI agents' ability to reason about complex knowledge where conditions aren't equal. Without hierarchy, agents can't distinguish hard constraints from soft guidelines. Without temporal tracking, agents miss duration-dependent conditions. Without interaction documentation, agents can't compute how conditions combine.

**Test:** For notes with multiple applicability conditions: (1) Can you identify which conditions are hard vs soft? (2) Do conditions have temporal components (duration, timing)? (3) Is there explicit documentation of how conditions interact? (4) Does the frontmatter include condition-type, temporal-conditions, and condition-interaction fields?

**Implementation:** Extend frontmatter schema:

```yaml
compound-conditions:
  - condition: "Temperature below 40F"
    type: hard-constraint  # must satisfy
    weight: 1.0
  - condition: "High humidity above 80%"
    type: soft-guideline  # recommended but not required
    weight: 0.5

temporal-conditions:
  - condition: "Temperature > 70F for 3+ consecutive days"
    duration: 3
    temporal-type: consecutive
    active-window: spring|fall

condition-interaction:
  type: multiplicative
  formula: "At high humidity, increase cooking time by 1.5x"
  example: "Bread baking: humidity affects hydration absorption"
```

**Condition Types:**
- `hard-constraint`: Must be satisfied — knowledge invalid if violated
- `soft-guideline`: Recommended but not required — knowledge still valid if ignored
- `preference`: Optional optimization — knowledge works either way

**Temporal Types:**
- `consecutive`: Condition must hold for duration continuously
- `accumulated`: Condition must hold for total duration (can be non-contiguous)
- `threshold`: Once condition hits threshold, remains active for duration

**Interaction Types:**
- `additive`: Conditions sum together
- `subtractive`: Conditions reduce or cancel each other
- `multiplicative`: Conditions scale each other
- `threshold`: One condition triggers when another reaches threshold

**Edge Cases:**

1. **Conflicting conditions:** When hard-constraint and soft-guideline conflict, hard-constraint wins
2. **Missing temporal data:** Default to non-temporal (static condition) if duration unclear
3. **Condition cycles:** For periodic conditions (seasonal), use active-window to specify applicable periods

**See Also:**
- [[AI-Assisted Knowledge Management Seed]] — Base compound condition rule (Section 7)
- [[Seed Gap - Compound Condition Knowledge Handling]] — Original gap analysis
- [[Frontier Exploration - Compound Context Knowledge]] — Context overlap with conditions
- [[Note Creation Decision Framework]] — When to create compound-condition notes
