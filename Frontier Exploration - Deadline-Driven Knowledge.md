---
last-reviewed: 2026-03-18
last-updated: 2026-03-18
confidence: emerging
knowledge-type: frontier
lifecycle: active
author-type: ai-assisted
tags:
  - frontier-exploration
  - deadline
  - temporal
  - knowledge-type
---

# Frontier Exploration: Deadline-Driven Knowledge

> Knowledge tied to specific dates, deadlines, or time windows that becomes incomplete, outdated, or harmful after expiration.

## The Problem

Current Seed rules cover:
- **Temporal knowledge**: Historical events, knowledge that changes over time
- **Version-based knowledge**: Software, frameworks that update
- **Seasonal knowledge**: Gardening, annual events with recurring cycles

But there's a gap: **deadline-driven knowledge** where:
- Missing the deadline has negative consequences
- The knowledge is only actionable before a specific date
- After expiration, the knowledge becomes misleading (implies deadline hasn't passed)

## Examples

### Tax Knowledge
- "File taxes by April 15" - After April 15, this is harmful (implies you can still file)
- Tax deduction deadlines
- Contribution deadlines for retirement accounts

### Application Deadlines
- College application deadlines
- Job posting closing dates
- Grant application windows
- Visa application timelines

### Contractual/Legal
- License renewal dates
- Warranty expiration
- Subscription renewal windows
- Insurance open enrollment periods

### Event-Based
- Conference registration deadlines
- Early bird pricing cutoffs
- Event scheduling (Webinars with fixed dates)

## Why This Matters

1. **Harm potential**: Unlike stale information, expired deadline knowledge can cause direct harm (missing deadlines, lost money, legal issues)

2. **Actionability decay**: The utility of this knowledge drops to zero after the deadline, not gradually like most knowledge

3. **False currency**: An AI agent might surface "file taxes by April 15" in March (useful) vs November (actively harmful - implies you can still file when you can't)

4. **Verification difference**: This knowledge can't be "verified" in the normal sense - you either act before deadline or you don't

## Proposed Seed Rules

### Rule: Tag deadline-driven knowledge with expiration metadata

**Why:** AI agents need to know when knowledge becomes harmful, not just when it was last reviewed.

**Test:** For time-sensitive knowledge, can you answer: (1) What is the deadline? (2) What happens if this deadline is missed? (3) Is there a way to recover after deadline?

**Implementation:**
```yaml
deadline-type: hard-soft-recoverable
deadline-date: 2026-04-15
deadline-consequence: "Late filing penalty"
recovery-method: "File extension request"
action-window: "90 days before deadline"
```

Where:
- `hard`: No recovery after deadline (missed exam, expired discount)
- `soft`: Recovery possible with penalty (late fee, reduced outcome)
- `recoverable`: Can still achieve goal after deadline with effort

### Rule: Expire deadline-driven knowledge from active retrieval after deadline + grace period

**Why:** Suraging expired deadline knowledge misleads users into thinking they can still act.

**Test:** Does the vault prevent expired deadlines from appearing in relevant queries? Is there a mechanism to archive or hide expired deadline knowledge?

**Implementation:**
- Hard deadlines: Remove from active index after expiration + 7 days
- Soft deadlines: Mark as expired but keep for recovery information
- Auto-archive with `status: deadline-expired` frontmatter

### Rule: Capture recovery paths for missed deadlines

**Why:** Users sometimes miss deadlines despite having the knowledge. Recovery options are valuable.

**Test:** For each deadline note, can you answer: "What if I miss this deadline?"

**Example:**
```yaml
primary-deadline: 2026-04-15
recovery-options:
  - method: "File extension"
    deadline: "2026-10-15"
    consequence: "6-month extension"
  - method: "Late filing"
    penalty: "5% per month"
    note: "Less favorable"
```

### Rule: Include action windows, not just deadlines

**Why:** "File by April 15" is less useful than "Start preparing tax documents by March 1 for April 15 deadline."

**Test:** Can you identify when someone should START acting, not just when they must FINISH?

**Implementation:**
```yaml
deadline: 2026-04-15
recommended-start: 2026-03-01
action-window-days: 45
milestones:
  - date: 2026-03-01
    action: "Gather documents"
  - date: 2026-03-15
    action: "First draft complete"
  - date: 2026-04-01
    action: "Review and finalize"
```

## Interaction with Existing Seed Rules

### Relationship to Verification
- Deadline knowledge verification = checking that deadline hasn't passed
- Auto-verification: Scripts check if deadline expired since last review

### Relationship to Diminishing Returns
- Deadline knowledge has asymmetric utility: high before deadline, negative after
- Apply "utility-expiry" concept from ML/DS domain specifically

### Relationship to Temporal Knowledge
- Temporal knowledge: "In 2024, X was true"
- Deadline knowledge: "By DATE, you must do X"
- Different structure: point-in-time vs. countdown

## Test Case: Tax Knowledge Base

**Current approach (problematic):**
- Note: "Tax Filing Deadlines" 
- Last reviewed: 2025-05
- Contains: "File by April 15"
- In November 2026, AI surfaces this - HARMFUL

**Deadline-aware approach:**
```yaml
---
deadline-type: hard
deadline-date: 2026-04-15
deadline-consequence: "Late filing penalty 5%/month"
recovery-method: "File extension available until Oct 15"
recommended-start: 2026-02-01
status: active
---
# Federal Tax Filing Deadline

## Primary Deadline
**File by April 15, 2026** (or extension request)

## If You Miss the Deadline
- Late filing penalty: 5% of unpaid taxes per month
- File extension: Available until October 15, 2026
- Interest: Accrues on unpaid taxes from April 15

## Recommended Timeline
- Feb 1: Gather documents
- Mar 1: Complete first draft  
- Apr 1: Final review
- Apr 15: File (or request extension)
```

**Auto-handling:**
- After April 22 (deadline + 7 days): Note automatically archived with `deadline-expired` tag
- Recovery information preserved for those who missed it
- New note created each year with new dates

## Related Notes

- [[Handling Temporal Knowledge]]
- [[Frontier Exploration - Condition-Triggered Knowledge]]
- [[Frontier Exploration - Seasonal and Cyclical Knowledge]]
- [[Stress Test - Temporal Knowledge Rule in Stock Trading]]
- [[Handling Temporal Knowledge]]

## Questions for Seed Update

1. Should `deadline-type` be a new knowledge-type category alongside `factual`, `procedural`, `experiential`?
2. How to handle recurring deadlines (annual tax filing) - same note with updated dates or new note each year?
3. Should deadline knowledge be exempt from normal verification ratio calculations since it has built-in expiration?
4. How to handle deadlines that shift (Tax Day moved to April 17-18 due to weekends/holidays)?
