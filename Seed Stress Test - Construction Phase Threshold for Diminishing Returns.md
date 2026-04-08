---
last-reviewed: 2026-04-08
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
verification-status: unverified
tags:
  - seed
  - stress-test
  - construction-phase
  - diminishing-returns
---

# Seed Stress Test: Construction Phase Threshold for Diminishing Returns

> Testing when diminishing returns testing should "turn on" during vault construction.
> Date: 2026-03-26

## Finding

**The Seed has a gap: No explicit guidance on when during construction to START applying diminishing returns testing.**

### What the Seed Says

1. **Construction phase rules (lines 95-104):** Relaxed standards apply during bootstrap (first 50 notes) — minimum links: 1, hop depth: 4, note size: 50+ words.

2. **Diminishing returns rule (line 407):** "Skip or defer if the note fails 2+ of: utility, connection, uniqueness, effort."

3. **Test for diminishing returns:** "For the last 5 notes added to a mature topic: Do 3+ pass all four tests?"

### The Gap

The diminishing returns test explicitly targets "a mature topic" — but when do you START treating topics as mature? During skeleton phase (1-20 notes), almost anything passes because there's little competition. The test becomes meaningful only after the topic has substance to compare against.

**No explicit rule tells you when to start applying diminishing returns testing.**

### Analysis

This creates two failure modes:

1. **Too early:** Applying diminishing returns during skeleton phase rejects foundational notes that will later be essential (no existing content to connect to or compare against).

2. **Too late:** Waiting too long lets low-value notes accumulate because "we're still in construction" with no clear transition point.

### Recommended Rule Addition

**Rule:** Enable diminishing returns testing after a topic reaches critical mass — apply only when the hub has ≥5 directly-connected child notes.
- **Why:** Before 5 notes, there's insufficient content to meaningfully assess diminishing returns. After 5, the topic has enough structure to compare new notes against existing ones.
- **Test:** For each hub/topic: (1) Count directly-connected child notes, (2) If ≥5, apply diminishing returns test to new captures, (3) If <5, exempt from test (foundational capture mode).
- **Implementation:** Add `test-applicable: true|false` based on child count, or apply programmatically: `diminishing-returns-test: apply when child-notes >= 5`

### Edge Cases

1. **Cross-topic notes:** Notes that connect multiple hubs should be tested at the more-mature destination. If one topic has 3 notes and another has 7, apply test at the 7-note threshold.

2. **High-stakes domains:** In medical/legal/safety domains, exempt critical knowledge regardless of topic maturity. Use `criticality: high` to override.

3. **Sparse domains:** Some topics may never reach 5 notes (niche interests). Allow manual override: `diminishing-returns-exempt: true` with justification.

### Integration with Construction Phase

The construction phase already defines:
- skeleton (1-20 notes): relaxed standards
- flesh (20-100 notes): tightening begins
- muscle (100-200): full standards

This finding suggests the diminishing returns test should align with **late flesh phase (~80-100 notes)** or when individual topics reach ≥5 notes, whichever comes first.

### See Also

- [[AI-Assisted Knowledge Management Seed]] (original rules)
- [[Seed Stress Test - Diminishing Returns Rule Across Domains]] (domain-specific modifications)
- Construction phase rules (lines 95-104)
- [[_root.md]]
