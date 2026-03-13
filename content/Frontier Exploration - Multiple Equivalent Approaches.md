---
last-reviewed: 2026-03-11
lifecycle: deprecated
confidence: high
tags:
  - frontier-exploration
  - structure
  - alternatives
  - domain-agnostic
  - superseded
---

> **⚠️ DEPRECATED:** This note's proposed rule has been incorporated into the Seed.
> See: [[AI-Assisted Knowledge Management Seed]] → Rule: "Present multiple equivalently valid approaches as alternatives"

# Frontier Exploration - Multiple Equivalent Approaches

> When there are multiple valid ways to achieve the same goal, how should a knowledge base present this? This frontier explores the gap between "contradictory sources" (one is wrong) and "subjective preferences" (all are valid).

---

## The Problem

Consider building a knowledge base about music composition. An AI encounters these scenarios:

1. **Voice leading**: There are 3 valid ways to resolve a dominant 7th chord to tonic, all technically correct
2. **Orchestration**: Multiple instrument combinations can create the same emotional effect
3. **Melodic phrasing**: Different rhythmic approaches can express the same musical idea

The current Seed handles:
- **Contradictory sources** → Synthesize with source attribution (Rule: "When sources contradict, create a synthesis note presenting both perspectives")
- **Subjective claims** → Tag with `claim-type: subjective` and `consensus` level

But neither covers **"multiple equivalently valid approaches"** — where:
- All options are correct/produce valid results
- No single answer is "better" universally
- The choice depends on context, style, or preference

## Why This Matters

Without guidance, an AI must guess how to structure knowledge about equivalent alternatives. Common failures:
- **False synthesis**: Presenting one approach as "best" when all are equal
- **False dichotomy**: Forcing a choice between alternatives that shouldn't require one
- **Fragmentation**: Creating separate notes for every variation without connection

## Proposed Approach

### Structure Options

| Scenario | Recommended Structure |
|----------|---------------------|
| 2 alternatives, comparison IS the insight | Single comparative note |
| 2 alternatives, each needs substantial development | Separate notes + bidirectional links |
| 3+ alternatives | Hub + spoke pattern |
| Alternatives are context-dependent (different styles, use cases) | Hub + tagged variants |

### Key Distinction

**Contradictory** = One is wrong / fact error → synthesize with evidence
**Subjective** = Matters of taste / opinion → present as perspectives with consensus
**Equivalent** = All valid, context determines choice → present as options with applicability guidance

## Testing the Gap

A knowledge base has a gap in handling equivalents if:
1. You find notes that claim one approach is "best" when alternatives exist
2. Notes about techniques don't acknowledge that other techniques achieve similar results
3. A learner cannot find guidance on which equivalent approach to use when

## Seed Rule Proposal

**Rule:** When multiple equivalently valid approaches exist for achieving the same goal, present them as alternatives with explicit applicability context — not as synthesized "best" approach.
**Why:** False synthesis misleads readers into thinking there's one correct answer; equivalence acknowledgment enables informed context-based choices.
**Test:** Pick a note describing a technique/approach. Can you identify: (1) Are there equivalent alternatives? (2) If yes, are they presented as alternatives, not as one winner? (3) Is there guidance on when to choose each?

---

## Related Notes

- [[Handling Contradictory Sources]] — For when sources actually disagree
- [[Frontier Exploration - Comparative Knowledge Structures]] — For binary choices where comparison IS the insight
- [[Frontier Exploration - Framework-Dependent Knowledge]] — For context-dependent variations
- [[AI-Assisted Knowledge Management Seed]] — For subjective vs objective claims in creative domains (see "Subjective Knowledge" section)
