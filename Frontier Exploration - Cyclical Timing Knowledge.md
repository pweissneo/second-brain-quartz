---
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
last-reviewed: 2026-03-24
verification-status: unverified
schema-version: "1.0"
level: principle
tags:
  - frontier-exploration
  - temporal
  - timing
  - cyclical
---

# Frontier Exploration - Cyclical Timing Knowledge

> Knowledge about optimal timing within recurring cycles — not when events occur, but when actions are most effective within a time period.

## The Gap

The Seed covers:
- Recurring events (schedules, calendars)
- Seasonal verification windows
- Time-sensitive data (rapidly changing values)

But the Seed lacks guidance on **cyclical timing knowledge** — knowledge about when within a cycle something is optimally done. This is distinct from:
- **Event timing**: When something happens (deadlines, schedules)
- **Duration timing**: How long something takes (intervals, rhythms)
- **Condition timing**: When conditions align for best results

## Why This Matters

Many domains have knowledge that depends on optimal timing within a cycle:

- **Productivity**: Cognitive peak times, creative windows, administrative slots
- **Cooking**: Humidity effects by season, ingredient ripeness cycles
- **Gardening**: Timing within growing season (not just planting dates)
- **Business**: Monthly/quarterly cycles affecting decisions
- **Health**: Circadian rhythms affecting medication, exercise, sleep
- **Learning**: Optimal review times within retention cycles

Without this guidance, AI agents capture timing knowledge as static facts ("best time is morning") rather than context-dependent patterns ("best time depends on cycle phase").

## Proposed Seed Rules

### Rule: Tag cyclical timing knowledge with phase dependency

For notes where timing affects outcomes, add `timing-dependency:` field:

```yaml
timing-dependency: phase-conditional  # vs. static-timing
cycle-type: circadian|weekly|monthly|quarterly|seasonal|annual
optimal-phase: "Description of when in the cycle"
phase-sensitivity: high|medium|low  # How much outcomes vary by timing
```

**Test:** For timing-related knowledge: (1) Does the optimal time depend on cycle phase? (2) Is the phase dependency documented? (3) Could someone determine phase sensitivity?

### Rule: Distinguish phase-dependent from phase-independent timing

Some timing is truly static ("cook for 20 minutes") — the clock time doesn't matter. Other timing depends on where you are in a cycle ("review at day 1, 3, 7" depends on when you started).

**Test:** For timing recommendations: (1) Is this tied to a specific clock time or to a cycle position? (2) If cycle-dependent, is the cycle start defined? (3) Does the recommendation work at any point in the cycle or only specific phases?

### Rule: Capture phase transition knowledge separately

Knowledge about transitioning between phases (dawn/dusk, seasonal transitions, month boundaries) often has unique characteristics.

**Test:** For notes about timing: (1) Is this about a phase transition? (2) Does transition knowledge have different validity than steady-state timing? (3) Are transition windows documented with their unique properties?

### Rule: Track cycle alignment requirements

Some knowledge requires multiple cycles to align:
- Specific day-of-week + time-of-year
- Moon phase + tide cycle
- Quarterly results + annual planning

**Test:** For complex timing: (1) How many cycles must align? (2) Is each cycle tracked separately? (3) Can you calculate the next alignment window?

## Example: Productivity Timing Knowledge

Instead of capturing "morning is best for creative work" as a static fact:

```yaml
timing-dependency: phase-conditional
cycle-type: circadian
optimal-phase: "90 minutes after natural waking; before first coffee"
phase-sensitivity: high
context-factors:
  - sleep-quality-previous-night
  - chronotype
```

This captures that timing depends on individual cycle position, not clock time.

## Example: Cooking Seasonality Knowledge

```yaml
timing-dependency: phase-conditional  
cycle-type: seasonal
optimal-phase: "Low humidity months (Nov-Feb in Northern Hemisphere)"
phase-sensitivity: medium
context-factors:
  - geographic-location
  - kitchen-climate-control
```

This captures that baking timing depends on seasonal conditions, not just a fixed calendar window.

## Domains Where This Matters Most

1. **Productivity/Performance**: Task timing, energy management
2. **Agriculture/Horticulture**: Growth timing, harvest windows
3. **Cooking/Baking**: Environmental cooking conditions
4. **Business/Finance**: Cycle-based decision timing
5. **Health/Fitness**: Circadian-aligned activities
6. **Learning/Memory**: Spacing and review timing

## Edge Cases

- **Individual variation**: Chronotypes, personal cycles differ — tag with `individual-variation: high`
- **Multiple overlapping cycles**: May need tracking of each separately with alignment calculation
- **Phase transitions**: Often have unique properties (dawn, equinox, month boundaries)
- **Phase shift adaptation**: When cycles change (travel, daylight savings) — track transition knowledge

## Related Seed Rules

- [[Seed Gap - Recurring and Periodic Knowledge]]
- [[AI-Assisted Knowledge Management Seed#Edge case (NEW - 2026-03-18): In domains with seasonal or cyclical verification constraints]]
- [[Frontier Exploration - Context-Gated Knowledge]]

---

*This note captures a frontier gap in the Seed for cyclical timing knowledge — knowledge about optimal timing within recurring cycles, distinct from event timing and duration timing.*

## Related

- [[_root]]
- [[Seed Gap - Recurring and Periodic Knowledge]]
- [[AI-Assisted Knowledge Management Seed]]
- [[Frontier Exploration - Context-Gated Knowledge]]
