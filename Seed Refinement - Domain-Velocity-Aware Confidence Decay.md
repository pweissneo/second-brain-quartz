---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-04-02
last-updated: 2026-04-02
lifecycle: seed-refinement
confidence: emerging
tags:
  - seed-refinement
  - confidence
  - domain-velocity
  - decay
  - knowledge-maturity
gap-type: seed-missing
gap-status: resolved
gap-priority: medium
gap-severity: useful
discovered: 2026-03-27
resolved-by: [[Seed Refinement - Domain-Velocity-Aware Confidence Decay]]
source-stress-tests:
  - [[Seed Stress Test - Photography Knowledge Base]]
  - [[Seed Stress Test - Music Performance Knowledge Base]]
  - [[Seed Stress Test - Gardening Knowledge Base]]
---

# Seed Refinement: Domain-Velocity-Aware Confidence Decay

> A proposed Seed rule to address gaps identified in photography and music performance stress tests.
> Resolved gap: Seed Gap - Domain-Velocity Confidence Decay.md (Photography stress test, rule added to Seed 2026-03-28)
> Related: [[AI-Assisted Knowledge Management Seed]], [[Seed Stress Test - Photography Knowledge Base]], [[Seed Stress Test - Music Performance Knowledge Base]]

## Gap Identification

**Original Gap Identification (from Seed Gap - Domain-Velocity Confidence Decay.md):**
The Seed's confidence markers and review intervals don't account for domain velocity — how quickly knowledge becomes outdated varies dramatically by domain, but the Seed treats confidence uniformly across domains.

**Evidence from Stress Tests:**

**Photography (from Seed Stress Test - Photography Knowledge Base):**
- Camera technology evolves rapidly - knowledge about autofocus systems from 2018 may be obsolete by 2026
- Post-processing software changes frequently
- The Seed has "confidence: high" on the main Seed file, but photography-specific knowledge should have faster decay

**Music Performance (from Seed Stress Test - Music Performance Knowledge Base):**
- Technique knowledge is relatively stable ( fundamentals don't change)
- But equipment, pedagogy, and practice research evolve
- Embodied knowledge doesn't decay the same way technical knowledge does

**Gardening (from Seed Stress Test - 5-1 Ratio in Gardening.md):**
- Seasonal knowledge has cyclical validity
- Climate change affects traditional wisdom
- Zone-specific knowledge has geographic velocity

## Proposed Seed Rule

**Rule:** Assign domain-velocity classification to knowledge bases and adjust confidence decay expectations accordingly — fast-velocity domains require more frequent review and lower starting confidence.

**Why:** Treating all domains equally causes fast-velocity domains to accumulate false confidence (stale knowledge appears reliable) and slow-velocity domains to suffer unnecessary review overhead. Photography knowledge about 2018 cameras shouldn't have the same confidence decay timeline as fundamental mathematics. Without domain-velocity awareness, AI agents cannot appropriately calibrate confidence and review frequency.

**Test:** 
1. Can you classify your vault's primary domains by velocity (fast/medium/slow/static)?
2. Do high-velocity domain notes have review intervals ≤90 days?
3. Do static domain notes have `review-interval: historical` or `review-interval: never`?
4. Is confidence appropriately calibrated — fast-velocity domains should rarely reach `confidence: high` without recent verification?

## Domain Velocity Taxonomy

```
FAST VELOCITY (review interval: 30-90 days):
- Consumer electronics (cameras, phones, computers)
- Software/SDKs with frequent updates
- Social media platforms and features
- Market data and financial instruments
- News and current events
- Web frameworks and tooling

MEDIUM VELOCITY (review interval: 90-180 days):
- Professional equipment (medical devices, industrial tools)
- Software best practices
- Domain-specific methodologies
- Tool comparisons and reviews
- Industry regulations

SLOW VELOCITY (review interval: 180-365 days):
- Craft techniques (woodworking, cooking fundamentals)
- Practice methodologies
- Performance psychology
- Educational pedagogy
- Health/fitness research

STATIC (review-interval: historical or never):
- Mathematical proofs
- Historical facts (ancient)
- Philosophical arguments
- Foundational definitions
- Classical literature
- Fundamental physical constants
```

## Implementation

### For Vault Level
Add to vault config or root note:
```yaml
domain-velocity-map:
  primary-domains:
    - domain: photography
      velocity: fast
      default-review-interval: 60
    - domain: music-performance
      velocity: slow
      default-review-interval: 180
    - domain: mathematics
      velocity: static
      default-review-interval: never
```

### For Individual Notes
```yaml
domain-velocity: fast|medium|slow|static
review-interval: 60  # days, or "historical"/"never"
confidence-adjustment: -1  # reduce confidence by 1 level for fast-velocity domains
```

### Modified Confidence Test for Fast-Velocity Domains

For domains with velocity: fast, modify the confidence test:
- `confidence: high` requires: verification within 30 days AND source is current version
- `confidence: emerging` is the typical ceiling unless actively maintained
- Automatic downgrade from `confidence: high` to `confidence: emerging` after review-interval expires

## Edge Cases

**Hybrid domains:** Some domains have mixed velocity - photography technique is slow but equipment is fast. Apply multi-label: `domain-velocity: [slow, fast]` with `velocity-scopes: {technique: slow, equipment: fast}`.

**Subdomain variation:** Within a domain, subtopics may have different velocity. Photography: "composition principles" (static) vs "autofocus systems" (fast).

**Geographic variation:** Traditional knowledge may be slow-velocity in its origin region but fast-velocity elsewhere (imported techniques).

## Transition Guidance

Existing vaults should:
1. Audit primary domains and assign velocity classifications
2. Update review-interval on existing notes to match domain velocity
3. Consider reducing confidence on fast-velocity notes that haven't been reviewed in >60 days
4. Add domain-velocity to new note templates for fast-velocity domains

## Related Seed Rules

- [[AI-Assisted Knowledge Management Seed]] — Primary Seed
- [[Seed Stress Test - Photography Knowledge Base]] — Identified confidence decay gap
- [[Seed Stress Test - Music Performance Knowledge Base]] — Verified gap across domains
- [[Stress Test - Confidence Markers Rule Across Domains]] — Related stress test
- [[Seed Gap - Domain-Velocity Confidence Decay]] — Original gap identification (merged 2026-04-02)
