---
last-reviewed: 2026-03-19
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
tags:
- frontier-exploration
- verification
- experiential-knowledge
---

# Frontier Exploration: Knowledge That Requires Active Practice to Validate

> How do you verify knowledge that cannot be assessed from reading alone — knowledge that requires the reader to actively practice to confirm its validity?

## The Problem

The Seed provides excellent guidance on verification through:
- Source verification (checking citations, dates, credibility)
- Cross-referencing with other notes
- Temporal decay tracking (outdated knowledge)
- Contradiction detection

But these approaches assume the verifier can assess correctness through **passive review** — reading, comparing, analyzing text. Some knowledge **fundamentally requires active execution** to validate:

- A recipe's taste can only be known by cooking it
- A presentation's effectiveness can only be judged by giving it
- A meditation technique's usefulness can only be verified by practicing it
- A sports technique's correctness can only be confirmed by performing it

This is distinct from "experiential knowledge" which is knowledge *about* experiences. This is knowledge that *requires* experience to verify.

## The Gap in Current Rules

The Seed addresses:
- Verification-status: unverified (captured but not source-confirmed)
- Verification cycles (30-day windows, seasonal verification)
- Correction metadata for wrong knowledge

But it lacks guidance on:
1. **Verification modality** — passive (read-only) vs. active (practice-required)
2. **Execution uncertainty** — how to handle knowledge where execution might yield different results than description
3. **Failure modes** — distinguishing between knowledge that's wrong vs. execution that's poor
4. **Progress tracking** — how to mark verification progress for practice-dependent knowledge

## The Challenge

For passive knowledge:
- Verification = "Does this match sources?"
- Update cycle = "Has this been superseded?"
- Correction = "This was wrong"

For active-practice knowledge:
- Verification = "Did this work when you tried it?"
- Update cycle = "Have you actually tested this recently?"
- Correction = "Did it fail because the knowledge is wrong, or because execution was poor?"

These are fundamentally different verification paradigms.

## A Framework for Practice-Dependent Knowledge

### Categorization

When capturing new knowledge, distinguish:

| Type | Verification Method | Update Trigger |
|------|---------------------|----------------|
| **Passive** | Read, compare sources, check logic | New information appears |
| **Practice-dependent** | Actually do the thing | You've tested it |
| **Hybrid** | Read sources AND practice | Either new info OR new practice |

### Implementation

Add verification-modality field:
```yaml
verification-modality: passive | practice-required | hybrid
practice-status: not-attempted | in-progress | successful | failed
practice-date: 2026-03-19
execution-challenges: "What made testing difficult?"
```

### Verification for Practice-Required Knowledge

For knowledge requiring active practice:

1. **Capture with explicit uncertainty** — mark as practice-required, set verification-status: unverified
2. **Prioritize testing** — schedule actual execution within reasonable timeframe (not 30 days — might need seasons)
3. **Track execution separately from truth** — a note can be:
   - Correct knowledge + good execution = verified
   - Correct knowledge + poor execution = update execution notes
   - Wrong knowledge + any execution = correction needed
4. **Distinguish failure modes** — if testing fails, ask:
   - Is the knowledge itself wrong? (correction needed)
   - Was execution flawed? (practice guidance needed)
   - Was the context wrong? (applicability boundary needed)

### Example

**Note:** "Add salt at the end of cooking to maintain texture"

- Source: Classic French technique
- verification-modality: practice-required (you must taste to verify)
- verification-status: unverified
- practice-status: not-attempted
- After cooking and tasting: update with practice-status: successful/failed and notes about what you observed

## Seed Rule Proposal

**Rule:** Distinguish verification modality — categorize knowledge as passive (read-only verification) or practice-required (active execution needed to verify).
**Why:** Passive verification methods fail for practice-dependent knowledge. Without explicit categorization, AI agents use wrong verification approaches, leading to false confidence in unverified claims.
**Test:** (1) Can this knowledge be verified by reading alone? (2) Does it describe something that must be done to be evaluated? (3) If yes to 2, mark verification-modality: practice-required and set practice-status: not-attempted.

**Rule:** Track execution status separately from knowledge validity — a practice-failed note may contain correct knowledge applied incorrectly, not incorrect knowledge.
**Why:** Conflating execution failure with knowledge error leads to over-correction. A recipe can be sound but poorly executed; marking the knowledge as wrong when the issue is execution guidance creates false negatives.
**Test:** When practice fails: (1) Did you follow the steps exactly? (2) Did the failure occur at the knowledge level (wrong principle) or execution level (missing guidance)? (3) If execution-level, add execution details rather than marking knowledge as incorrect.

**Rule:** Set realistic verification timeframes for practice-required knowledge — 30-day verification windows often insufficient for domains requiring physical execution.
**Why:** Cooking a seasonal dish, learning a musical piece, or testing a garden technique cannot be verified in 30 days. Artificial urgency leads to either skipping verification or false verification.
**Test:** For verification-modality: practice-required notes: (1) Is the expected verification timeframe realistic? (2) Has practice been scheduled? (3) If verification is impossible in current context (missing ingredients, tools, season), mark as pending with expected-verify-when field.

## Related Notes

- [[Frontier Exploration - Knowledge Prioritization and Focus Decisions]] — when to prioritize testing vs. capturing new knowledge
- [[Stress Test - Atomicity Rule Across Domains]] — atomicity applies differently when content requires practice to understand
- [[Note Lifecycle Management]] — practice-required notes may need longer lifecycle phases
- [[Handling Temporal Knowledge]] — correction protocols for practice-failed knowledge
- [[Seed Gap - Music Composition Knowledge Bases]] — music is a practice-intensive domain