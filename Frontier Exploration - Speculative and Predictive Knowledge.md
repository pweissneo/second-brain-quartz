---
last-reviewed: 2026-03-21
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
verification-status: unverified
tags:
  - frontier-exploration
  - speculative-knowledge
  - prediction-handling
  - temporal-knowledge
schema-version: "1.0"
---

# Frontier Exploration: Speculative and Predictive Knowledge

> How should a knowledge base handle predictions, forecasts, and hypothetical scenarios?

## The Problem

Some knowledge is inherently forward-looking:
- Economic forecasts
- Technology predictions
- Scenario planning
- Trend analysis
- Hypothetical "what if" questions

This knowledge has different characteristics than past-focused or present-focused knowledge:
1. It may never be verified (the future hasn't happened)
2. Confidence assessment is different (you can't verify predictions before the time)
3. It can become dated very quickly
4. Distinguishing well-reasoned predictions from speculation is challenging

## Current Seed Coverage

The Seed covers:
- Temporal knowledge (timeline organization)
- Verification workflows
- Confidence calibration
- Staleness detection
- Knowledge debt tracking

## What's Missing

### Gap 1: Prediction Verification Timing

Standard verification assumes you can verify knowledge within days or months. Predictions may take years to verify (or never).

**Proposed Rule:** For speculative knowledge with future verification windows, use `prediction-horizon:` frontmatter to indicate when verification becomes possible, and adjust verification debt calculations accordingly.

```yaml
prediction-horizon: 2028-12  # When this prediction can be verified
verification-status: pending-resolution
```

**Why:** Treating predictions like regular knowledge creates unfair verification debt - a 2024 prediction about 2030 can't be verified in 30 days.

**Test:** For prediction notes: (1) Can you identify when verification becomes possible? (2) Is verification debt calculated from prediction-horizon, not capture date?

### Gap 2: Prediction Confidence Calibration

Standard confidence assumes source reliability and evidence. Predictions require different calibration:

- Track record of similar predictions
- Methodology quality (data-driven vs intuition)
- Time horizon (near-term vs distant)
- Number of independent sources agreeing

**Proposed Rule:** For predictive knowledge, add `prediction-confidence:` with orthogonal dimensions:

```yaml
prediction-confidence:
  methodology: data-driven|model-based|expert-opinion|intuition
  track-record: strong|moderate|limited|unknown
  horizon: near-term (<2 years)|medium-term (2-5 years)|long-term (>5 years)
  consensus-level: unanimous|majority|divergent
```

**Why:** A prediction from a proven forecasting model deserves different confidence than a speculation.

**Test:** Can you assess a prediction's reliability using multiple orthogonal dimensions, not just single confidence?

### Gap 3: Scenario vs Prediction Distinction

Some knowledge is about possible futures (scenarios) rather than likely futures (predictions).

- **Prediction:** "The price will reach X by 2025" (asserts likelihood)
- **Scenario:** "If X happens, then Y could follow" (explores possibility)

**Proposed Rule:** Distinguish predictive claims from scenario explorations using separate frontmatter:

```yaml
knowledge-type: prediction  # Asserts likely outcome
# vs
knowledge-type: scenario   # Explores possible outcome
scenario-conditions:
  - "Condition A must be true"
scenario-uncertainty: high|medium|low
```

**Why:** Treating all forward-looking knowledge the same creates misleading confidence signals.

**Test:** Can you distinguish what's likely from what's merely possible in your vault?

### Gap 4: Outdated Predictions

When a prediction fails, how should it be handled?

**Proposed Rule:** Treat failed predictions differently from incorrect facts:

```yaml
prediction-outcome: confirmed|failed|pending
resolution-type: obsoleted-by-events|superseded-by-better-model|invalid-methodology
lessons-learned: "What this reveals about prediction methodology"
```

**Why:** Failed predictions are valuable data about forecasting accuracy and should be preserved.

**Test:** Do failed predictions document their outcome and what was learned?

### Gap 5: Meta-Prediction Knowledge

Knowledge about the prediction process itself:

- What makes predictions reliable?
- Common prediction failures
- Methodology comparisons
- Track records

**Proposed Rule:** Track prediction methodology knowledge separately from specific predictions:

```yaml
meta-prediction: true
methodology-type: statistical|expert-judgment|machine-learning|analogical
effectiveness-evidence: "Track record data"
best-practices: ["Practice 1", "Practice 2"]
```

**Why:** Meta-knowledge about prediction is more durable than specific predictions.

**Test:** Can you distinguish prediction methodology knowledge from specific predictions?

## Proposed Seed Rules

### Rule: Handle Speculative Knowledge with Horizon-Aware Verification

> **Rule:** For predictions, forecasts, and scenario explorations, use `prediction-horizon:` to indicate when verification becomes possible. Calculate verification debt from horizon, not capture date.
> **Why:** Standard verification timelines don't apply to knowledge about the future.
> **Test:** Can you identify when each prediction can be verified? Is verification debt calculated appropriately?

### Rule: Calibrate Prediction Confidence Orthogonally

> **Rule:** For predictive knowledge, assess confidence across multiple dimensions: methodology quality, track record, time horizon, and source consensus. Do not use single confidence scores.
> **Why:** Predictions require multi-dimensional reliability assessment.
> **Test:** Can you evaluate a prediction's credibility using orthogonal dimensions?

### Rule: Preserve Failed Predictions as Methodology Evidence

> **Rule:** When predictions fail, preserve them with `prediction-outcome:` and `resolution-type:` documenting what was learned.
> **Why:** Failed predictions are valuable evidence about forecasting limitations.
> **Test:** Do failed predictions include outcome documentation and lessons learned?

## Domain Applicability

This gap applies to:
- Economic and financial forecasting
- Technology trend analysis
- Scenario planning (business, policy)
- Scientific predictions (climate, demographic)
- Personal predictions (career, life planning)

## Related

- [[Frontier Exploration - Temporal Knowledge]] — Existing temporal handling
- [[Handling Temporal Knowledge]] — Existing temporal guidance
- [[Frontier Exploration - Probabilistic Knowledge]] — Uncertainty representation
- [[[Frontier Exploration - Knowledge Maintenance]]] — Debt tracking
- [[Confidence Calibration]] — Confidence assessment
