---
last-reviewed: 2026-04-03
last-updated: 2026-04-04
lifecycle: emerging
confidence: medium
author-type: frontier-exploration
---

# Frontier Exploration - Time-Context-Aware Knowledge Activation

> When should knowledge "wake up" and "sleep"? Time-sensitive knowledge activation patterns

## The Problem

The Seed handles temporal knowledge through validity windows and freshness dating, but there's a gap: **knowledge that is contextually true only at specific times**. 

Consider knowledge like:
- "The café is open now" — true at 9 AM, false at 11 PM
- "Exchange rate" — accurate at moment of capture, stale within hours
- "Next bus arrives in X minutes" — changes every minute
- "Weekend schedule" — applies differently on Sat vs Sun vs Mon
- "Quarterly report deadline" — relevant only in specific weeks

An AI building a knowledge base needs rules for: (1) marking knowledge as time-context-aware, (2) determining when to surface vs suppress, (3) handling retrieval when context has shifted.

## Current Seed Gaps

1. **No activation window rules** — Seed covers validity ("when is this true?") but not activation ("when should this be surfaced?")
2. **No temporal suppression guidance** — How to handle knowledge that's true but not currently applicable
3. **No refresh triggers** — When should time-context-aware knowledge be re-validated vs archived
4. **No retrieval-time adaptation** — Queries should potentially return different results based on when they're asked

## Edge Cases

- **Event-based knowledge**: "Registration opens June 1st" — need to track pre-event vs during vs post-event states
- **Recurring temporal patterns**: Knowledge that's only relevant during specific seasons, months, or recurring periods
- **Decision deadline knowledge**: "Submit by Friday" — needs day-of-week awareness
- **Historical vs projected**: Knowledge marked as "as of date" needs clear temporal scope

## Proposed Framework

**Knowledge Activation States:**
- `dormant`: True in general, not currently applicable
- `active`: Currently applicable and accurate
- `pending`: Will become active at specified time
- `expired`: Was true, no longer applicable

**Retrieval-Time Adaptation:**
- Knowledge bases could annotate retrieval-time sensitivity
- "At what time was this captured?" — explicit temporal metadata
- "When should this be re-checked?" — refresh-before timestamp

## Test Scenarios

1. **Temporal lookup**: Query "is the café open?" — should respond based on current hour
2. **Advance capture**: Note about "next week's meeting" — should remain dormant until appropriate time
3. **Deadline awareness**: Query "report deadline" — should indicate days remaining
4. **Seasonal knowledge**: "Summer hiking routes" — should signal when relevant

## Related Notes

- [[Frontier Exploration - Temporal Validity Bounds]] — extends to activation windows
- [[Frontier Exploration - Cyclical Timing Knowledge]] — recurring patterns
- [[Seed Gap - Knowledge with Inherent Expiration Windows]] — expiration, not activation
- [[Seed Refinement - Temporal Validity Bounds Rule]] — current temporal rules

## Domain Stress Test: Event Planning Knowledge Base

If applying Seed to an event planning knowledge base:
1. "Venue contact" — active year-round, dormant between events
2. "Catering menu" — activates 2 weeks before event
3. "Setup checklist" — activates day-of only
4. "Post-event retrospective" — activates after event closes

Without activation-aware rules, the vault surfaces outdated or premature knowledge, reducing utility.

---
*This note is a candidate for Seed integration if the concept proves valuable across multiple domains.*