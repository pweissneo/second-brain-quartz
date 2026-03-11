---
last-reviewed: 2026-03-10
lifecycle: emerging
confidence: emerging
tags: [stress-test, domain:research, confidence-markers, scientific-method]
---

# Stress Test: Confidence Markers Rule in Scientific Research

> Testing Seed rule: "Use confidence markers (high/emerging/disputed/obsolete) to signal reliability of knowledge."

## Domain: Scientific Research

In scientific research, "confidence" has a very specific meaning that differs from everyday usage. This stress test examines whether the Seed's confidence markers work for scientific knowledge.

## Question 1: Does this rule make sense for scientific research?

**Yes, but with complications.**

In scientific literature, confidence levels are explicitly defined:
- **High**: Reproduced by multiple independent studies, meta-analyses, consensus statements
- **Emerging**: New findings, limited replication, active research area
- **Disputed**: Conflicting results, active debate, competing theories
- **Obsolete**: Superseded by newer understanding, rejected by subsequent evidence

The Seed's markers align with scientific practice. However, there's a gap: scientific confidence also depends on **evidence tier** (systematic review > RCT > observational > case report > expert opinion).

## Question 2: Is the Seed's Test executable by an AI?

**Partially.**

The Test asks: "Do notes with contested claims include confidence metadata?"

This is executable, but insufficient for scientific knowledge because:
1. An AI cannot independently assess whether a claim is "high" confidence - it needs source evaluation
2. Scientific confidence changes over time as new studies emerge
3. The distinction between "emerging" and "disputed" requires domain expertise

**Refined Test for Scientific Domain:**
```
For each scientific claim:
1. Does it have confidence metadata?
2. Does it have evidence-tier metadata (systematic-review/rct/observational/case-study/expert-opinion)?
3. Can you trace the confidence level to a source?
4. Is the confidence level consistent with the source quality?
```

## Question 3: Edge cases where the rule fails

### Edge Case 1: Conflicting Studies
When two high-quality studies reach opposite conclusions, is the confidence "disputed" or "high" for each?

**Resolution:** The note should present both with "disputed" confidence, citing both sources. Don't pick winners.

### Edge Case 2: Preliminary Results
Preprints (papers not yet peer-reviewed) - what's the confidence level?

**Resolution:** Use "emerging" with a note like "preprint - not peer reviewed" and include `peer-review-status: pending`.

### Edge Case 3: Consensus That Turns Out Wrong
Historical examples: "the earth is the center of the universe" was once "high" confidence.

**Resolution:** Notes with historical confidence should include `status: superseded` with a pointer to the current understanding.

### Edge Case 4: Replication Crisis Domains
In psychology, many "high" confidence findings have failed replication. How should notes represent this?

**Resolution:** Use `replication-status: replicated/failed-replication/pending` in addition to confidence markers.

## Proposed Seed Rule Refinement

**For scientific domains, add to the Confidence Markers rule:**

> **Rule:** For scientific knowledge, include evidence-tier metadata in addition to confidence markers.
> **Why:** Scientific confidence is hierarchical - a systematic review carries more weight than a single study.
> **Test:** For scientific claims: (1) Is there confidence metadata? (2) Is there evidence-tier metadata? (3) Does the confidence level match the evidence tier (e.g., "high" confidence should not come from a single case study)?

## Related
- [[AI-Assisted Knowledge Management Seed]] — The rule being tested
- [[Stress Test - Source Quality Hierarchy in Medical Knowledge]] — Related domain testing
- [[Stress Test - Probabilistic Knowledge Rule Across Domains]] — Confidence and probability overlap
