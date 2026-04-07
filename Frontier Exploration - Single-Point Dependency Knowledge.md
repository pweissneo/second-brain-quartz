---
tags:
  - frontier-exploration
  - knowledge-architecture
  - self-reference
created: 2026-03-16
confidence: emerging
lifecycle: evergreen
last-reviewed: 2026-04-04
last-updated: 2026-04-06
author-type: ai-assisted
verification-status: unverified
access-pattern: decision
knowledge-type: meta
---

# Frontier Exploration - Single-Point Dependency Knowledge

## The Problem

Some knowledge in a vault exists in a fragile state — it is true (or useful) only because a single other piece of information is not yet known or doesn't exist. This is different from:

- **Contradictory sources** — we have conflicting evidence
- **Unverified knowledge** — we could test but haven't yet  
- **Discredited knowledge** — we have evidence it's false
- **Provisional knowledge** — subject to change with more evidence

This is **dependency knowledge** — knowledge that would be invalidated, reversed, or fundamentally changed by discovering one specific piece of information that currently doesn't exist or isn't known.

## Examples

1. **Belief-invalidation knowledge**: "I believe X is true because I haven't seen evidence Y" — if Y is ever discovered, the belief must be abandoned
2. **Placeholder reasoning**: "Assuming A is true, then B follows" — but A is unknown
3. **Absence-based conclusions**: "No successful method exists for X" — currently true but could be invalidated by a future discovery
4. **Single-witness knowledge**: "Source A claims X" — vulnerable to being contradicted by a single new source
5. **Temporal uniqueness claims**: "This is the only known example" — depends on complete knowledge of all examples

## Why This Matters for AI Knowledge Bases

When an AI builds a knowledge base from scratch using only the current Seed rules, it may capture these fragile truths without any mechanism to:
1. Recognize their fragility
2. Track what would invalidate them
3. Automatically revisit them when new information arrives
4. Distinguish them from robust knowledge

## Challenges for Seed Rules

Current Seed rules address:
- Confidence markers (but not specifically for dependency fragility)
- Contradictory sources (but not single-point dependency)
- Temporal knowledge (but not this specific fragility type)
- Diminishing returns (but not this type of knowledge quality)

## Potential Seed Enhancement

**Rule idea:** Tag knowledge with single-point dependencies differently from other provisional knowledge:

```yaml
dependency-type: single-point  # vs multi-point, robust
dependency-condition: "What would invalidate this"
invalidation_threshold: 1  # How many new discoveries would change this
```

**Test:** Can you identify knowledge in your vault that would be fundamentally changed by a single new piece of information? Do you track what that information would be?

## Related Notes

- [[Frontier Exploration - Incomplete and Provisional Knowledge]]
- [[Handling Contradictory Sources]]
- [[Frontier Exploration - Unknown Unknowns in Vast Domains]]
- [[Confidence Markers]]

## Questions to Explore

1. How should an AI agent identify single-point dependencies vs robust knowledge?
2. Should these notes have different lifecycle rules?
3. How do you track "what would change this" without knowing what you don't know?
4. Is this fundamentally different from "unknown unknowns" or a subset of it?

---

*This is a frontier note — not a mature Seed rule. It captures an emerging insight about knowledge management that may develop into testable rules over time.*
