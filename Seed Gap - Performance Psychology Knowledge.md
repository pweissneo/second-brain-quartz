---
last-reviewed: 2026-04-02
last-updated: 2026-04-02
lifecycle: active
confidence: emerging
author-type: ai-assisted
tags:
  - seed-gap
  - performance-psychology
  - music
  - mental-preparation
schema-version: "1.0"
---

# Seed Gap - Performance Psychology Knowledge in Skill-Based Domains

## Status: OPEN (2026-04-02)

Identified through Seed Stress Test on Music Performance Knowledge Base.

## The Gap

The Seed covers practice structure, skill progression, and embodied knowledge in physical skill domains, but lacks guidance for capturing **performance psychology** — the mental and emotional aspects of performing skills in front of others or under pressure.

In domains like music performance, public speaking, sports, acting, and any skill performed live, significant knowledge exists about:
- Mental preparation techniques
- Stage fright / performance anxiety management
- Focus and concentration under pressure
- Pre-performance routines
- Recovery from mistakes during performance
- Visualization and mental rehearsal
- Confidence building
- Handling audience expectations

The Seed has no rules for capturing this type of knowledge.

## Why This Matters

- Performance psychology knowledge is HIGH VALUE — it distinguishes good performers from great ones
- Mental skills often matter MORE than technical skills in live performance
- This knowledge is HIGHLY PERSONAL — what works for one person may not work for another
- Without explicit guidance, performance psychology knowledge goes uncaptured or gets mixed with technique notes

## Gap Type

**Domain-Specific Knowledge Gap** — The Seed needs guidance for a specific knowledge type (mental/emotional) that's critical in performance-oriented domains but absent from general rules.

## What the Seed Currently Covers

1. **Practice meta-knowledge** — separating practice management from skill content
2. **Skill progression tracking** — milestones, levels, regression detection
3. **Practice type classification** — deliberate, maintenance, exploratory, performance
4. **Embodied knowledge** — tactile, kinesthetic, sensory knowledge
5. **Verification modality** — practice-required verification

## What's Missing

### 1. Mental Preparation Knowledge Capture

How to document pre-performance mental routines?

Missing guidance for:
- Pre-performance rituals and routines
- Mental warm-up techniques
- Anxiety management strategies specific to performance
- Focus triggers and anchors
- Breathing techniques for performance
- Positive self-talk patterns

### 2. Performance Psychology vs. Technique Distinction

When is a note about performance psychology vs. technique?

- "How to hold the bow" = technique (physical)
- "How to stay calm before walking on stage" = performance psychology (mental)
- "How to recover from a mistake" = performance psychology (mental/emotional)

### 3. Validation of Performance Psychology Knowledge

How do you verify if a mental technique works?

- Source verification is insufficient — what works for one may not work for another
- Empirical verification requires actually performing, not just practicing
- The "test" is: did this help in actual performance conditions?

### 4. Privacy Considerations

Performance psychology often involves:
- Personal fears and anxieties
- Past failures and embarrassing moments
- Confidence issues
- May need higher privacy protection than other knowledge types

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

## Related Seed Rules

- [[Seed Stress Test - Music Performance Knowledge Base]] — identifies this gap
- [[AI-Assisted Knowledge Management Seed]] — foundation rules

## Edge Cases

### Already covered by existing rules
- **Embodied knowledge** — covered for physical feel, not mental states
- **Practice types** — covers deliberate, maintenance, exploratory, performance

### Distinct from this gap
- **Technique knowledge** — physical execution, not mental state
- **Practice scheduling** — when to practice, not how to prepare mentally
- **Motivation** — general drive, not performance-specific anxiety

---

**See also:**
- [[Seed Stress Test - Music Performance Knowledge Base]]
- [[Frontier Exploration - Emotional and Sentimental Knowledge]]

**Gap identified by:** Seed Stress Test on Music Performance (2026-04-02)