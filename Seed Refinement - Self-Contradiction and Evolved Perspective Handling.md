---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-04-06
last-updated: 2026-04-06
lifecycle: seed-gap-resolved
confidence: emerging
tags:
  - knowledge-evolution
  - self-contradiction
  - seed-gap
  - temporal-knowledge
  - resolved
---

# Seed Refinement - Self-Contradiction and Evolved Perspective Handling

> Capturing how your own knowledge has evolved over time.

## The Gap

The Seed covers:
- [[Handling Contradictory Sources]] — External conflicts between sources
- [[Handling Temporal Knowledge]] — Field-level changes, superseded knowledge
- [[Frontier Exploration - Personal Experimentation Results]] — What didn't work

But missing: **Self-contradiction tracking** — documenting your own view changes over time.

## Distinction from Existing Seed Coverage

The Seed covers different types of contradictory knowledge:

| Scenario | Covered? | Rule/Note |
|----------|----------|-----------|
| Source A vs Source B disagree | ✅ | [[Handling Contradictory Sources]] |
| Field evolved, old knowledge superseded | ✅ | [[Handling Temporal Knowledge]] |
| Your view changed from X to Y | ❌ | MISSING (now addressed) |
| Experiment showed your hypothesis wrong | Partially | [[Frontier Exploration - Personal Experimentation Results]] |

## Why It Matters

1. **Personal knowledge compounds** — If you don't track your own evolution, you lose the learning
2. **Context preservation** — Knowing *why* you changed helps future decisions
3. **Prevents repeated mistakes** — Documenting what you used to believe helps avoid backsliding
4. **Reasoning transparency** — Shows the evolution of your understanding

## Proposed Seed Rule Addition

**Rule:** Track personal knowledge evolution on notes that represent your evolving understanding — include `evolution-history` frontmatter when your view on a topic has changed significantly.

**Why:** Without evolution tracking, vault notes present your current view as if it were always true. This creates false confidence in transient opinions and loses the learning from perspective changes. Documenting evolution preserves the reasoning path.

**Test:** Pick 5 notes about your recommendations or opinions. (1) Can you trace how your view has evolved? (2) Is there `evolution-history` frontmatter on notes where your view changed? (3) Does the note explain *why* you changed?

**Implementation:**
```yaml
evolution-history:
  - date: 2024-06
    view: "Approach X is best"
    reason: "Initial testing showed good results"
  - date: 2025-03
    view: "Approach Y is better"
    reason: "Longer testing revealed X has hidden costs"
    what-changed: "Discovered maintenance overhead"

# Current view (always present if evolution exists)
current-view: "Approach Y is better"
last-evolution: 2025-03
```

**Rule:** Distinguish self-contradiction from external contradiction and superseded knowledge.

**Why:** Three different scenarios require different handling:
- **External contradiction:** Source A says X, Source B says Y — resolved through evidence weighting
- **Superseded knowledge:** Field evolved, old understanding was X, new understanding is Y — update note, mark old as historical
- **Self-contradiction:** You previously believed X, now believe Y — preserve both with evolution history

**Test:** Can you categorize contradictory knowledge as external (source vs source), field (superseded by field progress), or personal (your view changed)?

**Implementation:**
```yaml
contradiction-type: external|field|personal

# For personal contradiction:
personal-evolution:
  previous-view: "..."
  current-view: "..."
  evolution-date: 2025-03
  evolution-reason: "What caused the change"
  lessons-learned: "What you learned from the change"
```

## When to Apply

Apply evolution tracking to notes containing:
- Recommendations (that changed)
- Opinions (that evolved)
- Approaches (that were replaced)
- Beliefs (that shifted)

Don't apply to:
- Factual claims (facts don't evolve, they get corrected)
- Evergreen principles (stable knowledge)
- Procedural knowledge (methods change, not the procedure itself)

## Stress Test

**Test (Cooking Domain):**
You built a cooking knowledge base using current Seed rules. You note "roast chicken at 425°F for 45 minutes" in 2024. In 2025, you discover 375°F for 75 minutes produces better results.

Current Seed handling:
- Old note marked deprecated (correct)
- New note created with updated info (correct)
- But no record of WHY you changed (gap)

Evolution tracking would add:
- Old note has evolution history showing the change
- Current note links to predecessor
- Reason for change documented

## Related Notes

- [[Frontier Exploration - Self-Contradiction and Evolved Perspective]]
- [[Handling Contradictory Sources]]
- [[Handling Temporal Knowledge]]
- [[Frontier Exploration - Personal Experimentation Results]]
