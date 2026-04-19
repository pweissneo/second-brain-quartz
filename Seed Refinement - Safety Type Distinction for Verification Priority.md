---
last-reviewed: 2026-04-08
lifecycle: seed-refinement
confidence: medium
author-type: ai-assisted
knowledge-type: meta
access-pattern: lookup
verification-status: in-progress
tags:
  - seed-refinement
  - safety
  - verification-priority
  - compliance-gap
schema-version: "1.0"
---

# Seed Refinement: Safety Type Distinction in Verification Priority

## Rule

**Add `safety-type` frontmatter field to distinguish between different categories of safety knowledge, each with different verification priority levels and timeframes.**

## Why

The current Seed treats "safety-critical" as a monolithic category, but different types of safety knowledge have fundamentally different characteristics:

- **Mechanical safety** (immediate physical harm): cuts, burns, falls — requires urgent verification
- **Chemical safety** (toxicity, reactions): proper ventilation, chemical storage — medium-term effects
- **Ergonomic safety** (cumulative injury): posture, repetitive strain — verification over weeks/months
- **Biological safety** (pathogens, contamination): food safety, infection — context-dependent
- **Fire safety** (combustion risk): flash point, ignition — immediate verification needed

Each type has different:
- Verification methods (inspection vs. testing vs. source review)
- Priority levels in verification hierarchy
- Timeframes for verification cycles
- Expertise requirements (domain expert vs. general practitioner)

## Test

Can you answer YES to all of these?

1. Do safety-critical notes include `safety-type:` field with one of: mechanical|chemical|ergonomic|biological|fire|other?
2. Do verification priority rules treat different safety types with appropriate priority levels?
3. Can you identify which safety notes require immediate verification vs. medium-horizon vs. long-horizon?
4. Does the verification-status field reflect the appropriate timeframe for the safety type?

## Implementation

```yaml
safety-type: mechanical|chemical|ergonomic|biological|fire|other
verification-priority: critical|high|medium|low
verification-cycle: immediate|medium-horizon|long-horizon
safety-type-rationale: "Why this classification"
required-expertise: general|practitioner|expert
```

### Verification Timeframe by Type

| Safety Type | Verification Cycle | Priority Default | Verification Method |
|-------------|-------------------|-----------------|---------------------|
| Mechanical | Immediate | Critical | Inspection + source |
| Chemical | Medium-horizon (30-90 days) | High | Source + expert review |
| Ergonomic | Long-horizon (90+ days) | Medium | Practice validation |
| Biological | Context-dependent | High | Source + context validation |
| Fire | Immediate | Critical | Code compliance + source |

## Edge Cases

**Compound safety types:** Some knowledge has multiple safety aspects (e.g., woodworking involves mechanical, dust-related chemical, and noise-related ergonomic). Use `safety-types:` (plural) array and default to highest priority component.

**Domain-specific subtypes:** Some domains have specialized safety categories. Extend base taxonomy with domain-specific types while maintaining compatibility with core categories.

## Related

- [[Seed Refinement - Verification Priority Hierarchy Edge Cases]] — Original refinement note
- [[Seed Refinement - Verification Priority in Cooking Domain]] — Domain-specific example showing safety type distinction
- [[AI-Assisted Knowledge Management Seed.md]] — Main Seed document
- [[Compliance Audit - Verification Priority Refinement Integration]] — Audit identifying this gap

## Status

**Proposed for Seed integration.** This refinement addresses the missing safety type distinction identified in the 2026-04-08 compliance audit of Verification Priority rules.