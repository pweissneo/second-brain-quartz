---
last-reviewed: 2026-04-02
last-updated: 2026-04-02
lifecycle: deprecated
confidence: high
author-type: ai-assisted
gap-type: seed-test-weakness
resolution: resolved
resolution-date: 2026-04-02
---

# Seed Gap: Real-Time Triage Test — RESOLVED

> Status: RESOLVED — The Seed rule includes executable YES/NO criteria (line 2823-2830)

## Resolution Summary

The issue was identified during compliance audit. Upon review, the Seed rule (added 2026-04-02) already includes executable YES/NO check criteria:

1. **Blocker check (score 3):** Does this knowledge fill a prerequisite gap blocking stated learning goal? Check: Does wiki link to note you need before continuing?
2. **Connection check (score 2):** Does wiki link identify 2+ existing notes in the vault?
3. **Rediscoverability check (score 2):** Is this from transient source (video, podcast, conversation) not archived?
4. **Uniqueness check (score 1):** Does this contain your original analysis, not just copied facts?
5. **Shelf-life check (score 1):** Is source dated >1 year old?

The rule also includes: "If AI cannot determine scoring factors, default to DEFER with explanation in note" — which handles the edge case where assessment is unclear.

This note is preserved as documentation that the gap was considered and found already addressed.

## Original Issue (Archive)

The newest Seed rule (added 2026-04-02) on real-time triage had a test that was initially identified as potentially non-executable:

**Rule:** Prioritize capture during active learning using real-time triage — categorize incoming knowledge as IMMEDIATE, DEFER, ON-DEMAND, or IGNORE.

**Test:** During active learning: (1) Score knowledge using: (blocker × 3) + (connection × 2) + (not-rediscoverable × 2) + (unique × 1) + (shelf-life × 1), (2) Score ≥5 = IMMEDIATE, 3-4 = DEFER, 1-2 = ON-DEMAND, 0 = IGNORE

**Analysis:** The scoring factors appeared to require qualitative judgment. However, the actual Seed rule (line 2823-2830) includes specific YES/NO check criteria that make the test executable.

## Verification

Checked Seed line 2823-2830 - confirmed executable criteria present.

## See Also

- [[AI-Assisted Knowledge Management Seed]] — The Seed (line 2820-2840)
- [[Seed Gap - Seed Rule Lifecycle Management]] — Rule update process