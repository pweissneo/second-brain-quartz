---
last-reviewed: 2026-03-17
last-updated: 2026-03-17
confidence: emerging
lifecycle: evergreen
verification-status: verified
author-type: ai-assisted
tags:
  - frontier-exploration
  - knowledge-structure
  - context-dependence
---

# Frontier Exploration - Context-Gated Knowledge

> Knowledge that is factually correct but only applies in specific contexts.

## The Problem

Some knowledge is universally true (2+2=4, water boils at 100°C at sea level). But a lot of knowledge is **conditionally true** — it depends on context that may not be obvious:

- "The subway runs 24/7" — true in NYC, false in most cities
- "You need a visa for entry" — depends on your citizenship
- "This library works in browsers" — depends on build configuration
- "Annual pass includes free parking" — depends on which theme park

The Seed handles **condition-triggered knowledge** (when to apply knowledge) but not **context-gated knowledge** (when knowledge even applies).

## Why It Matters

Without explicit context gating:
1. **False applicability** — Users assume knowledge applies to them when it doesn't
2. **Silent failures** — Actions fail because preconditions aren't met
3. **Context blindness** — Notes don't signal what context is needed
4. **Transfer errors** — Knowledge that works in one context fails in another

## Types of Context Gates

### Geographic Gates
- Climate zone (frost dates, growing season)
- Local regulations (legal requirements, permits)
- Infrastructure availability (public transit, internet speed)

### Temporal Gates
- Time of day (store hours, peak hours)
- Season (weather-dependent activities)
- Year (version-specific knowledge, policy changes)

### Identity Gates
- Citizenship (visa requirements, tax treaties)
- Professional role (permissions, access levels)
- Personal attributes (age, health conditions)

### Technical Gates
- Tool version (API compatibility, software versions)
- Platform (OS, browser, device)
- Configuration (settings, environment variables)

### Resource Gates
- Budget tier (free vs paid features)
- Equipment (specialized tools needed)
- Access level (permissions required)

## Proposed Solution

### Frontmatter Fields

```yaml
context-gate: true
context-type: geographic|temporal|identity|technical|resource
context-conditions:
  - condition: "location"
    values: ["NYC Metro Area"]
    note: "Only applies to NYC subway"
  - condition: "api-version"
    values: [">=3.0", "<5.0"]
    note: "Endpoint added in 3.0, deprecated in 5.0"
```

### Rule for the Seed

**Rule:** Tag context-gated knowledge with explicit gate conditions — knowledge that is true but only applies in specific contexts must be labeled with `context-gate: true` and `context-conditions:` listing what must be true for the knowledge to apply.
**Why:** Without explicit context gates, users and AI agents assume applicability broader than warranted. Context-gated knowledge without tags leads to failed actions, false expectations, and transfer errors across contexts.
**Test:** For notes with context-dependent applicability: (1) Is there a `context-gate: true` tag? (2) Are all conditions explicitly listed in `context-conditions`? (3) Can a reader determine if this knowledge applies to them?

### Example Note Structure

```markdown
---
context-gate: true
context-type: geographic
context-conditions:
  - condition: "region"
    values: ["California", "Arizona", "Nevada"]
    note: "Drought restrictions vary by state"
---

# Watering Restrictions

In California, outdoor watering is restricted to 2 days per week...

## Context Requirements

- **Region:** Must be one of the listed states
- **Season:** Summer (restrictions lifted in winter)
- **Source:** Local water district regulations
```

## Distinction from Related Concepts

| Concept | Description | Handling |
|---------|-------------|----------|
| Condition-triggered | When to apply knowledge | Action triggers in note |
| Context-gated | Whether knowledge applies | Gate tags + conditions |
| Scope-limited | Whom knowledge applies to | Applicability tags |
| Time-stale | When knowledge expires | Review dates |

## Test Questions

1. Does this knowledge assume something about the reader's context?
2. Would this knowledge be false for someone in a different context?
3. Could following this knowledge fail due to unmet preconditions?
4. Does the knowledge depend on something the reader may not have?

If yes to any → consider context-gate tagging.

---

See also:
- [[Frontier Exploration - Condition-Triggered Knowledge]]
- [[Seed Gap - Recurring and Periodic Knowledge]] — Consolidated temporal knowledge guidance
- [[Domain-Specific Knowledge Bases]]
- [[Anti-Pattern - Missing Negative Knowledge]] (for counter-indications)
- [[Confidence Markers]] (for certainty levels)
