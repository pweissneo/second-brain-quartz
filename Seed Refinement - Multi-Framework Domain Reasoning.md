---
lifecycle: seed-extension
confidence: emerging
last-reviewed: 2026-03-28
author-type: ai-assisted
verification-status: verified
tags:
  - seed-refinement
  - reasoning-strategies
  - multi-framework
  - evidence-tier
  - gap-detection
related-seed_rule: [[AI-Assisted Knowledge Management Seed#Reasoning Strategies]]
---

# Seed Refinement: Multi-Framework Domain Reasoning

> This note captures refinements to the Seed's reasoning strategies rule based on stress testing in therapeutic psychology and similar multi-framework domains.

## The Gap

The Seed's reasoning strategies rule (query decomposition, traversal planning, relevance scoring, confidence aggregation, gap detection) works for single-framework domains but fails for multi-framework domains where:
- Multiple competing frameworks exist (CBT vs. DBT vs. ACT vs. Psychodynamic)
- Each framework has different evidence levels and recommendations
- Recommendations are client-specific and context-dependent
- Safety, credentials, and phase all affect applicability

## The Discovery

During stress testing in therapeutic psychology, 6 additional reasoning dimensions were identified:

1. **Framework identification** — Every recommendation must be traceable to a framework
2. **Evidence tier weighting** — Not all evidence is equal (RCT vs. case studies vs. expert consensus)
3. **Required factor detection** — Recommendations may require client factors (age, comorbidities, preferences)
4. **Credential constraint checking** — Some interventions require specific training/certification
5. **Phase/stage awareness** — Recommendations change based on process phase
6. **Harm potential weighting** — High-stakes domains need safety checks before recommendations

## Proposed Seed Rule Addition

> **Rule (NEW):** For domains with competing frameworks, the reasoning strategy must identify which framework a recommendation comes from, weight by evidence tier, detect missing required factors, check credential constraints, consider phase/stage, and weight harm potential.
>
> **Why:** Multi-framework domains (therapeutic psychology, investing, software architecture, medical specialties) have different "correct" answers depending on framework. Generic reasoning strategies that ignore frameworks give false confidence — they present one framework's recommendations as universal when they're actually framework-specific.
>
> **Test:** For a recommendation in a multi-framework domain: (1) Is the source framework identified? (2) Is evidence tier noted? (3) Are required client/user factors checked? (4) Are credential requirements verified? (5) Is phase/stage appropriate? (6) Is harm potential assessed?

## Implementation Guidance

### Framework Tagging
```yaml
framework: cognitive-behavioral  # vs. psychodynamic, humanistic, etc.
framework-alternatives:
  - psychodynamic
  - humanistic
framework-evidence-tier: gold-standard|good|moderate|emerging|insufficient
```

### Evidence Tier Integration
Existing `evidence-tier:` field should be required for all intervention/recommendation notes in multi-framework domains.

### Required Factor Detection
```yaml
required-factors:
  - client-age
  - client-culture
  - comorbidities
  - previous-treatment-history
```

### Credential Constraint
```yaml
required-credentials:
  - emdr-certification
  - licensed-therapist
application-scope: licensed-practitioner  # vs. public, professional-only
```

### Phase Awareness
```yaml
therapeutic-phase: assessment|early|middle|late|termination
phase-appropriate-for:
  - early
  - middle
```

### Harm Potential
```yaml
harm-potential: minimal|moderate|significant
safety-review-required: true  # for significant harm-potential
```

## Domains This Applies To

- **Therapeutic psychology**: CBT, DBT, ACT, Psychodynamic, etc.
- **Investing**: Value, momentum, growth, technical analysis
- **Software architecture**: Monolithic, microservices, serverless, etc.
- **Medical specialties**: Differentpecialties have different treatment paradigms
- **Education**: Different pedagogical approaches (Montessori, Waldron, traditional)
- **Cooking**: French, Italian, Japanese, molecular gastronomy traditions

## Edge Cases

### Edge Case: Framework-Neutral Recommendations
Some knowledge is framework-neutral — "diagnostic criteria for depression" applies regardless of treatment approach. Tag these as `framework-neutral: true` to signal they're not framework-dependent.

### Edge Case: Framework Evolution
Frameworks change over time. Add `framework-version:` or `framework-era:` for temporal framework tracking (e.g., "CBT per Beck 1970s" vs. "CBT per Beck 2020s").

### Edge Case: Hybrid Approaches
Modern therapy often combines frameworks ("integrative" or "eclectic"). Track with:
```yaml
framework-type: integrative|eclectic|sequential
component-frameworks:
  - cognitive-behavioral
  - mindfulness-based
```

## Related Notes

- [[Seed Stress Test - Reasoning Strategies in Therapeutic Psychology]] — Original stress test
- [[Seed Stress Test - Expertise Level Rule in Foreign Language Learning]] — Framework-like differentiators (methodologies)
- [[Seed Stress Test - Philosophy Knowledge Base]] — Framework-dependent knowledge
- [[Frontier Exploration - Decision Framework Selection Knowledge]] — Framework selection
- [[AI-Assisted Knowledge Management Seed#Knowledge Source Type]] — Source type tracking