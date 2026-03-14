---
last-reviewed: 2026-03-12
lifecycle: draft
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - real-time-knowledge
  - sensor-data
  - iot
level: principle
---

# Frontier Exploration - Real-Time and Sensor-Based Knowledge

> How do we capture knowledge that is continuously updating from live data streams?

## The Problem

The Seed handles static knowledge well — notes that capture a point-in-time understanding and can be reviewed periodically. But some knowledge domains are fundamentally **continuous** rather than **discrete**:

- **IoT/Smart home**: Current temperature, occupancy status, energy usage
- **Personal biometrics**: Heart rate, sleep stages, activity levels from wearables
- **Environmental monitoring**: Air quality, weather stations, seismic data
- **Financial data**: Stock prices, cryptocurrency rates, commodity prices
- **Server metrics**: CPU usage, network traffic, service health
- **Scientific instrumentation**: Telescope feeds, particle detectors, climate sensors

This is different from:
- **Temporal knowledge**: Events that happened in sequence (historical)
- **Time-sensitive data**: Data that changes but can be snapshot-captured
- **Version-scoped knowledge**: Software versions that change but on defined schedules

Real-time knowledge is **inherently incomplete** — by the time you finish reading this sentence, the data may have changed.

## Current Seed Gaps

1. **No guidance on storing vs linking live data** — When should sensor data be embedded vs linked to a live source?
2. **No guidance on data freshness requirements** — How recent must "current" data be to be useful?
3. **No guidance on historical aggregation** — How to capture trends from continuous data without storing every data point?
4. **No guidance on sensor reliability** — How to handle knowledge from fallible sensors?
5. **No guidance on location-specific data** — GPS coordinates, room-specific sensors, device-specific readings
6. **No guidance on personal biometric knowledge** — Health data that is personal, sensitive, and continuously streaming

## Questions an AI Agent Would Have

An AI building a knowledge base about "my home" or "my health" using only current Seed rules would struggle with:

1. Should I store the current temperature as a note, or link to the thermostat API?
2. How often should I snapshot my heart rate data? Hourly? Daily? Weekly?
3. What do I do when a sensor goes offline — mark the data as stale?
4. How do I handle conflicting readings from two sensors in the same room?
5. Should biometric data even be in the knowledge base, or is it "raw data"?

## Domains Where This Matters Most

- **Personal knowledge management**: Health trackers, smart home data, fitness logs
- **Research**: Scientific instrumentation, environmental monitoring, astronomical data
- **Operations**: Infrastructure monitoring, service health, security systems
- **Finance**: Real-time market data, cryptocurrency, commodity prices

## Emerging Rule Suggestions

### Rule: Distinguish raw data streams from synthesized knowledge

**Why:** Raw sensor data (temperature readings every minute) is not knowledge. Aggregated insights ("the bedroom is typically 5°F warmer than the living room") IS knowledge. Don't pollute the vault with unprocessed data.

**Test:** Can you state the insight, not just the data point? If the note only contains numbers without interpretation, it's raw data, not knowledge.

### Rule: Store insights, link to live sources

**Why:** Embedding live data creates stale notes. Linking to APIs/dashboards keeps data fresh. Store the synthesized insight ("office gets too hot in the afternoon") as a note; link to the temperature sensor for current readings.

**Test:** Does the note capture a pattern or insight that would remain true even if the live source went offline?

### Rule: Define freshness requirements based on use case

**Why:** "Current temperature" for comfort is different from "current heart rate" for medical monitoring. Define acceptable staleness based on what decisions the knowledge supports.

**Test:** Can you state: (1) What decision does this knowledge support? (2) How stale can it be before it's useless?

### Rule: Handle sensor fallibility explicitly

**Why:** Sensors fail, drift, and disagree. Knowledge derived from sensors should acknowledge uncertainty.

**Test:** For sensor-derived knowledge: (1) Is sensor reliability documented? (2) Are there known failure modes? (3) Is there a fallback source or manual verification method?

### Rule: Aggregate temporal data into meaningful periods

**Why:** Storing every data point creates noise. Aggregating into daily/weekly/monthly summaries captures trends without overwhelming the vault.

**Test:** Can you identify meaningful time periods for aggregation? ("Morning rush hour" is more useful than "6:00 AM" for traffic patterns)

### Rule: Separate personal biometric data with explicit consent and security considerations

**Why:** Health data is sensitive. Personal knowledge bases may contain data that could harm the individual if exposed. Separate storage, encryption, and access controls may be warranted.

**Test:** For biometric data: (1) Is the data source secure? (2) Who has access? (3) What harm could result from exposure?

### Rule: Use point-in-time references with timestamps for historical data

**Why:** "The temperature was 72°F" is meaningless without a timestamp. Always include when the reading was taken.

**Test:** Does every sensor data point include a timestamp? Can you distinguish "current" from "historical" at a glance?

## Test Case: Building a Smart Home Knowledge Base

An AI building a knowledge base about "my smart home" using only current Seed rules would:
- ✓ Create atomic notes for each room/concept
- ✓ Link related notes together
- ✓ Track confidence and verification status
- ✗ Not know whether to store current temperature readings or link to sensors
- ✗ Not know how to handle conflicting sensor readings
- ✗ Not know how to balance real-time data vs synthesized insights
- ✗ Not distinguish between "current state" (ephemeral) and "patterns" (knowledge)

## Related

- [[Handling Temporal Knowledge]] — Related but covers events in sequence, not continuous streams
- [[Frontier Exploration - User Situational Constraints]] — May include time/equipment constraints
- [[Stress Test - Temporal Knowledge Rule in Stock Trading]] — Similar challenge in financial domain
- [[Handling Temporal Knowledge]] — Point-in-time capture strategies
