---
last-reviewed: 2026-03-24
lifecycle: seed-extension
confidence: emerging
verification-status: unverified
tags:
  - seed-gap
  - temporal
  - recurring
  - seasonal
  - deadline
  - scheduling
  - cycles
level: principle
author-type: ai-assisted
---

# Seed Gap: Recurring, Cyclical, and Deadline-Driven Knowledge

> Knowledge about events, deadlines, and cycles that repeat on predictable schedules requires different handling than static knowledge or time-sensitive data. The Seed covers temporal knowledge and outdated knowledge but lacks guidance for:
> 1. **Recurring knowledge** — events that repeat on schedules (fiscal years, annual deadlines)
> 2. **Cyclical knowledge** — knowledge relevant during specific phases/season (seasonal content, dormant vs active)
> 3. **Deadline-driven knowledge** — knowledge tied to specific dates where missing has consequences

This note consolidates three related frontier explorations into one comprehensive Seed gap proposal.

---

## The Gap

The Seed has comprehensive guidance for:
- **Time-sensitive data**: Rapidly changing values (weather, prices, scores)
- **Outdated knowledge**: Was correct, now stale but historically accurate
- **Sequential knowledge**: Where order IS the knowledge (historical narratives, processes)

But it's missing guidance for the full spectrum of temporal recurrence:

### Missing: Recurring Knowledge
Events, deadlines, and cycles that repeat on predictable schedules where the schedule itself IS the knowledge being captured.

**Without guidance, an AI would:**
- Treat recurring events as static "fact" notes (miss the recurring nature)
- Not know how to capture schedule-dependent knowledge (fiscal year, academic calendar)
- Not distinguish between "one-time event" and "recurring event" knowledge

### Missing: Cyclical Knowledge  
Knowledge that recurs in patterns but doesn't progress linearly. The same knowledge becomes relevant again each cycle.

**Without guidance, an AI would:**
- Not know to mark "tomato planting" as spring-only knowledge
- May incorrectly flag seasonal advice as "stale" in off-season
- Not create predictable activation/deactivation cycles

### Missing: Deadline-Driven Knowledge
Knowledge tied to specific dates where missing the deadline has negative consequences. After expiration, the knowledge becomes misleading.

**Without guidance, an AI would:**
- Surface expired deadlines as if still actionable (harmful: "file taxes by April 15" in November)
- Not capture recovery paths for missed deadlines
- Not include action windows (when to START, not just when to FINISH)

---

## Examples

### Recurring Knowledge (Schedule Pattern)

| Knowledge | Pattern | Cycle Type |
|-----------|---------|------------|
| "Q1 ends March 31" | Annual | Fiscal |
| "US tax deadline is April 15" | Annual | Regulatory |
| "Academic semester dates" | Seasonal | Institutional |
| "Change HVAC filter every 90 days" | Interval | Maintenance |
| "US Presidential election" | 4-year | Cyclic |

### Cyclical Knowledge (Dormant/Active Phases)

| Knowledge | Active Phase | Dormant Phase |
|-----------|--------------|---------------|
| Holiday cookie recipes | Nov-Dec | Jan-Oct |
| Moon phase astronomy | Monthly cycles | Ongoing |
| Tax strategies | Mar-Apr | May-Feb |
| Telescope targets | Winter | Other seasons |
| Running training plans | Spring/Fall | Summer/Winter |

### Deadline-Driven Knowledge (Consequence After Expiration)

| Knowledge | Deadline | After Expiration |
|-----------|----------|------------------|
| Tax filing | April 15 | Late penalties accrue |
| Early bird pricing | Event date | Higher cost |
| License renewal | Expiration date | Legal issues |
| Conference registration | Event date | Cannot attend |
| Visa application | Embassy date | Rejection |

---

## Why These Are Different

| Type | Direction | Example | Utility After Expiration |
|------|-----------|---------|------------------------|
| Time-sensitive | Linear | Stock price | Gradually stale |
| Sequential | Progressive | Learning prerequisites | Still valid |
| Cyclical | Recurring | "Holiday cookies" | Returns next cycle |
| Deadline-driven | Binary | "Tax by April 15" | **Harmful** (implies can still act) |
| Static | None | Mathematical proofs | Always valid |

