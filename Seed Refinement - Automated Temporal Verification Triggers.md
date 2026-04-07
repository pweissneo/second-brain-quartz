---
last-reviewed: 2026-04-03
last-updated: 2026-04-03
lifecycle: seed-refinement
confidence: medium
author-type: ai-assisted
tags:
  - seed-refinement
  - verification
  - automation
  - temporal
---

# Seed Refinement - Automated Temporal Verification Triggers

> [!note]
> This note proposes a new Seed rule: automated temporal verification triggers for knowledge freshness management.

## Gap Identification

After reviewing the Seed comprehensively, I found:
- Extensive rules for **detecting** staleness (Rule at line ~2282)
- Verification ratio tracking (line ~445)
- Knowledge validity windows (see [[Seed Gap - Knowledge with Inherent Expiration Windows]])
- Verification ceiling enforcement (line ~454)

But the Seed lacks:
- **When** to actively trigger verification (vs. passive waiting)
- Integration guidance with automation systems (cron/heartbeat)
- Explicit trigger thresholds based on knowledge type

## Proposed Rule

> **Rule (NEW - 2026-04-03):** Implement automated temporal verification triggers based on knowledge type and age thresholds — the vault should actively surface verification candidates rather than waiting for passive human review.
>
> **Why:** The Seed tells how much verification to maintain (ratio, ceiling) and how to detect staleness, but not when or how to actively trigger verification prompts. Without automated triggers, knowledge drifts between verification until a human happens to review, regardless of staleness detection.
>
> **Test:** (1) Can the vault automatically surface knowledge needing verification based on age thresholds? (2) Is trigger frequency differentiated by knowledge type (factual=quarterly, procedural=annual, conceptual=minimal)? (3) Does the system balance triggering with resource constraints? (4) Are triggered verifications logged for analytics?

## Implementation

```yaml
verification-trigger:
  enabled: true
  trigger-knowledge-type:
    factual: 90  # days - quarterly
    procedural: 365  # days - annual
    experiential: as-needed
    conceptual: 730  # days - biennial
    relational: 365
  max-pending-verifications: 10  # resources
  priority-order: safety > decision > frequency > age
```

## Edge Cases

### Resource Constraints
When verification backlog exceeds capacity, prioritize:
1. Safety-critical knowledge
2. Decision-critical knowledge  
3. Frequently-referenced knowledge
4. Oldest unverified knowledge

### Domain-Specific Triggers
- Medical: quarterly factual, annual procedural
- Legal: annual all types
- Finance: quarterly factual (rates change), annual procedural
- Historical: minimal triggers (stable knowledge)

### Multi-Person Vaults
Trigger assignment strategies:
- Round-robin: distribute evenly
- Expertise-based: assign by domain
- Stochastic: random selection from pending

## Integration

For heartbeat/cron integration:
```bash
# Example trigger query
find . -name "*.md" -mtime +90 -exec grep -l "knowledge-type: factual" {} \;
```

## Related Seed Rules

- [[Seed Rule: Track vault growth velocity and maintain verification ratio]] (line ~445)
- [[Seed Rule: Enforce verification ceiling]] (line ~454)
- [[Seed Rule: Distinguish staleness from obsolescence]] (line ~2282)
- [[Seed Gap - Knowledge with Inherent Expiration Windows]]

## Domain Stress Tests

### Medical Knowledge Base
- Drug interaction facts: trigger at 90 days
- Diagnostic procedures: trigger at 365 days
- Historical case studies: minimal trigger

### Cooking Knowledge Base  
- Nutrition data: trigger at 90 days
- Recipes: trigger at 365 days
- Ingredient seasonality: trigger at seasonal boundaries

### Personal Finance Knowledge Base
- Tax rules: annual trigger
- Account details: as-needed (not automated)
- Investment principles: biennial trigger

---

*Confidence: medium — needs field testing in automated vault environments before full Seed integration.*