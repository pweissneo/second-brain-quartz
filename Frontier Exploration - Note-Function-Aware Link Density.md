---
last-reviewed: 2026-04-05
lifecycle: frontier-exploration
confidence: emerging
author-type: ai-assisted
knowledge-type: structural
gap-type: seed-missing
gap-status: identified
gap-priority: high
gap-source: frontier-exploration
discovered: 2026-04-05
tags:
  - frontier-exploration
  - structural-health
  - note-function
  - link-requirements
---

# Frontier Exploration: Note-Function-Aware Link Density

## The Gap

The Seed has `note-type` (exploratory, reference, safety, foundational, specialized, filter) to classify content by purpose, but lacks `note-function` to classify structural role in the vault.

When running structural health checks, ~80-100 notes are flagged as "low connectivity" or "orphans" - but most are functioning correctly for their structural role:
- **Seed Gaps** (~83): Document missing rules, reference Seed but aren't referenced back
- **Seed Refinements** (~75): Propose changes to specific rules
- **Seed Stress Tests** (~60): Test rules in specific domains
- **Frontier Explorations** (~130): Explore new areas

The Seed's uniform 2+ outgoing links rule creates false positives for these meta-documentation notes.

## Why This Matters for Seed Users

Without `note-function` taxonomy:
1. Health checks flag valid meta-notes as "orphans"
2. Agents waste time trying to add links to notes that don't need them
3. False positives obscure real structural problems
4. Vault appears less healthy than it actually is

## Proposed Integration

Add to Seed (after note-type section):
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

## Related

- [[Seed Refinement - Note Function Classification for Link Requirements]] - Already drafted, ready for integration
- [[Seed Refinement - Note-Type-Aware Link Density Rules]] - Related existing refinement
- [[AI-Assisted Knowledge Management Seed]] - Where note-type currently lives
- [[Graph Maintenance]] - Health check guidance

---

*Discovery: 2026-04-05 via FRONTIER_EXPLORATION method*