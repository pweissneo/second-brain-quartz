---
last-reviewed: 2026-03-25
last-updated: 2026-03-25
lifecycle: seed-extension
confidence: high
author-type: ai-assisted
schema-version: "1.0"
foundational: true
tags:
  - metadata
  - confidence
  - verification
---

# Confidence Markers and Verification Status

> How to signal certainty levels and verification state in knowledge notes.

Knowledge quality requires two complementary metadata dimensions: how certain the knowledge is (confidence) and whether it's been verified (verification status).

## Part 1: Confidence Markers

Confidence markers help readers (and AI agents) assess how certain the knowledge is. They enable appropriate skepticism and guide verification effort.

### Frontmatter Field

```yaml
confidence: high
```

### Levels

- **high**: Well-verified, multiple sources, strong evidence
- **emerging**: Some verification, reasonable confidence, but not fully established
- **disputed**: Known contradictions or unresolved debates about this knowledge
- **obsolete**: Knowledge that was previously correct but is now outdated or superseded

### Usage

Add `confidence:` to frontmatter for any note where certainty matters. Default to `emerging` when uncertain.

## Part 2: Verification Status

Verification status tracks whether knowledge has been checked for accuracy.

### Frontmatter Field

```yaml
verification-status: unverified|verified|pending|disputed
```

### Values

- **unverified**: Captured but not yet verified
- **verified**: Checked and confirmed accurate
- **pending**: Awaiting verification
- **disputed**: Known contradiction or unresolved conflict

### Verification Ratio

The Seed requires maintaining a verification ratio:
> A healthy vault verifies at least 50% of new captures within 30 days.

When unverified notes exceed 40% of total vault, pause exploration and prioritize verification.

## When to Use Which

| Scenario | Confidence | Verification Status |
|----------|------------|---------------------|
| Personal experience, not yet fact-checked | emerging | unverified |
| Multiple reputable sources confirm | high | verified |
| Known controversy in field | disputed | disputed |
| Old information that may be outdated | emerging or obsolete | pending review |

## Related Concepts

This note connects to [[Note Types and Templates]], [[Knowledge Graph Structure]], [[Atomic Note Principle]], and [[Note Lifecycle Management]] for how confidence and verification fit into note design.

## Related
- [[Graph Maintenance]] — Regular health checks
- [[Self-Improvement Cycle]] — Review and improvement workflow