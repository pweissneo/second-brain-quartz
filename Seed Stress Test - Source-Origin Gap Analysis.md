---
last-reviewed: 2026-03-31
last-updated: 2026-03-31
lifecycle: draft
confidence: emerging
author-type: ai-assisted
tags:
  - seed-stress-test
  - source-origin
  - gap-analysis
---

# Seed Stress Test: Source-Origin Gap Analysis

**Test date:** 2026-03-31
**Discovery method:** SEED_STRESS_TEST
**Related notes:** 
- [[Seed Rule Addition - Knowledge Without External Sources]]
- [[Frontier Exploration - Knowledge Without Sources]]
- [[AI-Assisted Knowledge Management Seed]]

## Summary

Tested Seed rules against the gap between proposed rule for original knowledge and current Seed coverage.

## Does the rule make sense?

**Question:** Does the Seed handle knowledge without external sources (original syntheses, personal experiments, novel ideas)?

**Analysis:** The Seed covers:
- `author-type` - distinguishes human-written, AI-assisted, AI-generated
- `source-type` - primary, secondary, tertiary for domains with hierarchies
- `confidence` - from speculative to established
- Source citation rules
- AI-generated content provenance

**Gap identified:** The Seed lacks explicit handling for:
- Knowledge that is original synthesis (combining multiple experiences into new insight)
- Personal experiments without external validation
- Novel hypotheses proposed without testing
- Intuition-based knowledge from deep experience
- Documentation of what makes knowledge "YOURS" vs restatable from public sources

## Is the Test executable?

The proposed rule's test asks:
1. Is knowledge marked with `source-origin: original`?
2. Does confidence match knowledge type?
3. Is uniqueness explicitly stated?

The Seed doesn't currently have this test because the schema doesn't exist.

## Edge Cases

1. **Original synthesis vs regular notes:** A note that combines personal experience with external sources - is it "original" or just "sourced"?

2. **Hypothesis evolution:** When does an "untested hypothesis" become "experiential knowledge"? The proposed rule has hypothesis-status but Seed doesn't track this lifecycle.

3. **Intuition calibration:** How do you verify "expert intuition"? The proposed rule says "medium-high confidence if expert-level" but Seed has no expertise-level tracking.

4. **Synthesis basis:** The proposed rule includes `synthesis-basis` field listing experiences that combined into insight - no equivalent in Seed.

5. **Originality contribution:** How do you verify a note's claim that it adds something beyond public knowledge? No test exists.

## What This Reveals

The Seed handles:
- Source provenance (external sources)
- AI provenance (author-type)
- Confidence calibration

But lacks:
- Original knowledge provenance (source-origin-type)
- Synthesis methodology documentation
- Hypothesis testing lifecycle
- Intuition/experience calibration
- Uniqueness verification

## Comparison to Similar Rules

| Proposed Field | Closest Seed Equivalent | Gap |
|----------------|----------------------|-----|
| source-origin | (none) | No tracking for non-source knowledge |
| source-origin-type | source-type | Current is for external sources only |
| synthesis-basis | (none) | No methodology tracking |
| hypothesis-status | verification-status | Different concept - verification is binary, hypothesis has stages |
| originality-contribution | (none) | No uniqueness verification |
| intuition calibration | confidence | Not calibrated by expertise level |

## Recommendation

The "Seed Rule Addition - Knowledge Without External Sources" note proposes integration but the Seed doesn't include it. This is a gap between Seed Gap analysis and Seed integration.

The proposed schema provides value:
- Distinguishes synthesis from hypothesis from intuition
- Calibrates confidence by source-origin type
- Documents what makes knowledge unique

However, the test criteria ("what makes this YOUR insight") is subjective and hard for AI to verify.

## Seed Integration Status

**Analysis complete: 2026-03-31**

The Seed has partial coverage:
- `knowledge-source-type: synthesis|intuition|analysis|authority|experiment` (lines 827-854) — captures how knowledge was derived
- `evidence-tier: personal-discovery` (Tier 6, lines 864-878) — captures untested personal findings

**Gaps remain:**
1. `source-origin: original` field missing — no explicit tracking for non-source knowledge
2. `source-origin-type: synthesis|hypothesis|invention|intuition|experiential|empirical` — nuanced types not fully captured
3. `hypothesis-status: untested|planned-test|failed|confirmed` — hypothesis lifecycle tracking missing
4. `synthesis-basis` — what experiences combined into insight not tracked
5. `originality-contribution` — what makes knowledge unique vs restatable public knowledge

**Verdict:** Gap confirmed. The proposed rule should be integrated into the Seed, building on existing `knowledge-source-type` and `evidence-tier` rules rather than creating entirely new schema.

---
**See also:**
- [[Seed Rule Addition - Knowledge Without External Sources]]
- [[Frontier Exploration - Knowledge Without Sources]]
- [[Seed Development Hub]] — tracks Seed gaps and rule additions
- [[Frontier Exploration Hub]] — related frontier notes
- [[AI-Assisted Knowledge Management Seed]] lines 827-854 (source type tracking)
- [[AI-Assisted Knowledge Management Seed]] lines 2241-2278 (author-type and AI content)