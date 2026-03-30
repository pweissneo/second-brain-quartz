---
last-reviewed: 2026-03-30
last-updated: 2026-03-30
confidence: emerging
author-type: ai-assisted
tags:
  - seed-gap
  - frontier-exploration
  - social-validation
  - feedback-knowledge
gap-status: analyzed
gap-phase: analysis
gap-review-date: 2026-03-30
gap-source: frontier-exploration
discovered: 2026-03-30
schema-version: "1.0"
---

# Seed Gap: Social Validation Knowledge

> Knowledge that requires external human feedback to verify (not expert consultation, not empirical testing).

**Discovery Method:** FRONTIER_EXPLORATION
**Domain:** Music composition, creative writing, UI design
**Date:** 2026-03-30

---

## Gap Identification

**What gap occurred:** The Seed covers multiple verification modalities:
- **Source verification:** Checking documentation, citations
- **Empirical verification:** Testing with users, A/B testing, playtesting
- **Drill verification:** Practice under conditions that simulate emergency
- **Embodied verification:** Physical sensation, kinesthetic feel
- **Tool-dependent verification:** Requires physical measurement devices

But the Seed does NOT cover knowledge requiring **social/external feedback** — where the correctness depends on how other people perceive, understand, or respond to your work. Examples:

- "Is this explanation clear?" → requires reader feedback, not just source check
- "Does this melody sound good?" → requires listener feedback, not just music theory
- "Is this design usable?" → requires user testing, but that's empirical... hmm
- "Is this writing engaging?" → requires reader feedback

**Wait:** User testing IS covered under empirical verification. The gap is more specific: what about knowledge where the verification is purely SOCIAL (opinion, perception, aesthetic judgment) but the source is unavailable or the domain is purely subjective?

**Refined gap:** For creative domains where the "correct" answer is defined by audience response rather than objective criteria, the Seed doesn't address:
1. How to capture feedback-dependent knowledge
2. How to weight conflicting audience responses
3. When to trust majority feedback vs. expert feedback vs. your own judgment

## What Rule Is Missing from the Seed

A rule addressing knowledge that depends on social validation — capturing feedback, handling conflicting responses, and knowing when to trust audience over self.

**Proposed rule structure:**
```
Rule: For creative work knowledge (music, writing, design, art), capture feedback with source tracking and use explicit feedback-weighting criteria.
Why: Creative work validity is defined by audience response, not objective measurement. Without feedback tracking, you lose the data needed to improve.
Test: For creative work notes: (1) Does feedback exist with source tracking? (2) Is feedback weighted (majority vs. expert vs. self)? (3) Is conflicting feedback documented?
```

## Implementation Sketch

```yaml
verification-mode: social-validation
feedback-sources:
  - type: majority-audience|expert|peer|self
    count: 10
    positive: 8
    negative: 2
    date: 2026-03-30
feedback-weight: high|medium|low
confidence: calibrated-by-feedback
```

## Related Gaps

- [[Frontier Exploration - Personal Taste Calibration Knowledge]] — overlaps but more about calibration than verification
- [[Seed Gap - Empirically Validatable Knowledge]] — empirical testing is different from social feedback
- [[Seed Gap - Subjective Personal Knowledge Handling]] — subjective knowledge vs. feedback-dependent knowledge

## See Also

- [[AI-Assisted Knowledge Management Seed]] — verification rules section
- [[Frontier Exploration - Creative Project Phase Knowledge]] — creative work documentation

---

**Status:** Analyzed — rule proposal drafted
**Next:** Advance to proposed phase with Seed rule in Rule/Why/Test format

## Seed Rule Proposal

**Rule:** For creative domain knowledge bases where validity depends on audience response (music, writing, design, visual art), tag feedback-dependent knowledge with verification-mode: social and track feedback with source, date, and sample characteristics.

**Why:** Social validation differs from empirical testing (user studies) and expert review — it's about audience reception, aesthetic response, and subjective quality assessment. Without explicit tracking, feedback data is lost and confidence calibration becomes impossible. Creative knowledge without feedback tracking is incomplete even if source-quality is high.

**Test:** For creative work notes: (1) Does frontmatter include `verification-mode: social`? (2) Is feedback tracked with source, date, and sample size? (3) Are conflicting responses (positive/negative) documented? (4) Is feedback type distinguished (majority-audience | expert | peer | self)?

**Implementation:**
```yaml
verification-mode: social
feedback-type: majority-audience|expert|peer|self
feedback-sample-size: number
feedback-positive: count
feedback-negative: count
feedback-date: YYYY-MM-DD
feedback-context: "What feedback was given"
conflicting-feedback: true|false
```

**When to use:** Apply to creative work knowledge where correctness is defined by audience response, not objective measurement. Do not apply to craft technical knowledge (anatomy, technique) which IS objectively verifiable.

**Relationship to existing rules:** Orthogonal to empirical verification (user testing with controlled conditions), tool verification (physical measurement), and drill verification (emergency procedures). Social validation is distinct — it's about subjective reception, not objective performance.

**See also:** [[Frontier Exploration - Personal Taste Calibration Knowledge]] | [[Seed Gap - Empirically Validatable Knowledge]]