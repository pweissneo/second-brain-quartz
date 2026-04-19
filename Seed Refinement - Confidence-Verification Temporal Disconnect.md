---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-04-07
lifecycle: seed-refinement
confidence: emerging
tags:
  - seed-refinement
  - confidence-verification-gap
  - temporal-knowledge
---

# Seed Refinement: Confidence-Verification Temporal Disconnect

## Problem Identified

The Seed manages `confidence` (source reliability) and `verification-status` (verification state) as separate dimensions, but lacks explicit guidance on how **time since capture** should affect confidence levels for unverified notes.

**Current state:**
- Confidence values: `high`, `emerging`, `low`, `speculative`
- Verification-status values: `unverified`, `verified`, `testing`, etc.
- No explicit rule linking age of unverified notes to confidence degradation

## The Gap

When a note is captured with `confidence: emerging` and `verification-status: unverified`:

1. **After 30 days** — Seed says verify within 30 days, but doesn't say what happens to confidence if verification doesn't happen
2. **After 90 days** — Unverified note is now significantly stale; does confidence drop?
3. **After 1 year** — Note has never been verified; is it still "emerging" or does it become `low`?

The Seed has temporal rules for:
- Knowledge validity windows (line ~2727)
- Verification timing (30-day window)
- Staleness detection

But it lacks: **confidence decay rules for persistently unverified notes**.

## Why This Matters

Without explicit guidance:
1. AI agents may keep unverified notes at `confidence: emerging` indefinitely, creating false confidence
2. Old, never-verified knowledge appears as reliable as newly captured, verified knowledge
3. Users cannot distinguish "captured yesterday, not yet verified" from "captured 2 years ago, never verified"
4. Knowledge debt calculation (line ~2886) uses verification-status but not temporal degradation of confidence

## Test (Cooking Domain Stress Test)

Pick 10 cooking notes with `verification-status: unverified`:
1. Check `last-updated` date for each
2. Record current `confidence` level
3. Calculate days since capture/last-update
4. Ask: Should confidence be the same for a 30-day-old unverified note vs. a 365-day-old unverified note?
5. If no difference exists, this is a gap

**Expected behavior:** Older unverified notes should have lower confidence than newer ones, all else equal.

## Proposed Rule Addition

**Rule (NEW - 2026-04-07):** For unverified notes, apply temporal confidence decay — confidence should degrade based on age since last verification attempt.

**Why:** A note that was never verified and has aged for 1 year has less proven reliability than a note captured yesterday. Without decay, old unverified notes retain inflated confidence, misleading users about actual reliability.

**Test:** For notes with `verification-status: unverified`: (1) Can you calculate days since capture? (2) Is there a defined decay curve (e.g., emerging → low after 90 days, low → speculative after 1 year)? (3) Does the vault apply consistent decay? (4) Can you distinguish "not yet verified" from "persistently unverified"?

**Implementation:**
```yaml
# For unverified notes, track:
verification-last-attempted: 2026-01-15
verification-attempts: 3
confidence-decay-trigger: true|false

# Decay curve (proposed):
# 0-30 days: maintain original confidence
# 31-90 days: downgrade one level (emerging → low)
# 91-180 days: downgrade again (low → speculative)
# 180+ days: mark as verification-overdue with explicit flag
```

**Exception:** Notes with `verification-modality: long-horizon` (scientific hypotheses, longitudinal studies) should have extended decay windows appropriate to their verification cycle.

## Related Seed Sections

- Line ~2899: Initial confidence calibration (emerging for new knowledge)
- Line ~2886: Knowledge debt calculation
- Line ~509: Medium-horizon verification for fitness
- Line ~2727: Knowledge validity windows
- Line ~230: Gap identification framework

## Related Notes

- [[AI-Assisted Knowledge Management Seed]] — Core Seed rules
- [[Seed Refinement - Verification Ratio Test Executability]] — Related verification tracking gaps
- [[Handling Temporal Knowledge]] — Temporal knowledge patterns
- [[Frontier Exploration - Time-Context-Aware Knowledge Activation]] — Related temporal activation
- [[Seed Refinement - Domain-Velocity-Aware Confidence Decay]] — Similar decay concept
- [[Seed Refinement - Knowledge Debt Rule for Craft Domains]] — Knowledge debt tracking

## Resolution Path

1. Confirm the gap exists via stress test
2. Define appropriate decay curve (90/180/365 day thresholds)
3. Add rule to Seed with Rule/Why/Test format
4. Apply to existing unverified notes
5. Update knowledge debt calculation to include temporal confidence factor