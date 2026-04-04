---
last-reviewed: 2026-04-03
last-updated: 2026-04-03
lifecycle: seed-refinement
confidence: medium
author-type: ai-assisted
gap-status: integrated
resolved-by: [[Seed Refinement - Learning Progression Organization]]
resolved: 2026-04-03
---

# Seed Refinement - Learning Progression Organization

## Context

The Seed Gap "Learning Progression Organization" identified that the Seed lacked an explicit rule for organizing learning progressions in learning-focused knowledge bases. The gap was documented with a proposed rule in Rule/Why/Test format.

This refinement integrates the proposed rule into the Seed's Foundation section.

## Integration

### New Rule Addition

Add to Foundation section after "Prioritize foundational concepts before applications":

**Rule (NEW - 2026-04-03):** For learning-focused vaults, define explicit learning progression — identify entry points for complete beginners, milestone nodes marking progress, and exit criteria for basic competence.

**Why:** Without explicit progression, learning vaults lack the structural guidance that distinguishes "learning" from "reference." A learner needs a path with milestones, not just a graph to explore. The Seed covers prerequisite tracking and sequential-skill domains but doesn't explicitly address designing learnable sequences.

**Test:** For learning-focused vaults: (1) Can you trace a learning path from zero to basic competence? (2) Are there explicit milestone notes marking progress? (3) Can a learner determine when they've "completed" the basics? (4) Is there a clear entry point for complete beginners?

**Implementation:**
```yaml
vault-purpose: learning|reference|hybrid
learning-focused: true  # if learning is primary purpose
learning-progression:
  entry-point: [[Note Name]]  # where beginners start
  milestones:
    - name: "Basic competence"
      criteria: "Can perform X independently"
      exit-note: [[Exit Note Name]]
  path-type: linear|spiral|branching|discovery
```

### Entry Point Requirements

For learning-focused vaults, the entry point note must:
- Assume zero prior knowledge
- Define prerequisites explicitly
- Link to first milestone
- Include self-assessment criteria

### Milestone Design

Milestone notes should include:
- What the learner can do after completing
- Links to prerequisite milestones
- Links to exit criteria if final milestone
- Progress indicators (e.g., "You are here")

### Exit Criteria

Define what "basic competence" means for the domain:
- Can perform core tasks independently
- Knows when to seek help
- Can explain core concepts
- Can apply knowledge to novel situations

## Edge Cases

1. **Mutually-supporting knowledge** (vocabulary + grammar): Create parallel paths with cross-links, not sequential dependency
2. **Multiple entry points**: Allow different paths for different backgrounds, document each entry point's assumed knowledge
3. **Spiral curriculum**: Same concepts at increasing complexity — create milestone layers, not linear progression
4. **Domain-specific primitives**: Document what "primitive" means for the domain (e.g., scales in music, equations in math)

## Related Notes

- [[Seed Gap - Learning Progression Organization]] — original gap (now integrated)
- [[Frontier Exploration - Learning Progression and Curriculum Design]] — problem space documentation
- [[Seed Stress Test - Prerequisites Rule in Framework Learning]] — sequential-skill edge case
- [[Seed Stress Test - Knowledge Type Taxonomy in Language Learning]] — knowledge type for learning content

## Gap Lifecycle Update

- **Previous status:** proposed, phase: implementation
- **New status:** integrated
- **Resolution:** Rule added to Seed Foundation section