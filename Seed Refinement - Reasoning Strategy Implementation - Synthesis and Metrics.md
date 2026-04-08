---
last-reviewed: 2026-04-07
lifecycle: seed-refinement
confidence: high
author-type: ai-assisted
knowledge-type: meta
tags:
  - seed-refinement
  - reasoning-strategies
  - synthesis
  - metrics
  - documentation
gap-status: resolved
gap-phase: verification
resolved-date: 2026-04-07
resolution-method: merged into [[Seed Refinement - Reasoning Strategy Implementation Gaps]]
---

# Seed Refinement: Reasoning Strategy Implementation — Synthesis & Metrics

> Refining the reasoning strategies rules with explicit synthesis documentation format and quality metrics schema.

## Issue Identified

The reasoning strategies stress tests (see [[Seed Stress Test - Reasoning Strategies Rules]]) identified gaps in:
1. **Synthesis documentation format** — No required fields for documenting how notes combine into answers
2. **Reasoning quality metrics** — No standard schema for tracking query completion, gap detection, and answer quality
3. **Rule interaction guidance** — No decision tree for how reasoning components work together

The 2026-04-04 refinement addressed query decomposition, traversal, relevance scoring, confidence aggregation, and gap classification — but did NOT add synthesis documentation format or quality metrics schema.

## Proposed Refinement

### Synthesis Documentation Format

Add required frontmatter fields for synthesized answers:

```yaml
synthesis:
  sources: [[Note A]], [[Note B]], [[Note C]]
  method: cross-reference|inductive|deductive|analogical
  assumptions:
    - "Assumption 1 (explicit)"
    - "Assumption 2 (explicit)"
  confidence-inherited:
    - note: [[Note A]]
      confidence: high
    - note: [[Note B]]
      confidence: medium
  final-confidence: medium  # Cannot exceed lowest inherited
  gaps-identified:
    - gap: "Missing context about X"
      severity: blocking
      action: note-and-continue
```

**Test:** Can another agent reproduce your answer by following your synthesis documentation? Are all sources, assumptions, and confidence inheritances explicitly documented?

### Reasoning Quality Metrics Schema

Add standard tracking schema for vault-level reasoning health:

```yaml
reasoning-metrics:
  # Query completion tracking
  queries-total: 100
  queries-completed: 85
  queries-abandoned: 15
  completion-rate: 0.85
  
  # Gap detection tracking  
  queries-with-gaps: 23
  gap-types-identified:
    missing-note: 12
    incomplete: 7
    outdated: 4
  gaps-resolved: 15
  gap-resolution-rate: 0.65
  
  # Answer quality tracking (if human feedback available)
  quality-reviews-received: 20
  quality-scores:
    accurate: 15
    partially-accurate: 4
    incorrect: 1
  quality-rate: 0.75

# Per-query metadata (not stored long-term)
query-log:
  - query: "How do I X?"
    timestamp: 2026-04-04
    status: completed|abandoned|gap-found
    notes-consulted: 5
    synthesis-method: deductive
```

**Test:** Can you calculate: (1) What percentage of queries complete successfully? (2) How often do queries reveal knowledge gaps? (3) Do reasoning failures correlate with specific structural issues?

### Rule Interaction Decision Tree

Add explicit decision flow for reasoning component interaction:

```
Query Received
     │
     ▼
┌─────────────┐
│ Classify    │
│ Query Type  │
└─────────────┘
     │
     ▼
┌─────────────┐
│ Decompose   │──► Sub-queries (atomic)
│ by Type     │
└─────────────┘
     │
     ▼
┌─────────────┐
│ Select      │──► breadth-first / depth-first / hub-first / link-hop
│ Traversal  │
│ Strategy    │
└─────────────┘
     │
     ▼
┌─────────────┐
│ Execute     │──► Visit notes, score relevance
│ Traversal   │
└─────────────┘
     │
     ▼
┌─────────────┐
│ Detect Gaps │──► If blocking gap: abort or note-and-continue?
└─────────────┘
     │
     ▼
┌─────────────┐
│ Aggregate   │──► average / minimum / weighted
│ Confidence  │
└─────────────┘
     │
     ▼
┌─────────────┐
│ Synthesize  │──► Combine notes using documented method
│ Answer      │
└─────────────┘
     │
     ▼
┌─────────────┐
│ Document    │──► Sources, method, assumptions, confidence
│ Synthesis   │
└─────────────┘
     │
     ▼
┌─────────────┐
│ Update      │──► Increment metrics counters
│ Metrics     │
└─────────────┘
```

**Decision rules for interaction:**
1. If query is simple (single note sufficient): Skip decomposition, use direct retrieval
2. If gap found during traversal: Option A (note and continue) or Option B (abort if blocking)
3. If conflicting notes: Use minimum confidence aggregation, document conflict
4. If no notes found: Log as gap, suggest creation

**Test:** For any complex query, can you trace through this decision tree and justify each choice?

## Integration with Existing Rules

This refinement complements:
- **Rule: Document synthesis logic** (line ~2262) — adds format to the "how" requirement
- **Rule: Track reasoning success rate** (line ~2266) — adds schema to the "what to track" requirement
- **Rule (REFINEMENT 2026-04-04):** Apply implementation-specific reasoning strategies — adds interaction guidance

## Test Summary

After integration, the reasoning strategies rules should pass these tests:

1. **Query decomposition** by type: procedural→steps, conceptual→causes, relational→attributes, recommendation→criteria, troubleshooting→hypothesis-test ✅ (from 2026-04-04)
2. **Traversal strategy** by intent: breadth-first for overview, depth-first for analysis, hub-first for structured domains, link-hop for discovery ✅ (from 2026-04-04)
3. **Relevance scoring** with explicit formula: 0.3×keyword + 0.3×connectivity + 0.2×type_match + 0.2×recency ✅ (from 2026-04-04)
4. **Confidence aggregation** by dependency: average for independent, minimum for dependent, weighted for contradictory ✅ (from 2026-04-04)
5. **Gap classification** by type: missing-note/incomplete/outdated/contradictory/unverified with specific actions ✅ (from 2026-04-04)
6. **Synthesis documentation** with required fields: sources, method, assumptions, confidence-inherited, final-confidence, gaps-identified (NEW)
7. **Quality metrics** with standard schema: completion-rate, gap-resolution-rate, quality-rate (NEW)
8. **Rule interaction** with decision tree and explicit choice justification (NEW)

---

**See also:**
- [[Seed Stress Test - Reasoning Strategies Rules]] (full gap analysis)
- [[Seed Refinement - Reasoning Strategy Implementation Gaps]] (previous refinement)
- [[Seed Refinement - Reasoning Success Rate Implementation]] (previous refinement)
