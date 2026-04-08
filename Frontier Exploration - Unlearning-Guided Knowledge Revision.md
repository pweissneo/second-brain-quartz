---
last-reviewed: 2026-04-07
lifecycle: exploration
confidence: medium
author-type: ai-assisted
knowledge-type: meta
access-pattern: decision
tags:
  - frontier-exploration
  - unlearning
  - knowledge-revision
  - correction
schema-version: "1.0"
related-seed-gap: "[[Seed Gap - Unlearning-Guided Knowledge Revision]]"
---

# Frontier Exploration: Unlearning-Guided Knowledge Revision

> When your entire mental model was wrong — not just a fact, but the framework.

## The Unlearning Problem

You believed X was true. You captured it. Months later, you realize your entire understanding was flawed — not because a source was wrong, but because you misunderstood the domain at a foundational level.

This is different from:
- **Source contradiction** — Two external sources disagree
- **Verification failure** — A claim fails its test  
- **Temporal obsoletion** — Was true then, false now

The unlearning case is: **I held a wrong mental model, and it needs to be replaced entirely.**

## Why This Matters

Without unlearning guidance, AI agents will:
1. Simply replace the incorrect note with correct info
2. Lose the "why I believed this" context
3. Miss the meta-knowledge about domain learning curves

The wrong belief itself may be valuable — it explains why others hold that belief, reveals common misconceptions, and documents the correction pathway.

## The Three Revision Types

| Type | Description | Example |
|------|-------------|---------|
| Fact update | Single fact was wrong | "Paris is the capital" → "Nice is correct" |
| Belief revision | Understanding partially wrong | "Climate varies latitudinally" → "also affected by elevation" |
| Model unlearning | Entire mental model wrong | "Photography is about camera settings" → "Photography is about light" |

## Implementation Framework

```yaml
revision-type: fact-update|belief-revision|model-unlearning

unlearning-pathway:
  belief-origin: "what made this compelling"
  correction-trigger: "what revealed the error"
  replacement-understanding: "[[Link to new understanding]]"
  related-corrections: ["notes corrected by this unlearning"]
  
unlearning-event: true
```

## Example: Model-Unlearning in Photography

**Wrong belief captured (2025-06):** "A good photo is about getting the technical settings right."

**Why it was compelling:** Camera reviews focus on specs, tutorials start with settings, the gear industry reinforces this.

**Correction trigger (2026-03):** Realized the best photos from a workshop had "wrong" settings but great light — the settings followed the vision, not the other way around.

**Replacement understanding:** "Photography is the craft of shaping light. Settings are a translation mechanism, not the creative act."

**Cascading corrections:**
- Note about "essential camera settings" → replaced with "essential light skills"
- Note about "best apertures" → reframed as "aperture as a compositional tool"
- Tutorial structure → reordered to lead with light, not settings

## Test Criteria

- [ ] Can you classify a revision as fact-update/belief-revision/model-unlearning?
- [ ] Does the corrected note include why the original was believed?
- [ ] Is there documentation of what triggered the unlearning?
- [ ] Can you find all notes affected by cascading unlearning?
- [ ] Does future retrieval of the old belief route to the correction?

## Related

- [[Seed Gap - Unlearning-Guided Knowledge Revision]] — Original gap documentation
- [[Handling Contradictory Sources]] — Source-vs-source conflicts
- [[Correction Metadata in Seed]] — Current correction system
- [[Frontier Exploration - Knowledge Maintenance]] — Ongoing knowledge quality