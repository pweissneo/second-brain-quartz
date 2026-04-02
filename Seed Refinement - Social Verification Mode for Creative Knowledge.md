---
last-reviewed: 2026-03-31
lifecycle: seed-refinement
confidence: emerging
author-type: ai-assisted
tags:
  - seed-refinement
  - verification-mode
  - social-validation
  - creative-domains
  - feedback
related:
  - "[[AI-Assisted Knowledge Management Seed]]"
  - "[[Seed Gap - Social Validation Knowledge]]"
  - "[[Frontier Exploration - Personal Taste Calibration Knowledge]]"
---

# Seed Refinement - Social Verification Mode for Creative Knowledge

> Adding explicit support for audience-feedback verification in creative domains.

## Summary

The Seed has verification modes for:
- `tool-dependent` — requires physical measurement devices
- `drill-verified` — validated through practice under stress conditions
- `embodied` (real-time) — validated during execution through sensory feedback
- `source` — authority vouching

But it lacks explicit support for **social validation** — knowledge where correctness depends on audience perception, aesthetic response, or subjective reception.

## The Gap

Creative domains (music composition, creative writing, visual art, design) have knowledge where:
- "Is this melody good?" depends on listener response
- "Is this explanation clear?" depends on reader feedback
- "Is this design usable?" depends on user perception

These are DIFFERENT from empirical verification (controlled user testing) because:
- Sample sizes are small (1-5 reviewers typical)
- Responses are subjective (not correct/incorrect)
- Feedback varies (same work gets different responses)

The Seed doesn't explicitly handle this verification mode.

## Proposed Enhancement

Add a verification mode for creative knowledge:

```yaml
# For creative work notes:
verification-mode: social
feedback-type: audience|peer|expert|self
feedback-sources:
  - reviewer: "Name or role"
    response: positive|negative|mixed
    date: 2026-03-31
feedback-summary: "Brief summary of main themes"
confidence: calibrated-by-feedback
```

This is ORTHOGONAL to other verification modes:
- A note can be both source-verified AND socially validated
- Social verification doesn't replace empirical testing — they're different dimensions
- Use when correctness is defined by audience reception, not objective measurement

## Integration Path

1. Update Seed Gap - Social Validation Knowledge: mark `gap-status: proposed` with reference to this refinement note
2. Add `verification-mode: social` to Seed's verification mode list
3. Document in verification-mode conflict resolution how social interacts with other modes

## See Also

- [[AI-Assisted Knowledge Management Seed#verification]] — where verification modes are defined
- [[Seed Gap - Social Validation Knowledge]] — gap analysis with full context
- [[Seed Refinement - Verification Mode Conflict Resolution Edge Cases]] — how conflicts between modes are resolved