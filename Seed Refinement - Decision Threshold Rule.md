---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-03-30
last-updated: 2026-03-30
lifecycle: evergreen
confidence: high
tags:
  - seed-refinement
  - decision-threshold
  - edge-cases
---

# Seed Refinement: Decision Threshold Rule

**Based on:** [[Seed Stress Test - Decision Threshold Rule in Emergency Medicine]]

**Original Rule:**
> Add decision threshold guidance for actionable knowledge — when knowledge recommends a decision, include explicit criteria for when to stop gathering information and act.

**What the Stress Test Revealed:**

The original rule assumes evidence-based thresholds ("need 2+ source confirmations") but misses several critical variants that exist in real domains:

## Edge Cases Discovered

### 1. Temporal Decision Thresholds (Time-Based, Not Evidence-Based)

In emergency medicine, the threshold isn't "enough information" — it's elapsed time. Stroke treatment (tPA within 4.5 hours), trauma "golden hour," door-to-needle targets.

**Implication:** The Seed rule needs a temporal variant for time-critical domains.

### 2. Team Decision Architecture

The Seed tests assume individual decision-making, but many domains are team-based (emergency medicine, military, aviation, project management).

**Implication:** Add decision-architecture field (individual|team|escalation).

### 3. Decision-Reversibility vs. Outcome-Reversibility

A decision can be "one-shot" (can't un-give a drug) but the outcome may be partially reversible (complications treatable). The original rule conflates these.

**Implication:** Distinguish decision-reversibility from outcome-reversibility.

### 4. Multiple Waiting-Cost Types

"Waiting cost" in the Seed seems to be opportunity cost. In medicine, waiting has clinical harm (patient outcomes worsen), resource harm (beds occupied), and legal harm (liability).

**Implication:** Add waiting-cost-type: (clinical|resource|legal|opportunity).

### 5. Diagnostic Threshold vs. Treatment Threshold

The rule asks "when to stop gathering information" but in medicine, the question is "when does diagnostic probability cross treatment threshold" — different from complete information.

**Implication:** Distinguish diagnostic threshold from treatment threshold.

### 6. Hard (Guideline) vs. Soft (Clinical Judgment) Thresholds

Guidelines have hard thresholds ("door-to-needle <45 minutes"). Clinical judgment has soft thresholds ("consider if uncertain").

**Implication:** Add threshold-type: (guideline|clinical|calculated).

### 7. Escalation Decisions

The rule covers "when to act" but not "when to escalate" — when to call for help, consult specialist, or transfer to others.

**Implication:** The rule should cover escalation decisions.

## Proposed Rule Refinement

Add to the decision threshold rule:

```yaml
# Extended frontmatter for decision thresholds
decision-threshold-type: temporal|evidential|probabilistic
# temporal: act after time X (stroke window, door-to-needle)
# evidential: act after information threshold (2+ sources)  
# probabilistic: act when probability crosses threshold (P > X%)

temporal-threshold:
  metric: minutes|hours|days
  value: 45
  reference: "door-to-needle time"

probabilistic-threshold:
  threshold-type: treatment-threshold|diagnostic-threshold
  value: 0.65
  calculation: "benefit_probability * benefit_magnitude > harm_probability * harm_magnitude"

decision-architecture:
  type: individual|team|escalation
  primary-decider: "role or name"
  can-initiate: ["list of roles"]
  escalation-path: "path to higher authority"
  consensus-required: false|true

decision-reversibility: easy|hard|one-shot
outcome-reversibility: full|partial|none
reversibility-notes: "optional notes"

waiting-cost-type: clinical|resource|legal|opportunity
waiting-cost-metric: "what is measured"
waiting-cost-value: "X per unit"

threshold-type: guideline|clinical|calculated
# guideline: hard threshold from official guidelines
# clinical: soft threshold from judgment
# calculated: derived from formula

escalation-available: true|false
escalation-path: "who to escalate to"
escalation-threshold: "when to escalate"
```

## Updated Test

**Original Test:** For notes containing decision content: (1) Is there `decision-horizon:`? (2) Is there `reversibility:`? (3) Can you state explicit threshold conditions? (4) Is waiting-cost documented?

**Refined Test:**
1. Is there `decision-threshold-type:` (temporal|evidential|probabilistic)?
2. Is there `decision-architecture:` (individual|team|escalation)?
3. For temporal thresholds: is there a specific time metric and value?
4. For probabilistic thresholds: is the threshold calculation documented?
5. Is `waiting-cost-type:` specified (clinical|resource|legal|opportunity)?
6. Is there a distinction between decision-reversibility and outcome-reversibility?
7. Are escalation paths defined for uncertain cases?
8. Is `threshold-type:` (guideline|clinical|calculated) specified?

## What This Teaches Us

1. **High-stakes domains expose gaps** — The rule worked for normal decisions but broke under extreme conditions (time-critical, team-based, irreversible).

2. **Temporal thresholds are common** — Many domains have time-based decision points (deadlines, windows, freshness).

3. **Decision architecture matters** — Individual vs. team vs. escalation changes how thresholds work.

4. **Reversibility is multi-dimensional** — Distinguishing decision from outcome helps in domains where partial reversal is possible.

5. **Escalation is a decision type** — "When to get help" is under-specified in the current Seed.

---

**Related:**
- [[Seed Stress Test - Decision Threshold Rule in Emergency Medicine]]
- [[Seed Stress Test - Decision Threshold Rule in Software Architecture]]
- [[Frontier Exploration - Decision Threshold Knowledge]]
