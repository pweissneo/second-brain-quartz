---
last-reviewed: 2026-04-08
last-updated: 2026-04-08
lifecycle: deprecated
confidence: high
author-type: ai-assisted
tags:
  - seed-refinement
  - verification
  - knowledge-type
  - verification-modality
  - archived
access-pattern: decision
knowledge-type: meta
gap-source: frontier-exploration
integrated-by: self
gap-status: integrated
discovered: 2026-04-06
resolved: 2026-04-08
resolved-by: [[AI-Assisted Knowledge Management Seed.md]]
integration-point: "Seed Gap - Knowledge Type to Verification Modality Mapping.md (deprecated, merged)"
integration-status: complete
redundant-with: [[Seed Gap - Knowledge Type to Verification Modality Mapping.md]]
---

# Frontier Exploration - Knowledge Type-Verification Modality Mapping

> How should knowledge bases map verification methods to knowledge types — beyond time-based rules?

## Context

This exploration was conducted during the 2026-04-06 heartbeat (FRONTIER_EXPLORATION method) to identify gaps in the Seed's verification framework.

## Current Seed Coverage

The Seed has verification rules organized by **time horizon**:
- **Standard:** 30-day verification ratio (line 463-469)
- **Creative (long-horizon):** 90-day cycle for subjective domains (line 470-472)
- **Fitness (medium-horizon):** 8-week minimum for exercise protocols (line 473-475)
- **Seasonal:** Domain-aware verification windows (line 469)

The Seed also has verification **priority hierarchy** (line 483-495):
- Level 1: Safety-critical
- Level 2: Foundational
- Level 3: Hub/frequently-referenced
- Level 4: Low-priority

## The Gap

The Seed maps verification to **time** (how long until verification) and **priority** (which to verify first), but lacks guidance on **verification modality** — the *method* of verification differs by knowledge type:

| Knowledge Type | Verification Modality | What "Verified" Means |
|----------------|---------------------|----------------------|
| Factual | Source consultation | Citation is real, claim matches source |
| Procedural | Execution test | Procedure actually works |
| Experiential | Context replication | Experience can be repeated |
| Conceptual | Logical consistency | Arguments are valid, no contradictions |
| Relational | Multi-source triangulation | Relationship holds across contexts |
| Meta-Knowledge | Application test | Applying this improves outcomes |

**What's missing:**
- No explicit mapping of knowledge type → verification modality
- No guidance for when modalities conflict (e.g., factual claim that requires procedural test)
- No framework for composite verification (multi-modal knowledge)
- No test for whether verification modality matches knowledge type

## Why This Matters

1. **Misleading verification status** — A note marked "verified" might mean "source exists" (factual) when it should mean "actually works" (procedural)

2. **Agent verification limitations** — The Seed notes AI agents can verify source quality but not embodied knowledge. This is a modality constraint, not just a time constraint.

3. **Composite knowledge** — Some knowledge is multi-type. A recipe is both factual (ingredients exist) AND procedural (cooking works). How to verify the compound?

4. **Domain-specific modality** — Medical knowledge requires clinical trials (empirical), legal requires case law (source), artistic requires aesthetic judgment (subjective). Generic "verification" obscures these differences.

## Current Partial Coverage

The Seed does address some verification modality concerns:
- Line 114: `verification-approach` field in knowledge type taxonomy (empirical/source/social/self-consistency)
- Line 134: Aesthetic notes verification "acknowledges subjectivity"
- Line 468: Distinguishes source verification from execution verification
- Seed stress tests test various domains' verification challenges

But there's no **unified framework** that maps knowledge type → verification modality as a general rule.

## Proposed Seed Rule (Draft)

### Rule: Map Knowledge Type to Verification Modality

**Rule:** For every note, ensure verification method matches the knowledge type — use source verification for factual, execution testing for procedural, contextual replication for experiential.

**Why:** "Verified" has different meanings for different knowledge types. A fact is verified by checking sources; a procedure is verified by successfully executing it. Without modality mapping, verification status misleads about knowledge reliability.

**Test:**
1. Can you identify the knowledge type for any given note?
2. Does verification-status reflect the appropriate modality for that type?
3. For compound notes (multiple types), is each type's verification method applied?
4. Are there notes where modality is misaligned (factual claim tested procedurally, or vice versa)?

**Implementation:**
```yaml
verification-approach: empirical|source|social|self-consistency
verification-modality: execution|source|replication|consistency|triangulation|application
verification-method: What specific action verifies this?
# Example:
# knowledge-type: procedural
# verification-approach: empirical  
# verification-modality: execution
# verification-method: "Successfully complete the procedure"
```

## Edge Cases

### Modality Conflicts
When verification methods conflict (e.g., a factual claim about whether a procedure works), prioritize the stricter modality. "Does this recipe work?" requires execution, not just source verification.

### Multi-Modal Knowledge
For knowledge with multiple types, verify each component separately. A cooking note with ingredients (factual) + technique (procedural) needs both source check AND execution test.

### Agent vs. Human Verification
Some modalities require human verification (execution, aesthetic judgment). The Seed's automated vault edge case (line 480-481) addresses this but could be generalized:
- Agent-verifiable: source, consistency, structure
- Human-required: execution, replication, aesthetic

### Verification Cost Tracking
Different modalities have different costs. Source verification is cheap; execution testing is expensive. The verification priority hierarchy should factor modality cost alongside priority level.

## Related Notes

- [[AI-Assisted Knowledge Management Seed]] (line 95-135): Knowledge Type Taxonomy with verification-approach field
- [[AI-Assisted Knowledge Management Seed]] (line 463-481): Verification ratio and automation edge cases
- [[Seed Refinement - Verification Priority Hierarchy]]
- [[Seed Gap - Multi-Modal Verification Tracking]] — related gap note
- [[Frontier Exploration - Verification Hierarchy]]

## Gap Assessment

This exploration identifies a **Seed Gap** in the verification framework:

- **Gap type:** Seed-missing (framework gap)
- **Status:** identified → needs analysis
- **Severity:** useful (not critical)
- **Overlaps with:** Seed Gap - Multi-Modal Verification Tracking (could be consolidated)

**Recommendation:** Map this exploration into the existing Multi-Modal Verification Tracking gap, or create a combined refinement that adds verification-modality to the knowledge type taxonomy.

---

*Exploration conducted during 2026-04-06 heartbeat via FRONTIER_EXPLORATION method. Vault: 562+ notes. Method: Random domain simulation (language learning) → identified verification modality gap.*