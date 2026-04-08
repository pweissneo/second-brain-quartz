---
last-reviewed: 2026-04-08

lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
gap-status: integrated
gap-priority: medium
gap-phase: implementation
gap-severity: nice-to-have
gap-source: frontier-exploration
discovered: 2026-04-04
resolved: 2026-04-04
integrated: 2026-04-04
resolution-type: rule-integration
integrated-into: AI-Assisted Knowledge Management Seed.md
integration-details: "Rule added at line ~1595: Apply explicit deletion criteria for low-value notes"
title: "Seed Gap - Note Deletion Criteria"
tags:
  - seed-gap
  - note-lifecycle
  - vault-maintenance
---

# Seed Gap - Note Deletion Criteria

## Problem Statement

The Seed covers when to deprecate notes (mark as superseded with pointer to replacement), but provides limited guidance on when complete deletion is appropriate. The current lifecycle rules emphasize preservation (never delete, just deprecate), but this creates accumulation of low-value notes that bloat the vault without providing proportional knowledge value.

## Current Gap in Seed

The Seed covers:
- ✅ Note lifecycle stages (draft → active → evergreen → deprecated)
- ✅ Correction handling (mark as incorrect, not delete)
- ✅ Deprecation criteria (contradicted, redundant, outdated, low value)
- ❌ Deletion criteria (when is removal better than preservation?)
- ❌ Low-value note removal protocol (how to safely delete without breaking graph)
- ❌ Orphan handling (notes with no links - merge/reconnect vs delete)

## Why This Matters

1. **Vault bloat:** Notes that pass initial capture but provide minimal utility accumulate over time
2. **Search noise:** Low-value notes appear in results, reducing effective retrieval
3. **Maintenance burden:** Every note requires some maintenance (review cycles, link checking)
4. **Graph health:** Orphan notes that can't be reconnected may be better removed than preserved

## Proposed Rule Addition

**Rule:** Apply explicit deletion criteria when deprecation would preserve low-value content — delete notes that have no current utility, no historical value, no reconnection potential, and where deprecation adds maintenance burden without commensurate benefit.

**Why:** Deprecation assumes someone might reference the note later. When a note has zero incoming links, no historical significance, no reconnection pathway, and would require ongoing maintenance (version updates, link checking), deletion preserves vault clarity better than marking it deprecated.

**Test:** Can you identify notes that meet ALL deletion criteria (no links, no historical value, no reconnection, maintenance burden > utility)? Are these explicitly handled differently from deprecated notes?

**Implementation:**
```yaml
deletion-candidates:
  - criteria: "zero-incoming-links AND no-historical-value AND no-reconnection-potential"
  - criteria: "duplicate-without-merge-value"
  - criteria: "contradicted-not-just-outdated AND replacement-exists"
```

## Deletion Criteria

A note is a deletion candidate when ALL of these are true:
1. **No incoming links** (0 backlinks, not just low)
2. **No historical value** (not a record of what you thought, just redundant)
3. **No reconnection potential** (can't be linked to active content)
4. **Maintenance burden > utility** (requires upkeep, provides no current value)

Or when ANY of these are true:
- **True duplicate:** Another note covers identical content with no unique value
- **Factually incorrect AND correction lost:** Not just outdated, but wrong AND the correction provides no value
- **Violates privacy:** Contains sensitive info about living individuals without consent
- **Ephemeral by design:** Meeting notes, temporary scratch notes with no long-term value

## Distinction from Deprecation

| Scenario | Action |
|----------|--------|
| Note was correct, now superseded by better note | Deprecate (preserve history) |
| Note was correct, context changed, might be useful later | Archive (mark as-of) |
| Note has 0 links, no historical significance, no future use | Delete (remove noise) |
| Note is factually wrong, correction captured elsewhere | Delete (preserve correction, not error) |

## Verification

After deletion:
1. Verify no broken links remain in vault
2. Check if any hub notes lost significant connections
3. Document what was deleted and why (for learning)

## Edge Cases

- **Protected notes:** Never delete notes with `protected: true`
- **Foundational notes:** Even with low links, foundational concepts may have latent value
- **Creative/experiential notes:** Personal creative work has historical value even if not currently referenced
- **Seed Gap notes:** Document gaps before solving them - don't delete gap notes, deprecate when resolved

## Related

- [[Note Lifecycle Management]] (protected note this gap extends)
- [[Graph Maintenance]]
- [[Handling Temporal Knowledge]]
