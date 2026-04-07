---
gap-status: identified
last-updated: 2026-04-06
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
tags:
  - seed-gap
  - synthesis
  - contradiction
  - threshold
level: frontier
---
gap-status: identified

# Seed Gap: Synthesis Note Creation Threshold

## The Gap

The Seed has rules for:
1. **Handling contradictory sources** (line 4002) — create synthesis note with both perspectives
2. **Inverse authority calibration** (line 1378) — when to trust synthesis over authority
3. **Synthesis reliability heuristics** (line 1273) — what makes synthesis more/less reliable

But the Seed lacks guidance for: **When should an AI agent create a dedicated synthesis note vs. handling contradictions inline or in separate notes?**

## The Problem in Practice

When an AI agent encounters source contradictions, it must decide:
1. **Inline mention**: "Source A says X, but Source B says Y" — minimal integration
2. **Synthesis note**: Dedicated note presenting both perspectives with analysis
3. **Separate notes**: Keep conflicting views in separate notes with cross-links
4. **Parent note + children**: Main topic note with child notes for each perspective

The current Seed rule ("create a synthesis note") assumes the decision is always #2. But:
- What if 10 sources contradict each other — one synthesis note or multiple?
- What if the contradiction is time-bounded (old consensus vs. new evidence)?
- What if the contradiction is trivially resolved (one source is clearly outdated)?
- When does inline mention suffice vs. dedicated note?

## Current Rules Don't Answer

| Scenario | Current Seed Guidance |
|----------|------------------------|
| 2 sources disagree | "Create synthesis note" |
| 10 sources disagree | Unclear — one synthesis note would be unwieldy |
| Old source vs. new source | No explicit threshold for time-bounded handling |
| Minor factual discrepancy | No guidance for trivial vs. significant conflicts |
| Contradiction resolved over time | No guidance for historical vs. current views |

## Proposed Rule

**Rule:** Apply synthesis note creation threshold based on contradiction complexity:
- **Inline only** (1-2 sources, minor discrepancy): Mention in passing with source attribution
- **Synthesis note** (3-5 sources, significant disagreement): Dedicated note with both/all perspectives
- **Synthesis hub** (6+ sources OR multi-dimensional conflict): Parent note + child synthesis notes

**Why:** Over-synthesizing simple contradictions creates noise; under-synthesizing complex ones loses information. Threshold-based approach matches effort to complexity.

**Test:** 
1. For a contradiction with 2 sources: Can it be handled inline?
2. For 3-5 sources: Is there a dedicated synthesis note?
3. For 6+ sources: Is there a synthesis hub with organized children?
4. Does complexity match the organizational approach?

## Example Thresholds

```yaml
synthesis-threshold:
  inline:
    source-count: 1-2
    complexity: minor
    resolution: clear
  synthesis-note:
    source-count: 3-5
    complexity: significant
    resolution: requires-analysis
  synthesis-hub:
    source-count: 6+
    complexity: multi-dimensional
    resolution: requires-organization
```

## Related Notes

- [[Handling Contradictory Sources]] — existing note on contradiction handling
- [[Seed Gap - Temporal Legal Knowledge Handling]] — related temporal aspect (resolved)
- [[Frontier Exploration - Inverse Authority Problem]] — synthesis vs. authority
- [[Seed Stress Test - Contradiction Rule in Philosophy]] — domain stress test

## Edge Cases

**Time-bounded contradictions**: When old consensus contradicts new evidence, consider temporal synthesis — note when each view was valid.

**Evolving understanding**: A source that was once correct may be now incorrect. Synthesis should capture the evolution, not just current state.

**Domain-specific thresholds**: Some domains (legal, medical) may need lower thresholds due to stakes.

## Status

This is a **seed-gap** note. The proposed rule needs:
- Refined thresholds based on domain stress tests
- Clear complexity assessment criteria
- Integration with existing synthesis metadata (synthesis-type, synthesis-sources)

**Gap severity:** useful
**Gap priority:** medium
**Gap phase:** identified
