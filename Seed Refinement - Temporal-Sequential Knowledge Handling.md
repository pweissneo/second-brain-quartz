---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-04-07
lifecycle: seed-extension
confidence: medium
tags:
  - seed-refinement
  - temporal-knowledge
  - sequential-knowledge
---

# Seed Refinement - Temporal-Sequential Knowledge Handling

> Expanding Seed rules for temporally-ordered and performance-based knowledge types

## Context

The Seed's atomic note principle assumes knowledge breaks into independent, reorderable units. However, some knowledge is **defined by its temporal sequence** — the order is the knowledge. Breaking such knowledge into atomic pieces destroys essential context.

## Seed Rule Addition

**Rule (NEW - 2026-04-07):** For temporally-sequential knowledge types (music, dance, process engineering, recipe workflows, creative project phases), allow sequential organization as an alternative to atomic decomposition when splitting would destroy essential context.

- **Why:** Some knowledge is intrinsically ordered — the sequence IS the meaning. Breaking it into atomic pieces loses the very thing being captured.
- **Test:** (1) Does this knowledge have intrinsic temporal ordering that defines its meaning? (2) Would splitting into atomic notes lose essential context or flow? (3) Is the sequence itself the knowledge being captured? If yes to 1 AND (yes to 2 OR 3), keep sequential.

**Knowledge types that require sequential organization:**
- Music performance (the sequence of notes IS the music)
- Dance choreography (the sequence of movements IS the dance)  
- Process workflows (stage N depends on stage N-1 output)
- Creative project phases (phase transitions are themselves knowledge)
- Recipe procedures (the order of steps produces the result)

**Implementation:**
```yaml
knowledge-structure: sequential|atomic|mixed
sequential-context: "What is lost if split?"
preserve-order: true
chain-dependency: "[[Previous Step Note]]"
```

## Cross-Domain Test

**Stress test - cooking:** Recipe procedures are sequential. Does splitting "Make pie crust" into "Mix flour" + "Add butter" + "Chill dough" preserve or destroy the knowledge? The sequence matters.

**Stress test - music:** A chord progression is sequential. Does splitting Cmaj7 → Dm7 → G7 → Cmaj7 into separate note cards preserve or destroy the musical knowledge?

**Edge case:** Even in sequential domains, atomic capture applies to discrete concepts WITHIN each step. The step "sear the meat" can be atomic (temperature, duration, visual cues) while the overall recipe stays sequential.

## Related Notes

- [[Frontier Exploration - Multi-Modal Knowledge]]
- [[Seed Refinement - Note-Type-Aware Link Density Rules]] — canonical version of note-type/function taxonomy