---

## Proposed Seed Rules

### Rule 1: Capture recurring knowledge with explicit schedule metadata

**Rule:** Distinguish one-time events from recurring events, document the recurrence pattern, and track the knowledge's valid timeframe across cycles.

**Why:** Recurring knowledge has different characteristics than static or time-sensitive data. A fiscal year deadline exists every year with the same essential information (date, requirements, consequences). Treating recurring knowledge as static "fact" notes loses the pattern and makes the note feel outdated between cycles.

**Test:** Can you categorize temporal notes as: (1) one-time event (static date), (2) recurring event (schedule pattern), (3) time-sensitive data (rapidly changing value), (4) sequential knowledge (causal chain)? For recurring notes: Does frontmatter include `recurrence-pattern:`, `cycle-type:`, and `schedule-valid-for:`?

**Implementation:**
```yaml
recurring: true
recurrence-pattern: annual|quarterly|monthly|weekly|seasonal|cyclic
cycle-type: fiscal|academic|calendar|regulatory|organizational|seasonal
next-occurrence: 2026-04-15
cycle-relative-timing: "End of Q1 (varies by fiscal year)"
```

### Rule 2: Tag cyclical knowledge with temporal phases

**Rule:** Distinguish cyclical knowledge from time-sensitive data by tagging with `temporal-type: cyclical` and tracking `cycle-phase: active|dormant`.

**Why:** Seasonal knowledge becomes relevant again each cycle, unlike time-sensitive data that flows in one direction. Marking seasonal knowledge as "expired" loses valuable information that will be relevant again.

**Test:** For cyclical notes: Is there a `temporal-type: cyclical` tag? Is `cycle-phase:` present? Is `next-relevant:` date specified?

**Implementation:**
```yaml
temporal-type: cyclical
cycle-period: annual|seasonal|monthly|quarterly
cycle-phase: active|dormant
peak-season: [season or date range]
next-relevant: 2026-11-01
```

### Rule 3: Handle deadline-driven knowledge with consequence tracking

**Rule:** Tag deadline-driven knowledge with explicit deadline metadata, consequence information, and recovery paths. After deadline + grace period, expire from active retrieval.

**Why:** Unlike stale information, expired deadline knowledge can cause direct harm (missing deadlines, lost money, legal issues). AI agents need to know when knowledge becomes harmful, not just when it was last reviewed.

**Test:** For deadline notes: (1) What is the deadline? (2) What happens if this deadline is missed? (3) Is there a way to recover after deadline? (4) Is expired deadline knowledge excluded from active retrieval?

**Implementation:**
```yaml
deadline-type: hard|soft|recoverable
deadline-date: 2026-04-15
deadline-consequence: "Late filing penalty 5%/month"
recovery-method: "File extension available until Oct 15"
recommended-start: 2026-02-01
action-window-days: 45
```

Where:
- `hard`: No recovery after deadline (missed exam)
- `soft`: Recovery possible with penalty (late fee)
- `recoverable`: Can still achieve goal after deadline with effort

### Rule 4: Create phase-aware hub notes for cyclical content

**Rule:** For annual/seasonal content, create hub notes that shift "active" status based on the cycle phase.

**Why:** Users navigating a knowledge base should see relevant content for their current context, not content from irrelevant seasons.

**Implementation:**
```
# Seasonal Gardening Hub

## Spring (Active: March-May)
- [[Starting Seeds Indoors]]
- [[Early Spring Planting]]

## Summer (Dormant)
[links hidden or de-emphasized]

## Fall (Active: September-October)
- [[Fall Bulb Planting]]
- [[Winter Prep]]
```

### Rule 5: Expire deadline-driven knowledge after deadline + grace period

**Rule:** Remove expired deadline knowledge from active index after expiration + grace period (recommended: 7 days), but preserve recovery information.

**Why:** Surfacing expired deadline knowledge misleads users into thinking they can still act.

**Test:** Does the vault prevent expired deadlines from appearing in relevant queries? Is there a mechanism to archive or hide expired deadline knowledge?

