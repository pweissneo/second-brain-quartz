---
last-reviewed: 2026-04-02
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
tags:
  - seed-gap
  - maintenance
  - workflow
  - operations
gap-status: analyzed
gap-priority: high
gap-phase: implementation
gap-source: frontier-exploration
discovered: 2026-04-02
analyzed: 2026-04-02
analysis-conclusion: "Clear operational gap in Seed - rules exist for maintenance burden evaluation and version control, but no guidance on operational maintenance workflow. Ready for proposed rule integration."
---

# Seed Gap: Operational Knowledge Maintenance Workflow

**Source:** FRONTIER_EXPLORATION heartbeat (2026-04-02)

## The Gap

The Seed contains rules for:
1. **Maintenance burden evaluation** (line ~839) — when to exclude volatile/low-utility knowledge
2. **Evolution patterns** — how knowledge changes (discrete, slow, cyclical, deepening)
3. **Version control** — tracking change lineage for knowledge with dependencies

**What's missing:** Operational workflow for actually maintaining captured knowledge — the systematic process of:
- Which notes need review and when
- What triggers a maintenance review
- How to decide between update, archive, or delete
- Maintenance batching and scheduling

## Current Seed Coverage (Incomplete)

The Seed references [[Frontier Exploration - Knowledge Maintenance]] in two places (lines 850, 868), but:
- The frontier exploration explains the concept, not the operational process
- No explicit rule provides maintenance workflow guidance
- No test exists for evaluating whether the vault has an operational maintenance system

## Where AI Gets Stuck

When applying Seed rules to an established vault (100+ notes):

1. **Maintenance scheduling** — The Seed says "exclude high-maintenance knowledge" but once captured, how do we systematically schedule reviews?
2. **Review triggers** — What indicators should prompt a maintenance review? (time-based? usage-based? staleness signals?)
3. **Decision framework** — For notes needing updates: when to update in-place vs. create new version vs. archive vs. delete?
4. **Maintenance batching** — Can maintenance be batched (e.g., "review all technical notes monthly") or must it be ad-hoc?
5. **Obsolescence handling** — Beyond "mark as deprecated," what's the operational process for knowledge that's become obsolete?

## Proposed Seed Rules

### Rule: Operational Knowledge Maintenance Workflow

**Rule:** Establish a systematic maintenance workflow with scheduled review triggers, not just time-based staleness detection.

**Why:** The Seed covers staleness detection (30-day rule) but not the operational process of reviewing and updating knowledge. Without scheduled maintenance, even well-captured knowledge degrades over time.

**Test:** Does the vault have: (1) scheduled review triggers (time-based or usage-based)? (2) a decision framework for update/archive/delete? (3) maintenance batching strategy? (4) obsolete knowledge handling process?

### Rule: Maintenance Priority Based on Knowledge Characteristics

**Rule:** Prioritize maintenance effort based on: (1) dependency count (notes with more dependents need more careful updates), (2) volatility type (version-sensitive needs frequent review, stable needs rare review), (3) criticality (safety-critical requires rigorous maintenance, nice-to-have can be more casual).

**Why:** Not all knowledge needs equal maintenance. Resources should flow to high-dependency, high-volatility, high-criticality notes.

**Test:** Can you rank notes by maintenance priority? Do high-priority notes get more frequent reviews?

### Rule: Maintenance Review Triggers

**Rule:** Use multiple trigger types: time-based (per volatility type), usage-based (retrieval frequency), signal-based (external changes detected), and manual (user flags).

**Why:**单一 time-based trigger misses knowledge that becomes obsolete between scheduled reviews or remains useful well past expected staleness.

**Test:** Does the vault use multiple trigger types? Can you identify what triggered each maintenance review?

## Implementation Options

### Option A: Scheduled Batch Maintenance

```yaml
maintenance-schedule:
  version-sensitive: monthly
  price-sensitive: weekly
  technique-stable: quarterly
  principle-evergreen: annual
```

### Option B: Event-Driven Maintenance

```yaml
maintenance-triggers:
  - type: time-based
    interval: per volatility-type
  - type: usage-based
    threshold: low-retrieval-90-days -> deprioritize
  - type: signal-based
    source: version-tracker|price-feed|news-alert
  - type: manual
    trigger: user-flag
```

### Option C: Hybrid

Combine scheduled batches for routine maintenance with event-driven triggers for high-priority changes.

## Related Notes

- [[AI-Assisted Knowledge Management Seed]] — Maintenance burden rule (line ~839)
- [[Frontier Exploration - Knowledge Maintenance]] — Concept exploration
- [[Seed Gap - Knowledge Deprecation and Obsolescence Management]] — Complementary gap
- [[Seed Stress Test - Maintenance Burden Rule in Cooking]] — Domain-specific test

---

**Discovered by:** heartbeat-2026-04-02
**Method:** FRONTIER_EXPLORATION — examined Seed rules for maintenance coverage