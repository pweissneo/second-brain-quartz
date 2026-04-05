---
last-reviewed: 2026-04-05
lifecycle: seed-refinement-proposed
confidence: high
author-type: ai-assisted
gap-status: identified
gap-phase: discovery
gap-source: redundancy-scan-pivot
discovered: 2026-04-05
tags:
  - seed-refinement
  - redundancy-scan
  - structural-health
  - note-function
  - meta-notes
---

# Seed Refinement: Note-Function Taxonomy for Structural Health

**Source:** REDUNDANCY_SCAN → PIVOT to structural analysis - 2026-04-05
**Date:** 2026-04-05
**Method:** REDUNDANCY_SCAN (50%) → found no redundant pairs → pivoted

## Discovery Summary

Method: REDUNDANCY_SCAN
Action: Analyzed vault for duplicate content across ~350+ notes
Result: No redundancy found - existing merge patterns are working
Pivot: Analyzed structural patterns instead

**Finding:** The vault contains distinct note function types with different appropriate link densities:

| Function Type | Count | Avg Links | Current Issue |
|---------------|-------|-----------|---------------|
| Content notes | ~150 | 3-8 | Subject to 2+ rule correctly |
| Seed Gaps | 85 | 0-1 | False positives as orphans |
| Seed Refinements | 77 | 0-1 | False positives as orphans |
| Seed Stress Tests | ~60 | 0-1 | False positives as orphans |
| Frontier Explorations | ~130 | 0-1 | False positives as orphans |

Total: ~350+ notes incorrectly flagged by uniform link density rules.

## The Problem

The Seed's link density rule (line ~2101):
> Every note should link to at least 2 other notes.

This applies uniformly but fails for:
1. **Meta-documentation notes** - designed to reference Seed, not be referenced back
2. **Testing notes** - narrow scope, test specific rules, not general content
3. **Gap notes** - document what's missing, inherently point outward
4. **Refinement notes** - propose changes to existing rules

When running structural health checks, these get flagged as "orphans" or "low connectivity" - but they're functioning correctly FOR THEIR PURPOSE.

## Root Cause

Seed has:
- `note-type:` field (exploratory, reference, safety, foundational, specialized, filter)
- `note-type-aware` link density (different expectations by note type)

Missing:
- `note-function:` field for structural role (content vs meta-documentation)
- Filtering guidance for health checks

## Evidence

Previous audit (2026-04-04) via CLAUDE.md:
> Verified vault structural health: all notes have >=2 outgoing links or valid exemptions

But the "valid exemptions" are not explicitly defined in Seed - they're post-hoc justifications.

## Proposed Refinement

**Rule (REFINEMENT):** Apply note-function-aware link density - content notes require >=2 outgoing links, while meta-documentation notes (gaps, refinements, stress tests, frontier explorations) have 0-1 links by design.

**Why:** Uniform link requirements create false positives in health checks. Meta-documentation notes serve structural functions (documenting gaps, testing rules, proposing changes) not building interconnected content. Treating them the same prompts unnecessary refactoring.

**Test:**
1. Can you classify notes by function (content|gap-documentation|stress-test|refinement|frontier-exploration)?
2. Do health checks apply different link thresholds based on function?
3. Are meta-documentation notes exempted from standard 2-link requirement?

**Implementation:**

```yaml
note-function: content|gap-documentation|stress-test|refinement|frontier-exploration|hub
```

| Function | Min Links | Max Links | Rationale |
|----------|-----------|-----------|-----------|
| content | 2 | — | Core knowledge, interconnected |
| gap-documentation | 0 | 1 | References Seed, not referenced back |
| stress-test | 0 | 1 | Tests specific rules, narrow scope |
| refinement | 0 | 1 | Proposes changes, not general content |
| frontier-exploration | 0 | 1 | Explores new areas, experimental |
| hub | 5 | — | Aggregates and navigates |

**Relationship to existing note-type:**
- `note-type:` — content purpose (exploratory|reference|safety|foundational|specialized|filter)
- `note-function:` — structural role in vault

Both can coexist on a note.

## What I Learned

1. **Not all notes are content** — Vault has meta-notes that serve structural functions
2. **Uniform rules create false positives** — 2-link rule flags valid patterns as problems
3. **Health checks need filtering** — Skip low-link warnings for expected categories
4. **Seed already has note-type** — note-function complements, doesn't replace

## Related Notes

- [[Seed Refinement - Note-Type-Aware Link Density Rules]] — Related but more focused on note-type than function
- [[Seed Refinement - Note Function Classification for Link Requirements]] — Previous attempt (already committed but not integrated into Seed)
- [[Graph Maintenance]] — Graph health guidance
- [[AI-Assisted Knowledge Management Seed]] — Current link density rule (line ~2101)

---

*Discovery: 2026-04-05 heartbeat via REDUNDANCY_SCAN method. No redundant pairs found. Pivoted to structural analysis to find the note-function taxonomy gap.*
