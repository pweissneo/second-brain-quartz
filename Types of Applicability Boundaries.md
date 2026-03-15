---
last-reviewed: 2026-03-15
lifecycle: active
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - applicability
  - boundaries
  - structure
---

# Types of Applicability Boundaries

> Categorization of how knowledge boundaries can be documented

Knowledge doesn't apply in different ways. Categorizing these boundary types helps capture when knowledge fails.

## Why This Matters

1. **Preventing misapplication**: Knowledge correct in one context can cause harm in another.
2. **Building trust**: A KB that admits limitations is more trustworthy.
3. **Saving time**: Don't try approaches known to fail for your situation.

An AI building a gardening KB with current Seed rules would tag with hardiness zones but miss: "this doesn't work with clay soil," "don't combine with that fertilizer," "fails above 90% humidity."

## Proposed Seed Rule

> **Rule:** Document applicability boundaries — explicitly note when knowledge doesn't apply.
> **Why:** Knowledge works in one context, fails in another. Explicit boundaries prevent misapplication.
> **Test:** Pick 5 notes with absolute language. Document when each doesn't apply.

## 1. Contextual Boundaries

Knowledge that works in one context but not another:
- "This pruning technique works for fruit trees, not ornamental"
- "This teaching method works for beginners, not advanced learners"
- "This financial advice applies to employees, not business owners"

## 2. Boundary Conditions

Knowledge correct at certain scales or thresholds:
- "Newtonian physics works at everyday speeds, not at relativistic speeds"
- "Linear regression works when relationships are linear, not for curved data"
- "This recipe serves 4, not scalable below 2 servings"

## 3. Precondition Boundaries

Knowledge requiring specific conditions:
- "This solution works only when you have X equipment"
- "This approach requires Y amount of time"
- "This advice applies only if you have Z background"

## 4. Temporal Boundaries

Knowledge correct but conditions changed:
- "This worked in 2020 market conditions, not in 2024"
- "Pre-pandemic travel advice no longer applies"
- "This tool was free, now it's subscription-only"

## 5. Combinatorial Boundaries

Knowledge failing when combined with other things:
- "X and Y both work separately, but not together"
- "This medication interacts with these other drugs"
- "These two frameworks conflict when used simultaneously"

## Structure Template

```yaml
applicability:
  applies-to: [list where it works]
  does-not-apply-to: [list where it doesn't]
  boundary-conditions:
    - condition: "What must be true"
      threshold: "Break point"
  preconditions:
    required: [what's needed]
    incompatible: [what conflicts]
```

## Related

- [[The Inverse Test]] — Technique for finding undocumented boundaries
- [[Frontier Exploration - Trade-off Knowledge Capture]]
- [[Frontier Exploration - User Situational Constraints]]
