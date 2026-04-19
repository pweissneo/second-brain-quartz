---
last-updated: 2026-04-19
lifecycle: seedling
confidence: emerging
author-type: ai-assisted
---

# Frontier Exploration - Real-Time vs Temporal Knowledge Distinction

## The Problem

Current Seed handles **temporal knowledge** (knowledge that changes over time with validity windows) and **API-dependent knowledge** (external data sources). But a gap exists for **real-time dynamic knowledge** — knowledge that changes continuously or near-continuously and requires different handling than either:

1. **Temporal knowledge with validity windows** ("As of March 2025, X was true")
2. **API-dependent knowledge** ("Current weather is fetched on demand")
3. **Real-time dynamic knowledge** — where staleness isn't binary (expired/valid) but Gradational, where the knowledge has an "update velocity" not just an expiration timestamp

## Use Case: Amateur Astronomy

In an amateur astronomy knowledge base:

| Knowledge Type | Examples | Current Seed Coverage |
|---------------|----------|----------------------|
| Temporal | "Best telescopes for beginners (2024 edition)" | ✓ Handled by temporal validity |
| API-dependent | "Tonight's weather forecast" | ✓ Handled by API-Dependent rules |
| Real-time dynamic | ISS pass timing (changes daily), satellite positions (changes hourly), meteor shower peak times (sub-hourly precision windows) | ⚠️ Gap — needs update velocity, not just validity window |

## Edge Cases

1. **Update velocity** — Some knowledge "goes stale" gradually, not all at once. ISS position data is accurate for ~minutes, weather for ~hours, seasonal patterns for ~months. Seed needs to capture "staleness gradient" not just binary validity.

2. **Critical update thresholds** — For time-critical knowledge (e.g., "when to go outside for meteor shower"), knowing something is "stale" isn't enough — knowing when it BECOMES stale is critical. Seed needs decision-action timestamps, not just validity windows.

3. **Multi-velocity knowledge** — A single note might contain multiple knowledge types with different update velocities:
   - Telescope specs (years)
   - Weather conditions (hours)
   - ISS pass times (minutes)
   Current Seed handles each type separately but doesn't address how to combine them in a coherent note.

## Proposed Seed Rule

**Rule:** For knowledge that changes continuously or near-continuously, apply **update velocity** tagging instead of static expiration:

```yaml
update-velocity: continuous|hourly|daily|weekly|monthly|yearly
critical-update-threshold: 15m  # When staleness affects decision quality
staleness-gradient: [10m, 30m, 1h, 6h]  # Levels at which knowledge degrades
action-trigger: "When to act on this knowledge"
```

**Why:** Binary expiration (valid/expired) fails for time-critical knowledge where the decision window is narrow. Knowing data is "valid" doesn't tell you when to act. Update velocity with gradient captures decision-relevant staleness.

**Test:** For time-critical knowledge: (1) Can you identify when to act vs. when to wait for update? (2) Is there explicit guidance on update frequency needed? (3) Does staleness affect decision quality gradationally or binarily?

## Related Notes

- [[Handling Temporal Knowledge]] — Temporal validity windows (different from update velocity)
- [[Frontier Exploration - API-Dependent Real-Time Knowledge Handling]] — External API knowledge
- [[Frontier Exploration - Time-Critical Knowledge]] — Time-sensitive decisions
- [[Frontier Exploration - Amateur Astronomy Knowledge Bases]] — Domain application
- [[Seed Gap - Time-Sensitive Knowledge Refresh Automation]] — Automation for refresh