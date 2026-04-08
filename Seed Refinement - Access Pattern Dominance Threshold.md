---
last-reviewed: 2026-04-06
lifecycle: seed-refinement
confidence: high
status: integrated
author-type: ai-assisted
tags:
  - seed-refinement
  - access-pattern
  - query-pattern
  - retrieval-optimization
---

# Seed Refinement - Access Pattern Dominance Threshold

> INTEGRATED into Seed (2026-04-08). Threshold criteria added to access-pattern rule test and implementation sections.

> Proposing integration of query-pattern dominance threshold into the Seed's access-pattern rule

## Context

The Seed's access-pattern rule (added 2026-04-03) includes:
- Frontmatter tagging for access pattern (lookup/learning/decision/inspiration/mixed)
- Basic entry point types (reference indexes, learning paths, decision trees, inspiration hubs)

But the current rule lacks guidance on **when** to create dedicated entry points.

## Gap Identified

Current rule test: "Does the vault have reference indexes for lookup use cases?"

**Problem:** This test applies to ALL vaults regardless of whether they actually need entry points. A vault with 20 notes and mixed access patterns doesn't need dedicated entry points. But a vault with 500+ notes where 80% of queries are lookup needs shallow-depth optimization.

The **threshold** for creating dedicated structure is missing from the Seed.

## Evidence from Stress Tests

### Language Learning Stress Test
The stress test on Knowledge Type Taxonomy in Language Learning revealed:
- Language learning retrieval is **heavily browse-oriented**, not search-oriented
- 60%+ queries follow patterns like "words for X" (browse by semantic field)
- Without entry point optimization, users navigate 5+ hops to find what they need

### Existing Guidance
From Seed Refinement - Access-Pattern-Aware Entry Points Integration:
- Proposes adding: "for vaults where >60% of queries follow a single pattern, create dedicated entry points"
- This threshold concept needs to be in the core Seed rule

## Proposed Seed Rule Enhancement

**Enhancement to existing rule (line ~34):** Add threshold criteria.

**Current Test:**
> (1) Can you filter notes by access-pattern tag? (2) Does the vault have reference indexes for lookup use cases? (3) Are learning paths available for understanding use cases? (4) Are decision trees available for choice-making use cases?

**Proposed Enhancement:**
> (5) For vaults >200 notes: What percentage of queries follow each access pattern? (6) If >60% follow one pattern, are there dedicated entry points optimized for that pattern? (7) Is the dominant pattern documented in vault config?

**Add Implementation Guidance:**
```yaml
# Threshold for dedicated entry points
access-pattern-threshold: 0.60  # 60% = create dedicated structure
# Track query patterns for 30+ days before deciding
query-tracking-period: 30  # days
# After threshold met, create optimized entry points
entry-point-optimization:
  lookup:
    max-hop-depth: 2
    require-reference-index: true
  learning:
    require-prerequisite-chains: true
    require-learning-path: true
  decision:
    require-trade-off-tables: true
    require-decision-tree: true
  inspiration:
    require-cross-domain-links: true
    min-connections-per-note: 3
```

## Rationale

- **Small vaults (<200 notes):** Generic linking sufficient, no dedicated entry points needed
- **Large vaults (>200 notes):** Query pattern analysis becomes valuable
- **Threshold (60%):** When one pattern dominates, generic structure creates friction; dedicated structure justified
- **Tracking period:** Avoid premature optimization; gather 30+ days of query data

## Test Update

The complete test for access-pattern rule becomes:

1. Can you filter notes by access-pattern tag?
2. Does the vault have reference indexes for lookup use cases?
3. Are learning paths available for understanding use cases?
4. Are decision trees available for choice-making use cases?
5. **For vaults >200 notes:** What percentage of queries follow each pattern?
6. **If >60% single pattern:** Are there dedicated entry points optimized for it?
7. Is the dominant pattern documented in vault config?

## Related Notes

- [[AI-Assisted Knowledge Management Seed]] — access-pattern rule (line ~34)
- [[Seed Refinement - Access-Pattern-Aware Entry Points Integration]] — detailed implementation
- [[Seed Stress Test - Knowledge Type Taxonomy in Language Learning]] — browse-oriented retrieval evidence

---

**Status:** Ready for Seed integration. This enhancement completes the access-pattern rule by adding the missing threshold criteria that distinguishes when dedicated structure is needed.