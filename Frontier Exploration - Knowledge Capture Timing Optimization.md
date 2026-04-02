---
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
last-reviewed: 2026-03-27
verification-status: unverified
schema-version: "1.0"
level: principle
tags:
  - frontier-exploration
  - capture-timing
  - knowledge-lifecycle
  - temporal
---

# Frontier Exploration - Knowledge Capture Timing Optimization

> Knowledge about when within a domain's temporal cycle it is optimal to capture knowledge — distinct from when to verify or when to review.

## The Gap

The Seed covers:
- **Verification timing** (when to check if knowledge is correct)
- **Review timing** (when to revisit notes for currency)
- **Recurring knowledge** (knowledge about recurring patterns)
- **Cyclical timing** (optimal timing within cycles)

But the Seed lacks guidance on **capture timing** — when during a domain's natural cycle is the best moment to capture knowledge. This is distinct from:
- **Event timing**: When something happens
- **Verification timing**: When to check accuracy
- **Review timing**: When to refresh knowledge
- **Usage timing**: When knowledge is needed

## Why This Matters

In many domains, knowledge is easiest to capture and most accurate when captured at specific moments in the domain's natural cycle:

- **Home repair/DIY**: Capture lessons immediately after project completion while details are fresh — wait a month and critical context (exact measurements, specific challenges, material brands) is lost
- **Cooking**: Capture recipe insights while cooking — the "why" behind adjustments is only accessible during execution
- **Gardening**: Capture planting/growing observations during the season — capture in winter and you forget micro-decisions made during planting
- **Fitness**: Capture workout insights within 24 hours — session-specific fatigue and progress context evaporates quickly
- **Music practice**: Capture technique insights during or immediately after practice — the "feel" of what worked is only accessible in that moment
- **Travel**: Capture experiences while still in location — context and sensory detail degrade rapidly after return

The pattern: **Perishable context** — knowledge that depends on being present during the experience. The Seed's "capture first, process second" assumes capture happens, but doesn't address WHEN capture yields highest-quality knowledge.

## What the Seed MISSES

### 1. Capture Window Awareness

No rule for recognizing when knowledge is "fresh" vs "stale" in the domain sense. A recipe captured 3 months after cooking loses:
- Specific adjustments made during cooking
- Why certain steps were modified
- What worked that wasn't in the original recipe

**Gap:** No guidance on determining domain-specific "capture windows" — how long after an experience does knowledge become "stale" for capture purposes?

### 2. Context Degradation Tracking

No rule for tracking how quickly context degrades in different domains. Some knowledge:
- Degrades in hours (workout feel, session-specific insights)
- Degrades in days (recipe details, project decisions)
- Degrades in weeks (gardening observations)
- Degrades in months (travel experiences)

**Gap:** No framework for AI agents to assess "capture urgency" based on domain-specific context degradation rates.

### 3. Proactive Capture Prompts

The Seed assumes capture happens but doesn't prompt AI agents to capture at optimal moments. For example:
- After a project completes (home repair, crafts)
- During specific seasonal phases (gardening)
- Within a time window after events (workouts, meals)
- During the experience itself (travel, experiments)

**Gap:** No rule for AI agents to recognize optimal capture moments within domain cycles.

### 4. Capture vs. Verification Timing Distinction

The Seed conflates "when to verify" with "when to capture" in some cases. But:
- **Capture timing**: When the knowledge is most accessible to capture
- **Verification timing**: When the knowledge can be confirmed as accurate

A gardening note captured in winter might be verifiable in summer. The Seed covers verification windows but not capture windows.

**Gap:** No explicit distinction between capture windows and verification windows.

## Proposed Seed Rules

### Rule: Identify domain-specific capture windows

For each domain, determine the optimal moment to capture knowledge:

```yaml
capture-window: true
window-type: during-execution|immediate-post|seasonal|event-triggered
optimal-capture-moment: "Description of when capture is highest quality"
window-duration: hours|days|weeks|season  # How long window stays open
degradation-rate: fast|medium|slow  # How quickly context degrades
```

