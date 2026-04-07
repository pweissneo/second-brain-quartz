---
last-reviewed: 2026-03-20
last-updated: 2026-03-20
lifecycle: evergreen
confidence: emerging
verification-status: ai-generated
author-type: ai-assisted
tags:
  - seed-stress-test
  - decision-threshold
  - emergency-medicine
  - healthcare
---

# Stress Test: Decision Threshold Rule in Emergency Medicine

> **Note:** This stress test uses hypothetical examples from emergency medicine for illustrative purposes. These are teaching examples demonstrating how Seed rules would apply in high-stakes medical domains.

## Seed Rule Being Tested

**Rule:** Add decision threshold guidance for actionable knowledge — when knowledge recommends a decision, include explicit criteria for when to stop gathering information and act.

**Why:** Without decision thresholds, users face analysis paralysis. The Seed covers what to decide and how to verify, but not when "enough is enough" to make the call.

**Test:** For notes containing decision content: (1) Is there `decision-horizon:` (immediate|flexible|open)? (2) Is there `reversibility:` (easy|hard|one-shot)? (3) Can you state explicit threshold conditions? (4) Is waiting-cost documented for time-sensitive decisions?

## Domain Context: Emergency Medicine

Emergency medicine represents an extreme case for decision thresholds:
- Time-critical decisions (stroke, MI, trauma)
- Irreversible harm from delays
- High cost of false positives AND false negatives
- Legal/liability implications
- Team-based decisions (not individual)

## Edge Cases Found

### Edge Case 1: Golden Hour / Window Constraints

**Problem:** In stroke treatment (tPA within 4.5 hours), the decision threshold isn't about "enough information" — it's about elapsed time.

Example: A note about "Stroke Recognition and tPA Administration" might have:
- decision-horizon: immediate
- reversibility: one-shot
- decision-threshold: "If suspect stroke, activate stroke protocol within 10 minutes of first medical contact"

The problem: The Seed's `decision-threshold` asks for conditions like "2+ source confirmations" but in emergency medicine, the threshold is temporal, not evidential.

**Verdict:** The rule needs a temporal decision threshold variant for time-critical domains.

### Edge Case 2: Team Decision Architecture

**Problem:** The Seed tests assume individual decision-making, but emergency medicine is team-based.

Example: A note about "Trauma Activation Criteria" might say:
- decision-horizon: immediate
- reversibility: hard
- decision-threshold: "ED physician decides activation"

But this misses: Who activates? At what threshold? Can a nurse activate? What if physician disagrees?

**Verdict:** The rule needs to account for multi-person decision architectures.

### Edge Case 3: One-Shot Reversibility Is Complex

**Problem:** The Seed distinguishes "easy", "hard", and "one-shot" reversibility, but medical reversibility is nuanced.

Example: Giving tPA (clot-buster) is "one-shot" in that you can't un-give the drug. But:
- Some complications are reversible (allergic reaction treated)
- Some outcomes are reversible over time (bleeding resolves)
- The decision is one-shot but the outcome isn't final

**Verdict:** Need distinction between decision-reversibility and outcome-reversibility.

### Edge Case 4: Waiting Cost Is Not Just Time

**Problem:** In the Seed, "waiting-cost" seems to refer to opportunity cost. In medicine, waiting has clinical harm.

Example: For suspected myocardial infarction:
- decision-horizon: immediate
- waiting-cost: "Each 30-minute delay increases mortality by X%"

The problem: This is a clinical harm metric, not an opportunity cost. The rule should distinguish:
- Clinical harm (patient outcomes worsen)
- Resource harm (beds/teams occupied)
- Legal harm (delays expose to liability)

**Verdict:** Add `waiting-cost-type:` (clinical|resource|legal|opportunity) to distinguish harm types.

### Edge Case 5: Diagnostic Uncertainty vs. Treatment Threshold

**Problem:** The rule conflates diagnostic uncertainty with treatment readiness.

In medicine, there's a well-established concept (from Professor Paul Sax):
- Treatment threshold = the probability at which the expected benefit of treatment exceeds the expected harm of not treating
- This is different from "enough information"

Example: For anticoagulation in atrial fibrillation:
- CHA2DS2-VASc score gives risk
- But decision also depends on: bleeding risk, patient preference, fall risk, adherence