**Implementation:**
- Hard deadlines: Remove from active index after expiration + 7 days
- Soft deadlines: Mark as expired but keep for recovery information
- Auto-archive with `status: deadline-expired` frontmatter

---

## Edge Cases

### Variable Schedules
Some recurring knowledge has variable timing (Easter, Ramadan, DST transitions).

```yaml
schedule-variable: true
schedule-calculation: "Third Sunday of March (US)"
variable-example: "2024: March 10, 2025: March 16"
```

### Multi-Year Cycles
Some knowledge operates on multi-year cycles (elections, census, license renewal).

```yaml
cycle-period: 4-years
full-cycle-phases:
  - primary-season
  - general-election
  - transition
  - administration
```

### Location-Dependent Schedules
Schedules vary by geography (fiscal year start: US Oct 1, UK April 1).

```yaml
jurisdiction: US
# or separate note for UK
```

### Schedule Changes
Organizations change schedules over time.

```yaml
schedule-history:
  - period: "Pre-2020"
    schedule: "April 15"
    note: "Before secure act"
  - period: "2020-present"
    schedule: "July 15"
    note: "Due to COVID, made permanent"
```

---

## Interaction with Existing Seed Rules

| Existing Rule | Relationship |
|---------------|---------------|
| Temporal Knowledge Handling | This extends from "capture point-in-time" to "capture recurring pattern" |
| Sequential Knowledge | Different: cyclical is repetition, not causal sequence |
| Note Lifecycle | Recurring notes need cycle-relative validity, not just time-based |
| Verification | Deadline verification = checking deadline hasn't passed |

---

## Test Cases

### Test 1: Building a Gardening Knowledge Base
An AI building a gardening vault with current Seed rules would:
- ✓ Create atomic notes on plants, techniques
- ✗ Not know to mark "tomato planting" as spring-only
- ✗ Might incorrectly flag spring advice as "stale" in fall

With these rules:
- Tomato planting tagged `temporal-type: cyclical`, `cycle-phase: dormant`, `next-relevant: 2027-04`
- Review triggered each March for spring planting update

### Test 2: Tax Knowledge Base
Current approach (problematic):
- Note: "Tax Filing Deadlines"
- Contains: "File by April 15"
- In November, AI surfaces this — **HARMFUL**

Deadline-aware approach:
```yaml
---
deadline-type: hard
deadline-date: 2026-04-15
status: active
---
# Federal Tax Filing Deadline

File by April 15, 2026

## If You Miss
- Late filing penalty: 5% per month
- File extension: Available until October 15
```
- After April 22: Note archived with `deadline-expired` tag
- Recovery information preserved

---

## Summary: One Rule to Rule Them All

**Rule:** Categorize all temporal knowledge by its recurrence pattern — static (never changes), sequential (progressive order matters), cyclical (recurs predictably), time-sensitive (changes over time), or deadline-driven (action required before specific date). Tag each with appropriate metadata and handle accordingly.

**Why:** Different temporal patterns require different handling. Treating all temporal knowledge the same (e.g., marking everything with an expiration date) loses the recurring nature of cyclical knowledge or creates harmful false currency with expired deadlines.

**Test:** For any temporal note: (1) Does it recur? (2) If yes, what's the pattern? (3) Does missing the time have consequences? (4) Is appropriate metadata present?

---

## Related Notes (Consolidated from Merged Notes)

- [[Handling Temporal Knowledge]] — covers time-sensitive and outdated knowledge
- [[Frontier Exploration - Timeline-Based Knowledge Structures]] — related: sequential temporal structures
- [[Seed Stress Test - Advisory Validity Tracking in Financial Planning]] — domain-specific deadline handling
- [[Frontier Exploration - Condition-Triggered Knowledge]] — related: when to apply knowledge

---

*This note was created by merging:*
- *Seed Gap - Recurring and Periodic Knowledge*
- *Frontier Exploration - Seasonal and Cyclical Knowledge*
- *Frontier Exploration - Deadline-Driven Knowledge*

*These three notes covered overlapping territory around temporal recurrence and were consolidated to eliminate redundancy while preserving all unique insights.*
