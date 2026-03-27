---
last-reviewed: 2026-03-26
last-updated: 2026-03-26
lifecycle: seed-gap
confidence: high
author-type: ai-assisted
knowledge-type: structural
gap-status: identified
gap-priority: medium
gap-type: seed-missing
discovered: 2026-03-26
gap-source: frontier-exploration
tags:
  - seed-gap
  - knowledge-source-type
  - synthesis
  - ai-behavior
---

# Seed Gap - Knowledge Source Type Missing Synthesis Category

## Status: IDENTIFIED (2026-03-26)

## The Gap

The Seed tracks knowledge source types at lines 636-659 with four categories: intuition, analysis, authority, and experiment. However, it lacks a **synthesis** category — knowledge derived from combining multiple existing sources through reasoning chains.

This gap matters especially for AI-assisted knowledge bases where:
1. AI agents frequently synthesize new insights by combining 3+ sources
2. Synthesized knowledge has different reliability characteristics than single-source knowledge
3. Without synthesis tagging, users cannot distinguish "I reasoned this out" from "I read this somewhere"

## Current Seed State (lines 636-641)

```yaml
knowledge-source-type: intuition|analysis|authority|experiment
```

## What's Missing

The Seed needs a fifth source type: **synthesis**

### Why Synthesis Is Distinct

- **Source verification doesn't apply** — no single source to verify against
- **Confidence typically lower** — multi-source synthesis has more failure points
- **Requires update tracking** — if any source changes, synthesis may need recalculation
- **Provenance matters** — which sources were combined matters for credibility

### Related Existing Notes

- [[Frontier Exploration - AI Synthesis Provenance]] — documents the need for synthesis metadata
- [[Frontier Exploration - AI-Synthesized Knowledge]] — complementary note on synthesis risks
- [[Best Practice - Multi-Source Synthesis]] — covers synthesis best practices

## Proposed Seed Rule Addition

**Rule:** Add synthesis as a knowledge source type — tag AI-synthesized knowledge with synthesis metadata including sources combined, reasoning chain, and confidence calibration.

**Why:** AI agents need explicit tagging to distinguish synthesized knowledge from direct source knowledge. Synthesis has different verification requirements (re-synthesis vs. source-check) and different confidence characteristics (typically lower than single-source).

**Test:** For knowledge claims: (1) Can you identify whether this was source (read), experienced (personal), or synthesized (reasoning)? (2) Does synthesized knowledge document the source chain? (3) Is confidence appropriately calibrated (synthesis typically lower)?

**Implementation:**
```yaml
knowledge-source-type: synthesis
synthesis-type: cross-source|inductive|deductive|analogical
synthesis-sources:
  - [[Note A]]
  - [[Note B]]
  - [[Note C]]
reasoning-chain: "Step-by-step explanation of how sources combine"
synthesis-confidence-calibration: high|medium|low  # typically medium or lower
synthesis-validity-conditions: "What would make this synthesis invalid"
last-synthesized: 2026-03-26
```

**Synthesis types:**
- **Cross-source**: Combining multiple sources to create new insight
- **Inductive**: Generalizing from specific instances to broader principle
- **Deductive**: Applying general principles to specific cases
- **Analogical**: Mapping knowledge from one domain to another

**Confidence calibration guidance:**
- Single authoritative source → high confidence
- Multiple independent sources agreeing → high confidence
- Cross-source synthesis with clear reasoning → medium-high confidence
- Analogical transfer from distant domain → medium-low confidence
- Inductive generalization from few instances → low confidence

## Integration Point

Add to existing knowledge-source-type rule (around line 641):

```yaml
knowledge-source-type: intuition|analysis|authority|experiment|synthesis
```

And add synthesis-specific guidance after the source-appropriate verification section.

## Test for Gap Closure

- [ ] Seed includes synthesis as a knowledge-source-type option
- [ ] Synthesis-specific metadata fields are documented
- [ ] Confidence calibration guidance exists for synthesis
- [ ] Related notes link to the updated Seed rule
