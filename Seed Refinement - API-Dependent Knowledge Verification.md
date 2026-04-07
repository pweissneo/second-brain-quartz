---
last-reviewed: 2026-04-06
lifecycle: seed-refinement
confidence: emerging
author-type: ai-assisted
verification-status: unverified
tags:
  - seed-refinement
  - knowledge-verification
  - api-dependent
  - real-time
schema-version: "1.0"
---

# Seed Refinement: API-Dependent Knowledge Verification

> Extending verification modality to handle knowledge requiring external API queries.

## Current Gap

The Seed includes `execution-type: api` in the tool-executable rule, but lacks a dedicated `verification-modality` for API-dependent knowledge. This creates inconsistency:
- Tool-executable knowledge has `verification-modality` options (passive, practice-required, hybrid, embodied)
- API-dependent knowledge is categorized as execution-type but lacks verification modality

## Proposed Seed Extension

**Rule (REFINED):** Extend verification-modality to include `api-dependent` — a distinct pathway for knowledge requiring external service queries to verify currency or accuracy.

**Why:** API-dependent knowledge has fundamentally different verification characteristics than passive, practice-required, or embodied knowledge:
- Staleness can be seconds (not days) — current != verified moments ago
- Verification requires external service availability, not just user capability
- Failure modes differ (service down, rate-limited, auth expired — not "haven't practiced yet")
- Caching is essential but introduces staleness risk

**Test:** For notes tagged with `verification-modality: api-dependent`:
1. Does frontmatter include `api-endpoint:` and `api-verification-type:`?
2. Is `last-api-check:` tracked with freshness threshold comparison?
3. Is there explicit handling for API failures (`api-fallback:`)?
4. Is stale-marked knowledge distinguishable from unverified?

## Implementation

```yaml
verification-modality: passive|practice-required|hybrid|embodied|api-dependent

# For api-dependent knowledge
api-endpoint: "https://api.example.com/status"
api-verification-type: availability|current-value|schema-valid|connectivity
last-api-check: 2026-04-06T10:00:00Z
api-freshness-threshold: 1h
api-fallback: use-cached|stale-mark|mark-unverified
api-status: reachable|unreachable|error|rate-limited
```

## Distinction from Existing Modalities

| Modality | Verification Method | Staleness Pattern | Failure Meaning |
|----------|-------------------|-------------------|------------------|
| passive | Source/document check | Days to months | "Haven't found time" |
| practice-required | User execution | Days to weeks | "Haven't practiced yet" |
| embodied | Sensory experience | N/A (physical) | "Haven't experienced" |
| tool-executable | Local command run | Hours to days | "Command failed locally" |
| **api-dependent** | External service query | **Seconds to hours** | **"Service unavailable"** |

## Integration with Existing Rules

This extends the tool-executable knowledge rule (line ~1236) by adding:
1. Freshness thresholds specific to external services (vs. local execution)
2. Failure handling for unreachable services (vs. local environment issues)
3. Staleness dating (vs. "last-executed" which implies local run time)

## Edge Cases

- **Rate limiting**: Include `api-rate-limit-reset:` for intelligent retry
- **Authentication**: Use reference to credentials in TOOLS.md, not stored API keys
- **Geographical variation**: Track `api-region:` if results vary by location
- **Cost tracking**: For paid APIs, include `api-cost-per-call:` for budget awareness
- **Privacy**: For endpoints that log queries, document what metadata is exposed

## See Also

- [[Frontier Exploration - Real-Time API-Dependent Knowledge]]
- [[Seed Rule - Tool-Executable Knowledge]]
- [[Seed Refinement - Verification Method Availability Tracking]]