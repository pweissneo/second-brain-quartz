---
last-reviewed: 2026-04-05
lifecycle: seed-refinement
confidence: established
author-type: ai-assisted
verification-status: verified
verification-mode: reasoning
tags:
  - seed-refinement
  - access-pattern
  - entry-points
  - retrieval-optimization
---

# Seed Refinement - Access-Pattern-Aware Entry Points Integration

> Integration of access-pattern guidance with use-case-specific entry point implementation

## Context

The Seed now contains:
1. `access-pattern:` frontmatter field (added 2026-04-03)
2. Basic guidance on access pattern types (lookup, learning, decision, inspiration)

But the Seed lacks guidance on creating **use-case-specific entry points** — the structural elements that make each access pattern efficient.

## The Gap

Same knowledge needs different organization depending on access pattern:

| Pattern | Current Structure | Optimal Structure |
|---------|------------------|-------------------|
| **Lookup** | Standard linking | Shallow depth, direct links, reference indexes |
| **Learning** | Standard linking | Prerequisite chains, progressive complexity |
| **Decision** | Standard linking | Option comparison, trade-off summaries |
| **Inspiration** | Standard linking | Creative connections, cross-domain links |

Without entry point guidance, vaults default to one structure that serves no pattern optimally.

## Proposed Seed Rule Addition

**Rule (ADD to Seed):** Create use-case-specific entry points when access pattern dominates — for vaults where >60% of queries follow a single pattern, create dedicated entry points optimized for that pattern.

**Why:** Atomicity and general linking work for mixed-use vaults, but when one access pattern dominates (>60% of queries), generic structure creates friction. Reference-optimized vaults need shallow depth for quick lookup; learning-optimized vaults need explicit prerequisite paths.

**Test:** (1) Can you identify your dominant access pattern from query logs or usage patterns? (2) Do you have dedicated entry points optimized for that pattern? (3) Is the dominant pattern documented in frontmatter?

**Implementation:**
```yaml
# On vault config or root note
access-pattern: lookup  # primary pattern (dominant >60%)
access-pattern_secondary: learning  # secondary pattern
use-case-entry-points:
  reference-index:
    - [[Quick Reference Hub]]
    - [[Common Tasks Index]]
  learning-path:
    - [[Getting Started]]
    - [[Prerequisite Chain]]
  decision-tree:
    - [[Choice Framework]]
  inspiration-hub:
    - [[Creative Recombination Index]]
```

## Entry Point Types

| Type | Purpose | Structure |
|------|---------|-----------|
| **Reference Index** | Quick lookup | Alphabetical/categorical, minimal depth |
| **Learning Path** | Understanding | Sequential with explicit prerequisites |
| **Decision Tree** | Choice-making | Branching with trade-off summaries |
| **Inspiration Hub** | Creative discovery | Cross-domain, random connections allowed |

## When to Apply

1. **Track query patterns** for 30+ days
2. **Identify dominant pattern** (>60% of retrievals)
3. **Create entry point** if threshold met
4. **Maintain generic structure** for minority patterns

## Integration with Existing Seed Rules

This rule extends, not replaces:
- **Knowledge Type Taxonomy** — Access pattern is orthogonal (a procedural note can be lookup-optimized or learning-optimized)
- **Hub Node Creation** — Entry points are specialized hubs
- **3-Hop Rule** — Lookup patterns may need shallower depth; learning patterns deeper

## Related Notes

- [[AI-Assisted Knowledge Management Seed]] — access-pattern frontmatter (line ~1681)
- [[Seed Gap - Access-Pattern-Aware Knowledge Organization]] — original gap identification
- [[Seed Refinement - Access Pattern Optimized Entry Points]] — detailed implementation
- [[Frontier Exploration - Knowledge Access Pattern Optimization]] — exploration of the concept

## Test Questions

1. Can you identify your vault's dominant access pattern?
2. Are entry points optimized for that pattern?
3. Do minority patterns still have adequate structure?

---

**Status:** Ready for integration into Seed. This rule completes the access-pattern guidance by adding the structural element (entry points) that the current Seed lacks.