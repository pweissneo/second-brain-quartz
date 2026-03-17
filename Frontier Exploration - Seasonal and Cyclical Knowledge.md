---
last-reviewed: 2026-03-17
lifecycle: active
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - temporal
  - seasonality
  - cycles
---

# Frontier Exploration: Seasonal and Cyclical Knowledge

> How to handle knowledge that is relevant only during specific times of year or recurring cycles, distinct from linear temporal knowledge.

## The Problem

The Seed covers:
- **Time-sensitive data**: Stock prices, weather, news (changes linearly over time)
- **Static knowledge**: Facts that don't change (math, history)
- **Sequential knowledge**: Where order IS the knowledge (learning progressions)

But the Seed MISSES: **Cyclical knowledge** — knowledge that recurs in patterns but doesn't progress linearly. Examples:

- **Seasonal content**: Holiday recipes, winter sports, summer gardening
- **Recurring events**: Annual reviews, tax preparation, conference seasons
- **Environmental cycles**: Moon phases for astronomy, tide charts for sailing
- **Biological cycles**: Migratory patterns, breeding seasons, harvest times
- **Business cycles**: Quarterly planning, budget cycles, industry conferences
- **Personal cycles**: Birthday/anniversary reminders, annual goals, yearly reviews

## Why This Is Different from Time-Sensitive Data

Time-sensitive data flows in one direction (prices go up/down over time). Seasonal knowledge RECURS — the same knowledge becomes relevant again each cycle.

| Type | Direction | Example |
|------|-----------|---------|
| Time-sensitive | Linear | Stock price on March 17, 2026 |
| Sequential | Progressive | Learning prerequisites |
| Cyclical | Recurring | "Best cookies for holiday baking" |
| Static | None | Mathematical proofs |

## The Gap in Current Seed Rules

An AI building a knowledge base with current Seed rules would:
- ✓ Mark time-sensitive data with expiration
- ✓ Track sequential knowledge with prerequisites
- ✗ Not know how to handle "make this again next December" type knowledge
- ✗ Not distinguish cyclical from temporal
- ✗ May mark seasonal knowledge as "outdated" when it's actually just "not currently relevant"

## Key Questions for Seasonal Knowledge

1. **Does this knowledge expire or just become irrelevant temporarily?** 
   - "Tax deadline strategies" expires after April 15
   - "Holiday cookie recipes" becomes relevant again next year

2. **Is there a predictable recurrence pattern?**
   - Annual (same date each year)
   - Seasonal (solstice/equinox based)
   - Event-triggered (depends on external event)

3. **Does the knowledge change between cycles?**
   - Pure recurrence: Same knowledge works year after year
   - Evolving: Each cycle brings new information (new holiday trends)

## Proposed Seed Extension

### Rule: Tag cyclical knowledge with `temporal-type: cyclical`

```yaml
temporal-type: cyclical
cycle-period: annual|seasonal|monthly|custom
cycle-phase: active|dormant
next-relevant: YYYY-MM-DD
```

### Rule: Distinguish expiration from dormancy

- **Expired**: Knowledge is no longer accurate (superseded, wrong)
- **Dormant**: Knowledge is accurate but not currently applicable

```
| Status | Meaning | Action |
|--------|---------|--------|
| expired | Was correct, now wrong | Update or deprecate |
| dormant | Still correct, not now relevant | Reactivate at next cycle |
| cyclical | Recurs predictably | Track next relevant date |
```

### Rule: Create seasonal hub notes

For annual content, create hub notes that activate at relevant times:
```
Holiday Baking/
  ├── Holiday Baking (hub, activates November)
  ├── Thanksgiving Desserts (active: November)
  ├── Christmas Cookies (active: December)
  ├── Fourth of July (active: July)
```

### Rule: Use review triggers based on cycle, not time

Instead of "review every 30 days":
- Review tax knowledge annually in March
- Review gardening knowledge seasonally
- Review astronomy knowledge monthly for moon phase updates

## Test Case: Building a Gardening Knowledge Base

An AI building a gardening vault with current Seed rules would:
- ✓ Create atomic notes on plants, techniques
- ✓ Link seasonal information appropriately
- ✗ Not know to mark "tomato planting" as spring-only knowledge
- ✗ Might incorrectly flag spring advice as "stale" in fall
- ✗ Not create predictable activation/deactivation cycles

With cyclical knowledge rules:
- Tomato planting notes tagged `temporal-type: cyclical`, `cycle-phase: dormant`, `next-relevant: 2027-04`
- Review triggered each March for spring planting update
- Seasonal hub "Spring Gardening" activates each year

## Implementation

### Frontmatter for Cyclical Knowledge

```yaml
temporal-type: cyclical
cycle-period: annual|seasonal|quarterly|monthly
cycle-phase: active|dormant
peak-season: [season or date range]
next-relevant: YYYY-MM-DD
review-trigger: [month or event]
```

### Example Tags

| Knowledge | temporal-type | cycle-period | peak-season |
|-----------|---------------|--------------|-------------|
| Moon phases | cyclical | monthly | all |
| Tax strategies | cyclical | annual | March-April |
| Holiday recipes | cyclical | annual | November-December |
| Telescope targets | cyclical | seasonal | winter |
| Running training | cyclical | annual | spring/fall |

### Seasonal Hub Pattern

Create hub notes that shift "active" status:
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

## Questions This Raises

1. Should dormant notes be hidden from default searches?
2. How do you track evolution across cycles (e.g., new cookie trends)?
3. What's the right granularity for cycle periods?
4. How do multi-year cycles work (e.g., Olympic sports)?

## Related

- [[Handling Temporal Knowledge]] — Linear time-sensitive knowledge
- [[Frontier Exploration - Iterative Creative Knowledge]] — Cyclic evaluation patterns
- [[AI-Assisted Knowledge Management Seed]] — Core rules
- [[Domain-Specific Knowledge Bases]] — Domain-specific applications
