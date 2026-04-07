---
last-reviewed: 2026-04-05
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
tags:
  - seed-gap
  - legal-knowledge
  - temporal
  - law
gap-status: resolved
gap-priority: medium
gap-phase: resolution
gap-severity: useful
gap-source: frontier-exploration
discovered: 2026-04-01
gap-review-date: 2026-04-05
resolution-date: 2026-04-05
resolved-by: Seed rules at lines 3097 (regulatory dating), 4870 (valid-until for factual), 4872 (time-limited knowledge)
---

# Seed Gap - Temporal Legal Knowledge Handling

## The Gap

The Seed has stress tests for legal knowledge bases but lacks explicit rules for **temporal legal knowledge** — knowledge whose validity changes based on time. Example questions the Seed doesn't answer:

- How do you handle laws that were valid when written but have since been repealed?
- How do you annotate knowledge that is only valid for a specific jurisdiction during a specific time period?
- When does historical legal knowledge become "deprecated" vs. "archived"?

## Why This Matters

Legal knowledge is inherently temporal. A legal opinion based on a court case may be valid under one ruling but invalidated by a later one. An interpretation of regulations may apply only until the regulations change. Without temporal metadata, the vault risks presenting outdated legal knowledge as current.

## Proposed Rule (Rule/Why/Test format)

**Rule:** For knowledge bases containing legal, regulatory, or policy information, include temporal validity bounds in frontmatter and link to superseding knowledge when validity ends.

**Why:** Legal knowledge is temporally bound. Presenting expired knowledge as current can lead to incorrect decisions. Explicit temporal metadata allows the vault to surface the correct (current) knowledge while maintaining historical context.

**Test:** (1) Do legal/regulatory notes have `valid-from` and/or `valid-until` frontmatter? (2) When knowledge is superseded, is there a link from the old note to the new one? (3) Can you identify which version is currently valid?

## Related Notes

- [[Seed Stress Test - Legal Knowledge Bases]]
- [[Frontier Exploration - Knowledge Deprecation and Retirement Criteria]]
- [[Seed Refinement - Temporal Validity Bounds Rule]]

## Resolution (2026-04-05)

This gap has been resolved through existing Seed rules:

1. **Line 3097:** "Use regulatory dating for compliance knowledge — include `regulatory-date:` (when captured), `regulatory-valid-until:` (expiration/review), and `jurisdiction:` tags."

2. **Line 4870:** "Use time-boxing for rapidly-changing factual knowledge — include `valid-until` frontmatter for year-specific data..."

3. **Line 4872:** Test for factual notes includes checking for `valid-until:` date.

The Seed already provides comprehensive temporal validity bounds for legal/regulatory knowledge. No additional rule needed.

**Gap status: RESOLVED**