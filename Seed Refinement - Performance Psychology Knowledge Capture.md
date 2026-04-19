---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-04-04
last-updated: 2026-04-04
lifecycle: seed-refinement
confidence: emerging
tags:
  - seed-gap
  - seed-refinement
  - performance-psychology
  - skill-development
  - mental-preparation
gap-status: addressed
gap-closure-date: 2026-04-04
---

# Seed Refinement - Performance Psychology Knowledge Capture

Stress test of Seed rules against Music Performance Knowledge Base (2026-03-24) identified gaps in capturing mental preparation, stage fright management, and performance psychology knowledge. This note consolidates the gap identification and proposed solution.

## Status: ADDRESSED (2026-04-04)

This gap has been addressed through the refinement below. The original gap identification and proposed rules have been merged.

## The Gap

The Seed covers practice type classification and session structure, but lacks guidance for **capturing performance psychology knowledge** — the mental and emotional aspects of skill execution under pressure.

This applies to:
- Music performance (stage fright, mental preparation, pre-performance routines)
- Sports (game-day mindset, competition anxiety, pressure handling)
- Public speaking (presentation anxiety, audience connection)
- Any skill performed under scrutiny or time pressure

## What the Seed Currently Covers

1. **Practice type classification** — deliberate, maintenance, exploratory, performance practice
2. **Session structure** — warm-up, main, cool-down phases
3. **Skill progression tracking** — milestones, regression risk, plateau detection
4. **Embodied knowledge** — tactile, kinesthetic, sensory knowledge

## What's Missing

### 1. Pre-Performance Routine Capture

How to document mental preparation before high-pressure executions?

Missing guidance for:
- Mental warm-up activities
- Pre-performance rituals and superstitions
- Anxiety management techniques
- Focus-setting procedures
- Confidence-building practices

### 2. Pressure Response Knowledge

How to capture knowledge about performing under pressure?

Missing:
- What works vs doesn't under pressure
- How technique differs under stress vs practice
- Recovery from mistakes during performance
- Managing adrenaline response

### 3. Performance Reflection Structure

How to capture the mental aspects of performance feedback?

Missing:
- Mental state documentation (anxious, focused, confident)
- What mental factors contributed to success/failure
- Audience/judge response interpretation

### 4. Long-term Psychology Development

How to track psychological growth in skill domains?

Missing:
- Mental stamina development
- Competition experience accumulation
- Pressure tolerance progression

## Why This Matters

- Performance psychology knowledge is HIGH VALUE — it distinguishes good performers from great ones
- Mental skills often matter MORE than technical skills in live performance
- This knowledge is HIGHLY PERSONAL — what works for one person may not work for another
- Without explicit guidance, performance psychology knowledge goes uncaptured or gets mixed with technique notes

## Proposed Seed Rules

### Rule: Capture performance psychology knowledge separately from technique knowledge

**Why:** Mental preparation and technique are fundamentally different types of knowledge. Mixing them makes both harder to find and apply.

**Test:** Can you find performance psychology notes without navigating through technique notes? Are mental preparation strategies in dedicated notes?

**Implementation:**
```yaml
knowledge-type: performance-psychology
performance-context: live-performance|competition|presentation|audition
mental-skill-type: anxiety-management|focus|confidence|recovery|visualization
privacy-level: personal|shareable
```

### Rule: Capture pre-performance mental preparation as explicit routine notes

**Why:** Mental preparation is distinct from physical warm-up. Without explicit capture, pressure-handling knowledge stays tacit and is lost between performers.

**Test:** For skills performed under pressure: (1) Do you have notes documenting your mental warm-up? (2) Can you identify what mental state you aim for before performing? (3) Is there a documented pre-performance routine?

**Implementation:**
```yaml
performance-psychology:
  pre-routine:
    - "visualization: 5min"
    - "breathing exercises"
    - "focus affirmation"
  target-mental-state: "confident|calm|energized"
  anxiety-management: ["technique-1", "technique-2"]
```

### Rule: Validate performance psychology knowledge through actual performance, not just practice

