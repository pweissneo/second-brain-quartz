---
last-reviewed: 2026-03-30
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
schema-version: "1.0"
gap-status: identified
gap-priority: medium
gap-source: frontier-exploration
discovered: 2026-03-30
tags:
  - frontier-exploration
  - sparse-knowledge
  - reasoning-with-incomplete-information
  - knowledge-boundaries
---

# Frontier Exploration - Sparse Knowledge Reasoning

> How to help users make decisions when the vault has partial knowledge — interpolation, extrapolation, analogical transfer, and managing the gap between "what we know" and "what we need to decide."

## The Problem

When someone uses a knowledge vault to support decisions, they encounter different states of vault coverage:

1. **Direct match** — Vault has exact answer for the question (best case)
2. **Analogical transfer** — Vault has related knowledge that transfers with adaptation
3. **Interpolation** — Vault has nearby data points; user can infer the middle
4. **Extrapolation** — Vault has partial range; user can project beyond known bounds
5. **Synthesis gap** — Vault has pieces but lacks connections between them
6. **Unknown unknowns** — Vault doesn't know what it's missing

The Seed handles direct matches well and has rules for handling contradictions and gaps. But it lacks guidance for **reasoning with partial coverage** — helping users understand when they have enough to interpolate vs. when they're extrapolating dangerously.

## Current Seed Gaps

1. **No guidance on interpolation vs. extrapolation** — When can a user infer from nearby notes vs. when is projection unreliable?
2. **No guidance on analogical transfer confidence** — When does "similar domain" become "transferable principle"?
3. **No guidance on synthesis gap awareness** — How does a user know when they're missing connections between pieces?
4. **No guidance on uncertainty communication** — When should the vault say "I don't know enough to help with this decision" vs. "here's what I can piece together"?
5. **No guidance on example density assessment** — Does 2 examples justify generalization? Does 20?

## Why This Matters

Without guidance for sparse knowledge reasoning, users may:

- **Over-trust** interpolated knowledge (assume smoothness where it doesn't exist)
- **Under-trust** transferable knowledge (miss valuable analogical insights)
- **Ignore** synthesis gaps (make decisions without seeing how pieces connect)
- **Over-rely** on vaults that say nothing when partial knowledge could help
- **Miss** the difference between "I have partial coverage" and "I'm extrapolating beyond my data"

## The Domain-General Problem

This isn't domain-specific. Every knowledge base faces:

- **Sparse coverage** — Some topics have 20 notes, others have 2
- **Uneven density** — Some regions are well-developed, others are thin
- **Boundary uncertainty** — It's unclear where knowledge stops being applicable

The Seed covers quality rules (atomicity, linking, verification) but not **coverage awareness rules** — how to reason about what you have vs. what you need.

## Proposed Rule: Sparse Knowledge Reasoning

**Rule:** For any knowledge claim, distinguish between direct evidence (vault has specific support), interpolated inference (vault has adjacent data), extrapolated projection (vault has partial range), and analogical transfer (vault has similar-domain knowledge). Present these with appropriate epistemic markers.

**Why:** Users need to know not just WHAT the vault knows, but HOW the vault knows it. A claim supported by 5 direct examples is different from a claim interpolated from 2 adjacent notes, which is different from a claim projected from a different domain. Without explicit markers, users cannot calibrate their trust appropriately.

**Test:** For any knowledge used in a decision: (1) Is this direct evidence, interpolation, extrapolation, or analogy? (2) Does the presentation distinguish the epistemic type? (3) Can a user determine how much confidence is warranted?

## Implementation

### Epistemic Type Frontmatter

```yaml
epistemic-type: direct|interpolated|extrapolated|analogical
evidence-basis:
  direct-examples: 5
  adjacent-notes: 2
  analogical-source: [[Other Domain Note]]
  confidence-source: "5 examples in same category"
interpolation-confidence: high  # confidence that intermediate values exist
transferability-assessment: high|medium|low
applicability-boundary: "Known valid range: X to Y"
```

### Reasoning Patterns

**Direct Evidence (epistemic-type: direct)**
- Multiple specific notes support the claim
- Present as standard knowledge with standard confidence
- Appropriate for: well-covered topics with 5+ supporting notes

**Interpolation (epistemic-type: interpolated)**
- Vault has knowledge at points A and C, user needs B
- Present with: "Based on available data at [A] and [C], the pattern suggests..."
- Mark applicability boundary: "Inferred between known data points; confirm for edge cases"
- Appropriate for: continuous domains, established patterns with gaps

**Extrapolation (epistemic-type: extrapolated)**
- Vault has knowledge in range [A, B], user needs [C] outside range
- Present with explicit warning: "Projecting beyond observed range; high uncertainty"
- Mark boundary: "Known valid range: [A, B]; extrapolated to [C]"
- Appropriate for: when internal logic supports extension but no direct evidence exists

**Analogical Transfer (epistemic-type: analogical)**
- Vault has knowledge in Domain X, user is in Domain Y (similar structure)
- Present with: "Domain X shows pattern; similar structure suggests Domain Y may follow"
- Mark transferability: explicit assessment of why analogy applies
- Appropriate for: cross-domain principle transfer, precedent-based reasoning

## Coverage Density Assessment

When a user asks about a topic, the vault should assess:

```
Coverage Density Assessment:
- Direct matches: N notes
- Related notes: N notes (within 1-2 hops)
- Adjacent domains: N notes (analogical sources)
- Unlinked gaps: N areas that should exist but don't

Recommended response:
- High coverage (5+ direct): "I have solid evidence for this"
- Medium coverage (2-4 direct): "I can interpolate, but recommend verification"
- Low coverage (1 direct): "This is extrapolated from limited data"
- No coverage: "No direct knowledge; analogical transfer possible from [X]"
```

## Distinguishing Similar Concepts

### Sparse Knowledge vs. Probabilistic Knowledge

- **Probabilistic**: Known distribution of outcomes (coin is 50/50; weather is 70% rain)
- **Sparse**: Limited data points, pattern uncertain (only seen 3 coin flips; only have 2 weather reports)
- A sparse knowledge claim might become probabilistic with more data, or might reveal the domain is inherently stochastic

### Sparse Knowledge vs. Incomplete Knowledge (Whisper/Draft/Probe)

- **Incomplete**: Note exists but isn't finished (whisper, draft, probe stages)
- **Sparse**: Notes exist but don't fully cover the topic
- A topic can have many "complete" notes (status: active) but sparse coverage overall

### Sparse Knowledge vs. Unknown Unknowns

- **Unknown unknowns**: Don't know what knowledge is missing
- **Sparse**: Know you have limited coverage; can articulate what you have
- Sparse knowledge reasoning helps identify when you're in unknown-unknowns territory

## Test Scenario

An AI building a knowledge base from scratch using only current Seed rules would:

1. ✓ Create well-organized, atomic notes
2. ✓ Link notes to form coherent structure
3. ✓ Track confidence and verification status
4. ✗ Not help users understand when they're interpolating vs. extrapolating
5. ✗ Not distinguish "I have partial coverage" from "I have no relevant knowledge"
6. ✗ Not assess analogical transferability before presenting cross-domain insights

The missing guidance: **How to reason about partial knowledge** — not just what the vault knows, but how to responsibly use partial knowledge for decisions.

## Edge Cases

**Interpolation in non-continuous domains**: Some topics don't interpolate smoothly (cuisine traditions, programming paradigms). Mark with `interpolation-valid: false` when domain has discrete jumps.

**Extrapolation warnings**: Some domains are anti-inductive (what worked for 10 cases fails at case 11). Tag with `anti-inductive: true` when known.

**Analogical transfer failure**: Analogies can mislead. Track `transfer-success-cases` vs `transfer-failure-cases` for each analogical source.

**Multi-hop interpolation**: "I have A and D, infer B and C" — chain interpolation requires more confidence than single-step.

## Integration Point

This rule connects to:

- [[Frontier Exploration - Probabilistic Knowledge]] — Probabilistic knowledge is about known distributions; sparse knowledge is about limited observations
- [[Frontier Exploration - Incomplete and Provisional Knowledge]] — Incomplete is about note status; sparse is about coverage density
- [[Seed Gap - Distributed Understanding Threshold]] — Related to how much coverage enables understanding
- [[Frontier Exploration - Cross-Domain Knowledge Synthesis]] — Analogical transfer is one form of cross-domain synthesis
- [[Confidence Markers]] — Extend confidence markers to include epistemic type

## Related Notes

- [[Frontier Exploration - Probabilistic Knowledge]]
- [[Frontier Exploration - Incomplete and Provisional Knowledge]]
- [[Frontier Exploration - Cross-Domain Knowledge Synthesis]]
- [[Confidence Markers]]
- [[Note Lifecycle Management]]
- [[Domain-Specific Knowledge Bases]]