The current rule asks "when to stop gathering information" — in medicine, this might mean "when diagnostic probability crosses treatment threshold" not "when you have complete information."

**Verdict:** The rule should distinguish diagnostic threshold from treatment threshold.

### Edge Case 6: Guidelines vs. Bedside Judgment

**Problem:** Emergency medicine notes might reference guidelines (which have hard thresholds) vs. clinical judgment (soft thresholds).

Example guideline: "Door-to-needle time < 45 minutes for STEMI"
- decision-threshold: 45 minutes (hard)
- decision-horizon: immediate

Example clinical: "Consider tPA if uncertain"
- decision-threshold: undefined
- decision-horizon: flexible

The rule doesn't distinguish hard thresholds (from guidelines) from soft thresholds (from judgment).

**Verdict:** Add `threshold-type: guideline|clinical|calculated` to distinguish.

### Edge Case 7: Escalation vs. De-escalation Decisions

**Problem:** The rule focuses on "when to act" but doesn't address "when to escalate."

In emergency medicine, many decisions are about whether to escalate care:
- When to call ICU
- When to consult specialist
- When to transfer

These have different decision dynamics: you're not deciding to act, you're deciding that someone else should decide.

**Verdict:** The rule should also cover escalation decisions.

## What Works

1. The core intuition is correct — decision paralysis is real in medicine
2. The `reversibility` field is highly relevant (one-shot decisions in medicine)
3. The `decision-horizon` field captures the urgency spectrum

## What Breaks

1. The test assumes individual decision-making; medicine is team-based
2. Temporal thresholds (elapsed time) aren't well captured
3. The distinction between diagnostic and treatment thresholds is missing
4. Clinical harm as waiting-cost is distinct from opportunity cost
5. Hard thresholds (guidelines) vs. soft thresholds (judgment) aren't distinguished

## Proposed Refinement

### Add temporal decision threshold variant

```yaml
decision-threshold-type: temporal|evidential|probabilistic
# temporal: act after time X (stroke window, door-to-needle)
# evidential: act after information threshold (2+ sources)
# probabilistic: act when probability crosses threshold (P > X%)

temporal-threshold:
  metric: minutes|hours
  value: 45
  reference: "door-to-needle time"

probabilistic-threshold:
  threshold-type: treatment-threshold
  value: 0.65  # 65% probability of benefit > harm
  calculation: "benefit_probability * benefit_magnitude > harm_probability * harm_magnitude"
```

### Add team decision architecture

```yaml
decision-architecture:
  type: individual|team|escalation
  primary-decider: "ED physician"
  can-initiate: ["ED physician", "NP", "RN"]
  escalation-path: "Attending → Department Chief → Hospital Admin"
  consensus-required: false  # Can act without full team agreement
```

### Distinguish decision-reversibility from outcome-reversibility

```yaml
decision-reversibility: one-shot  # Can't re-do the decision
outcome-reversibility: partial    # Some effects can be reversed
reversibility-notes: "Complications treatable; long-term effects may persist"
```

### Add waiting-cost types

```yaml
waiting-cost-type: clinical  # Patient outcomes worsen
waiting-cost-metric: "mortality_increase_per_30min"
waiting-cost-value: "7.5%"
waiting-cost-source: "European Heart Journal 2024"
```

## Test Refinement

The Seed test should be updated for high-stakes domains:

**Original Test:** For notes containing decision content: (1) Is there `decision-horizon:`? (2) Is there `reversibility:`? (3) Can you state explicit threshold conditions? (4) Is waiting-cost documented?

**Refined Test for Medical/Emergency Domains:**
1. Is there `decision-threshold-type:` (temporal|evidential|probabilistic)?
2. Is there `decision-architecture:` (individual|team|escalation)?
3. For temporal thresholds: is there a specific time metric and value?
4. For probabilistic thresholds: is the threshold calculation documented?
5. Is `waiting-cost-type:` specified (clinical|resource|legal)?
6. Is there a distinction between decision-reversibility and outcome-reversibility?
7. Are escalation paths defined for uncertain cases?

## Related

- [[Frontier Exploration - Decision Threshold Knowledge]]
- [[Stress Test - Knowledge Activation States in Medical Knowledge]]
- [[Stress Test - Source Quality Hierarchy in Medical Knowledge]]
- [[Handling Contradictory Sources]] (relevant when guidelines conflict)
