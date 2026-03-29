---
last-reviewed: 2026-03-28
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
knowledge-type: structural
gap-status: resolved
gap-priority: medium
gap-type: seed-missing
discovered: 2026-03-28
resolved: 2026-03-29
gap-resolution-note: Rule added to Seed on 2026-03-28 - "Document reasoning traces for complex queries"
replaced-by: [[AI-Assisted Knowledge Management Seed]]
tags:
  - seed-gap
  - reasoning-trace
  - query-response
  - auditability
---

# Seed Gap - Reasoning Trace Documentation

## The Gap

The Seed covers query answering strategies and reasoning strategies for AI agents, but lacks explicit guidance for documenting the **reasoning trace** — the step-by-step path the AI took to generate an answer. Without reasoning traces, users cannot verify the AI's logic, audit how conclusions were reached, or improve the vault based on reasoning failures.

## Why This Matters

- **Auditability**: When the AI makes a recommendation, users cannot see what notes were consulted, how they were weighted, or why certain sources were preferred
- **Error detection**: Reasoning traces reveal when the AI took a problematic path (circular logic, over-reliance on weak sources, missed key connections)
- **Vault improvement**: Reasoning failures highlight graph gaps — when the AI couldn't find what it needed, that's a structural problem to fix
- **Trust calibration**: Users can assess whether to trust an answer based on the reasoning quality, not just the conclusion
- **Reproducibility**: Other AI agents or humans can verify or build on the same reasoning path

## What the Seed Currently Covers

1. **Query decomposition**: Breaking complex queries into atomic sub-questions
2. **Traversal planning**: Planning paths before executing
3. **Relevance scoring**: Scoring note relevance using explicit criteria
4. **Confidence aggregation**: Aggregating confidence from component notes
5. **Gap detection**: Detecting and flagging knowledge gaps during reasoning
6. **Synthesis logic**: Documenting how multiple notes were combined

## What's Missing

### 1. Reasoning Trace Structure

How should the AI document its reasoning process?

Current guidance: None — the Seed only mentions "document synthesis logic" without specifying structure.

Required guidance:
- What information to capture at each reasoning step
- How to represent uncertainty and confidence at each step
- When to include vs. exclude intermediate reasoning
- How to handle multi-hop reasoning paths

### 2. Trace Retention and Retrieval

Should reasoning traces be stored? For how long?

Missing guidance:
- Storage format (embedded in response, stored as notes, logged externally)
- Retention policy (ephemeral, session-based, permanent)
- Retrieval interface (how to access past reasoning traces)
- Privacy considerations (traces may reveal query patterns)

### 3. Trace Quality Metrics

How to evaluate reasoning trace quality?

Missing guidance:
- Completeness metrics (are all key steps documented?)
- Correctness verification (can the trace be re-executed?)
- Gap identification (does the trace reveal missing knowledge?)
- User-facing vs. internal traces

## Proposed Seed Rule Addition

**Rule:** Document reasoning traces for complex queries — capture the step-by-step path from question to answer, including consulted notes, weighting rationale, confidence at each step, and identified gaps.

**Why:** Without reasoning traces, users cannot verify AI logic, audit conclusions, or improve the vault based on reasoning failures. The Seed covers reasoning strategies but not the explicit documentation of reasoning execution. This gap matters especially when AI assists decision-making — users need to see how conclusions were reached.

**Test:** (1) For a complex query (3+ notes consulted), can you generate a reasoning trace showing the path from question to answer? (2) Does the trace include consulted notes, weighting rationale, confidence at each step, and any gaps identified? (3) Can a user follow the trace to verify or replicate the reasoning? (4) Does the trace identify specific vault gaps that caused reasoning failures?

**Implementation:**
```yaml
# Reasoning trace structure
reasoning-trace:
  query-decomposition:
    - sub-question 1
    - sub-question 2
  traversal-path:
    - note: [[Note Name]]
      relevance-score: 0.0-1.0
      confidence: 0.0-1.0
      role: primary|supporting|corroborating
  synthesis:
    - sources-combined: [note1, note2]
    - reasoning: "How sources were combined"
    - confidence: aggregated score
  gaps-identified:
    - gap: "Missing knowledge"
      severity: blocking|minor
  final-confidence: 0.0-1.0
```

**Trace retention:**
- Default: ephemeral (discard after response delivered)
- Option: session-based (retain for current session)
- Option: permanent (store as notes for audit)

**Quality criteria:**
- Every step identifies the source note
- Confidence scores at each step
- Explicit synthesis rationale
- Clear gap identification

## Resolution Options

1. **Add rule to Seed** — Include reasoning trace documentation as a core Seed rule
2. **Create detailed note** — Create a comprehensive Reasoning Trace Implementation note and reference from Seed
3. **Hybrid** — Add high-level rule to Seed with detailed note as implementation guide

**Recommendation:** Option 3 — add core rule to Seed (Rule/Why/Test) and create detailed implementation note.

## Related Notes

- [[AI-Assisted Knowledge Management Seed]] — Foundation rules (needs reasoning trace rule)
- [[Query Answering Strategies]] — Related but covers execution, not trace documentation
- [[Reasoning Strategies for Knowledge Agents]] — Related but focuses on strategy selection
- [[Confidence Aggregation]]]] — Related but covers scoring, not trace structure

---

*Discovered during: Frontier Exploration heartbeat (2026-03-28)*
