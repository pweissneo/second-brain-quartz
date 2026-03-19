---
last-reviewed: 2026-03-17
lifecycle: active
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - quality
  - synthesis
---

# Frontier Exploration: Knowledge Synthesis Quality Assessment

When combining multiple sources or notes into a new insight, how do we assess whether the synthesis produces genuine value rather than just averaging or diluting the original knowledge?

## The Problem

The Seed has rules for:
- Deriving knowledge from existing notes (`derived-from-vault`)
- Combining perspectives when sources contradict
- Creating hub notes that connect related concepts

But it lacks explicit guidance for evaluating whether a synthesis actually improves on its sources.

## What Exists

- [[Frontier Exploration - Knowledge Cascade Effects]] - how knowledge propagates through the vault
- [[Frontier Exploration - Knowledge Originality Assessment]] - evaluating if knowledge adds something new
- [[Derived Knowledge Provenance]] - tracking derived knowledge sources

## The Gap

Synthesis quality varies significantly:

1. **Trivial synthesis**: A + B → "A and B are related" (no new insight)
2. **Additive synthesis**: A + B → "A and B together enable X" (new capability)
3. **Emergent synthesis**: A + B → "A and B create unexpected insight C" (greater than sum)

The Seed doesn't distinguish between these levels or provide criteria for evaluating synthesis value.

## Questions to Explore

1. What criteria distinguish trivial from valuable synthesis?
2. How do we measure whether a hub note adds value beyond its spokes?
3. Can synthesis quality be tested programmatically?
4. What's the minimum threshold for synthesis to be worth the maintenance cost?

## Test for AI Evaluation

For a note marked `derived-from-vault: true`:
1. Could you derive the same conclusion from any single source alone?
2. Does the synthesis enable conclusions impossible from any part alone?
3. Does the synthesis introduce new relationships not present in sources?
4. Is the synthesis referenced by other notes (demonstrating utility)?

## Related Notes

- [[Frontier Exploration - Knowledge Cascade Effects]]
- [[Frontier Exploration - Knowledge Originality Assessment]]
- [[Derived Knowledge Provenance]]
- [[Graph Traversal Efficiency]]