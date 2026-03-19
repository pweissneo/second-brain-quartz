---
last-reviewed: 2026-03-17
last-updated: 2026-03-17
confidence: high
author-type: ai-assisted
knowledge-type: thinking-tool
thinking-tool-type: reasoning-framework
lifecycle: deprecated
redirects-to: [[AI-Assisted Knowledge Management Seed]]
---

# DEPRECATED: Frontier Exploration - Knowledge Confidence Calibration

> ⚠️ **This note is deprecated.** The content has been integrated into the [[AI-Assisted Knowledge Management Seed]]. This note is kept for historical reference only.

## Summary

All rules from this note are now in the Seed:
- Confidence calibration methodology (lines 611+)
- Confidence adjustment tracking
- Domain-specific confidence floors
- Confidence corridors for related knowledge

Please use the Seed for confidence calibration rules.

# Frontier Exploration - Knowledge Confidence Calibration

## The Gap

The Seed covers confidence markers extensively but lacks systematic guidance on **confidence calibration** - how to set initial confidence levels for new knowledge and how to adjust them based on evidence over time. Without calibration methodology, AI agents default to arbitrary confidence levels that don't reflect actual reliability.

## Why This Matters

- **New knowledge has no track record** - How should an AI set initial confidence for freshly captured knowledge?
- **Confidence should evolve** - Knowledge used successfully should increase in confidence; failures should decrease it
- **Domain variation** - Different domains have different baseline confidence expectations
- **Calibration enables trust** - Well-calibrated confidence helps users know when to trust vault knowledge

## The Problem

Current Seed rules:
- Set confidence at capture time
- Don't specify how to choose initial levels
- Don't provide mechanisms for adjustment based on use

This leads to:
- Overconfident new knowledge with no verification
- Stale confidence that doesn't reflect accumulated evidence
- No systematic way to distinguish "tried and true" from "never tested"

## Proposed Rules

**Rule:** Set initial confidence based on source quality and verification potential, not content appearance.

- `confidence: high` - Only from authoritative primary sources with clear verification path
- `confidence: medium` - From reputable sources, or personal experience without explicit verification
- `confidence: low` - From uncertain sources, AI-generated without verification, or theoretical speculation
- `confidence: emerging` - New knowledge with no track record (replaces "unverified" for non-procedural content)

**Test:** For each new note, can you articulate: (1) What makes this level of confidence appropriate? (2) What evidence would upgrade it? (3) What evidence would downgrade it?

**Rule:** Track confidence adjustment events separately from review dates - each significant use or verification attempt should potentially adjust confidence.

Implementation:
```yaml
confidence-adjustments:
  - date: 2026-03-17
    event: used-successfully
    evidence: "Applied to real decision, positive outcome"
  - date: 2026-03-18
    event: source-verified
    evidence: "Cross-referenced with authoritative source"
```

**Rule:** Apply domain-specific confidence floors - certain domains require higher baseline confidence due to stakes.

- Medical/legal/financial: floor at `medium`, require human expert for `high`
- Personal opinions: floor at `low`, require explicit perspective tagging
- Experimental domains: floor at `low`, require verification for elevation

**Test:** For domains with safety implications, is confidence floor respected? Are exceptions documented with `confidence-override: true`?

**Rule:** Use confidence corridors for related knowledge - when multiple notes on a topic have conflicting confidence levels, the corridor (range) matters more than individual levels.

A topic with notes ranging from `low` to `high` confidence should be treated as "emerging" overall. A topic where all notes are `high` is "established."

**Test:** For each major topic area, can you identify the confidence corridor? Does retrieval treat the corridor as a signal of overall reliability?

## Relationship to Existing Seed Rules

This extends:
- [[Confidence Markers]] - Provides methodology for calibration
- [[Note Lifecycle Management]] - Connects verification events to confidence adjustment
- [[Frontier Exploration - Knowledge Debt]] - Confidence debt is part of overall knowledge debt calculation

## Test Case

Imagine building a knowledge base about cooking from scratch:

1. **Initial capture**: You add a recipe from a blog. Confidence = `low` (unverified source)
2. **First use**: You cook it, it works. Adjust to `medium`, add adjustment event
3. **Multiple uses**: After 5 successful cooks, elevate to `high`, add `verification-status: community-validated`
4. **Failure**: One time it doesn't work (different altitude). Add adjustment event, keep `high` but note limitation

Without explicit calibration, the recipe would still show `low` after 10 successful uses - or worse, start at `high` with no track record.

## Open Questions

- How should confidence from multiple uses be weighted? (recent more heavily? all equally?)
- How to handle "mixed" outcomes - works sometimes, doesn't others?
- Should confidence decay over time even without negative evidence?
- How do different users' success rates affect confidence for shared vaults?

## See Also

- [[Frontier Exploration - Knowledge Retrieval Patterns and Usage Tracking]] - How usage patterns inform confidence
- [[Confidence Markers]] - Existing confidence framework
- [[Frontier Exploration - Knowledge Debt]] - Composite health scoring including confidence
