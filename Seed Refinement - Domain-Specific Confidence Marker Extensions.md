---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-04-06
lifecycle: emerging
confidence: high
tags:
- seed-refinement
- confidence-markers
- domain-specific
- stress-test-integration
---

# Seed Refinement: Domain-Specific Confidence Marker Extensions

> Integrating findings from [[Seed Stress Test - Confidence Markers Rule Across Domains]]

## The Gap

The core confidence marker rule (line 4276-4278) remains generic:
> **Rule:** Use confidence markers (high/emerging/disputed/obsolete) to signal reliability of knowledge.

However, the stress test reveals that different knowledge domains require **supplementary fields** beyond basic confidence markers to properly communicate reliability.

## Proposed Integration

Rather than creating separate rules for each domain, the Seed should specify that confidence markers are the **base layer** with domain-specific **extension fields**.

### Base Rule (existing, remains)

**Rule:** Use confidence markers (high/emerging/disputed/obsolete) to signal reliability of knowledge.
**Why:** Readers need to distinguish established facts from debated hypotheses without reading source chains.
**Test:** Do notes with contested claims include confidence metadata?

### Domain-Specific Extensions (NEW)

The following supplementary fields should be added based on knowledge domain:

#### Scientific Knowledge
```yaml
evidence-tier: systematic-review|rct|observational|case-study|expert-opinion|anecdote
# Aligns with line 4415 but integrates into confidence rule
```

**Test:** For scientific claims: (1) Is confidence metadata present? (2) Is evidence-tier documented? (3) Does confidence level appropriately reflect evidence tier?

#### Legal Knowledge
```yaml
jurisdiction: [US, EU, UK, etc.]
legal-source-tier: primary|secondary|tertiary
# Extends line 4280's recency requirement
```

**Test:** For legal claims: (1) Is confidence metadata present? (2) Is jurisdiction documented? (3) Is last-reviewed within 6 months?

#### Culinary/Cooking Knowledge
```yaml
claim-type: objective|subjective|preference-dependent|traditional
source-type: scientific|traditional|expert-opinion|personal
# Addresses culinary edge cases from stress test
```

**Test:** For culinary claims: (1) Is confidence metadata present? (2) Is claim-type documented? (3) For subjective claims, is the subjective nature clear?

#### Personal Finance/Investing Knowledge
```yaml
temporal-scope: historical|projected|unknown
holding-period: N-years|any
validity-conditions: [market regime dependencies]
test-method: backtest|live-paper|live-production
advisory-type: information|analysis|recommendation
# Addresses financial edge cases from stress test
```

**Test:** For financial claims: (1) Is confidence metadata present? (2) Is temporal-scope documented (distinguishing what HAS happened from what WILL happen)? (3) Are validity conditions stated?

#### Medical Knowledge
```yaml
peer-review-status: published|preprint|pending|rejected
replication-status: replicated|failed-replication|pending
# Addresses medical-specific concerns
```

**Test:** For medical claims: (1) Is confidence metadata present? (2) Is peer-review status documented? (3) For emerging claims, is replication status noted?

## Unified Test

For any note with factual claims:
1. Is `confidence` metadata present?
2. Is domain-appropriate extension metadata present?
3. Does the confidence level appropriately reflect all available metadata?

## Implementation Note

The Seed should reference this refinement in the Confidence Markers section, pointing to this note for domain-specific implementation guidance.

## Related
- [[Seed Stress Test - Confidence Markers Rule Across Domains]] — Source of refinements
- [[Confidence Markers]] — Base rule being extended
- [[Domain-Specific Knowledge Bases]] — Related domain adaptation guidance
