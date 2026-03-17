---
last-reviewed: 2026-03-17
last-updated: 2026-03-17
confidence: emerging
author-type: ai-assisted
lifecycle: active
tags:
  - frontier-exploration
  - constraints
  - knowledge-organization
---

# Frontier Exploration - Multi-Constraint Interaction Knowledge

## The Problem

The Seed handles single-constraint knowledge well: time-constrained recipes, budget-constrained cooking, skill-level-dependent explanations. But it underweights **constraint interaction** — knowledge where the combination of constraints creates a unique problem space that no single constraint predicts.

### Example Scenarios

- "Quick meals under 30 minutes" (single constraint: time)
- "Budget cooking under $10/day" (single constraint: budget)  
- **"One-handed cooking for people with motor impairments, on a budget, under 30 minutes"** (three constraints interacting)

The third scenario is NOT just the union of three single constraints — the interaction creates emergent requirements. A one-handed cook with 30 minutes and $10 has different optimal solutions than any single constraint would suggest.

## Why Current Rules Miss This

1. **Diminishing returns test** evaluates notes against individual criteria, not constraint combinations
2. **User situational constraints** covers single constraints but not their interactions
3. **Expertise-level dependent knowledge** handles skill level but not compound situational limits

## The Gap

When an AI builds a knowledge base about "quick meals for students," it follows the constraint rules and creates a "Quick Meals" hub and a "Student Budget" hub. But the intersection — meals that work for time-poor, budget-constrained students — requires NEW atomic notes that don't emerge from either constraint alone.

The knowledge is **greater than the sum of its constraints**.

## Test for Multi-Constraint Knowledge

A note contains multi-constraint interaction knowledge when:
1. It specifies 2+ constraints that MUST be satisfied simultaneously
2. The optimal solution differs from solutions that satisfy any single constraint
3. Following single-constraint advice would produce suboptimal results

## Proposed Rule Addition

**Rule:** For knowledge domains with multiple interacting constraints, create intersection notes capturing the emergent solution space, not just the union of constraint-specific knowledge.

**Why:** Single-constraint hubs miss the interaction effects. A student who is both time-poor AND budget-constrained needs different advice than either constraint alone would suggest.

**Test:** For a domain with constraints A, B, C: Can you identify notes addressing A+B, B+C, A+C, AND A+B+C? If only single-constraint notes exist, the interaction space is unexplored.

## Implementation

Tag multi-constraint notes with:
```yaml
constraint-interaction: true
constraints:
  - type: time
    value: "30 minutes"
  - type: budget
    value: "$10/day"
  - type: skill-level
    value: beginner
interaction-effect: "Why the combination creates a unique problem"
```

Create constraint intersection hubs when:
- 2+ constraints frequently co-occur in retrieval patterns
- The domain has known interaction effects
- Users explicitly ask for "X AND Y" solutions

## Edge Cases

- **Constraint independence:** Some constraints truly don't interact (time and color preference). Don't force intersection notes when solution space is truly additive.
- **Constraint hierarchies:** Some constraints dominate others. Document which constraint drives the solution when interactions exist.
- **Personal constraint variation:** Individual constraints (dietary restrictions, allergies) may override situational ones. Use `constraint-priority:` to rank.

## Domains Where This Matters Most

- Cooking (time + budget + dietary + equipment + skill)
- Home repair (cost + time + skill + tools owned + safety)
- Travel planning (budget + time + accessibility + interests + season)
- Learning (time + cost + prior-knowledge + access + goal)
- Healthcare navigation (insurance + location + language + urgency)

## Related Notes

- [[Frontier Exploration - User Situational Constraints]]
- [[Frontier Exploration - Recipe and Menu Design Knowledge]]
- [[Frontier Exploration - Expertise-Level Dependent Knowledge]]
- [[Frontier Exploration - Equivalent Alternatives and Contextual Selection]]
- [[AI-Assisted Knowledge Management Seed]]
