---
last-reviewed: 2026-04-04
lifecycle: seed-refinement
confidence: emerging
author-type: ai-assisted
knowledge-type: structural
tags:
  - seed-refinement
  - reasoning-strategies
  - query-answering
  - confidence-aggregation
---

# Seed Refinement: Query Answering Reasoning Strategy Gaps

## Overview

During SEED_STRESS_TEST on 2026-04-04, the Seed's reasoning strategy rules (query answering) were tested against a cooking knowledge base. Several gaps were identified that need explicit Seed guidance.

## Gap 1: Traversal Strategy Selection

**Problem:** The Seed doesn't define traversal strategies for different query types. For the same query, different traversal strategies yield different results.

**Proposed Seed Rule:**

> **Rule:** Select traversal strategy based on query type and vault structure — breadth-first for overview/quick answers, depth-first for deep analysis, hub-first for structured domains, link-hop for discovery.

> **Why:** Different queries require different approaches. Without explicit strategy selection, AI agents default to one approach for all queries, often the simplest (link-hop), which may not be optimal.

> **Test:** For complex queries: (1) Can you justify WHY you chose your traversal strategy? (2) Does strategy selection match query type (overview→breadth-first, analysis→depth-first, structured→hub-first, discovery→link-hop)?

**Edge Cases:**
- **Hybrid queries:** Mix strategies — start breadth-first for overview, then depth-first on relevant branches
- **Low-hub vaults:** When hubs are sparse, prefer breadth-first or link-hop over hub-first
- **Time-constrained:** When time matters, limit traversal depth regardless of strategy

---

## Gap 2: Explicit Relevance Scoring Formula

**Problem:** The Seed doesn't specify what makes a note "relevant" or how to score relevance. Different scoring approaches yield different rankings.

**Proposed Seed Rule:**

> **Rule:** Define and apply explicit relevance scoring criteria before executing queries — include keyword match, link density, recency, and confidence as weighted factors.

> **Why:** Without explicit scoring criteria, AI agents use invisible heuristics that can't be audited or improved. Explicit scoring enables analysis of retrieval quality.

> **Test:** Can you articulate your relevance scoring criteria BEFORE running the query? For two notes ranked differently on the same query, can you explain WHY Note A ranked higher than Note B?

**Default Weights (adjustable by domain):**
```yaml
relevance-scoring:
  keyword-match: 0.30      # Exact/title match weight
  semantic-match: 0.25    # Conceptual similarity weight  
  link-density: 0.20      # Hub proximity weight
  recency: 0.10           # Freshness weight (decay over 180 days)
  confidence: 0.15        # Quality signal weight
```

**Domain Adjustments:**
- **Reference KBs:** Increase keyword-match to 0.40, decrease link-density to 0.10
- **Learning KBs:** Increase link-density to 0.30, increase confidence to 0.20
- **Creative KBs:** Increase semantic-match to 0.35, adjust for subjectivity

---

## Gap 3: Confidence Aggregation

**Problem:** When combining confidence from multiple notes, the Seed doesn't specify HOW to aggregate. Different methods yield different final confidence.

**Proposed Seed Rule:**

> **Rule:** Aggregate confidence from multiple notes using explicit methodology — minimum when notes are dependent (answer requires ALL), weighted average when independent, with floor constraint.

> **Why:** Confidence aggregation directly affects answer quality representation. Without explicit rules, AI agents guess at aggregation, producing inconsistent confidence signals.

> **Test:** For answers derived from multiple notes: (1) Can you show your confidence aggregation calculation? (2) Is the method appropriate for whether notes are dependent or independent? (3) Does the final confidence respect the floor constraint (if ANY note is emerging, final cannot exceed medium)?

**Aggregation Methods:**
| Scenario | Method | Formula |
|----------|--------|---------|
| Dependent notes (all required) | Minimum | `min(c1, c2, ...)` |
| Independent notes (uses parts) | Weighted average | `(c1×w1 + c2×w2) / (w1+w2)` |
| Mixed | Floor constraint | If ANY emerging → final ≤ medium |

**Confidence Levels:** speculative (0.1) → emerging (0.3) → established (0.5) → high (0.8) → verified (1.0)

---

## Gap 4: Synthesis Documentation Requirements

**Problem:** The Seed doesn't specify required synthesis documentation format. Without it, reasoning can't be audited or reproduced.

**Proposed Seed Rule:**

> **Rule:** Document synthesis with required fields — sources used, synthesis method, assumptions made, and confidence aggregation approach.

> **Why:** Without synthesis documentation, reasoning is a black box. Other agents (and humans) can't verify, reproduce, or learn from the reasoning process.

> **Test:** Can another agent reproduce your answer by following your synthesis documentation? Does your documentation include: (1) source notes, (2) method (chain/tree/network), (3) assumptions, (4) confidence aggregation?

**Required Documentation Schema:**
```yaml
synthesis:
  sources: [[Note A]], [[Note B]], [[Note C]]
  method: chain|tree|network
  assumptions:
    - "Assumption 1"
    - "Assumption 2"
  confidence-aggregation: min|average|weighted
  reasoning-log: "Step-by-step reasoning trace"
```

---

## Gap 5: Quality Metrics Integration

**Problem:** The Seed has rule "Track reasoning success rate" but lacks implementation guidance. The Seed Refinement note provides concrete metrics that should be integrated.

**Proposed Integration (replace line 2266-2268 test with expanded criteria):**

> **Test (expanded):** Can you report: (1) Query completion rate (target >80%)? (2) Gap detection rate (target 10-30%)? (3) Quality rate (target >60% high quality)? (4) Structural correlation analysis?

**Implementation Schema:**
```yaml
reasoning-metrics:
  period: 30-day-rolling
  total-queries: <count>
  completion-rate: <0.0-1.0>
  gap-detection-rate: <0.0-1.0>
  quality-rate: <0.0-1.0>
  structural-correlations:
    low-connectivity-failures: <count>
    unverified-note-failures: <count>
    outdated-note-failures: <count>
```

---

## Integration Recommendations

These five gaps should be integrated into the Seed as follows:

1. **Traversal strategy** → Add after line ~2260 (reasoning strategies section)
2. **Relevance scoring** → Add as new rule near query type patterns (line ~117)
3. **Confidence aggregation** → Add near confidence markers section or verification
4. **Synthesis documentation** → Add in reasoning strategies section
5. **Quality metrics** → Replace/update test at line 2266-2268

---

## Related Notes

- [[Seed Stress Test - Reasoning Strategies Rules]] - Full stress test document
- [[Seed Refinement - Reasoning Success Rate Implementation]] - Related metrics refinement
- [[AI-Assisted Knowledge Management Seed]] - Original rules being refined

---

*Generated during: SEED_STRESS_TEST heartbeat (2026-04-04)*
*Test domain: cooking (varied from previous psychology test)*