---
last-reviewed: 2026-03-18
lifecycle: emerging
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - knowledge-correction
  - maintenance
  - anti-pattern
---

# Frontier Exploration - Handling Incorrect or Outdated Knowledge

> How to identify, mark, and correct knowledge in your vault when you discover it's wrong, outdated, or was always incorrect — without losing valuable context about why it was wrong.

## The Problem

The Seed covers verification workflows and confidence markers, but it lacks explicit guidance for what happens **after** you discover knowledge is incorrect:

- You learned something new that contradicts an existing note
- A source you trusted was later found to be unreliable
- Knowledge that was once true is now outdated (software version deprecated, best practice changed)
- You made a mistake in your own synthesis or interpretation

Current Seed rules focus on **prevention** (verification before adding) and **detection** (confidence markers), but not on **remediation** (what to do when wrong knowledge is discovered).

## The Gap in Current Seed Rules

The Seed covers:
- `verification-status:` — unverified, testing, verified, failed
- `confidence:` — high, emerging, disputed, obsolete
- `valid-from` / `valid-until` — temporal validity

But it lacks:
- What to do when you discover existing verified knowledge was wrong
- How to preserve the "why it was wrong" context
- When to delete vs mark vs fix incorrect knowledge
- How to handle knowledge that was correct but is now outdated

## Questions That Stump AI

Without explicit guidance, an AI faced with incorrect knowledge will:
1. Arbitrarily decide to delete or keep
2. Lose the context about WHY the knowledge was wrong
3. Not distinguish between "wrong" and "outdated" 
4. Not preserve potentially valuable "what I used to think" context

Specific questions:
- Should incorrect knowledge be deleted entirely or preserved as a learning artifact?
- How do you mark knowledge that was correct once but is now outdated?
- What's the difference between "wrong" (incorrect fact) vs "outdated" (no longer applicable)?
- How do you track what caused you to realize the knowledge was wrong?
- Should you keep a record of your past mistakes?

## Proposed Approach

### Taxonomy of Incorrect Knowledge

1. **Factual error** — The knowledge was never correct
   - Source was wrong, you misread, you synthesized incorrectly
   - Example: "I thought X caused Y, but research shows Z"

2. **Outdated** — The knowledge was correct once but is no longer
   - Domain evolved, best practices changed, version deprecated
   - Example: "This API was deprecated in 2024"

3. **Misinterpretation** — The knowledge is correct but you applied it wrongly
   - Context was wrong, assumptions didn't hold
   - Example: "This works in production but not in development"

4. **Personal error** — You made a mistake in your own reasoning
   - Synthesis was flawed, logic was wrong
   - Example: "I incorrectly concluded X from these facts"

### Recommended Handling

```yaml
# For factual errors
correction-type: factual-error
was-correct: false
correction-date: 2026-03-18
correction-trigger: [source-re-evaluation|new-information|practical-failure]
# Optional: preserve what was wrong
# incorrect-because: "..."

# For outdated knowledge  
correction-type: outdated
was-valid-until: 2024-06
current-status: deprecated|superseded|superseded-by: [[Note Name]]
# Keep old note as historical reference

# For misinterpretation
correction-type: misinterpretation
corrected-understanding: [[Note Name]]
context-where-it-applies: [...]
context-where-it-does-not: [...]

# For personal errors
correction-type: personal-error
what-went-wrong: "..."
lesson-learned: "..."
```

### Decision Framework

| Type | Keep? | Mark? | Update? |
|------|-------|-------|---------|
| Factual error | Optional* | Required | Create corrected version |
| Outdated | Yes | Required | Link to current version |
| Misinterpretation | Yes | Required | Note context limits |
| Personal error | Yes (valuable) | Required | Document lesson |

*Keep factual errors if they have educational value or represent common mistakes.

### Preservation Principle

**Keep the history, not just the correction.** The value isn't in having clean knowledge — it's in understanding how your knowledge evolved. A note that says "I used to think X" is valuable meta-knowledge.

Suggested approach:
1. Create corrected note (or update existing)
2. Mark original with `correction-type:` and link to corrected
3. Add `formerly-believed:` field to corrected note
4. Consider creating a "learning note" capturing what you learned

### The "Correction Hub" Pattern

For domains with frequent corrections (like fast-moving tech), create a correction log:
```
# Knowledge Corrections Log

## 2026-03
- [[Incorrect: Docker Networking]] → [[Corrected: Docker Networking]]
- [[Outdated: React Hooks Best Practices]] → [[Current: React Hooks]]

## 2026-02
- ...
```

## Test for This Frontier

An AI should be able to answer:
1. What type of incorrectness does this note have?
2. Should I keep, delete, or mark this note?
3. How do I preserve the context about why it was wrong?
4. Is there a corrected version to link to?

## Related Seed Rules

- [[Frontier Exploration - Active Knowledge Replacement]] — related (updating knowledge)
- [[Frontier Exploration - Self-Contradiction and Evolved Perspective]] — related (evolving views)
- [[Frontier Exploration - Deadline-Driven Knowledge]] — deadline-driven knowledge becomes harmful after expiration
- [[Seed Refinement - Decay Functions]] — temporal decay
- [[Verification Workflow]] — current verification rules
- [[Confidence Markers]] — current confidence system

## Open Questions

- Should incorrect knowledge count against verification ratios?
- How far back should you keep incorrect historical notes?
- Is there a case where you should just delete without marking?
- How do you handle corrections from trusted sources that later prove wrong?
