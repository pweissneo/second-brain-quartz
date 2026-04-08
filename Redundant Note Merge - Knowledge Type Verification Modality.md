---
last-reviewed: 2026-04-08
last-updated: 2026-04-08
lifecycle: historical
confidence: high
author-type: ai-assisted
tags:
  - seed-gap
  - verification
  - knowledge-type
  - verification-modality
  - archived
  - redundancy-resolved
access-pattern: decision
knowledge-type: meta
gap-source: merged-duplicate
gap-status: resolved
discovered: 2026-04-06
resolved: 2026-04-08
resolved-by: redundancy-scan
integration-point: "Integrated into Seed (see [[AI-Assisted Knowledge Management Seed]] line ~505)"
integration-status: complete
merged-from:
  - "Seed Gap - Knowledge Type to Verification Modality Mapping.md"
  - "Frontier Exploration - Knowledge Type-Verification Modality Mapping.md (DELETED 2026-04-08)"
---

# Redundant Note Merge: Knowledge Type ↔ Verification Modality Mapping

> This note documents the redundancy resolution - two identical explorations from different methods were merged.

## What Was Found

Two nearly identical notes existed in the vault:

1. **Seed Gap** version (created 2026-04-06 via seed-gap analysis)
2. **Frontier Exploration** version (created 2026-04-08 via frontier-exploration method)

Both explored the same gap: the Seed maps verification to time and priority, but lacks explicit mapping of knowledge type → verification modality (the *method* of verification).

## The Insight

This redundancy reveals an interesting pattern: **the same gap can be discovered through multiple analysis paths**. The knowledge-type taxonomy and verification-ratio rules live in different parts of the Seed, so when analyzing gaps in verification, this topic naturally emerges from multiple angles.

This is not a problem - it's evidence that the gap is genuinely important enough to appear in different contexts.

## Original Content (Preserved)

### The Gap Identified

The Seed has verification rules organized by:
- **Time horizon:** 30-day (standard), 90-day (creative), 8-week (fitness), seasonal
- **Priority level:** Safety-critical → Foundational → Hub → Low-priority

What's missing: **verification modality** - the method of verification differs by knowledge type:

| Knowledge Type | Verification Modality | What "Verified" Means |
|----------------|---------------------|----------------------|
| Factual | Source consultation | Citation is real, claim matches source |
| Procedural | Execution test | Procedure actually works |
| Experiential | Context replication | Experience can be repeated |
| Conceptual | Logical consistency | Arguments are valid, no contradictions |
| Relational | Multi-source triangulation | Relationship holds across contexts |
| Meta-Knowledge | Application test | Applying this improves outcomes |

### Why This Matters

1. **Misleading verification status** — A note marked "verified" might mean "source exists" when it should mean "actually works"

2. **Agent verification limitations** — AI agents can verify sources but not embodied knowledge (modality constraint)

3. **Composite knowledge** — Some knowledge is multi-type. A recipe is both factual AND procedural. How verify compound?

4. **Domain-specific modality** — Medical requires clinical trials (empirical), legal requires case law (source), artistic requires aesthetic judgment

### Proposed Seed Rule

**Rule:** For every note, ensure verification method matches the knowledge type.

**Why:** "Verified" has different meanings for different knowledge types. Without modality mapping, verification status misleads.

**Test:**
1. Can you identify the knowledge type for any given note?
2. Does verification-status reflect the appropriate modality for that type?
3. For compound notes, is each type's verification method applied?

### Edge Cases

- **Modality conflicts:** Prioritize stricter modality when methods conflict
- **Multi-modal knowledge:** Verify each component separately
- **Agent vs. human:** Some modalities require human verification (execution, aesthetic)
- **Verification cost:** Source verification is cheap; execution testing is expensive

## Resolution

This gap has been integrated into the Seed (see line ~505 - verification ceiling rule section). The duplicate content was consolidated into [[Seed Gap - Knowledge Type to Verification Modality Mapping.md]] (updated 2026-04-08 with additional edge cases). The remaining redundant note was deleted. This historical record preserved as documentation of the redundancy detection.

## Related

- [[AI-Assisted Knowledge Management Seed]] (line 95-135): Knowledge Type Taxonomy
- [[AI-Assisted Knowledge Management Seed]] (line 463-481): Verification ratio and automation edge cases
- [[Seed Refinement - Interpretive Verification Modality]]
- [[Seed Refinement - Verification Priority Hierarchy]]

---

*Resolved during 2026-04-08 heartbeat via REDUNDANCY_SCAN. Method: File comparison → identified duplicate content → merged into single historical record.*