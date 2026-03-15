---
last-reviewed: 2026-03-14
confidence: emerging
author-type: ai-assisted
lifecycle: draft
tags:
  - frontier-gap
  - skill-tracking
  - proficiency
  - experiential-knowledge
---

# Frontier Gap: Skill Proficiency Tracking in Knowledge Bases

> Knowledge of "how to do X" differs fundamentally from the ability to actually do X. A knowledge base can contain perfect instructions for a piano piece, yet the owner cannot play it. This gap explores how to capture and track physical, embodied, or practiced skills separately from declarative knowledge.

## The Problem

Traditional knowledge management assumes knowledge = ability. If you have a note about "how to do a pull-up," knowing the note means you can do a pull-up. But this fails for:

- **Physical skills**: Playing piano, cooking, martial arts, surgery
- **Embodied knowledge**: Riding a bike, swimming, driving
- **Practiced skills**: Foreign language speaking, coding interviews, improv
- **Decaying knowledge**: Things you once knew but have forgotten

The same note about "how to do X" could represent:
1. Theory you read about (can explain but not do)
2. Something you used to do but can't anymore (atrophied)
3. Something you can do competently (current skill)
4. Something you're learning (in progress)
5. Something you want to learn (goal)

The Seed's `experiential-component` marks what *requires* practice, but doesn't track your *current* proficiency.

## Current Seed Coverage

The Seed includes:
- `experiential-component` frontmatter: marks knowledge that requires direct experience to apply
- `prerequisites`: lists background notes needed
- `difficulty`: labels complexity level
- `status`: lifecycle stage (draft, active, evergreen, deprecated)

What's missing: **current user proficiency level** at the skill being documented.

## Proposed Solution

Add `proficiency-level` frontmatter to skill-based notes:

```yaml
proficiency-level: novice|learning|competent|proficient|master
last-practiced: 2026-03-01
practice-interval: weekly  # optimal practice frequency to maintain
decay-rate: physical  # physical skills decay faster than mental
```

### Proficiency Levels

- **novalearning**: Have read about it, understand theory, cannot perform
- **learning**: Can perform with significant effort, inconsistent results
- **competent**: Can perform reliably, needs concentration
- **proficient**: Can perform fluently, can teach others
- **master**: Can perform effortlessly,创新能力, adapts spontaneously

### Why This Matters

1. **Retrieval filtering**: When I want to "cook dinner," I need recipes I can actually execute, not just ones I have notes about
2. **Practice prioritization**: Shows what skills are at risk of decay
3. **Goal tracking**: Shows what you want to learn vs. what you can do
4. **Honest self-assessment**: Distinguishes "knowing about" from "being able to do"

### Relationship to Existing Metadata

- `proficiency-level` is about *your current ability*, orthogonal to:
  - `difficulty`: how hard the skill is objectively
  - `experiential-component`: whether the skill requires practice (yes/no)
  - `status`: whether the note itself is complete

## Edge Cases

**Theoretical domains**: Mathematics, philosophy, physics - these don't decay physically. Use `decay-rate: mental` or omit.

**Knowledge vs. skill**: Some things are pure knowledge (history facts) with no skill component. Don't add proficiency to these.

**Social skills**: Interpersonal skills decay differently - they require other people. Use `decay-rate: social` and note interaction requirements.

**Atrophied skills**: If you used to be competent but stopped practicing, mark with `proficiency-level: atrophied` and `last-performed: YYYY-MM-DD`.

## Test

Can you distinguish between:
1. A recipe you can cook (competent+) vs. one you just bookmarked (novalearning)
2. A language you can speak vs. one you can read but not speak
3. A musical piece you can perform vs. one you just have sheet music for

If yes, you need proficiency tracking. If all your skill-notes are equally "known," you're not capturing the distinction.

## Related Seed Rules

- [[AI-Assisted Knowledge Management Seed]] - Foundation rules
- [[Stress Test - Experiential Knowledge Rule (Cross-Domain Analysis)]] - Tests experiential knowledge handling
- [[Frontier Exploration - Context-Specific Learning Insights]] - Context-dependent knowledge

---

This note identifies a genuine gap: the Seed tracks what knowledge exists, but not whether you can actually *do* the thing the knowledge describes. Physical, embodied, and practiced skills require different handling than static knowledge.
