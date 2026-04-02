---
last-reviewed: 2026-04-02
lifecycle: emerging
confidence: high
author-type: ai-assisted
gap-type: seed-test-weakness
---

# Seed Gap: Real-Time Triage Test is Not Executable by AI

## Issue

The newest Seed rule (added 2026-04-02) on real-time triage has a test that cannot be executed by an AI agent:

**Rule (NEW - 2026-04-02):** Prioritize capture during active learning using real-time triage — categorize incoming knowledge as IMMEDIATE (blocking, high-connection, non-obvious), DEFER (rediscoverable, natural re-encounter), ON-DEMAND (searchable, volatile, highly-specific), or IGNORE (already captured, out of scope).

**Test:** During active learning: (1) Score knowledge using: (blocker × 3) + (connection × 2) + (not-rediscoverable × 2) + (unique × 1) + (shelf-life × 1), (2) Score ≥5 = IMMEDIATE, 3-4 = DEFER, 1-2 = ON-DEMAND, 0 = IGNORE

## Why the Test Fails

The scoring factors are **qualitative assessments** that require human judgment:
- **blocker** — Is this knowledge blocking progress? Requires understanding the learner's current goals and context
- **connection** — Does this link to existing knowledge? Could be executable if AI has vault context
- **not-rediscoverable** — Will this be hard to find again? Requires predicting future search difficulty
- **unique** — Is this novel vs. duplicative? Requires domain knowledge to assess
- **shelf-life** — Will this remain accurate? Requires predicting knowledge decay

None of these have YES/NO criteria. The test is "execute this subjective scoring algorithm" not "verify these specific conditions."

## Proposed Refinement

Make the test executable with concrete checks:

**Revised Test:** During active learning:
1. Does the knowledge address a prerequisite for stated goal? → YES = blocker (score 3)
2. Does [[wikilinks]] identify 2+ existing notes? → YES = connection (score 2)
3. Is this from a ephemeral source (video, podcast, conversation) not saved? → YES = not-rediscoverable (score 2)
4. Is this your original analysis vs. copied fact? → YES = unique (score 1)
5. Is the source dated >1 year old? → YES = low shelf-life (score 1), NO = high shelf-life (score 1)

Or: The test should check for frontmatter that captures triage decisions:
```yaml
triage-category: IMMEDIATE|DEFER|ON-DEMAND|IGNORE
triage-score: 5
triage-decision-factors:
  - blocker: true
  - connection: 3
  - unique: true
triage-decision-date: 2026-04-02
```

## Domain Testing

Can an AI execute this test for any domain? Only partially — connection counting is executable, but blocker/not-rediscoverable/unique assessments require context the AI may not have.

## Recommendation

Update the Seed rule to either:
1. Make test criteria objective and executable (Yes/No checks only), OR
2. Require explicit triage frontmatter as evidence of decision-making

## See Also

- [[AI-Assisted Knowledge Management Seed]] — The Seed being tested
- [[Seed Gap - Seed Rule Lifecycle Management]] — Rule update process