---
last-updated: 2026-04-06
lifecycle: seed-refinement
confidence: emerging
author-type: ai-assisted
knowledge-type: structural
verification-status: unverified
gap-status: proposed
knowledge-source-type: deductive
domain-scope: physics
applicability: multi-domain
recurring: true
tags:
  - seed-refinement
  - verification-priority
  - physics-domain
  - edge-case
  - safety-detection
seealso:
  - Seed Stress Test - Verification Priority in Physics
  - AI-Assisted Knowledge Management Seed
  - Seed Refinement - Note-Type-Aware Link Density Rules
---

# Seed Refinement: Verification Priority Adaptations from Physics Domain

> **Date:** 2026-04-06
> **Method:** SEED_STRESS_TEST (via REDUNDANCY_SCAN - no redundancy found, pivoted to stress test review)
> **Source:** Seed Stress Test - Verification Priority in Physics.md (2026-04-03)

## The Gap

The Seed's Verification Priority Hierarchy rule (lines 404-441) doesn't adequately handle:
1. **Implicit safety-critical knowledge** — content that is safety-relevant without explicit frontmatter
2. **Foundational vs hub distinction** — different verification approaches for base knowledge vs. connector knowledge
3. **Small vault verification** — strategies for vaults without verification history
4. **Cross-domain safety implications** — knowledge that applies to multiple domains with different stakes

## What the Seed Currently Has

**Rule (lines 404-441):**
> Apply verification priority hierarchy when verification resources are limited — prioritize in order: (1) safety-critical knowledge, (2) decision-critical knowledge, (3) frequently-referenced knowledge, (4) verification cost-effective knowledge.

**Test:**
> (1) Can you identify notes tagged `criticality: high` or `safety-critical: true`? (2) Do these have `verification-status: verified`? (3) Are hub notes verified before peripheral notes? (4) Does verification history prioritize in Level 1→4 order?

## Proposed Refinements

### Refinement 1: Content-Based Safety Detection

**Rule:** Add content-based safety scanning for domains where safety-critical knowledge may not have explicit frontmatter.

**Why:** In domains like physics, engineering, chemistry, many safety-relevant notes don't have `safety-critical: true` frontmatter. Relying only on explicit frontmatter misses implicit safety knowledge.

**Test:** For your vault:
1. Can you identify domain-specific safety keywords relevant to your vault's topics?
2. Do notes containing these keywords have explicit safety frontmatter?
3. If not, can you add `safety-critical: implicit` or scan and add frontmatter?

**Implementation:**
```yaml
# Domain-specific safety keyword sets
safety-keywords:
  physics:
    - radiation
    - high-voltage
    - laser-hazard
    - cryogenic
    - vacuum-system
    - radioactive
    - particle-beam
  engineering:
    - structural-load
    - electrical-arc
    - pressure-vessel
    - fall-protection
  chemistry:
    - toxic
    - flammable
    - corrosive
    - reactive
```

### Refinement 2: Distinguish Foundational from Hub

**Rule:** Apply different verification approaches for foundational notes vs. hub notes.

**Why:** Foundational notes (core equations, fundamental laws, base definitions) need correctness verification. Hub notes (topic summaries, reference pages) need completeness and link verification. Conflating these leads to suboptimal verification.

**Test:** For each high-priority note:
1. Is this foundational (others build from it) or a hub (connects many topics)?
2. For foundational: verify correctness of core content
3. For hub: verify completeness and link accuracy

**Implementation:**
```yaml
note-function: foundational|hub|application|specialized
verification-approach:
  foundational: correctness-check
  hub: completeness-check
  application:实用性 verify
  specialized: domain-expert-review
```

### Refinement 3: Small Vault Verification Strategy

**Rule:** For vaults without verification history, use expected frequency and domain-specific prioritization instead of usage data.

**Why:** The current rule assumes established vaults with usage patterns. New vaults need different strategies.

**Test:** For your vault:
1. Is your vault new (<50 notes) or established (>100 notes)?
2. If new: does verification follow domain-appropriate prioritization (not history-based)?
3. For physics: theoretical → experimental → applied
4. For medicine: safety-critical → diagnosis → treatment → wellness

**Implementation:**
```yaml
vault-maturity: new|developing|mature
verification-strategy:
  new:
    - domain-appropriate-priority
    - foundational-first
    - safety-procedures-first
  developing:
    - usage-data-emerging
    - blend-expected-and-observed
  mature:
    - usage-based-priority
    - frequency-weighted
```

### Refinement 4: Cross-Domain Safety Tagging

**Rule:** For knowledge with cross-domain applicability, track which domains are affected by safety implications.

**Why:** Physics applied to medicine has different stakes than physics as pure theory. Multi-domain knowledge needs compound verification consideration.

**Test:** For notes with cross-domain applicability:
1. Does the note apply to multiple domains?
2. Are safety-critical implications tracked across affected domains?
3. Is verification prioritized by highest-stakes domain?

**Implementation:**
```yaml
safety-applies-to:
  - domain: physics
    criticality: high
  - domain: medical
    criticality: critical
  - domain: engineering
    criticality: high
```

## Related Notes

- [[Seed Stress Test - Verification Priority in Physics]] — source stress test
- [[Seed Refinement - Note-Type-Aware Link Density Rules]] — note-type awareness approach
- [[Seed Stress Test - Tool-Dependent Verification in Medical Knowledge]] — similar domain adaptation
- [[Frontier Exploration - Content-Based Safety Detection]] — frontier exploration note

## Integration Path

1. **Immediate:** Add refinements to Verification Priority rule (lines 404-441)
2. **Short-term:** Add `note-function` and `safety-applies-to` to schema
3. **Medium-term:** Add domain-specific safety keyword sets to Seed or separate domain configs

---

*Refinement status: proposed (heartbeat 2026-04-06)*