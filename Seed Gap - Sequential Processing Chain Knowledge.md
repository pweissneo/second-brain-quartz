---
last-reviewed: 2026-04-01
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
tags:
  - seed-gap
  - sequential-processing
  - chain-position
  - processing-pipeline
gap-status: integrated
gap-priority: medium
gap-type: seed-missing
discovered: 2026-04-01
gap-phase: proposed
---

# Seed Gap: Sequential Processing Chain Knowledge

## Gap Identified

The Seed lacks explicit handling for knowledge domains organized around **sequential processing chains** — domains where input flows through multiple transformation stages, with each stage depending on and affecting subsequent stages.

**Distinction from existing Seed content:** The Seed covers prerequisite chains (line 321) for sequential-skill learning domains. This is different:
- **Prerequisite chain**: Pedagogical sequence (A → B → C means learn A before B)
- **Processing chain**: Production pipeline (A → B → C means output flows through each stage)

## Examples of Sequential Processing Chain Domains

| Domain | Chain Stages |
|--------|-------------|
| Audio engineering | Source → Capture → Correction → Enhancement → Space → Output |
| Photography | Scene → Capture → Selection → Editing → Export → Display |
| Manufacturing | Raw materials → Processing → Assembly → QC → Packaging |
| Software development | Design → Implementation → Testing → Deployment → Monitoring |
| Video production | Capture → Ingest → Edit → Color → Audio → Export |
| Cooking | Prep → Cook → Plate → Serve |

## Why This Matters

Knowledge at different chain positions has different characteristics:
- **Early stages** (input, capture): Affect everything downstream - mistakes propagate
- **Late stages** (output, delivery): Only affect final output - localized impact
- **Adjacent stages**: Have dependencies that generic knowledge ignores

Examples:
- "Use EQ before compression" in audio — depends on chain position (EQ affects what compressor sees)
- "Leave headroom for mastering" in audio — only applies at output stage
- "Export for social media" in photography — only applies at export stage

Without chain-position tagging, position-dependent rules are indistinguishable from generic advice.

## Proposed Seed Rule

> **Rule:** For knowledge domains organized around sequential processing chains, tag notes with `chain-position:` frontmatter to indicate where in the chain the knowledge applies.
>
> **Why:** Sequential chain domains have knowledge that depends on processing stage. Early stages affect everything downstream; late stages only affect final output. Without chain position, position-dependent rules create confusion.
>
> **Test:** (1) Can you filter notes by chain position? (2) Does position-dependent knowledge include position metadata? (3) Can you identify which rules have wide vs. narrow impact?

**Implementation:**
```yaml
chain-position: input|capture|correction|enhancement|space|output
chain-stage-number: 1  # position in sequence
impact-radius: early-stage|mid-stage|late-stage|full-chain
adjacent-dependencies: [["Stage Name"]]  # optional: stages this depends on
```

**Impact radius reasoning:**
- Early-stage rules (input, capture) have **wide impact** — affect everything downstream
- Mid-stage rules have **local impact** — affect adjacent stages
- Late-stage rules (output, delivery) have **narrow impact** — only affect final output

## Edge Cases

### Multi-Path Chains
Some domains have branching paths (not just linear chains). Tag with:
```yaml
chain-structure: linear|branching|parallel
alternative-paths: [["Path A"], ["Path B"]]
```

### Feedback Loops
Some processing has feedback (output affects earlier stages). Tag with:
```yaml
feedback-loop: true
feedback-stage: "stage name"
```

### Domain-Specific Stage Names
Different domains use different terminology. Allow domain-appropriate names:
```yaml
# Audio engineering
chain-position: capture

# Photography  
chain-position: edit

# Generic fallback
chain-position: stage-1
```

## Related Seed Rules

- [[Seed Stress Test - Atomicity Rule Across Domains]] — covers sequential-skill domains with prerequisite chains (line 321), DIFFERENT from processing chains
- [[Knowledge Provenance]] — related to tracking transformation through stages
- [[Seed Refinement - Knowledge Source Type Domain Adaptation]] — allows domain-appropriate conventions

## Related Notes

- [[Seed Stress Test - Audio Engineering Knowledge Base]] — example domain with processing chain
- [[Seed Stress Test - Photography Knowledge Base]] — example domain with processing chain
- [[Seed Stress Test - Woodworking Knowledge Base]] — example of craft domain with process stages

## Test Case

**Audio engineering knowledge base:**
- Note: "Use EQ before compression" → chain-position: correction, impact-radius: early-stage
- Note: "Leave 6dB headroom for mastering" → chain-position: output, impact-radius: late-stage
- Filter: Can find all "input stage" knowledge → YES if chain-position metadata present