---
last-reviewed: 2026-04-01
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
tags:
  - seed-refinement
  - access-pattern
  - use-case-optimization
schema-version: "1.0"
---

# Seed Refinement - Access Pattern Optimized Entry Points

## The Insight

The Seed has `access-pattern:` frontmatter (line ~1681) but lacks guidance on creating use-case-specific entry points. The same knowledge needs different organization depending on access pattern:
- **Lookup** → needs shallow depth, direct links, reference indexes
- **Learning** → needs prerequisite chains, depth, examples
- **Decision** → needs option comparison, trade-off summaries
- **Inspiration** → needs creative connections, cross-domain links

## The Rule

**Rule:** Create use-case-specific entry points when access pattern dominates — for vaults where >60% of queries follow a single pattern, create dedicated entry points optimized for that pattern.

**Why:** Atomicity and general linking work for mixed-use vaults, but when one access pattern dominates (>60% of queries), generic structure creates friction. Reference-optimized vaults need shallow depth for quick lookup; learning-optimized vaults need explicit prerequisite paths.

**Test:** (1) Can you identify your dominant access pattern from query logs or usage patterns? (2) Do you have dedicated entry points optimized for that pattern? (3) Is the dominant pattern documented in frontmatter?

## Implementation

```yaml
access-pattern: lookup  # primary pattern
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
```

## Entry Point Types

- **Reference Index**: Alphabetical or categorical list for lookup
- **Learning Path**: Ordered sequence with prerequisites
- **Decision Tree**: Branching flow for choice-making
- **Inspiration Hub**: Random or curated connections for creative discovery

## When to Apply

Track query patterns. If >60% of retrievals follow one pattern for 30+ days, create optimized entry point. Keep generic structure for minority patterns.

[[_root]]

**Question for Seed:** Should this become a formal rule in the Seed? The gap note exists at [[Seed Gap - Access-Pattern-Aware Knowledge Organization]].