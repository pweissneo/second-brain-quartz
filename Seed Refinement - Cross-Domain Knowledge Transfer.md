---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-03-29
last-updated: 2026-03-29
lifecycle: seed-refinement
confidence: emerging
tags:
  - seed-refinement
  - knowledge-transfer
  - cross-domain
  - analogical-reasoning
level: principle
---

# Seed Refinement - Cross-Domain Knowledge Transfer

> How should knowledge bases handle knowledge that applies across domains?

## The Gap

The Seed covers:
- Domain-specific knowledge (cooking, medicine, woodworking)
- Cross-topic hubs for universal problems (debugging, decision-making)

But it lacks guidance for:
- When knowledge from domain A applies to domain B
- Documenting analogical connections explicitly
- Transferability assessment

## Problem Statement

A note about "feedback loops" in music composition may apply to:
- Cooking (when to flip food based on sizzle)
- Exercise (form correction timing)
- Learning (spaced repetition intervals)

Without explicit transferability tagging, this cross-domain knowledge is invisible.

## Proposed Rule

**Rule:** For knowledge with cross-domain applicability, add explicit transferability metadata and link to examples in multiple domains.
**Why:** Cross-domain knowledge transfer is a key value driver for knowledge bases. Without explicit tagging, analogical connections are invisible and users must rediscover applicable knowledge in each domain.
**Test:** (1) Can you identify knowledge that applies to 2+ domains? (2) Is transferability documented in frontmatter? (3) Do cross-domain links exist?

**Implementation:**
```yaml
transferability: high|medium|low
domains-applicable:
  - cooking
  - music
  - exercise
transfer-rationale: "Why this knowledge transfers"
cross-domain-examples:
  - [[Domain A Note]]
  - [[Domain B Note]]
```

## Test Scenario

Apply to cooking knowledge base: A note about "temperature feedback loops" should:
- Link to cooking (pan searing)
- Link to home repair (soldering iron temperature)
- Link to chemistry (temperature control in reactions)

## Related Seed Rules

- [[Best Practice - Multi-Path Knowledge Discovery]]
- [[Frontier Exploration - Cross-Domain Knowledge Synthesis]]
- [[Frontier Exploration - Analogical Reasoning in Knowledge Bases]]

## Status

This is a proposed Seed refinement. Needs stress testing across domains before integration into Seed.
