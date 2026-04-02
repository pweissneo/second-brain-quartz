---
last-reviewed: 2026-04-02
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
gap-status: proposed
gap-priority: medium
gap-phase: implementation
gap-source: frontier-exploration
discovered: 2026-04-02
---

# Seed Gap: Personal Health Metrics and Body Knowledge Organization

## Gap Identification

The Seed lacks explicit guidance for organizing personal health metrics and body knowledge — distinct from general health knowledge or clinical guidelines. This creates:
- Inconsistent handling of time-series personal data
- No framework for privacy vs utility trade-offs
- No distinction between raw data and synthesized insights
- No self-referential verification criteria

## Related Notes

- [[Frontier Exploration - Personal Health Metrics and Body Knowledge]] — Detailed frontier analysis
- [[The Knowledge Portfolio]] — Personal-to-general ratio rules
- [[Note Lifecycle Management]] — Verification workflows
- [[Handling Temporal Knowledge]] — Time-series knowledge structures

## Proposed Rule

**Rule:** For personal health and body metrics knowledge, separate raw measurement data from synthesized insights, apply tiered sensitivity tagging (public/private/highly-sensitive), and use self-referential verification criteria that track data points (30+ for pattern confidence).

**Why:** Personal health data is highly sensitive, time-series data differs from atomic knowledge, and self-verification requires different criteria than source-based verification. The current Seed assumes external source verification, but personal health insights derive from self-observation.

**Test:**
1. Can you identify which notes are raw data vs synthesized insights?
2. Are sensitive notes appropriately tagged with `sensitivity:` field?
3. For pattern claims, do you have sufficient data points (30+) to claim confidence?
4. Are context factors documented alongside correlations?
5. Are goals distinguished from knowledge notes?

**Implementation:**
```yaml
knowledge-type: personal-health-metric
sensitivity-tier: public|private|highly-sensitive
data-status: raw-data|synthesis|insight
verification-mode: self-referential
data-points: number
context-factors: [relevant conditions]
goal-vs-knowledge: goal|knowledge
```

## Gap Status

- **Identified:** 2026-04-02 (via REDUNDANCY_SCAN → FRONTIER_EXPLORATION pathway)
- **Analyzed:** Front matter captured in [[Frontier Exploration - Personal Health Metrics and Body Knowledge]]
- **Proposed:** Rule drafted above

## Resolution Path

This gap can be resolved by:
1. Adding the proposed rule to the Seed's Foundation section
2. Creating example notes demonstrating the structure
3. Updating related notes (Personal Health Metrics frontier exploration) to reference the new rule

---

*Gap identified during 2026-04-02 heartbeat REDUNDANCY_SCAN. No redundant pairs found; explored frontier gaps instead.*