---
last-reviewed: 2026-04-07
last-updated: 2026-04-07
lifecycle: seed-refinement
confidence: medium
author-type: ai-assisted
knowledge-type: meta
verification-status: verified
tags:
  - seed-refinement
  - domain-adaptation
  - methodology
  - process
  - bootstrap
access-pattern: decision
---

# Seed Refinement - Domain Adaptation Checklist Template

## Summary

**Rule proposal:** Add a Domain Adaptation Checklist template to the Seed — a systematic process for AI agents to adapt Seed rules when entering new domains.

**Why:** The Seed provides domain-agnostic rules but lacks explicit guidance on how to adapt those rules when entering a new domain. The Domain Adaptation Checklist formalizes the adaptation process.

**Test:** For a new domain, can an AI agent use this checklist to systematically identify what Seed modifications are needed?

---

## Problem

When bootstrapping a knowledge base in a new domain, the Seed's domain-agnostic rules must be adapted:

- **Procedural ratio** — Cooking is 70% procedural, philosophy might be 30%
- **Verification modes** — Cooking needs execution verification, legal needs source verification
- **Embodied knowledge** — Pottery has high embodied knowledge, programming has low
- **Confidence decay** — Technology decays fast, mathematics decays slow

The Seed currently includes domain-specific test adaptations (line ~1116-1131) but lacks a **systematic checklist** for AI agents to use when encountering a new domain.

## Proposed Addition

Add to Seed Section 1 (Foundation) or create a new "Domain Adaptation" section:

### Rule: Apply Domain Adaptation Checklist for New Domains

**Rule:** When entering a new domain (bootstrapping a knowledge base or expanding into unfamiliar territory), systematically apply the Domain Adaptation Checklist before adding content.

**Why:** Mechanical rule application without domain consideration creates brittle vaults. The adaptation checklist ensures domain-specific factors are addressed before structural decisions compound.

**Test:** For a new domain bootstrap: (1) Is there a domain adaptation note? (2) Does it identify the domain's procedural/conceptual ratio? (3) Are verification mode requirements defined? (4) Are failure modes documented? (5) Is terminology handled appropriately?

### Domain Adaptation Checklist Template

```yaml
domain-adaptation:
  complete: true
  domain-name: [domain]
  date: 2026-04-07
  
# Knowledge Type Analysis
knowledge-type-ratio:
  procedural: 0.0-1.0
  conceptual: 0.0-1.0
  factual: 0.0-1.0
  experiential: 0.0-1.0
  relational: 0.0-1.0

# Verification Requirements
verification:
  primary-mode: source|empirical|embodied|tool-dependent|drill-verified
  fallback-modes: [list]
  confidence-decay-rate: fast|medium|slow|none

# Failure Mode Analysis
failure-consequences:
  safety: none|low|medium|high
  financial: none|low|medium|high
  time: none|low|medium|high
  aesthetic: none|low|medium|high

# External Dependencies
dependencies:
  equipment-required: true|false
  expertise-required: true|false
  seasonal-knowledge: true|false
  time-sensitive: true|false

# Terminology Handling
terminology:
  has-standard-abbreviations: true|false
  jargon-to-plain-mapping: present|needed
  domain-terminology: [list]
```

## Example Application

**Domain: Mixology (Cocktails)**

| Factor | Assessment |
|--------|------------|
| Procedural ratio | 0.8 (recipes, techniques) |
| Embodied knowledge | Medium (mixing feel, dilution) |
| Verification mode | Execution (taste result) |
| Confidence decay | Slow (classic recipes stable) |
| Failure consequences | Aesthetic + financial |
| Equipment required | Yes (bar tools) |
| Has abbreviations | Yes (oz, dash, splash, parts) |

**Adaptation notes:**
- Procedures >300 words are valid (recipes are complete workflows)
- Execution verification via personal testing records
- Sensory anchors required for technique notes
- Equipment dependencies tracked in frontmatter

## Integration Point

This refinement should be added to Seed Section 1 (Foundation) after the "Domain-Aware Capture Sequence" rule (line ~1000), as it directly supports bootstrap decisions.

## Related Notes

- [[Seed Gap - Cross-Domain Rule Adaptation Methodology]] — Original gap identification
- [[Frontier Exploration - Bootstrapping Knowledge Bases in Unfamiliar Domains]] — Initial domain entry
- [[AI-Assisted Knowledge Management Seed]] — Domain-specific test adaptations (line ~1116-1131)
- [[Seed Stress Test - Cooking Knowledge Base]] — Domain adaptation example