---
last-reviewed: 2026-03-29
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - quality
  - synthesis
related-seed-rules: diminishing-returns-testing, provenance-chain
---

# Frontier Exploration: Knowledge Synthesis Quality Assessment

> When combining multiple sources or notes into a new insight, how do we assess whether the synthesis produces genuine value rather than just averaging or diluting the original knowledge?

## The Problem

The Seed has rules for:
- Deriving knowledge from existing notes (`derived-from-vault`)
- Combining perspectives when sources contradict
- Creating hub notes that connect related concepts

But it lacks explicit guidance for evaluating whether a synthesis actually improves on its sources.

## What Exists

- [[Frontier Exploration - Knowledge Cascade Effects]] - how knowledge propagates through the vault
- [[Frontier Exploration - Knowledge Originality Assessment]] - evaluating if knowledge adds something new
- [[Frontier Exploration - Knowledge Provenance Chains]] - tracking derived knowledge sources
- [[Best Practice - Link Quality]] - quality criteria for individual links (apply the "why follow?" test)

## The Gap

Synthesis quality varies significantly:

1. **Trivial synthesis**: A + B → "A and B are related" (no new insight)
2. **Additive synthesis**: A + B → "A and B together enable X" (new capability)
3. **Emergent synthesis**: A + B → "A and B create unexpected insight C" (greater than sum)

The Seed doesn't distinguish between these levels or provide criteria for evaluating synthesis value.

## Synthesis Quality Levels

### Trivial (Skip)
- A + B → "A and B are related"
- A + B → "Both discuss X"
- A + B → Summary of both with no integration

### Additive (Add if useful)
- A + B → "A and B together enable X that neither enables alone"
- A + B → "Combining A's context with B's method creates actionable guidance"
- A + B → "A qualifies B's claim in a meaningful way"

### Emergent (Strong add)
- A + B → "This reveals a pattern neither A nor B explicitly states"
- A + B → "This creates a transferable principle from domain-specific examples"
- A + B → "This explains something previously unexplained in the vault"

## Test for AI Evaluation

For a note marked `derived-from-vault: true`:
1. Could you derive the same conclusion from any single source alone? → If yes, trivial
2. Does the synthesis enable conclusions impossible from any part alone? → If yes, additive or better
3. Does the synthesis introduce new relationships not present in sources? → If yes, additive or better
4. Is the synthesis referenced by other notes (demonstrating utility)? → Confirms value

Apply the **"Why follow?" test** (same as [[Best Practice - Link Quality]]): Can you write one sentence explaining why a reader should follow from source A to source B through this synthesis? If not, remove the synthesis.

**Rule:** Before creating a synthesis note, verify it passes at least the additive threshold. Trivial synthesis notes should be skipped — links between sources suffice without an intermediate note.

**Test:** For your last 5 synthesis notes: Can you categorize each as trivial/additive/emergent? If >60% are trivial, you're creating unnecessary noise.

## Gap-to-Seed Candidate

> **Rule:** A synthesis note must enable at least one conclusion that no single source enables alone. If the synthesis is explainable by any single source, skip the intermediate note and link directly.
> **Why:** Trivial synthesis notes create navigational noise without adding value. The graph should connect sources directly when no new insight emerges.
> **Test:** For a synthesis note: (1) Can any single source produce the same conclusion? (2) Does linking sources directly achieve the same purpose? If yes to either, delete the synthesis note.