**Test:** For knowledge from experiences: (1) Can you identify when it was captured? (2) Is capture timing within the optimal window? (3) Has context degraded since?

### Rule: Track capture timestamp vs. experience timestamp

Separate:
- **Experience timestamp**: When the actual event occurred
- **Capture timestamp**: When the knowledge was recorded

```yaml
experience-date: 2026-03-15
captured-date: 2026-03-16
capture-latency: 1 days  # How long after experience
capture-window-optimized: true|false  # Was capture in optimal window?
```

**Test:** For knowledge from experiences: (1) Are both timestamps present? (2) Was capture within the optimal window? (3) Does capture latency indicate context degradation?

### Rule: Flag late-capture notes for quality review

When capture happens outside optimal window, flag for reduced confidence:

```yaml
capture-quality: high|medium|low
capture-outside-window: true
context-degradation-likely: true
```

**Test:** For notes from experiences: (1) Is capture quality assessed? (2) Are notes captured outside optimal window flagged? (3) Does content include the details that degrade over time?

### Rule: Proactive capture at domain transition points

AI agents should prompt for capture at natural domain transitions:
- Project completion (home repair, crafts)
- Season transitions (gardening)
- Session end (fitness, practice)
- Location departure (travel)

```yaml
capture-trigger: project-complete|season-end|session-end|location-departure
auto-prompt-enabled: true
```

**Test:** For domain notes: (1) Are capture triggers identified? (2) Does the vault have notes captured at natural transition points? (3) Is there a mechanism for proactive capture prompts?

## Domain-Specific Capture Windows

### Home Repair/DIY
- **Optimal window**: Within 1-3 days after project completion
- **Context that degrades**: Exact measurements, specific product brands, challenges faced, solutions found
- **Trigger**: Project "complete" status

### Cooking
- **Optimal window**: During cooking or immediately after (within 1-2 hours)
- **Context that degrades**: "Why" behind modifications, sensory assessments, timing adjustments
- **Trigger**: Meal completion

### Gardening
- **Optimal window**: During the growing season, within days of observation
- **Context that degrades**: Micro-decisions made during planting/growing, weather-specific observations
- **Trigger**: Observation + seasonal phase

### Fitness
- **Optimal window**: Within 24 hours of session
- **Context that degrades**: Session-specific fatigue, progress feeling, workout quality
- **Trigger**: Session completion

### Music Practice
- **Optimal window**: During or immediately after practice (within 30 minutes)
- **Context that degrades**: "Feel" of what worked, physical sensations, breakthrough moments
- **Trigger**: Practice session end

### Travel
- **Optimal window**: While still in location or within 1-2 days of return
- **Context that degrades**: Sensory details, specific interactions, location-specific recommendations
- **Trigger**: Location departure

### Research/Experiments
- **Optimal window**: Within the session or immediately after
- **Context that degrades**: Exact conditions, observations, decisions made during process
- **Trigger**: Experiment session end

## Integration with Existing Rules

This gap intersects with:
- **[[Seed Gap - Recurring and Periodic Knowledge]]** — Recurring knowledge has natural capture windows tied to cycles
- **[[Frontier Exploration - Cyclical Timing Knowledge]]** — Capture timing is phase-dependent
- **[[Note Lifecycle Management]]** — Capture timing affects note birth quality
- **[[Seed Stress Test - Embodied Knowledge Rule]]** — Embodied knowledge requires capture during/close to experience

## Proposed Seed Addition

Add to Foundation section:

> **Rule:** Capture domain knowledge during optimal capture windows — when the knowledge is most accessible and context is fresh.
> **Why:** In many domains, knowledge can only be captured accurately within a specific time window after the experience. Waiting loses critical context that cannot be reconstructed later.
> **Test:** For knowledge from experiences: (1) Is capture timestamp recorded? (2) Was capture within the domain-specific optimal window? (3) Does the content include perishable context details?

---

*This note captures a frontier gap in the Seed for knowledge capture timing — when during a domain's natural cycle is the best moment to capture knowledge for accuracy and completeness.*