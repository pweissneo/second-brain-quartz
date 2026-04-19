---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-updated: 2026-04-08
confidence: emerging
verification-modality: passive
---

# Seed Refinement - Cognitive State-Aware Knowledge Organization

> Extends user-context-dependent knowledge to include cognitive/physical state.

## Gap Addressed

The existing Seed rule for user-context (expertise level, goals, preferences) doesn't account for the user's *current* mental or physical state. The same knowledge can be valid or dangerous depending on whether the user is rested, alert, fatigued, or depleted.

## Extension

Add cognitive state awareness to user-context rules:

```yaml
# Extended user-context schema
cognitive-state: alert|caffeinated|rested|fatigued|depleted|stressed
cognitive-state-awareness: true
state-dependent-knowledge: true

# For knowledge that should only be accessed in certain states
state-restrictions:
  valid-states: [alert, rested, caffeinated]
  invalid-states: [fatigued, depleted]
  warning-threshold: "May produce suboptimal results when fatigued"
```

## When This Matters

1. **Decision quality**: Critical decisions should reference only high-alertness knowledge
2. **Learning retrieval**: Complex concepts when rested, quick references when busy
3. **Creative work**: Brainstorming when caffeinated, editing when tired (different modes)
4. **Safety-critical**: Some knowledge should warn "do not use when fatigued"

## Test

For notes tagged `cognitive-state-aware`:
1. Can you identify what cognitive states this knowledge applies to?
2. Does the note include warnings for inappropriate states?
3. Is there a state-restriction flag for safety-critical content?

## Related

- [[Frontier Exploration - Cognitive State-Dependent Knowledge]] (exploration this refines)
- [[Seed Rule - User-Context-Dependent Knowledge]] (base rule being extended)
