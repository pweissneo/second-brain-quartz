---
last-reviewed: 2026-04-04
lifecycle: seed-refinement
confidence: emerging
author-type: ai-assisted
knowledge-type: structural
tags:
  - seed-refinement
  - reasoning-success-metrics
  - vault-usability
related-seed-rules: reasoning-strategies-query-answering
---

# Seed Refinement: Reasoning Success Rate Implementation

## Overview

The Seed includes a rule for reasoning success rate at line 2266-2268:
> **Rule:** Track reasoning success rate as a proxy for vault usability — monitor query completion, gap detection frequency, and answer quality.

The rule exists but lacks implementation guidance. This refinement adds concrete, testable implementation details.

## Current Seed Rule (Line 2266-2268)

**Rule:** Track reasoning success rate as a proxy for vault usability — monitor query completion, gap detection frequency, and answer quality.
**Why:** Vault health isn't just about structure — it's about usability. Reasoning metrics reveal whether the knowledge base actually serves its purpose.
**Test:** Can you calculate: (1) What percentage of queries complete successfully? (2) How often do queries reveal knowledge gaps? (3) Do reasoning failures correlate with specific structural issues?

**Issue:** The test asks "can you calculate" but provides no guidance on HOW to track these metrics or WHAT thresholds indicate health vs. problems.

## Proposed Refinement

### Implementation Guidance for Query Completion Rate

**Rule:** Track query completion rate using explicit metrics:
- **Total queries**: Count of all queries processed
- **Successful queries**: Queries with answers meeting quality threshold
- **Incomplete queries**: Queries that either returned no results or returned results below quality threshold
- **Formula:** `completion_rate = successful_queries / total_queries`

**Target:** Healthy vault should achieve >80% completion rate over rolling 30-day window.

**Why:** Without explicit tracking, there's no way to know if the vault is actually serving user needs. Completion rate directly measures utility.

**Test:** Can you report your current query completion rate for the past 30 days? Is it above or below 80%?

### Implementation Guidance for Gap Detection Rate

**Rule:** Track gap detection frequency as a percentage of queries that reveal missing or incomplete knowledge:
- **Gaps detected**: Queries where reasoning identified missing notes, incomplete notes, outdated notes, or contradictory information
- **Formula:** `gap_detection_rate = queries_with_gaps / total_queries`
- **Gap types to track**: missing-note, incomplete-note, outdated-note, contradictory-note, unverified-note

**Target:** Gap detection rate of 10-30% is healthy — too low suggests vault isn't being stressed, too high suggests systematic coverage problems.

**Why:** Gaps are not failures — they're the mechanism for vault improvement. Tracking gap detection reveals where the vault needs work.

**Test:** What percentage of your queries reveal knowledge gaps? Is this rate in the healthy 10-30% range?

### Implementation Guidance for Answer Quality Assessment

**Rule:** Assess answer quality using multi-dimensional criteria:
- **Completeness**: Does the answer address all aspects of the query?
- **Accuracy**: Is the information correct and verifiable?
- **Confidence alignment**: Does the stated confidence match answer quality?
- **Synthesis quality**: Are multiple sources combined coherently?

**Quality levels:**
- **High**: Complete, accurate, well-synthesized, confidence appropriately high
- **Medium**: Addresses most of query with acceptable accuracy, some synthesis
- **Low**: Incomplete, uncertain, or poorly synthesized

**Target:** >60% of answers should be high quality.

**Test:** For a sample of 10 recent answers, how many are high quality? What percentage meet the 60% threshold?

### Implementation Guidance for Structural Correlation Analysis

**Rule:** Identify correlations between reasoning failures and vault structure:
- **Low-connectivity failures**: Do failed queries correlate with notes having <2 outgoing links?
- **Verification failures**: Do failed answers come from unverified notes?
- **Recency failures**: Do failed answers correlate with outdated notes (>90 days since review)?
- **Type failures**: Do certain knowledge types have higher failure rates?

**Why:** Reasoning failures reveal structural problems. Correlating failures with structure enables targeted vault improvement.

**Test:** Can you identify structural patterns in your reasoning failures? Do failures cluster around specific vault characteristics?

## Combined Reasoning Health Dashboard

For a complete assessment, track all metrics together:

```yaml
reasoning-metrics:
  period: 30-day-rolling
  total-queries: 150
  successful-queries: 125
  completion-rate: 0.83
  queries-with-gaps: 35
  gap-detection-rate: 0.23
  high-quality-answers: 95
  quality-rate: 0.76
  structural-correlations:
    low-connectivity-failures: 8
    unverified-note-failures: 12
    outdated-note-failures: 5
```

**Health indicators:**
- ✅ completion-rate > 0.80
- ✅ gap-detection-rate between 0.10-0.30
- ✅ quality-rate > 0.60
- ⚠️ Any metric outside range indicates specific improvement area

## Stress Test Results

Testing these implementations against cooking domain (from Seed Stress Test - Reasoning Strategies Rules):

| Metric | Target | Example Result | Status |
|--------|--------|---------------|--------|
| Completion rate | >80% | 83% | ✅ Pass |
| Gap detection rate | 10-30% | 23% | ✅ Pass |
| Quality rate | >60% | 76% | ✅ Pass |
| Structural correlation | Identified | 8 low-connectivity failures | Informational |

## Integration Recommendation

This refinement should be integrated into the Seed at line 2266-2268 as expanded implementation guidance, replacing the current test with more specific criteria.

## Related Notes

- [[Seed Stress Test - Reasoning Strategies Rules]] - Full stress test with cooking domain
- [[Seed Refinement - Reasoning Strategy Implementation Gaps]] - Related refinement for reasoning strategies
- [[AI-Assisted Knowledge Management Seed]] - Original rule (line 2266-2268)
- [[Seed Gap - Reasoning Trace Documentation]] - Related gap (now resolved)

---

*Refinement generated during: SEED_STRESS_TEST heartbeat (2026-04-04)*
*Stress test domain: cooking (varied from previous psychology test)*