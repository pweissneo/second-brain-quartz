---
last-reviewed: 2026-04-05
lifecycle: seed-refinement
confidence: high
author-type: ai-assisted
gap-status: identified
gap-phase: discovery
gap-source: structural-health
discovered: 2026-04-04
resolved-date: 2026-04-05
status: ready-for-integration
tags:
  - seed-refinement
  - structural-health
  - note-classification
  - link-requirements
---

# Seed Refinement: Note Function Classification for Link Requirements

**Source:** REDUNDANCY_SCAN → Structural Health Check - 2026-04-04
**Date:** 2026-04-04
**Method:** REDUNDANCY_SCAN found no redundant pairs, pivoted to structural analysis

## Discovery

During redundancy scanning, I analyzed hundreds of notes to find duplicate content. No redundancy was found, but structural health analysis revealed the Seed's uniform link requirements create false positives for non-content note types.

### The Issue

The Seed's 2+ outgoing links rule (line ~300) applies uniformly to ALL notes:
> **Implementation:** Every note should link to at least 2 other notes.

However, the vault contains fundamentally different note types that have different appropriate link densities:

| Note Type | Count | Typical Link Count | Should They Have >=2? |
|-----------|-------|-------------------|----------------------|
| Content notes | ~350 | 2-10 | Yes |
| Seed Gaps | ~83 | 0-1 | No — they document missing rules |
| Seed Refinements | ~75 | 0-1 | No — they propose changes |
| Frontier Explorations | ~130 | 0-1 | No — they explore new areas |
| Seed Stress Tests | ~60 | 0-1 | No — they test specific rules |

When running structural health checks, ~80-100 notes are flagged as "low connectivity" or "orphans" — but most are functioning correctly for their note type. They reference the Seed but aren't referenced back because they document gaps, not content.

## Root Cause

The Seed has edge case exemptions for "specialized" and "foundational" notes but doesn't explicitly account for:
- **Gap documentation notes** — designed to reference the Seed, not be referenced
- **Stress tests** — narrow domain focus, not general reference points
- **Refinements** — propose changes to specific rules

## The Gap

**What's missing from Seed:**
- No explicit note-function taxonomy for structural role
- No differentiated link thresholds for non-content notes
- No guidance on filtering health checks by note type

## Proposed Seed Rule Addition

**Rule:** Apply note-function-aware link density — content notes require >=2 outgoing links, while gap documentation notes, refinements, and stress tests have 0-1 links by design.

**Why:** Uniform link requirements incorrectly flag structural components as unhealthy. Gap documentation and stress tests serve meta-functions (documenting gaps, testing rules) not building interconnected content. Treating them the same creates noise in health checks and may prompt unnecessary refactoring.

**Test:** 
1. Can you classify notes by function (content|gap-documentation|stress-test|refinement)?
2. Do health checks apply different thresholds based on function?
3. Are gap/refinement/stress-test notes exempted from standard link count requirements?

**Implementation:**

```yaml
note-function: content|gap-documentation|stress-test|refinement|hub
```

| Function | Min Links | Max Links | Rationale |
|----------|-----------|-----------|-----------|
| content | 2 | — | Core knowledge interconnected |
| gap-documentation | 0 | 1 | References Seed, not referenced back |
| stress-test | 0 | 1 | Tests specific rules, narrow scope |
| refinement | 0 | 1 | Proposes changes, not general content |
| hub | 5 | — | Aggregates and navigates |

**Relationship to existing note-type:**
- `note-type:` (exploratory|reference|safety|foundational|specialized|filter) — content purpose
- `note-function:` — structural role in vault

Both can coexist: a note can be `note-type: exploratory` AND `note-function: gap-documentation`.

## What I Learned

1. **Not all notes are content** — The vault has meta-notes (gaps, refinements, tests) that serve structural functions
2. **Uniform rules create false positives** — The 2-link rule flags valid patterns as problems
3. **Health checks need filtering** — Skip low-link warnings for expected categories
4. **The Seed already has note-type** — Adding note-function complements rather than replaces

This insight came from analyzing ~80 notes flagged as "orphans" that were actually functioning correctly:
- 20 Seed Gaps — document missing rules
- 30 Seed Refinements — propose rule changes  
- 15 Seed Stress Tests — test rules in specific domains
- 15 Frontier Explorations — explore new areas

## Related Notes

- [[Seed Refinement - Note-Type-Aware Link Density Rules]] — Related but more focused on note-type than function
- [[Seed Development Hub]] — Refinement tracking
- [[Graph Maintenance]] — Graph health guidance
- [[AI-Assisted Knowledge Management Seed]] — Current note-type implementation (line ~2101)

---

*Refinement generated during 2026-04-04 heartbeat via REDUNDANCY_SCAN method. No redundant pairs found, but structural analysis revealed Seed gap.*