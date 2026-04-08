---
last-reviewed: 2026-04-06
last-updated: 2026-04-06
lifecycle: deprecated
confidence: high
author-type: ai-assisted
tags:
  - seed-gap
  - verification
  - knowledge-type
  - verification-modality
  - multi-modal
  - archived
access-pattern: decision
knowledge-type: meta
gap-type: seed-missing
gap-status: integrated
gap-severity: useful
discovered: 2026-04-06
resolved: 2026-04-06
resolved-by: [[AI-Assisted Knowledge Management Seed.md]]
integration-point: "Line ~505 - verification ceiling rule section"
integration-status: complete
integration-note: "Rule added: Map knowledge type to verification modality. Seed already had verification-modality fields for specific cases; integration added explicit mapping table and multi-modal tracking guidance."
---

# Seed Gap - Knowledge Type to Verification Modality Mapping

## Identified Gap

The Seed has verification rules organized by **time horizon** (30-day, 90-day, seasonal) and **priority level** (safety-critical, foundational, hub, low-priority). However, it lacks explicit mapping of **knowledge type** to **verification modality** — the method of verification.

## Two Related Problems

### Problem 1: Modality Mismatch
The Seed defines knowledge types (factual, procedural, experiential, conceptual, relational, meta) but doesn't specify which verification method applies to each:

| Knowledge Type | Appropriate Modality | Current Guidance |
|----------------|---------------------|------------------|
| Factual | Source consultation | Partial (line 114) |
| Procedural | Execution test | Partial (line 468) |
| Experiential | Context replication | Minimal |
| Conceptual | Logical consistency | None explicit |
| Relational | Multi-source triangulation | None |
| Meta-Knowledge | Application test | None |

### Problem 2: Multi-Modal Requirements
Some notes legitimately require multiple verification modes simultaneously:
- Recipe with safety content: source + embodied + food safety
- Emergency procedure: drill-verified + source-verified + tool-dependent
- Tool-executable knowledge: execution + source + output validation

The current system tracks one primary verification mode per note.

## Evidence

1. "Frontier Exploration - Knowledge Type-Verification Modality Mapping.md" (2026-04-06) identified the modality mapping gap via language learning domain simulation
2. "Seed Gap - Multi-Modal Verification Tracking.md" (2026-04-03) identified the multi-modal tracking gap via audit
3. The Seed has `verification-approach` field (line 114: empirical/source/social/self-consistency) but no corresponding `verification-modality` field
4. Seed stress tests reveal verification challenges differ by domain (procedural in cooking, embodied in craft) but no unified framework

## Proposed Seed Rule

### Rule: Map Knowledge Type to Verification Modality

**Rule:** For every note, ensure verification method matches the knowledge type — use source verification for factual, execution testing for procedural, contextual replication for experiential, logical consistency for conceptual, triangulation for relational, and application testing for meta-knowledge.

**Why:** "Verified" has different meanings for different knowledge types. A fact is verified by checking sources; a procedure is verified by successfully executing it; experiential knowledge requires repeating the context. Without explicit modality mapping, verification status misleads about knowledge reliability.

**Test:**
1. Can you identify the knowledge type for any given note?
2. Does verification-status reflect the appropriate modality for that type?
3. For compound notes (multiple types), is each type's verification method applied?
4. Are there notes where modality is misaligned (factual claim verified procedurally, or vice versa)?

**Implementation:**
```yaml
knowledge-type: procedural
verification-approach: empirical
verification-modality: execution
verification-method: "Successfully complete the procedure and validate outcome"
```

### Extended: Multi-Modal Verification

**Rule:** For notes requiring multiple verification modalities, track each mode separately. A note is only fully verified when all required modalities pass.

**Why:** Some knowledge legitimately requires multiple verification paths. A recipe needs both source verification (ingredients exist) AND execution verification (tastes good). Partial verification creates false confidence.

**Test:**
1. Can you identify notes requiring multiple modalities?
2. Does each required modality have separate verification status?
3. Are there notes marked "verified" but missing required modalities?

**Implementation:**
```yaml
verification-modes:
  - modality: source
    status: verified
    date: 2026-04-01
  - modality: execution
    status: pending
    verified-by: null
```

## Additional Edge Cases

### Modality Conflicts
When verification methods conflict (e.g., a factual claim about whether a procedure works), prioritize the stricter modality. "Does this recipe work?" requires execution, not just source verification.

### Agent vs. Human Verification
Some modalities require human verification (execution, aesthetic judgment). Verification rules should distinguish:
- **Agent-verifiable:** source, consistency, structure
- **Human-required:** execution, replication, aesthetic judgment

### Verification Cost Tracking
Different modalities have different costs. Source verification is cheap; execution testing is expensive. Prioritize verification by both priority level AND modality cost.

## Related Notes

- [[AI-Assisted Knowledge Management Seed]] (line 95-135): Knowledge Type Taxonomy
- [[AI-Assisted Knowledge Management Seed]] (line 463-481): Verification rules
- [[Seed Refinement - Verification Mode Conflict Resolution Edge Cases]]

---

*Consolidated from redundant note [[Frontier Exploration - Knowledge Type-Verification Modality Mapping.md]] (deleted 2026-04-08). Gap originally identified 2026-04-06 during FRONTIER_EXPLORATION heartbeat. Domain: language learning.*