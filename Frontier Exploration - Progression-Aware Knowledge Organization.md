---
last-updated: 2026-04-05
confidence: emerging
lifecycle: seedling
author-type: ai-assisted
tags:
  - frontier-exploration
  - language-learning
  - progression-aware
---

# Frontier Exploration - Progression-Aware Knowledge Organization

## The Gap

The Seed handles expertise levels through the expertise-level rule and domain-specific variations, but lacks guidance for knowledge bases where the *learner* moves through distinct competency states over time. Language learning is the canonical example: a learner progresses from novice → intermediate → advanced → fluent, and the same knowledge must adapt to each stage.

## Why This Matters Beyond Language Learning

Progression-aware knowledge matters for any domain where:
1. Knowledge utility changes based on learner competency level
2. Same concept needs different explanations at different stages
3. Verification methods differ across progression states
4. Prior knowledge requirements shift as competency grows

**Examples beyond language learning:**
- **Music education**: Theory for beginners vs. advanced musicians
- **Mathematics**: Arithmetic → algebra → calculus → advanced
- **Programming**: Syntax → algorithms → system design
- **Fitness**: Beginner routines → intermediate → competitive
- **Cooking**: Basic techniques → advanced cuisine → professional

## What the Seed Lacks

The Seed has:
- `target-user-expertise` field for static expertise assumptions
- Construction phase rules that tighten as vault matures

The Seed lacks:
- **Progression state tagging** — knowledge tagged with which stage it serves
- **State-adaptive content** — notes that explain same concept differently per level
- **Progression-aware verification** — different verification methods for different stages
- **Milestone-based organization** — organizing knowledge by learner achievements

## Current Workaround Limitations

The existing `expertise-level` frontmatter assumes a static target user with fixed expertise. It cannot express:
- "This note serves learners at novice AND intermediate levels"
- "This grammar concept needs different explanations for beginners vs. advanced"
- "This vocabulary is active (production) not just passive (recognition)"

## Proposed Solution

Add **progression-aware knowledge organization** rules:

```yaml
progression-aware: true
progression-states:
  - novice
  - intermediate
  - advanced
  - fluent
primary-state: intermediate
state-adaptive: true  # same knowledge, different explanation per state
```

For each progression state, create state-specific sections in notes:
```markdown
## Beginner Context
[Explanation appropriate for beginners]

## Intermediate Context
[Same concept, deeper explanation for intermediate learners]

## Advanced Context
[Full treatment for advanced learners]
```

## Verification Adaptation

Progression-aware verification distinguishes:
- **Recognition-level**: Can identify/understand (passive)
- **Production-level**: Can use independently (active)
- **Teaching-level**: Can explain to others

Each level requires different verification:
- Recognition: Multiple-choice, matching
- Production: Free recall, application tasks
- Teaching: Explain to novice, correct errors

## Gap Test

Can an AI agent build a knowledge base for a progressive learner using current Seed rules?
- Language learning: **No** — needs progression-aware organization
- Music education: **Partial** — existing rules handle some
- Mathematics: **Partial** — prerequisite chains covered but not state-adaptive content
- Programming: **Yes** — version-scoped knowledge covers temporal changes

## Related Notes

- [[Seed Gap - Language Learning Knowledge Base Organization]]
- [[Frontier Exploration - Language Learning Knowledge Base Gaps]]
- [[Seed Gap - Learning Progression Organization]]

---

*This note was created during HEARTBEAT.md-driven vault maintenance. The Seed gap it identifies is a candidate for integration into the Seed.*