---
last-reviewed: 2026-03-09
lifecycle: draft
confidence: emerging
tags:
  - frontier-exploration
  - probabilistic-knowledge
  - uncertainty
---

# Frontier Exploration: Probabilistic Knowledge

> How do we handle knowledge that is true "most of the time" but has exceptions?

## The Problem

The Seed has confidence markers (high/emerging/disputed/obsolete), but these don't capture **inherent probabilistic knowledge** - knowledge that is legitimately uncertain or probabilistic in nature:

- Weather forecasting: "70% chance of rain"
- Medical statistics: "This treatment works 60% of the time"
- Financial predictions: "Historically, this strategy returns 8% on average"
- Physics: "Particles behave this way 99.9% of the time"
- Engineering: "This design has a 0.1% failure rate"

This is different from:
- **Disputed knowledge**: We don't know what's true
- **Emerging knowledge**: We think we know but are still gathering evidence
- **Obsolete knowledge**: We once thought this was true but were wrong

Probabilistic knowledge IS true - we just need to express the probability.

## Current Seed Gaps

1. **No guidance on expressing probability** - How to represent "usually works" vs "always works"?
2. **No guidance on probability distributions** - Not just point estimates but ranges and confidence intervals
3. **No guidance on when to present options vs probabilities** - If probability is ~50%, present as options; if 80/20, present probability
4. **No guidance on updating probabilistic knowledge** - When new data comes in, how to update?

## Domains Where This Matters Most

- **Medicine**: Treatment efficacy rates, side effect probabilities
- **Finance**: Historical returns, risk metrics, default probabilities
- **Weather/Climate**: Forecast probabilities, climate model predictions
- **Engineering**: Failure rates, reliability metrics
- **Science**: Measurement uncertainty, confidence intervals

## Emerging Rule Suggestions

### Rule: Express probability explicitly, not as vague language

**Why:** "Usually works" means different things to different people. Explicit probabilities enable proper weighting of knowledge.

**Test:** Can you assign a numerical probability to the claim? If yes, is it expressed numerically?

### Rule: Distribute point estimates into ranges when uncertainty is high

**Why:** A single number implies precision that may not exist. Ranges better represent true uncertainty.

**Test:** For any numerical claim >6 months old, has the range been reconsidered with new data?

### Rule: Present options when probability is near 50%; present probability when clearly skewed

**Why:** At 50/50, options are more actionable than probabilities. At 90/10, probability matters more.

**Test:** For claims near 50% probability, are multiple options presented rather than false certainty?

### Rule: Date probabilistic knowledge with expected update frequency

**Why:** Probabilistic knowledge changes as base rates change. Stale probabilities are misleading.

**Test:** For probabilistic claims, is there a refresh date or trigger condition for update?

## Test Case: Medical Knowledge Base

An AI building a medical vault using only current Seed rules would:
- ✓ Capture treatment efficacy
- ✓ Mark confidence as "high" or "emerging"
- ✗ Not express that "works 60% of the time" is different from "works 90% of the time"
- ✗ Not distinguish between "we don't know" (disputed) and "it works this often" (probabilistic)
- ✗ Not know when to present treatment as options vs probability

## Related

- [[Confidence Markers]] - Current confidence framework
- [[Stress Test - Probabilistic Knowledge Rule Across Domains]] - Domain stress tests for probabilistic knowledge
- [[Handling Temporal Knowledge]] - For updating probabilistic knowledge over time
- [[Domain-Specific Knowledge Bases]] - For domain-specific handling
- [[AI-Assisted Knowledge Management Seed]] - The Seed this explores
