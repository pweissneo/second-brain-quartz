---
last-reviewed: 2026-04-03
lifecycle: seed-gap
confidence: medium
author-type: ai-assisted
tags:
  - seed-gap
  - learning
  - progression
  - curriculum
gap-status: proposed
gap-priority: medium
gap-phase: implementation
resolution-target: 2026-04-10
gap-severity: useful
gap-source: frontier-exploration
discovered: 2026-04-03
---

# Seed Gap - Learning Progression Organization

## Identified Gap

The Seed lacks an explicit rule for organizing learning progressions in learning-focused knowledge bases.

## Where it Manifests

The Seed currently covers:
- Prerequisite tracking via wikilinks to missing notes
- Sequential-skill domains edge case (language, music, math, programming) - allows 6-hop depth
- Foundation notes prioritization
- Verification priority hierarchy

What's missing:
- **No explicit learning progression rule** - How to design a learnable sequence from entry to competence
- **No curriculum design principles** - How to identify primitives, milestones, and exit criteria
- **No learning-entry-point rule** - Where should a complete beginner start?
- **No milestone-tracking rule** - How to mark progress through a learning path

## Impact

Without explicit learning progression rules:
1. Learning-focused vaults become reference vaults in disguise
2. Learners must navigate the graph without explicit path guidance
3. "Completion" is undefined - no exit criteria
4. Can't distinguish content dependencies (can't understand B without A) from learning dependencies (A makes B easier but not required)

## Proposed Rule

**Rule:** For learning-focused vaults, define explicit learning progression — identify entry points, milestone nodes, and exit criteria.

**Why:** Without explicit progression, learning vaults lack the structural guidance that distinguishes "learning" from "reference." A learner needs a path with milestones, not just a graph to explore.

**Test:** 
1. Can you trace a learning path from zero to basic competence?
2. Are there explicit milestone notes marking progress?
3. Can a learner determine when they've "completed" the basics?
4. Is there a clear entry point for complete beginners?

## Implementation

```yaml
learning-focused: true
vault-purpose: learning|reference|hybrid
learning-progression:
  entry-point: [[Note Name]]
  milestones:
    - name: "Basic competence"
      criteria: "Can perform X independently"
      exit-note: [[Exit Note Name]]
  path-type: linear|spiral|branching|discovery
```

## Related Frontier Notes

- [[Frontier Exploration - Learning Progression and Curriculum Design]] - documents the problem space
- [[Seed Stress Test - Prerequisites Rule in Framework Learning]] - edge case for sequential skills

## Edge Cases to Consider

1. **Mutually-supporting knowledge** - Where A and B both help understand each other (vocabulary + grammar)
2. **Parallel prerequisites** - Multiple entry points possible
3. **Spiral curriculum** - Same concepts at increasing complexity
4. **Domain-specific primitives** - What's "primitive" varies by domain

## Gap Lifecycle

- **Status:** identified → Needs analysis and proposed rule
- **Next:** Write proposed rule in Rule/Why/Test format with edge cases
- **Target:** Merge into Seed Foundation section or create new section on Learning-Focused Vaults