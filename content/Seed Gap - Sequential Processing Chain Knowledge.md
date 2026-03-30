---
last-reviewed: 2026-03-28
lifecycle: emerging
confidence: emerging
author-type: ai-assisted
tags:
  - seed-gap
  - sequential-chain
  - processing-pipeline
  - audio-engineering
gap-type: seed-missing
gap-source: seed-stress-test
---

# Seed Gap: Sequential Processing Chain Knowledge (Resolution In Progress)

## Gap Identified

The Seed lacks explicit handling for knowledge domains organized around **sequential processing chains** where each stage transforms the output of the previous. Note: Related guidance exists at Seed lines 275-280 (sequential-skill domains) but this covers prerequisite chains, not processing pipelines.

### Examples of Sequential Chain Domains

- **Audio engineering**: source → capture → correction → enhancement → space → output
- **Manufacturing**: raw materials → processing → assembly → quality control → packaging
- **Software development**: design → implementation → testing → deployment → monitoring
- **Cooking**: prep → cook → plate → serve

### The Problem

Knowledge at different chain positions has different characteristics:
- Early stages (input, capture) affect everything downstream
- Late stages (output, delivery) only affect final output
-Adjacent stages have dependencies that aren't captured in the Seed

The Audio Engineering stress test identified this gap when analyzing signal chain knowledge:
- "Use EQ before compression" depends on chain position
- "Leave headroom for mastering" applies only at output stage
- These position-dependent rules aren't distinguishable from generic advice

## Proposed Rule

> **Rule:** For knowledge domains organized around sequential processing chains, use `chain-position:` frontmatter to indicate where in the chain the knowledge applies.
>
> **Why:** Sequential chain domains have knowledge that depends on processing stage. Chain position enables filtering by stage and understanding downstream impacts.
>
> **Test:** Can you filter notes by chain position? Do cross-chain notes document their dependencies?

## Implementation (Proposed for Seed)

```yaml
chain-position: input|capture|correction|enhancement|space|output
chain-stage-number: 1-6  # position in sequence
adjacent-stages: ["stage-before", "stage-after"]  # optional explicit links
impact-radius: early-stage|mid-stage|late-stage|full-chain  # downstream effect scope
```

**Key insight:** Rules at early chain stages have wider impact. Rules at late stages only affect final output. This distinguishes "use EQ before compression" (early stage, affects everything) from "leave headroom for mastering" (late stage, only affects output).

## Related

- [[Seed Stress Test - Audio Engineering Knowledge Base]]
- [[Frontier Exploration - Sequential Workflow Knowledge]]
- [[Seed Gap - Equipment Dependencies Rule Across Domains]]