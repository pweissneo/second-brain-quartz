---
last-reviewed: 2026-04-04
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - knowledge-type
  - personal-knowledge
  - experimentation
  - negative-results
gap-status: identified
gap-priority: medium
gap-severity: useful
---

# Frontier Exploration: Personal Experimentation Results as Knowledge Type

> Capturing what didn't work for YOU — distinct from general anti-patterns

## The Gap

The Seed covers:
- **Negative knowledge**: Anti-patterns, failure modes, lessons learned (general)
- **Trade-off knowledge**: Context-dependent decisions
- **Personal knowledge**: Insights, decisions, experiences
- **Source-origin tracking**: Distinguishing original/synthesized from external sources

But there's a gap: **Personal experimentation results** — specific things YOU tried that didn't work for YOUR specific context, situation, or preferences.

> **Note:** This is distinct from general negative knowledge. General negative knowledge (e.g., "searing doesn't seal in juices") applies universally. Personal experimentation results apply only to your specific context.

## The Missing Rule

The Seed needs a rule stating:

> **Rule:** Capture personal experimentation results explicitly — track what you tried, why it failed for your specific context, and conditions for potential retry.
> **Why:** Personal experimentation results are high-value knowledge that cannot be obtained from any external source. Without explicit capture, you'll repeat failed experiments.
> **Test:** Can you answer: "What have I tried that didn't work for me, and why?" for at least 3 experiments?

## Why It Matters

1. **Personal validity**: Something that works for others may not work for you. Capturing this helps avoid repeating failed experiments.

2. **Context preservation**: Your specific situation (equipment, time, preferences) affects what works. General advice can't capture this.

3. **Time savings**: Future-you doesn't remember that you already tried X and it failed.

4. **Honest knowledge base**: A KB that only shows successes is misleading. Your failures are valid data points.

5. **Different from general negative knowledge**: "Searing doesn't seal in juices" is universal — it doesn't work for anyone. "Sunday meal prep doesn't work for me because I need variety" is personal — it might work for others.

## What Makes This Different From Existing Knowledge Types

| Knowledge Type | Scope | Example |
|--------------|-------|---------|
| Negative Knowledge | Universal | "Searing doesn't seal in juices" |
| Trade-off Knowledge | Context-dependent | "Speed vs. thoroughness tradeoff" |
| Personal Knowledge | General experiences | "My insight on X" |
| Personal Experimentation Results | Specific failed experiments | "I tried Sunday meal prep and it failed because..." |

## Testability

A Seed rule on this would be testable:

1. Can you identify at least 3 personal experimentation results in your vault?
2. Does each capture: what you tried, your specific context, why it failed, conditions for retry?
3. Would deleting these notes cause you to repeat failed experiments?

## Implementation

Frontmatter structure:
```yaml
knowledge-type: procedural|conceptual|factual|experiential|relational|meta
experiment-status: pending|in-progress|success|failed|abandoned
experiment-context: Your specific situation (equipment, time, preferences)
experiment-outcome: What happened
experiment-reason-for-failure: Why you think it didn't work for you
experiment-retry-conditions: When you might try again
```

## Related

- [[Frontier Exploration - Personal Experimentation Results]] — existing note (pre-Seed rule)
- [[Anti-Patterns in Knowledge Management]] — general negative knowledge
- [[Trade-off Knowledge Capture]] — contextual decisions
- [[Seed Rule Addition - Knowledge Without External Sources]] — original/synthesized knowledge
- [[Frontier Exploration - User Situational Constraints]] — how context affects applicability

## Questions for Seed Update

1. Should the Seed include a rule specifically about personal experimentation results?
2. Should this be its own knowledge type or a sub-type of experiential knowledge?
3. Should successful experiments also be captured (vs. just failures)?
