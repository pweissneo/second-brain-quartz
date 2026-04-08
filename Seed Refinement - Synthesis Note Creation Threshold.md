---
last-reviewed: 2026-04-07
last-updated: 2026-04-07
lifecycle: seed-refinement
confidence: emerging
author-type: ai-assisted
knowledge-type: meta
status: proposed
tags:
  - seed-refinement
  - synthesis
  - contradiction-handling
  - threshold
  - resolution
---

# Seed Refinement - Synthesis Note Creation Threshold

> **Phase:** PROPOSED — Ready for Seed integration
> **Related Gap:** [[Seed Gap - Synthesis Note Creation Threshold]]
> **Integration Target:** AI-Assisted Knowledge Management Seed.md (Section on Contradiction Handling)

## Summary

The Seed currently instructs AI agents to "create a synthesis note" when sources contradict, but provides no guidance for determining the appropriate organizational approach based on contradiction complexity. This refinement adds threshold-based guidance.

## Proposed Seed Rule Addition

**Rule (NEW - 2026-04-07):** Apply synthesis note creation threshold based on contradiction complexity — inline handling for simple 1-2 source disagreements, dedicated synthesis note for 3-5 source significant disagreements, and synthesis hub (parent + child notes) for 6+ sources or multi-dimensional conflicts.

**Why:** Over-synthesizing simple contradictions creates noise; under-synthesizing complex ones loses information. The current "always create synthesis note" rule produces unwieldy notes when handling many sources and under-organizes complex multi-perspective conflicts. Threshold-based approach matches organizational effort to contradiction complexity.

**Test:** For any source contradiction:
1. Count distinct sources presenting different views
2. Assess complexity (minor factual discrepancy vs. significant disagreement vs. multi-dimensional)
3. Apply appropriate organizational approach:
   - **Inline** (1-2 sources, minor discrepancy): "Source A says X, Source B says Y" with source attribution
   - **Synthesis note** (3-5 sources, significant disagreement): Dedicated note presenting both/all perspectives with analysis
   - **Synthesis hub** (6+ sources OR multi-dimensional): Parent note summarizing conflict + child notes for each perspective
4. Verify organizational complexity matches contradiction complexity

**Edge cases:**
- **Time-bounded contradictions:** When old consensus contradicts new evidence, use temporal synthesis — note when each view was valid, consider `validity-period:` metadata
- **Trivial resolution:** When one source is clearly outdated or unreliable, prefer inline correction over synthesis note
- **Domain-specific thresholds:** High-stakes domains (medical, legal) may warrant lower thresholds due to stakes

## Implementation

```yaml
synthesis-threshold:
  approach: inline|synthesis-note|synthesis-hub
  source-count: number
  complexity: minor|significant|multi-dimensional
  resolution-type: trivial|requires-analysis|requires-organization
```

## Example Application

| Scenario | Threshold | Approach |
|----------|-----------|----------|
| Two blog posts disagree on exact temperature | 1-2 sources, minor | Inline |
| 4 academic papers present different conclusions | 3-5 sources, significant | Synthesis note |
| 12 sources across decades show evolving consensus | 6+ sources | Synthesis hub |
| Expert consensus vs. new research vs. anecdotal | Multi-dimensional | Synthesis hub |

## Related Notes

- [[Seed Gap - Synthesis Note Creation Threshold]] — Original gap documentation
- [[Handling Contradictory Sources]] — Existing contradiction handling guidance
- [[Frontier Exploration - Inverse Authority Problem]] — Synthesis vs. authority calibration
- [[Seed Stress Test - Contradiction Rule in Philosophy]] — Domain stress test
