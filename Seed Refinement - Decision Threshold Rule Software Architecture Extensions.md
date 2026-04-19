---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-04-07
last-updated: 2026-04-07
lifecycle: seed-extension
confidence: emerging
gap-source: Seed Stress Test - Decision Threshold Rule in Software Architecture
tags:
  - seed-refinement
  - decision-threshold
  - software-architecture
  - domain-extension
---

# Seed Refinement: Decision Threshold Rule — Software Architecture Extensions

> Integrating domain-specific insights from software architecture stress test into the Seed (2026-04-07)

## Background

A Seed stress test was performed on 2026-03-21 testing the Decision Threshold Knowledge rule against software architecture domain. The stress test identified four enhancement areas that weren't in the original rule.

## What the Stress Test Found

The Decision Threshold Rule in the Seed covers:
- `decision-horizon:` (immediate|flexible|open)
- `reversibility:` (easy|hard|one-shot)
- `decision-threshold:` (explicit criteria)
- `waiting-cost:` (high|low|moderate)

However, software architecture decisions have unique characteristics:

1. **Multi-stakeholder thresholds** — Different roles (CTO, lead engineer, team) have different risk tolerances and decision thresholds
2. **Interdependency chains** — Architecture decisions build on each other; choosing K8s affects database choice
3. **Technology validity periods** — Fast-moving domains have decisions that become stale within months
4. **Team-capability dependency** — Same decision has different thresholds based on team expertise

## What's Missing from the Seed

The Seed doesn't include:
- Field for documenting stakeholder-specific threshold variations
- Field for tracking decision interdependencies
- Validity period guidance for fast-moving technology domains
- Team-capability consideration in threshold determination

## Proposed Seed Enhancement

### Extended Decision Threshold Fields

```yaml
# Existing fields (keep as-is)
decision-horizon: flexible
reversibility: hard
decision-threshold: "Need 2+ architect reviews before proceeding"
waiting-cost: moderate

# New optional fields for complex domains
stakeholder-perspectives:
  - role: cto
    threshold: "cost > $50K requires board approval"
  - role: lead-engineer
    threshold: "implementation complexity > 8"
interdependency-scope: ["database-selection", "cloud-provider"]
technology-validity-period: "6-12 months"  # For fast-moving tech domains
team-capability-dependent: true
```

### Modified Test for Software Architecture/Similar Domains

1. Does this decision have explicit threshold criteria?
2. Is the reversibility scope clearly defined (module vs system vs org level)?
3. Are interdependencies with other decisions documented?
4. Is the technology validity period specified for fast-moving domains?
5. Does the threshold account for team capability variations?

## Integration Decision

**Recommendation:** Add optional extended fields to the Seed Decision Threshold rule as an optional extension for complex decision domains (software architecture, technology selection, strategic planning).

The core fields remain sufficient for simple decisions. The extended fields add value only when:
- Multiple stakeholders are involved
- Decisions have significant interdependencies
- The domain has fast-moving technology/knowledge
- Team capability significantly affects decision appropriateness

## Related Notes

- [[Seed Stress Test - Decision Threshold Rule in Software Architecture]] — Original stress test
- [[Frontier Exploration - Decision Threshold Knowledge]] — Original exploration
- [[Seed Stress Test - Advisory Validity Tracking in Financial Planning]] — Similar temporal considerations
- [[AI-Assisted Knowledge Management Seed]] — Core rule (lines 2607-2612)

## Status

**UNVERIFIED** — This refinement proposal needs testing across multiple domains before integration into the Seed.