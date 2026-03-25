---
last-reviewed: 2026-03-24
last-updated: 2026-03-25
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
tags:
  - seed-gap
  - practice-structure
  - skill-development
  - domain-agnostic
schema-version: "1.0"
---

# Seed Gap - Practice Routine Structure for Skill-Building Domains

## The Gap

The Seed covers separating practice meta-knowledge from skill knowledge, but lacks guidance for **structuring practice routines themselves** — how to organize a deliberate practice session for skill-building domains.

In domains like music performance, sports, coding, woodworking, and cooking, practice isn't just "do the skill" — it requires structure: warm-up, main work, cool-down, progression, feedback. The Seed has no rule for capturing this structural knowledge.

## Why This Matters

- Practice routine structure is reusable across many specific skills
- Without structure guidance, practice notes become disorganized
- Poor practice structure reduces skill development efficiency
- This knowledge differs from both skill content AND practice meta-management

## Gap Type

**Structural Knowledge Gap** — The Seed has rules for note structure, knowledge types, and practice separation, but lacks rules for practice session structure itself.

## What the Seed Currently Covers

1. **Separate practice meta-knowledge from skill knowledge** — practice goals, schedules, progress tracking
2. **Diminishing returns** — when to stop adding notes to a topic
3. **Atomicity** — one idea per note
4. **Lifecycle** — stages from draft to evergreen

## What's Missing

### 1. Practice Session Structure Template

When documenting a practice routine, what structural elements should be captured?

Missing guidance for:
- Warm-up activities (general vs. skill-specific)
- Main practice blocks (scope, duration, progression)
- Cool-down activities
- Session goals vs. actual outcomes
- Feedback and adjustment mechanisms

### 2. Skill Progression Tracking

How should practice notes track skill development over time?

Missing:
- Progression milestones (specific to skill type)
- Regression detection (skills lost due to lack of practice)
- Plateau identification
- Transfer learning (skills that transfer between domains)

### 3. Practice Type Classification

Practice isn't monolithic — different types need different structure:

- **Deliberate practice** — focused improvement on specific weaknesses
- **Maintenance practice** — keeping skills sharp
- **Exploratory practice** — trying new approaches
- **Performance practice** — practicing for specific events

### 4. Domain-Specific Practice Patterns

Different skill domains have different practice structures:

| Domain | Unique Practice Structure |
|--------|---------------------------|
| Music | Warm-up (scales), technique drills, repertoire work, sight-reading |
| Sports | Warm-up, drills, scrimmage, cool-down |
| Coding | Warm-up (syntax), algorithm practice, project work, review |
| Cooking | Mise en place, technique practice, plate composition |
| Woodworking | Safety check, tool preparation, technique practice, project work |

## Proposed Seed Rules

### Rule: Structure practice routine notes with explicit phases

**Why:** Practice sessions have natural phases (warm-up, main, cool-down). Without explicit structure, practice notes become disorganized and hard to follow.

**Test:** Can you identify: (1) warm-up activities, (2) main practice blocks, (3) cool-down activities in your practice notes? Is the structure consistent across sessions?

**Implementation:**
```yaml
practice-structure:
  warmup: [list of warm-up activities]
  main: [practice blocks with goals and duration]
  cooldown: [list of cool-down activities]
  total-duration: minutes
```

### Rule: Track skill progression separately from practice sessions

**Why:** Practice sessions document what you did; progression notes document what you're improving. Separating these keeps both actionable.

**Test:** Can you find a progression tracking note for each skill you're developing? Does it show: (1) current level, (2) target level, (3) progress over time?

### Rule: Classify practice by type and apply appropriate structure

**Why:** Deliberate practice (improving specific weaknesses) needs different structure than maintenance practice (keeping skills sharp).

**Test:** Can you categorize your practice sessions by type? Does each type have appropriate structure?

**Implementation:**
```yaml
practice-type: deliberate|maintenance|exploratory|performance
focus-area: specific weakness or skill being worked on
difficulty-target: challenge level (easy|medium|hard)
```

### Rule: Document practice routines at the session-template level, not session-log level

**Why:** Capturing every practice session as a note creates bloat. Capture the template/routine once, then reference it.

**Test:** Do practice notes describe "how to structure this type of practice" rather than "what I did in this session"? Can you execute a new practice session using only your routine notes?

## Update (2026-03-25)

This gap has been **partially addressed** by the Seed:

1. **Practice meta-knowledge rule (2026-03-24)** — Rule added: "Separate practice meta-knowledge from skill domain knowledge using dedicated practice notes." This covers the separation of practice management from skill content.

2. **Verification modality rule (2026-03-19)** — Added `verification-modality: practice-required` field for distinguishing verification that requires active execution.

3. **Practice status tracking (2026-03-19)** — Added `practice-status:` field (not-attempted | in-progress | successful | failed) to track execution separately from knowledge validity.

The remaining gap: The Seed doesn't have rules for **practice session structure itself** — the warm-up/main/cool-down phases, skill progression tracking, and practice type classification are still not addressed as explicit Seed rules.

## Test for Gap Closure

Can you:
1. Find a structured practice routine template for each skill domain?
2. Track progression milestones for each skill being developed?
3. Classify practice by type and apply appropriate structure?
4. Execute a practice session using only routine notes (no session logs needed)?

If yes to all 4, the gap is closed.

## Related Seed Rules

- [[Seed Rule - Daily Practice Knowledge]] — separates practice from skill
- [[Seed Stress Test - Music Performance Knowledge Base]] — identifies this gap
- [[Seed Stress Test - Practice Meta-Knowledge in Cooking]] — similar edge cases
- [[AI-Assisted Knowledge Management Seed]]

## Edge Cases

### Already covered by existing rules
- **Practice vs. skill separation** — covered by daily practice rule
- **Verification of skill improvement** — covered by verification rules
- **Goal setting** — covered by knowledge prioritization rules

### Distinct from this gap
- **What to practice** — skill content, not practice structure
- **Why to practice** — motivation, covered elsewhere
- **When to practice** — scheduling, covered by time management rules

### Additional Edge Cases from Related Exploration
- **Short vs. Long Practices** — Micro-practices (5-15 min): Habits, quick reviews; Standard practices (30-60 min): Most skill development; Deep practices (2+ hr): Advanced work, rare
- **Practice While Traveling** — Minimal practice abroad; Substitution exercises; Mental practice (visualization)
- **Practice and Injury/Illness** — Modified practice during recovery; Mental-only practice alternatives; Return-to-practice protocols

---

**See also:**
- [[Seed Stress Test - Music Performance Knowledge Base]]
- [[Seed Stress Test - Practice Meta-Knowledge in Cooking]]