**Why:** Mental techniques that work in practice may fail under actual performance pressure. Verification requires real conditions.

**Test:** Have you tested this mental technique in actual performance conditions (not just practice)? Does the note document the performance context where it was verified?

**Implementation:**
```yaml
verification-mode: performance-verified
performance-verified: true|false
performance-context: competition|recital|audition|presentation
test-results: "What happened when used in real performance"
```

### Rule: Document pressure response separately from skill execution notes

**Why:** What works in practice often fails under pressure. Capturing this distinction separately helps identify where technique needs to be more robust.

**Test:** Can you identify: (1) Techniques that work in practice but fail under pressure? (2) What mental factors affect performance quality? (3) Recovery strategies for mid-performance mistakes?

### Rule: Use performance reflection notes that include mental state documentation

**Why:** Performance feedback without mental state context misses half the learning.

**Test:** Do your performance reflections include: (1) Mental state before/during/after? (2) What mental factors contributed to outcome? (3) How did you handle pressure?

**Implementation:**
```yaml
performance-reflection:
  mental-state-pre: "anxious"
  mental-state-during: "focused after first mistake"
  mental-state-post: "satisfied regardless of outcome"
  pressure-handling: "effective|mixed|ineffective"
  adjustment-for-next: ["more visualization", "shorter pre-routine"]
```

### Rule: Include situational context for performance psychology knowledge

**Why:** Mental techniques are highly context-dependent. What works for a recital may not work for a competition.

**Test:** Does the note specify: (1) type of performance context, (2) audience size/type, (3) stakes (casual vs. high-stakes), (4) preparation time available?

**Implementation:**
```yaml
performance-context-type: casual|formal|competitive|audition
audience-size: small|medium|large
stakes-level: low|medium|high
```

### Rule: Document failed performance psychology techniques

**Why:** What doesn't work is equally valuable — mental techniques that fail waste time and can make performance anxiety worse.

**Test:** Do you have notes about mental techniques that didn't work for you? Do they document what happened and why it failed?

**Implementation:**
```yaml
technique-outcome: successful|failed|partial
failure-context: "What happened when you tried this"
failure-analysis: "Why it didn't work for you"
```

## Domain-Specific Manifestations

| Domain | Performance Psychology Knowledge |
|--------|-----------------------------------|
| Music | Stage fright, pre-performance routine, recovery from mistakes, audience connection |
| Public Speaking | Anxiety management, building confidence, handling Q&A |
| Sports | Pre-game routine, handling pressure, composure after errors |
| Acting | Character embodiment, stage presence, handling nerves |
| Dance | Performance flow, stage presence, handling costume/equipment |

## Test for Gap Closure

Can you:
1. Find dedicated performance psychology notes separate from technique notes?
2. Document which mental techniques have been tested in actual performances?
3. Distinguish between techniques that work in practice vs. actual performance?
4. Capture failed mental techniques with analysis of why they failed?
5. Document a pre-performance mental routine separate from physical warm-up?
6. Capture mental state in performance reflections?

If yes to all 6, the gap is fully addressed.

## Related Seed Rules

- [[Seed Rule - Classify practice by type and apply appropriate session structure]]
- [[Seed Rule - Track skill progression using explicit milestone and state tracking]]
- [[Seed Stress Test - Music Performance Knowledge Base]]
- [[Frontier Exploration - Emotional and Sentimental Knowledge]]

## Edge Cases

### Already covered by existing rules
- **Embodied knowledge** — covered for physical feel, not mental states
- **Practice types** — covers deliberate, maintenance, exploratory, performance
- **Physical warm-up** — separate from mental preparation
- **Practice scheduling** — when to practice, not how to prepare mentally
- **Motivation** — general drive, not performance-specific anxiety
- **Confidence from skill competence** — different from pressure handling
- **Audience relationship** — specific to performing arts

### Distinct from this gap
- **Technique knowledge** — physical execution, not mental state

---

**Original gap identified by:** Seed Stress Test on Music Performance (2026-04-02)
**Gap addressed:** 2026-04-04 (this merge)