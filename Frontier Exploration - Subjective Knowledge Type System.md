---
last-reviewed: 2026-03-26
last-updated: 2026-03-26
confidence: emerging
author-type: ai-assisted
lifecycle: seed-gap
meta-type: capture-process
schema-version: "1.0"
level: frontier
tags:
  - frontier-exploration
  - subjective-knowledge
  - epistemic
  - gap-identified
  - knowledge-types
---

# Frontier Exploration: Subjective Knowledge Type System

## Key Insight

The Seed needs a coherent **subjective knowledge type system** that parallels its factual knowledge type system. Currently:

- **Factual knowledge** has: confidence markers, verification status, source quality hierarchy
- **Subjective knowledge** has: scattered references but no systematic type taxonomy

This creates an asymmetry where AI agents can handle facts well but struggle with opinions, preferences, and beliefs.

## What I Learned

During frontier exploration of the vault's Seed Gaps, I identified that the Seed handles subjective knowledge in three fragmented ways:

1. **Unverifiable category** - marks things as fundamentally unverifyable (includes subjective experience)
2. **Confidence markers** - "speculative" is meant to cover subjective but conflates uncertainty with subjectivity
3. **Inverse authority rule** - allows contradicting experts but doesn't track the contradiction representation

The problem: none of these explicitly handle **subjective knowledge that is valid for the individual but not generalizable**.

## The Missing Framework

A coherent subjective knowledge type system needs:

| Category | Description | Verification | Confidence Meaning |
|----------|-------------|-------------|-------------------|
| **Personal opinion** | Individual judgment | Not applicable | Personal certainty |
| **Personal preference** | Taste/choice | Not applicable | Stability over time |
| **Personal belief** | Held view despite uncertainty | Not applicable | Commitment level |
| **Perspective** | Context-dependent view | Acknowledged | Situational validity |

## Proposed Seed Extension

**Rule (NEW - 2026-03-26):** Establish a subjective knowledge type taxonomy distinct from factual knowledge types — use `knowledge-type: subjective-opinion|subjective-preference|subjective-belief|subjective-perspective` with separate confidence semantics.

**Why:** Subjective knowledge has different semantics than factual knowledge. "High confidence" for a fact means high certainty from verification. "High confidence" for an opinion means strongly held but not externally validated. Without distinct types, AI agents cannot appropriately handle opinions vs. facts.

**Test:** (1) Can you categorize all subjective notes in the vault by type? (2) Do subjective notes use separate confidence semantics? (3) Is verification-status set to "not-applicable" for inherently subjective knowledge?

**Implementation:**
```yaml
# For subjective knowledge
knowledge-type: subjective-opinion|subjective-preference|subjective-belief|subjective-perspective
subjective-confidence: strong|moderate|weak  # distinct from factual confidence
verification-status: not-applicable  # cannot verify personal opinions
evolves: true|false  # may change over time
```

## Relationship to Existing Rules

- **Confidence Markers** - needs update to explain subjective vs. factual confidence semantics
- **Unverifiable Knowledge** - the "subjective" category should map to this new system
- **Note Types and Templates** - should include subjective note templates

## Test for This Exploration

Can the Seed now handle subjective knowledge systematically? Has the gap been transformed into a proposed rule with clear Rule/Why/Test format?

**Status:** Gap identified → Rule proposed (needs Seed integration)

## Related Notes

- [[Seed Gap - Subjective Personal Knowledge Handling]] - Source gap analysis
- [[Confidence Markers]] - Current system needing update
- [[Note Types and Templates]] - Needs subjective templates