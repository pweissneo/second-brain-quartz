---
last-reviewed: 2026-03-15
lifecycle: active
confidence: emerging
author-type: ai-assisted
tags:
  - seed-improvement
  - knowledge-processing
  - synthesis
---

# Seed Improvement - Derived Knowledge Provenance

> Adding provenance tracking for knowledge synthesized from other vault notes

## Problem

The Seed tracks external source provenance (citations, access requirements) but doesn't address knowledge derived from internal vault synthesis. When an AI agent:
- Combines insights from multiple existing notes to create a new synthesis
- Derives a principle from examining patterns across several notes
- Creates a hub note that represents emergent understanding from connected notes

...there's no way to track this derivation relationship. This creates two problems:

1. **Attribution gap**: Can't tell which notes contributed to a synthesized insight
2. **Verification gap**: Can't verify the synthesis is supported by its source notes
3. **Maintenance gap**: When source notes change, synthesized notes may need review

## Why This Matters

1. **Quality assurance**: Derived knowledge should be verifiable against its sources
2. **Trust calibration**: Readers (and AIs) should know knowledge is synthesized vs. observed
3. **Maintenance**: Source changes should trigger review of derived knowledge
4. **Learning capture**: The derivation process itself is valuable knowledge about HOW insights emerge

## Proposed Seed Addition

### Derived Knowledge Metadata

Add fields for notes that synthesize vault knowledge:

```yaml
derived-from-vault: true
synthesis-type: pattern-discovery|principle-extraction|hub-creation|inference
sources:
  - [[Note A]]
  - [[Note B]]
synthesis-method: How this was derived (induction, analogy, deduction)
derived-date: YYYY-MM-DD
```

### Rules

**Rule:** Synthesized notes must cite their source notes in frontmatter.
- Why: Enables verification and maintenance; readers can trace reasoning
- Test: For notes with `derived-from-vault: true`, can you trace to ≥2 source notes?

**Rule:** Major synthesized insights (principles, extracted patterns) should have an explanation of HOW the derivation was done.
- Why: The derivation method is meta-knowledge about knowledge creation
- Test: Does the note explain whether this was induction, analogy, deduction, or pattern matching?

**Rule:** Hub notes that represent emergent clusters should document what unifies the cluster.
- Why: Helps distinguish genuine emergence from coincidental co-occurrence
- Test: For hub notes, can you state what makes these notes belong together in one sentence?

### Differentiation

This is different from:
- **Source provenance** (external sources) - covered by `knowledge-source` field
- **Citation links** (references to external works) - already covered
- **Link relationships** (connections between notes) - already covered

Derived knowledge provenance tracks the specific notes AND the method that led to a NEW insight that didn't exist before.

## Implementation

1. Add `derived-from-vault` field to Seed
2. Add `synthesis-type` enumeration: pattern-discovery, principle-extraction, hub-creation, inference
3. Add `synthesis-method` field for derivation explanation
4. Update quality rules to verify derived notes have source attribution
5. Add maintenance trigger: source note changes should flag derived notes for review

## Test Criteria

- [ ] Can you identify notes that are synthesized from other vault notes?
- [ ] Does each derived note cite its source notes?
- [ ] Is the synthesis method documented?
- [ ] Can you verify the derived insight is supported by its sources?
- [ ] When source notes change, can you identify derived notes that need review?

## Related

- [[Note Lifecycle Management]]
- [[Knowledge Graph Structure]]
- [[Graph Traversal Efficiency]]
- [[Self-Improvement Cycle]]
- [[Frontier Exploration - Knowledge Activation States]]