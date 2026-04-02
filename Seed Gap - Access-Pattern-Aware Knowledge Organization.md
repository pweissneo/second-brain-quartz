---
last-reviewed: 2026-03-25
last-updated: 2026-04-01
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
tags:
  - seed-gap
  - access-pattern
  - organization
schema-version: "1.0"
gap-status: proposed
gap-priority: medium
gap-source: redundancy-scan-2026-03-25
discovered: 2026-03-25
analyzed: 2026-04-01
proposed: 2026-04-01
analysis-notes: "Partially addressed in Seed (access-pattern frontmatter at line ~1681). Missing: use-case-specific entry points guidance (reference indexes, learning paths)."
---

# Seed Gap - Access-Pattern-Aware Knowledge Organization

## Status: IDENTIFIED (2026-03-25)

Discovered during: REDUNDANCY_SCAN heartbeat (2026-03-25)

## The Gap

The Seed covers how to structure knowledge (atomicity, linking) and maintain it (quality, lifecycle), but doesn't address: **the same knowledge may need different organization depending on how it will be accessed**.

### Access Patterns

| Pattern | Use Case | Current Seed Gap |
|---------|----------|------------------|
| **Lookup** | Quick reference, fact retrieval | No guidance for reference-optimized notes |
| **Learning** | Understanding concepts, building mental models | Default assumption |
| **Decision** | Weighing options, making choices | No decision-specific structure |
| **Inspiration** | Creative recombination, brainstorming | Assumes general structure |

### Why Current Rules Fall Short

1. **Atomicity trade-offs**: Splitting a recipe across 5 notes helps learning but hurts lookup
2. **3-hop rule trade-offs**: Good for exploration, bad for quick reference
3. **Link density**: 2+ links rule helps discovery but adds noise for lookup

### Proposed Solution

The Seed needs guidance on:
1. **Tagging by access pattern**: `access-pattern: lookup|learning|decision|inspiration|mixed`
2. **Creating use-case-specific entry points**: reference indexes, learning paths, decision trees
3. **Measuring dominant pattern**: Track retrieval queries to identify dominant use case

## Test for Gap Closure

- [ ] Does the Seed contain guidance on access-pattern-aware organization?
- [ ] Does the Seed provide implementation guidance for use-case-specific entry points?

## Related

- [[Frontier Exploration - Knowledge Access Pattern Optimization]] — Detailed exploration
- [[Graph Traversal Efficiency]] — Current navigation rules (assumes single use case)
- [[Hub Node Creation]] — Entry points (domain-agnostic)

## Resolution Notes (2026-03-28)

This gap was identified during a previous heartbeat. The Seed has since been updated with `access-pattern:` frontmatter guidance (line ~1681), partially addressing this gap. However, full implementation guidance for use-case-specific entry points is still pending.

**Current Seed coverage:**
- Line 1681: access-pattern frontmatter field exists
- Still missing: explicit guidance for use-case-specific entry points (reference indexes, learning paths, decision trees)

[[_root]]
