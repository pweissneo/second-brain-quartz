---
last-reviewed: 2026-04-01
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
verification-status: unverified
tags:
  - seed-gap
  - temporal
  - deadline
  - interval
  - time-bound
gap-status: proposed
gap-phase: implementation
discovered: 2026-04-01
analyzed: 2026-04-01
proposed: 2026-04-01
analysis-conclusion: "Distinct from existing temporal handling rules. Time-bound action knowledge (when to act) is different from temporal validity knowledge (when knowledge expires). This gap warrants a new Seed rule."
---

# Seed Gap - Time-Bound Knowledge Beyond Temporal Decay

## The Gap

The Seed covers:
- Temporal decay (knowledge becomes stale over time)
- Seasonal verification (knowledge can only be tested at certain times)
- Condition-triggered knowledge (knowledge applies when specific states are met)
- Inherent expiration (knowledge with built-in validity windows)

But the Seed lacks explicit guidance for **time-bound action knowledge** — knowledge about **when something must be done**, not just when it becomes relevant or goes stale.

## What's Missing

### 1. Deadline Knowledge

Knowledge about actions that must occur before a specific time:

| Example | Type | Current Handling |
|---------|------|-----------------|
| Tax filing deadline | Hard deadline | Not explicitly covered |
| Contract renewal date | Decision deadline | Covered by condition-triggered? |
| Submission window | Time-bound opportunity | Partially covered (inherent expiration) |
| Maintenance schedule | Recurring deadline | Not covered |
| Follow-up reminder | Soft deadline | Not covered |

**The issue:** A note saying "Submit proposal by March 15" isn't temporal knowledge (it doesn't decay) and isn't condition-triggered (no state must be true). It's deadline knowledge — the time itself is the trigger.

### 2. Interval-Based Recurrence

Knowledge about things that repeat at specific intervals:

- "Change HVAC filter every 3 months"
- "Review insurance annually"
- "Service equipment after 100 hours of use"

This is neither:
- Temporal decay (the knowledge doesn't go stale)
- Cyclical timing (it's not tied to seasons/cycles)
- Condition-triggered (no state must be true)

It's **interval knowledge** — recurrence based on elapsed time or occurrence count.

### 3. Temporal Dependency

Knowledge where one note depends on another note being created at a specific time:

- "Before starting Phase 2, complete Phase 1 planning"
- "Update budget projections after Q1 data is available"
- "Review this note when you have the results from Experiment X"

Current Seed doesn't address knowledge that references other knowledge by temporal relationship.

## Proposed Seed Rule

**Rule:** For time-bound action knowledge (deadlines, intervals, temporal dependencies), include explicit temporal metadata that distinguishes action timing from knowledge validity.

**Why:** Without explicit temporal action metadata, AI agents cannot distinguish:
- Knowledge that is time-bound (the action must happen at a time)
- Knowledge that is time-sensitive (the knowledge changes over time)
- Knowledge that is condition-triggered (the knowledge applies when conditions are met)

This causes agents to apply incorrect handling — treating deadlines like stale knowledge (marking as outdated) or like condition-triggered knowledge (waiting for state that never comes).

**Test:** For notes with temporal action components: (1) Is there `deadline-type:` (hard|soft|decision|recurring)? (2) Is there `action-by:` or `repeat-interval:`? (3) Is temporal action distinguished from temporal validity?

**Implementation:**
```yaml
deadline-type: hard|soft|decision|recurring
action-by: 2026-04-15  # for hard/soft deadlines
repeat-interval: P3M    # ISO 8601 duration for recurring
temporal-dependency: [[Note Name]]  # for sequential dependencies
temporal-dependency-type: after-created|after-updated|after-completed
```

**Deadline types:**
- `hard`: Must complete by time (legal deadlines, contract expirations)
- `soft`: Should complete by time but negotiable (goals, reminders)
- `decision`: Must decide by time (options expire, offers expire)
- `recurring`: Repeats at intervals (maintenance, reviews, subscriptions)

**Handling guidance by type:**
- Hard deadlines → Add to calendar/alert system, not just vault
- Soft deadlines → Add reminder metadata, treat as guidance
- Decision deadlines → Flag as time-sensitive opportunity
- Recurring → Use `repeat-interval`, track last-completed

## Related

- [[Handling Temporal Knowledge]] — Time-based decay (complements, doesn't overlap)
- [[Frontier Exploration - Condition-Triggered Knowledge]] — State-based activation (adjacent but distinct)
- [[Seed Gap - Recurring and Periodic Knowledge]] — May be consolidated
- [[Frontier Exploration - Cyclical Timing Knowledge]] — Cyclical knowledge

## Analysis Summary

**Status:** Gap analyzed (2026-04-01). Analysis conclusion: Two aspects ARE covered by existing Seed rules (recurring/periodic knowledge at line ~1488, deadline-driven knowledge at line ~1656), but one aspect is genuinely NEW:

**What the Seed already covers:**
- Recurring and periodic knowledge (lines 1488-1508) — covers `recurrence-pattern`, `interval-value`, etc.
- Deadline-driven knowledge (lines 1656-1661) — covers hard/soft/recoverable deadlines

**What this gap adds (genuine new contribution):**
1. **Temporal dependency** — knowledge where one note depends on another note being created/updated at a specific time. NOT currently covered.
2. **Decision deadline type** — distinct from hard (must do) and soft (should do), this is "must decide by time" where options expire. NOT currently covered.

**Recommended action:** Add temporal-dependency field handling to Seed as an extension to the existing temporal handling rules. Mark gap-status as "proposed" pending Seed integration.

## Compliance Audit Finding (2026-04-01)

Today I performed a compliance audit on this gap note. Key finding: The Seed DOES cover deadline-driven knowledge at lines ~1656-1661 with `deadline-type: hard|soft|recoverable`. However, it does NOT cover:

1. **Temporal dependency** — knowledge where Note A depends on Note B being created/updated at a specific time (not covered)
2. **Decision deadline type** — distinct from hard (must do) and soft (should do), "must decide by time" where options expire (partially covered via soft but not explicit)

This confirms the gap is valid. The gap note now passes compliance — it's clear about what IS covered vs what is genuinely NEW.
