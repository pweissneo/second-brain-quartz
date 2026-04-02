---
last-reviewed: 2026-04-01
last-updated: 2026-04-01
lifecycle: emerging
confidence: emerging
author-type: ai-assisted
verification-status: verified
tags:
---

# Seed Refinement: Knowledge Debt Rule for Craft Domains

> This note captures refinements to the Knowledge Debt rule based on stress testing in woodworking domain.

## Context

The [[Seed Stress Test - Knowledge Debt Rule in Woodworking]] identified several gaps in how the Knowledge Debt rule applies to craft/experiential domains like woodworking.

## Findings

### Finding 1: Long-Horizon Verification Not Adequately Covered

The Seed has long-horizon verification rules for gardening/permaculture (verification-cycle: perennial), but woodworking has different verification timelines:
- Joinery techniques: 6+ months to verify (multiple projects)
- Finishes: seasons to verify (aging, humidity reaction)
- Wood movement calculations: years to verify (actual stability)

**The issue:** Woodworking verification fits neither the standard 30-day window nor the "perennial" cycle — it's somewhere in between.

### Finding 2: Equipment-Stale Detection Missing

The staleness debt calculation assumes time-based staleness. But in craft domains, knowledge becomes stale when equipment changes, not just time passes. A table saw setup note is "stale" when the saw is replaced, regardless of when it was written.

### Finding 3: Tool-Specific Knowledge Has Higher Decay

The current rule treats all knowledge the same for decay debt calculation. But tool-specific knowledge (how to tune a specific planer) decays faster than technique principles (how to joint a board).

### Finding 4: Project Notes Misclassified as Noise

The noise debt formula flags low-retrieval notes as potential dead weight. But project-specific notes (building THIS cabinet) are inherently low-frequency yet high-value when retrieved.

## Proposed Seed Updates

### Edge Case Addition to Knowledge Debt Rule

Add after existing edge cases:

> **Edge case (NEW - 2026-04-01):** In craft/experiential domains with tool-dependent knowledge (woodworking, metalworking, leatherworking, ceramics), apply modified debt calculation:
> 1. **Verification debt**: Use domain-appropriate thresholds — 60% instead of 40% for long-horizon craft verification (techniques requiring 6+ months to verify)
> 2. **Equipment-stale detection**: Track `equipment-model:` in frontmatter. Flag notes as equipment-stale when tools are replaced, separate from time-based staleness
> 3. **Decay rate by knowledge type**: Distinguish `decay-rate: tool-specific` (faster) from `decay-rate: technique-principle` (slower)
> 4. **Project note exemption**: Exclude notes with `knowledge-type: project-specific` from noise debt calculation — project notes are inherently low-frequency but high-value

### Frontmatter schema for craft domain notes:

```yaml
verification-cycle: long-horizon
verification-months-required: 6-24
equipment-model: [specific tool model]
decay-rate: tool-specific|technique-principle|material-specific
knowledge-type: project-specific  # exempt from noise debt
```

## Test

After applying this edge case, a woodworking vault with 50 notes should score in "moderate" range (0.15-0.30) rather than "critical" (>0.50) — the debt score now reflects actual vault health.

## Related Notes

- [[AI-Assisted Knowledge Management Seed]] — Knowledge Debt rule
- [[Seed Stress Test - Knowledge Debt Rule in Woodworking]] — Original stress test
- [[Seed Refinement - Note-Type-Aware Link Density Rules]] — Similar domain-specific calibration
- [[Seed Stress Test - Verification Ratio Rule in Woodworking]] — Related verification timing
- [[Frontier Exploration - Equipment and Tool Dependencies]] — Tool knowledge patterns