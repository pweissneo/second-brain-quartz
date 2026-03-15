---
last-reviewed: 2026-03-13
confidence: emerging
lifecycle: draft
author-type: ai-assisted
tags:
  - frontier-exploration
  - temporal-knowledge
  - predictions
  - forecasts
---

# Frontier Exploration - Predictive Knowledge Capture

> How to capture and structure knowledge about future events, forecasts, and projections

## The Problem

The Seed handles:
- **Temporal data**: "X is currently Y" (verifiable now)
- **Historical knowledge**: "X happened at time T" (verifiable in past)
- **Sequential knowledge**: "A happened, then B" (order is knowledge)

But it lacks explicit guidance for **predictive knowledge**: "X will likely happen" or "Y may be true in the future."

Predictive knowledge is fundamentally different because:
1. It cannot be verified at capture time
2. It may never be verifiable (some predictions are about unique events)
3. Accuracy can only be assessed retrospectively
4. Multiple predictions about the same event may all be "valid" at capture time

## Examples of Predictive Knowledge

| Type | Example | Verification |
|------|---------|-------------|
| Weather forecast | "Rain expected tomorrow" | Verifiable next day |
| Economic projection | "GDP growth will slow in Q3" | Verifiable after Q3 |
| Technological prediction | "AI will exceed human performance by 2030" | May not be verifiable |
| Personal forecast | "I will finish this project by Friday" | Verifiable by Friday |
| Scientific hypothesis | "This compound will react with X" | Verifiable via experiment |

## Key Distinctions

### Prediction vs. Projection vs. Forecast

- **Forecast**: Based on models/data, probabilistic ("60% chance of rain")
- **Projection**: Based on assumptions, conditional ("If trends continue...")
- **Prediction**: Statement about future state, often categorical ("X will happen")

### Prediction vs. Speculation

- **Prediction**: Has basis in data, models, or expertise
- **Speculation**: No basis, pure conjecture

The Seed should help distinguish these, but both can be valuable knowledge.

## Proposed Seed Rules

### Rule: Tag predictive knowledge with explicit temporal scope

**Why**: Readers need to know WHEN a prediction can be verified. Without temporal scope, stale predictions accumulate as "knowledge" that was never checked.

**Test**: For notes containing predictions: (1) Is there a `prediction-window:` or `verify-after:` date? (2) Can readers determine when this prediction becomes verifiable?

**Implementation**:
```yaml
prediction-type: forecast|projection|hypothesis
prediction-window: 2024-Q3  # When this can be verified
confidence: low|medium|high  # Based on model quality/data
```

### Rule: Distinguish model-based predictions from expert judgment

**Why**: A prediction from a validated model has different reliability than an expert's intuition. Both are valid, but readers need to know the source type.

**Test**: For predictive notes: (1) Is the source a model, data analysis, expert opinion, or intuition? (2) Can readers assess the prediction's methodological basis?

### Rule: Create verification triggers for predictions

**Why**: Predictions should be reviewed after their verification window passes. Without triggers, wrong predictions become stale "knowledge."

**Test**: Does the vault have a process to review predictions after their verification date? Are failed predictions tracked separately from successful ones?

### Rule: Track prediction accuracy over time

**Why**: A knowledge base that makes predictions should learn from them. Tracking accuracy builds credibility and improves future predictions.

**Test**: Can you calculate: (1) What percentage of predictions were correct? (2) Were correct predictions more confident than incorrect ones? (3) What patterns exist in failed predictions?

## Gap Analysis: Where would an AI get stuck?

An AI building a knowledge base about, say, **climate change projections** using only current Seed rules would struggle with:

1. **No guidance on temporal scope** — When does "projected" apply? 2030? 2100?
2. **No distinction between model outputs and expert judgment** — Both are predictions but have different reliability
3. **No verification process** — Predictions sit forever, never checked
4. **No accuracy tracking** — Can't learn from failed predictions
5. **No handling of self-defeating predictions** — If everyone believes X will happen, they act to prevent X

## Edge Cases

### Self-Defeating/Sufficient Predictions
Some predictions, if widely believed, cause actions that prevent the prediction from coming true. Example: "Oil will run out by 2030" - if believed, drives conservation that extends the timeline.

**Guidance**: Tag predictions that would change behavior if known.

### Unique Event Predictions
Some predictions are about one-time events that cannot be repeated for validation. "The Big One earthquake will hit California in 2045" can only be verified once.

**Guidance**: For unique event predictions, note the confidence interval explicitly and acknowledge they may be unverifiable.

### Competing Predictions
Multiple experts may make conflicting predictions. Both may be valid based on different assumptions.

**Guidance**: Present competing predictions with their underlying assumptions, don't force synthesis.

## Related Notes

- [[AI-Assisted Knowledge Management Seed]] - Now includes rules for predictive knowledge
- [[Handling Temporal Knowledge]] - Covers time-sensitive data
- [[Confidence Markers]] - For signaling reliability
- [[Frontier Exploration - Probabilistic Knowledge]] - Related but about uncertainty in current knowledge, not future
- [[Stress Test - Temporal Knowledge Rule in Stock Trading]] - Tested temporal data but not predictions
- [[Self-Improvement Cycle]] - Could incorporate prediction accuracy tracking
