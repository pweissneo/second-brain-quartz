---
last-reviewed: 2026-04-01
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
gap-status: proposed
gap-priority: medium
gap-type: seed-missing
gap-source: frontier-exploration
discovered: 2026-04-01
analyzed: 2026-04-01
proposed: 2026-04-01
analysis-notes: "The Seed provides domain-agnostic rules but lacks explicit guidance on HOW to adapt rules to new domains. This is distinct from domain-specific extensions (which the Seed already addresses) - this is about the transfer/adaptation process itself."
tags:
  - seed-gap
  - domain-adaptation
  - cross-domain
  - methodology
---

# Seed Gap - Cross-Domain Rule Adaptation Methodology

## The Gap

The Seed provides domain-agnostic rules ("every note should have 2+ outgoing links", "verify high-stakes knowledge") but lacks explicit guidance on **how an AI agent should adapt these rules when entering a new domain**.

## Why This Matters

Without an adaptation methodology:
1. **Agents apply rules mechanically** — they don't consider domain-specific modifications
2. **Stress tests are one-offs** — each domain requires manual stress testing
3. **Edge cases stay hidden** — until the vault hits them in production
4. **Domain expertise is assumed** — the Seed doesn't teach how to acquire it

## What the Seed Currently Covers

- Domain-specific extensions (Seed Gaps with `-domain` extensions)
- Stress tests across domains (cooking, woodworking, medical, etc.)
- Edge case documentation for specific domains

## What's Missing

### Explicit Adaptation Guidance

The Seed needs a methodology section that answers:

1. **What changes in this domain?** — Systematic checklist for identifying domain-specific modifications needed
   - Procedural vs. conceptual knowledge ratio
   - Verification mode requirements
   - Confidence decay rate
   - Embodied vs. abstract knowledge balance

2. **What domain-specific terminology exists?** — Process for identifying and handling jargon
   - Standard abbreviations (domain-specific rules)
   - Plain-language alternatives
   - When jargon is required

3. **What are the domain's failure modes?** — What happens when knowledge is wrong
   - Safety-critical (medical, home repair)
   - Financial impact (investment, legal)
   - Creative/esthetic (cooking, music)
   - Time-sensitive (trading, emergency)

4. **What external dependencies exist?** — What the vault assumes exists outside
   - Equipment requirements
   - Access to expertise
   - Temporal constraints (seasonal, cyclical)

## Proposed Seed Rule Addition

> **Rule:** When entering a new domain, systematically apply the Domain Adaptation Checklist before adding content — identify procedural/conceptual ratio, verification mode needs, failure modes, terminology, and dependencies.
> 
> **Why:** Mechanical rule application without domain consideration creates brittle vaults. The adaptation checklist ensures domain-specific factors are addressed before structural decisions compound.
> 
> **Test:** For a new domain: (1) Is there a Domain Adaptation Checklist note? (2) Does it identify the domain's procedural/conceptual ratio? (3) Are verification mode requirements defined? (4) Are failure modes documented? (5) Is terminology handled appropriately?

### Domain Adaptation Checklist

```yaml
domain-adaptation-complete: true
domain-name: [e.g., cooking, woodworking]
# Knowledge type ratio
procedural-ratio: 0.7  # 70% procedural, 30% conceptual
embodied-knowledge-level: high|medium|low
# Verification requirements
verification-mode: source|execution|social|mixed
verification-rigor: high|medium|low
confidence-decay-rate: fast|medium|slow
# Failure mode analysis
failure-consequences: safety|financial|time|aesthetic|none
domain-experts-available: true|false
# External dependencies
equipment-dependent: true|false
seasonal-knowledge: true|false
# Terminology
has-standard-abbreviations: true|false
jargon-to-plain-mapping: present|needed
```

### Adaptation Process

1. **Survey existing knowledge** — What's already in the vault about this domain?
2. **Identify knowledge type ratio** — Mostly procedural? Conceptual? Mixed?
3. **Determine verification needs** — What's at stake if knowledge is wrong?
4. **Map failure modes** — What can go wrong if guidance is incorrect?
5. **Handle terminology** — Standard jargon vs. plain language
6. **Identify dependencies** — Equipment, expertise, timing constraints
7. **Run domain-specific stress test** — Apply Seed rules and observe failures
8. **Document adaptations** — Create domain extension rules

## Example Application

**Domain: Cocktail Craft**

| Factor | Assessment |
|--------|------------|
| Procedural ratio | High (recipes, techniques) |
| Embodied knowledge | Medium (mixing, dilution feel) |
| Verification mode | Execution (you taste the result) |
| Confidence decay | Slow (classic recipes stable) |
| Failure consequences | Aesthetic + financial (wasted spirits) |
| Equipment dependent | Yes (tools, glassware) |
| Seasonal | Some (seasonal ingredients) |
| Has abbreviations | Yes (oz, dash, splash) |

**Adaptation:** Seed rules apply with modifications:
- Procedures >300 words are valid (recipes are complete workflows)
- Execution verification via personal testing records
- Equipment dependencies tracked in frontmatter
- Sensory anchors required for technique notes

## Related

- [[Seed Stress Test - Cooking Knowledge Base]] — Example domain adaptation
- [[Seed Stress Test - Craft Knowledge Bases]] — Multiple craft domains
- [[Frontier Exploration - Domain Jargon vs Plain Language]] — Terminology handling
- [[Seed Gap - Domain-Velocity Confidence Decay]] — How domains change over time
- [[Frontier Exploration - Bootstrapping Knowledge Bases in Unfamiliar Domains]] — Initial domain entry
