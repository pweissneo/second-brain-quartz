---
last-reviewed: 2026-03-17
confidence: emerging
lifecycle: active
author-type: ai-assisted
tags:
  - frontier-exploration
  - continuous-data
  - streaming
  - real-time
---

# Frontier Exploration: Continuous/Streaming Knowledge

> How should a knowledge base handle knowledge that updates continuously in real-time, not just periodically or on events?

## The Problem

The Seed addresses:
- **Static knowledge** — facts that don't change (principles, definitions, historical events)
- **Time-sensitive knowledge** — facts that expire after a period (news, trends, current prices)
- **Event-triggered knowledge** — knowledge that becomes relevant when specific conditions occur (trading strategies for market regimes)

The Seed does NOT address:
- **Continuous/streaming knowledge** — data that updates continuously in real-time (seconds or milliseconds)

Examples where this matters:
- IoT sensor data (temperature, humidity, pressure readings)
- Real-time financial data (price ticks, order book depth)
- Server/system metrics (CPU, memory, network traffic)
- Live sports scores and stats
- Weather station readings
- Scientific instrument data (telescope, lab equipment)

## Why This Is Different

| Type | Update Frequency | Storage Strategy |
|------|------------------|------------------|
| Static | Never | Store once |
| Time-sensitive | Periodic (hours/days) | Refresh on interval |
| Event-triggered | On condition change | Store state transitions |
| Continuous | Real-time (seconds/ms) | External storage, reference only |

Continuous data has unique properties:
1. **Volume** — too much to store as "notes"
2. **Currency** — "current" value is obsolete within seconds
3. **Purpose** — used for monitoring/alerting, not reference
4. **Authority** — the live source IS the truth, not a cached copy

## Gap Analysis

### Current Seed Coverage

The Seed addresses temporal knowledge through:
- Decay functions (time-sensitive knowledge)
- Review triggers (when to re-assess)
- Expiration intervals (when knowledge becomes stale)
- Point-in-time references (data with dates)

### What's Missing

1. **Reference vs. storage distinction** — When should knowledge link to external live sources vs. embed values?
2. **Freshness thresholds** — How fresh does "current" need to be for different use cases?
3. **Alert/notification integration** — How to handle knowledge that should trigger actions?
4. **Historical aggregation** — How to capture temporal patterns from continuous data?
5. **Visualization as knowledge** — How to represent patterns in continuous data?

## Proposed Rules

### Rule: Use external references for continuous data, not embedded values

**Rule:** For data that updates more frequently than daily, do not embed values in notes. Instead, link to live data sources and capture the knowledge ABOUT the data (patterns, thresholds, interpretation) separately.
**Why:** Embedding continuously-changing values creates maintenance burden, stale data, and false confidence. The live source is always more accurate.
**Test:** If a value changes more than weekly, is it a link to live data rather than an embedded value?

### Rule: Define freshness requirements by use case

**Rule:** Explicitly define acceptable data freshness for different knowledge types:
- **Monitoring/alerting**: Real-time (seconds)
- **Decision support**: Minutes to hours
- **Analysis/reporting**: Daily or weekly snapshots
- **Reference**: Point-in-time with date marked
**Why:** Different use cases have different freshness requirements. Without explicit thresholds, AI agents can't determine if data is "fresh enough."
**Test:** For each continuous-data note, can you state the freshness requirement?

### Rule: Capture pattern knowledge, not point-in-time values

**Rule:** For continuous data domains, capture the interpretive knowledge (thresholds, patterns, anomalies) rather than current values. Store historical aggregations separately from the knowledge base.
**Why:** Point-in-time values become obsolete; patterns and thresholds remain valid. The knowledge is "what to look for," not "what the reading is now."
**Test:** For a sensor-based note: Is the knowledge about interpreting patterns, not current readings?

### Rule: Use metadata for time-series references

**Rule:** When referencing continuous data in notes, use frontmatter to specify:
- `data-source:` — URL or API endpoint for live data
- `data-freshness:` — Maximum acceptable age (seconds/minutes/hours)
- `data-type:` — continuous | discrete | aggregated
- `historical-storage:` — where historical data is kept (not in vault)
**Why:** Explicit metadata enables AI agents to determine if referenced data meets freshness requirements.
**Test:** For continuous data references, is there metadata specifying source and freshness requirements?

### Rule: Separate alerting knowledge from monitoring knowledge

**Rule:** Distinguish:
- **Monitoring knowledge**: What the current value is (requires live source)
- **Alerting knowledge**: What conditions should trigger notification (thresholds, patterns)
- **Analysis knowledge**: What patterns emerge over time (requires historical data)
**Why:** Different knowledge types require different storage and retrieval strategies. Conflating them leads to inappropriate access patterns.
**Test:** Can you categorize continuous-data knowledge as monitoring/alerting/analysis?

## Test Case: Building a Home Automation Knowledge Base

An AI agent building a home automation KB faces decisions:

1. Should the note say "The living room is currently 72°F"?
   - Answer: No — link to the sensor API. Capture knowledge about: what temperature is comfortable, how HVAC responds, temperature patterns.

2. Should there be a note about "When temperature exceeds 78°F, turn on AC"?
   - Answer: Yes — this is alerting knowledge. Store as threshold + action rule.

3. How to capture knowledge about "temperature patterns over the day"?
   - Answer: This is analysis knowledge — reference historical data storage, capture interpretation patterns in the note.

## Questions This Raises

- How do you handle knowledge that's both continuous AND time-sensitive (stock prices that change AND have daily trends)?
- What's the boundary between "store in vault" vs "external reference"?
- How do you verify continuous data knowledge is still valid without checking every source?
- How do you handle knowledge derived from continuous data (aggregations, averages)?

## Related Notes

- [[Stress Test - Temporal Knowledge Rule in Stock Trading]] — Related but covers time-sensitive, not continuous
- [[Frontier Exploration - API and External Service Dependencies]] — Related but covers dependencies, not continuous data
- [[Knowledge Activation States]] — Could extend with "streaming" state
