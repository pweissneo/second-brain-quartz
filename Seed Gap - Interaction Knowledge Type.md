---
lifecycle: seed-gap
confidence: emerging
last-reviewed: 2026-03-28
author-type: ai-assisted
tags:
  - seed-gap
  - knowledge-type
  - interaction-knowledge
  - domain-agnostic
gap-type: seed-missing
gap-status: resolved
gap-priority: high
resolved: 2026-03-28
resolved-by: Seed
gap-resolution-note: "Added rule for interaction knowledge type to Seed section 6 (Knowledge Processing) on 2026-03-28"
---

# Seed Gap: Interaction Knowledge Type

## What Knowledge Type Is Missing

The Seed has rules for many knowledge types:
- Procedural (how to do X)
- Conceptual (what X means)
- Temporal (time-dependent)
- Conditional (if-then)
- Recognition (pattern identification)
- Troubleshooting (diagnostic reasoning)

But it lacks explicit handling for **interaction knowledge** — knowledge about how elements combine, interact, or affect each other when brought together.

## Examples of Interaction Knowledge

1. **Beverage-food pairing**: Wine + fatty fish = acid cuts fat
2. **Color combinations**: Blue + orange = complementary contrast
3. **Medication interactions**: Drug A + Drug B = adverse reaction
4. **Material compatibility**: Wood species + finish type = durability outcome
5. **Software integration**: API A + API B = data flow

## Why the Gap Exists

The existing knowledge types assume elements are independent:
- Procedural: doing X achieves Y
- Conditional: if A then B (binary state)
- Conceptual: X is Y (definition)

But interaction knowledge is about **emergent properties** — the combination produces something neither element has alone. This requires:
- Tracking directionality (A affects B ≠ B affects A)
- Capturing mechanism (chemical, structural, logical basis)
- Distinguishing structural interaction from subjective preference

## Proposed Rule

**Rule:** For interaction knowledge (knowledge about how elements combine or affect each other), capture with:
- The participating elements
- The interaction direction (A→B, B→A, mutual, neutral, conflicting)
- The mechanism (why the interaction produces its effect)
- The subjectivity level (structural | cultural | preference)

**Why:** Interaction knowledge is distinct from substitution (replacing one element), evaluation (judging quality), and simple conditions (binary applicability). Without explicit handling, AI agents cannot distinguish "A goes with B" (simple list) from "A and B interact to produce C" (interaction).

**Test:** For notes about combinations: (1) Are participating elements identified? (2) Is directionality stated? (3) Is mechanism explained? (4) Is subjectivity level indicated?

## Related Work

- [[Frontier Exploration - Beverage-Food Pairing Knowledge]] — detailed exploration of this gap in culinary domain
- [[Frontier Exploration - Ingredient Substitution Knowledge]] — related but different (substitution vs. interaction)
- [[Frontier Exploration - Equivalent Alternatives and Contextual Selection]] — selection between alternatives
- [[Frontier Exploration - Relational Knowledge]] — relationship types between concepts

## Resolution Path

This gap should be resolved by adding a knowledge-type rule to the Seed's Knowledge Processing section, with implementation in frontmatter:
```yaml
knowledge-type: interaction
interaction-type: complement|contrast|conflict|neutral
direction: a-enhances-b|b-enhances-a|mutual
mechanism: chemical|structural|cultural|preference
```

---

*Discovered during heartbeat: 2026-03-28*
*Resolution status: resolved by Seed rule addition 2026-03-28*