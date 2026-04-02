---
last-reviewed: 2026-04-02
lifecycle: seed-refinement
confidence: emerging
author-type: ai-assisted
verification-status: unverified
tags:
  - seed-refinement
  - maintenance
  - workflow
  - operations
  - integration
level: seed-refinement
---

# Seed Refinement: Operational Knowledge Maintenance Workflow

> Integration of operational maintenance workflow rules into the Seed (2026-04-02)

## Source

- [[Seed Gap - Operational Knowledge Maintenance Workflow]] — gap identified and analyzed

## Gap Summary

The Seed has rules for:
1. Maintenance burden evaluation (line ~839) — when to exclude volatile/low-utility knowledge
2. Evolution patterns — how knowledge changes over time
3. Version control — tracking change lineage for knowledge with dependencies

**What's missing:** Operational workflow — the systematic process of actually maintaining captured knowledge.

## Refinement: Operational Maintenance Workflow Rules

### New Rule: Systematic Maintenance Workflow

**Rule:** Establish a systematic maintenance workflow with scheduled review triggers, not just time-based staleness detection.

**Why:** The Seed covers staleness detection (30-day rule) but not the operational process of reviewing and updating knowledge. Without scheduled maintenance, even well-captured knowledge degrades over time.

**Test:** Does the vault have: (1) scheduled review triggers (time-based or usage-based)? (2) a decision framework for update/archive/delete? (3) maintenance batching strategy? (4) obsolete knowledge handling process?

**Integration:** Add to Seed section on "Knowledge Evolution & Maintenance" after the staleness detection rules (~line 868).

### New Rule: Maintenance Priority Based on Knowledge Characteristics

**Rule:** Prioritize maintenance effort based on: (1) dependency count (notes with more dependents need more careful updates), (2) volatility type (version-sensitive needs frequent review, stable needs rare review), (3) criticality (safety-critical requires rigorous maintenance, nice-to-have can be more casual).

**Why:** Not all knowledge needs equal maintenance. Resources should flow to high-dependency, high-volatility, high-criticality notes.

**Test:** Can you rank notes by maintenance priority? Do high-priority notes get more frequent reviews?

**Integration:** Add to Seed section on "Knowledge Evolution & Maintenance" as priority guidance.

### New Rule: Multiple Maintenance Review Triggers

**Rule:** Use multiple trigger types: time-based (per volatility type), usage-based (retrieval frequency), signal-based (external changes detected), and manual (user flags).

**Why:** Single time-based trigger misses knowledge that becomes obsolete between scheduled reviews or remains useful well past expected staleness.

**Test:** Does the vault use multiple trigger types? Can you identify what triggered each maintenance review?

**Implementation:**
```yaml
maintenance-triggers:
  time-based:
    version-sensitive: monthly
    price-sensitive: weekly
    technique-stable: quarterly
    principle-evergreen: annual
  usage-based:
    low-retrieval-90-days: deprioritize
    high-retrieval: prioritize
  signal-based:
    - version-tracker
    - price-feed
    - news-alert
  manual:
    - user-flag
```

## Integration with Existing Rules

The new rules integrate with existing Seed coverage:

| Existing Rule | Integration Point |
|---------------|-------------------|
| Maintenance burden evaluation (line 839) | Continue to exclude high-maintenance + low-utility at capture time |
| Evolution patterns (line 860) | Use pattern to determine review frequency |
| Version control (line 875) | Apply to high-dependency notes |
| Staleness detection | Complements with operational workflow |

## Decision Framework for Maintenance Actions

When maintenance review identifies needed updates:

| Condition | Action |
|-----------|--------|
| Content outdated but still accurate base | Update in-place, add changelog |
| Core principle changed (affects dependents) | Version note, update dependents, document rationale |
| Knowledge became obsolete | Mark deprecated, redirect to replacement |
| Knowledge no longer relevant | Archive (keep links) |
| Knowledge was always wrong | Delete (not just deprecate) |

## Maintenance Batching Strategy

For efficiency, batch maintenance by type:

- **Weekly:** Price-sensitive, time-sensitive knowledge verification
- **Monthly:** Version-sensitive technical knowledge, recent captures
- **Quarterly:** Technique-stable knowledge, general updates
- **Annually:** Principle-evergreen knowledge, schema review

## Test Updates

For Seed evaluation, add to maintenance-related tests:

1. Does the vault have scheduled review triggers?
2. Is there a decision framework for update/archive/delete?
3. Are maintenance triggers multi-type (time, usage, signal, manual)?
4. Is maintenance effort prioritized by dependency, volatility, criticality?
5. Can you identify what triggered each maintenance review?

## Related Notes

- [[Seed Gap - Operational Knowledge Maintenance Workflow]] — Original gap analysis
- [[AI-Assisted Knowledge Management Seed]] — Core rules (maintenance section ~line 839-880)
- [[Frontier Exploration - Knowledge Maintenance]] — Concept exploration
- [[Seed Gap - Knowledge Deprecation and Obsolescence Management]] — Complementary gap
- [[Note Lifecycle Management]] — Lifecycle stages for notes

---

**Status:** Refinement complete. Rule integration proposed. Ready for Seed update.

**Next Step:** Integrate rules into Seed file at maintenance section (~line 839-880).