---
last-updated: 2026-04-08
last-reviewed: 2026-04-08
confidence: emerging
knowledge-type: conceptual
verification-status: unverified
verification-modality: practice-required
---

# Frontier Exploration - Cognitive State-Dependent Knowledge

> Knowledge that applies differently depending on the user's current mental or physical state.

## The Problem

The Seed covers user-context (expertise level, goals, preferences) but treats the user as relatively static. However, the same person at different times has different:

- **Cognitive capacity**: Tired vs. alert, caffeinated vs. not
- **Decision quality**: Morning vs. evening, after difficult work vs. rested
- **Learning mode**: Fresh vs. fatigued, focused vs. distracted
- **Risk tolerance**: After wins vs. after losses, rested vs. depleted

A note about "quick decision-making" might be excellent advice when rested but dangerous when fatigued. The vault currently has no framework for tagging knowledge that is **state-dependent**.

## Why This Matters for Knowledge Management

1. **Same knowledge, different validity**: Advice that works when alert may fail when tired
2. **Verification varies by state**: What you verify when rested may not hold when depleted
3. **Retrieval optimization**: Morning retrieval (quick decisions) vs. evening (reflective)
4. **Safety implications**: Critical decisions should be flagged for "alert-only" execution

## Examples

- **Focus knowledge**: Deep work advice applies differently when tired
- **Decision-making**: Risk assessment differs based on cognitive load
- **Learning**: Spaced repetition efficiency varies with sleep quality
- **Creativity**: Brainstorming works differently caffeinated vs. not

## Proposed Frontmatter Schema

```yaml
cognitive-state-dependent: true
cognitive-state-type: alertness|decision-quality|risk-tolerance|learning-mode
state-sensitivity: high|medium|low
valid-states:
  - alert
  - rested
  - caffeinated
invalid-states:
  - fatigued
  - depleted
  - distracted
state-interaction_notes: "How this knowledge changes by state"
```

## Test Questions

1. Does this knowledge apply universally or only in specific cognitive states?
2. Would executing this knowledge while fatigued produce different (possibly worse) results?
3. Should this knowledge be flagged for "high-cognitive-load" situations only?

## Related Seed Rules

- [[Seed Rule - User-Context-Dependent Knowledge]] (existing)
- [[Seed Gap - Context-Switch Validity]] (related but different - this is about user state, not context)
- [[Seed Refinement - Verification Priority Hierarchy]] (state affects verification quality)

## Open Questions

- Should cognitive state be part of the retrieval context (what you show based on time of day)?
- How do you verify state-dependent knowledge (verify in multiple states)?
- Can AI agents assess their own cognitive state to make state-aware recommendations?

---

**Note**: This is a frontier exploration, not a Seed rule. The concept needs further development before integration.
