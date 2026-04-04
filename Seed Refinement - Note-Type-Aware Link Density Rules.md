---
last-reviewed: 2026-04-04
lifecycle: seed-refinement
confidence: high
author-type: ai-assisted
knowledge-type: structural
verification-status: verified
status: resolved
resolved-date: 2026-04-04
resolved-by: "Seed rule integrated (line 2030+, 2026-04-02)"
tags:
  - seed-refinement
  - link-density
  - note-types
  - structural-health
---

# Seed Refinement: Note-Type-Aware Link Density Rules

> **STATUS: RESOLVED** — This refinement proposed a rule that has been integrated into the Seed (2026-04-02). The note is kept for historical documentation.

## The Issue (Documented for Reference)

The Seed's 2+ outgoing links rule originally applied uniformly to all notes. Structural analysis revealed different note types have different appropriate link densities:

| Note Type | Expected Link Count | Rationale |
|-----------|---------------------|-----------|
| Content notes | >=2 links | Core knowledge should be interconnected |
| Seed Gaps | 0-1 links | Document missing rules, reference Seed but not referenced back |
| Seed Refinements | 0-1 links | Propose changes to specific rules, narrow scope |
| Frontier Explorations | 0-1 links | Document exploration findings, reference Seed |
| Seed Stress Tests | 0-1 links | Test specific rules, narrow purpose |
| Hub notes | >=5 links | Aggregate and navigate multiple topics |

## Evidence

From Structural Health Check - 2026-04-04:
- ~80 notes have no incoming links (orphans)
- These cluster into gap documentation (~20), Seed Refinements (~30), stress tests (~15), frontier explorations (~15)
- These are NOT structural problems - they are expected behavior for note types designed to reference the Seed, not be referenced by content

## Proposed Seed Rule Addition

**Rule:** Apply note-type-aware link density requirements — content notes require >=2 outgoing links, while gap documentation notes (Seed Gaps, Frontier Explorations) and stress tests may have 0-1 links.

**Why:** Uniform link density requirements incorrectly flag gap documentation and stress tests as unhealthy. These note types serve different purposes - they document gaps or test rules, not build interconnected knowledge. Treating them the same as content notes creates false positives in structural health checks and discourages gap documentation.

**Test:** (1) Can you classify each note by type (content/gap-documentation/stress-test/hub)? (2) Does each content note have >=2 outgoing links? (3) Do gap documentation and stress tests have appropriate (0-1) link counts? (4) Do hubs have >=5 links?

**Implementation:**
```yaml
note-type: content|gap-documentation|stress-test|hub|convention
note-role: content|reference|proposal|test
link-density-expectation:
  content: minimum: 2
  gap-documentation: maximum: 1
  stress-test: maximum: 1
  hub: minimum: 5
  convention: minimum: 1
```

**Distinction from existing rules:**
- Edge case in 2+ links rule (line ~300) mentions exemptions for "specialized" notes but doesn't specify note types
- This refinement explicitly defines note-type taxonomy and link expectations

## Related Notes

- [[Seed Stress Test - 2+ Links Rule Across Domains]] - Existing stress test
- [[Graph Maintenance]] - Graph health guidance
- [[Structural Health Check - 2026-04-04]] - Analysis that revealed this gap
- [[AI-Assisted Knowledge Management Seed]] - Foundation rules being refined

---

*Refinement generated during: REDUNDANCY_SCAN heartbeat (2026-04-04)*
*Note: REDUNDANCY_SCAN found no redundant note pairs, but discovered new Seed insight through structural analysis*