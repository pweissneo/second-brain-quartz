---
lifecycle: seed-gap
confidence: medium
author-type: ai-assisted
gap-status: proposed
gap-priority: medium
gap-type: seed-missing
discovered: 2026-04-02
gap-phase: implementation
last-reviewed: 2026-04-03
analysis-notes: "While Section 9 (Self-Improvement) covers vault-level improvement, it doesn't address SEED-SPECIFIC lifecycle management - how to track, audit, consolidate, and evolve the Seed's rules as a distinct meta-layer. General vault self-improvement ≠ Seed rule lifecycle management."
tags:
  - seed-gap
  - meta-knowledge
  - seed-evolution
  - rule-management
---

# Seed Gap - Seed Meta-Knowledge Layer

## The Gap

The Seed's Section 9 covers self-improvement for the **vault** (notes, structure, quality metrics), but doesn't address self-improvement for the **Seed itself** as a ruleset.

### What's Covered (Vault-Level)
- Vault must follow its own rules
- Every rule must be demonstrated by at least one note
- If vault consistently violates a rule, the rule may be wrong
- Seed should shrink over time (consolidate redundancy)
- Track quality metrics over time
- Measure utility beyond structure

### What's Missing (Seed-Rule-Level)
1. **Seed rule provenance tracking** — When was each rule added? Why? By what trigger (gap analysis, stress test, conflict)?
2. **Seed rule audit** — How to proactively find overlapping, contradictory, or stale rules?
3. **Seed consolidation criteria** — When should two similar rules merge vs. stay separate?
4. **Seed deprecation pathway** — How to retire obsolete rules (vs. notes)?
5. **Seed evolution visibility** — What's changed in the Seed over time? What's the history?

### Why This Matters

The Seed has grown organically from ~50 rules to 100+ rules over months. Without Seed-specific lifecycle management:
- Rules accumulate without cleanup
- Overlapping rules go undetected
- Stale rules persist indefinitely
- No clear path to consolidate similar rules
- Seed growth outpaces Seed improvement

### Existing Related Content

- [[Seed Gap - Seed Rule Lifecycle Management]] — Gap note (not yet integrated)
- [[Seed Refinement - Seed Rule Lifecycle Management]] — Proposed refinement (not yet integrated)
- [[Seed Rule Conflict Resolution]] — Reactive conflict handling (not proactive detection)
- Section 9 Self-Improvement — Vault-level (not Seed-level)

## Proposed Seed Addition

### Rule: Track Seed rule provenance and evolution

**Why:** The Seed accumulates rules over time from different sources (heartbeats, stress tests, gap analysis). Without provenance tracking, it's impossible to understand why rules exist, when they were added, or what might be stale.

**Test:** For any Seed rule, can you answer:
1. When was this rule added?
2. What triggered its addition (gap analysis, stress test, conflict)?
3. Has it been updated since?
4. Is it active, deprecated, or superseded?

### Rule: Audit the Seed quarterly for internal consistency

**Why:** The Seed can develop internal contradictions, redundancies, and stale rules. Without proactive auditing, these issues accumulate.

**Test:** Can you run an audit that finds:
- Rules with >80% overlap (consolidation candidates)
- Rules that contradict each other
- Rules with no updates in >180 days (staleness)

### Rule: Consolidate overlapping Seed rules rather than accumulating

**Why:** The Seed should shrink over time (as per Section 9), but consolidation needs explicit criteria.

**Test:** Can you identify two rules that say the same thing? Have you merged them?

## Gap Status

**Status:** analyzed  
**Priority:** medium  
**Gap-phase:** analysis
**Analysis completed:** 2026-04-02

### Implementation Approach

To move from "analyzed" to "proposed", the following implementation is needed:

1. **Provenance tracking:** Add frontmatter fields to each Seed rule:
   - `rule-added: YYYY-MM-DD`
   - `rule-trigger: gap-analysis|stress-test|conflict|manual`
   - `rule-status: active|deprecated|superseded`

2. **Quarterly audit script:** Create automated check for:
   - Rules with >80% keyword overlap (consolidation candidates)
   - Contradictory rule pairs (detected via semantic similarity)
   - Rules unchanged for >180 days (staleness flag)

3. **Consolidation criteria:** Merge when:
   - Two rules cover identical use cases
   - One rule's test is subset of another's
   - Domain-specific extensions make general rule redundant

4. **Deprecation pathway:** Follow note lifecycle but add:
   - Migration target (which rule replaces it)
   - Deprecation date
   - Sunset timeline (when fully removed from Seed)

---

**Discovered via:** FRONTIER_EXPLORATION heartbeat (2026-04-02)

This gap is distinct from the existing Seed Gap - Seed Rule Lifecycle Management because it focuses on the meta-layer difference between vault self-improvement (covered) vs. Seed rule self-improvement (not covered).