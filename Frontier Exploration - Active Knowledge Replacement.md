---
last-reviewed: 2026-03-18
last-updated: 2026-03-18
confidence: emerging
author-type: ai-assisted
lifecycle: evergreen
tags:
  - knowledge-management
  - maintenance
  - frontier-exploration
---

# Frontier Exploration - Active Knowledge Replacement

> When existing knowledge must be actively superseded rather than just marked stale

## The Problem

The Seed covers staleness (time-based decay) and obsolescence (reality-based invalidation), but doesn't address **active replacement** — cases where new knowledge doesn't just supersede old knowledge, but requires *updating* specific claims, changing guidance, or fundamentally revising understanding.

Examples:
- Medical best practices that changed (e.g., "don't recommend bed rest for back pain" replaced "bed rest is good for back pain")
- Technology recommendations that flipped (e.g., "SSD over HDD" became nuanced)
- Personal advice that evolved (e.g., your investment strategy changed based on experience)

## Why It Matters

Passive approaches (marking old notes stale) don't capture:
1. **What specifically changed** — the old claim vs. new claim
2. **Why it changed** — the evidence or reasoning that shifted
3. **What should be done** — explicit replacement vs. just deprecation

Without active replacement tracking, you lose the evolution of your understanding.

## Edge Cases

- **Partial replacement**: New knowledge supersedes only part of old note
- **Contextual replacement**: Old still applies in some contexts, new in others  
- **Cycles**: Knowledge that later reverts (e.g., fashion trends returning)
- **Accumulation**: Multiple replacements over time creating a history

## Implementation

```yaml
replaces:
  - note: "[[Old Note Title]]"
    replaced-claims: "Specific claims being superseded"
    reason: "New evidence showed X"
    replacement-type: complete|partial|contextual
```

## Test for Knowledge Bases

1. Can you identify knowledge that was explicitly replaced (not just deprecated)?
2. Do replacement notes document what changed and why?
3. Is there a trail showing how understanding evolved?

## Related

- [[Note Lifecycle Management]]
- [[Handling Temporal Knowledge]]
- [[Anti-Pattern - Neglecting Maintenance]]
