---
last-reviewed: 2026-04-04
lifecycle: seed-refinement
confidence: emerging
author-type: ai-assisted
knowledge-type: structural
tags:
  - seed-refinement
  - reasoning-strategies
  - query-processing
  - implementation-guidance
related-seed-rules: reasoning-strategies-query-answering
---

# Seed Refinement: Reasoning Strategy Implementation Guidance

## Overview

The Seed includes a rule for reasoning strategies at line 2223-2226:
> **Rule:** Define reasoning strategies for query answering — include explicit rules for query decomposition, traversal planning, relevance scoring, confidence aggregation, and gap detection.

The rule exists but lacks implementation guidance. This refinement adds concrete, testable implementation details.

## Current Seed Rule (Line 2223-2226)

**Rule:** Define reasoning strategies for query answering — include explicit rules for query decomposition, traversal planning, relevance scoring, confidence aggregation, and gap detection.
**Why:** A perfectly structured vault is useless without strategies for traversing and synthesizing knowledge. Without reasoning guidance, AI agents over-traverse, under-traverse, or miss key connections. Explicit strategies ensure consistent, high-quality answers.
**Test:** For a complex query, can you: (1) decompose it into atomic sub-questions? (2) plan traversal paths before executing? (3) score note relevance using explicit criteria? (4) aggregate confidence from component notes? (5) detect and flag knowledge gaps encountered during reasoning?

**Issue:** The test asks "can you" but provides no guidance on HOW. Different agents answer differently.

## Proposed Refinement

### Implementation Guidance for Query Decomposition

**Rule:** For complex queries requiring decomposition, apply a query-type-specific strategy:
- **How-to/procedural**: Decompose into sequential steps (prerequisite → action → outcome)
- **Why/conceptual**: Decompose into component causes (context → mechanism → result)
- **Comparison/relational**: Decompose into parallel attributes (A-attribute → B-attribute → difference)
- **Recommendation**: Decompose into criteria evaluation (option → criteria → score → recommendation)
- **Troubleshooting**: Decompose into hypothesis-testing sequence (symptom → possible-cause → test → resolution)

**Why:** Without type-specific decomposition, agents improvise inconsistent approaches. The Seed's query-patterns (line 119) maps query types to knowledge types; this refinement maps knowledge types to decomposition strategies.

**Test:** For a complex query: (1) Identify query type using Seed's query-patterns (line 119)? (2) Apply appropriate decomposition strategy? (3) Can you explain WHY this decomposition strategy fits this query type?

### Implementation Guidance for Traversal Strategy

**Rule:** Choose traversal strategy based on query intent before executing:
- **Breadth-first**: Overview queries, "what is X", fact retrieval — explore many nodes at current depth before going deeper
- **Depth-first**: Analysis queries, "why does X happen", deep understanding — follow chains to conclusion before exploring alternatives
- **Hub-first**: Structured domains, "X domain topics", domain exploration — start from high-connectivity nodes
- **Link-hop**: Discovery queries, "what relates to X", exploration — follow outgoing links to find connections

**Why:** Different traversal strategies produce different results for the same query. Without explicit strategy selection, agents default to one approach for all queries.

**Test:** For any query: (1) Can you identify query intent (overview/analysis/discovery/retrieval)? (2) Is traversal strategy appropriate for that intent? (3) Can you explain why this strategy vs alternatives?

### Implementation Guidance for Relevance Scoring

**Rule:** Before executing any query, define explicit relevance scoring with:
- **Keyword match** (weight: 0.3): Query terms appear in note title/content
- **Link connectivity** (weight: 0.3): Note links to/from other relevant notes
- **Knowledge type match** (weight: 0.2): Note type matches query intent (procedural for "how-to", conceptual for "why")
- **Recency** (weight: 0.2): Note recently reviewed/updated (for time-sensitive domains)

**Formula:** `score = 0.3×keyword + 0.3×connectivity + 0.2×type_match + 0.2×recency`

**Why:** Implicit scoring leads to inconsistent results. Explicit formula enables evaluation, debugging, and improvement.

**Test:** Can you write down your scoring formula and calculate a relevance score for any note before including it in your answer?

### Implementation Guidance for Confidence Aggregation

**Rule:** When aggregating confidence from multiple notes, use dependency-aware method:
- **Independent notes** (different sources, different aspects): Use average `(c1 + c2 + ...)/n`
- **Dependent notes** (same source, building on each other): Use minimum `min(c1, c2)`
- **Contradictory notes** (different positions on same topic): Use weighted by source reliability
- **Single note**: Use note's confidence directly

**Why:** Different aggregation methods yield different results. Without explicit method selection, agents produce inconsistent confidence levels.

**Test:** For any answer combining multiple notes: (1) Are notes independent or dependent? (2) Can you justify your aggregation method? (3) Does the final confidence reflect the method used?

### Implementation Guidance for Gap Classification

**Rule:** When gaps are detected during reasoning, classify them using this taxonomy:
- **missing-note**: Query returns no results → Action: create note proposal
- **incomplete-note**: Low word count (<100) or <2 outgoing links → Action: expand note
- **outdated-note**: last-reviewed > 90 days (adjustable by domain velocity) → Action: verify or update
- **contradictory**: Multiple notes conflict on same fact → Action: reconcile or mark uncertainty
- **unverified**: No verification evidence → Action: add verification or mark confidence

**Why:** Gap detection without classification leads to lost insights. Classification enables pattern analysis and systematic gap resolution.

**Test:** For every gap detected: (1) Can you classify it by type? (2) Can you suggest a specific action? (3) Is the gap tracked for follow-up?

## Additional Test Questions (from Gaps Note)

These additional test questions complement the implementations above:

### Query Decomposition Strategy

**Test (additional):** For any query requiring 3+ sub-queries, can you articulate WHY this decomposition is appropriate?

### Traversal Strategy Selection

**Test (additional):** Can you justify your traversal strategy choice BEFORE executing the query?

### Relevance Scoring Formula

**Test (additional):** Can you articulate your relevance scoring criteria BEFORE running the query?

### Confidence Aggregation Method

**Test (additional):** For notes with different confidence levels, can you justify your aggregation method?

### Gap Classification System

**Test (additional):** For every gap detected, can you classify it and suggest an action?

## Stress Test Results

Testing these implementations against cooking domain (from Seed Stress Test - Reasoning Strategies Rules):

| Implementation | Cooking Query Example | Result |
|----------------|----------------------|--------|
| Query Decomposition | "How do I make bread?" | Steps: ingredients → process → troubleshooting ✓ |
| Traversal Strategy | "Why is my bread dense?" | Depth-first: flour → technique → temperature ✓ |
| Relevance Scoring | "best bread recipes" | Score: 0.7 keyword + 0.3 connectivity + 0.2 type ✓ |
| Confidence Aggregation | Multiple recipe notes | Average for independent recipes ✓ |
| Gap Classification | "sourdough hydration" | Missing-note → create proposal ✓ |

## Integration Recommendation

This refinement should be merged into the Seed at line 2223-2226 as expanded implementation guidance, replacing the current test with more specific criteria.

## Related Notes

- [[Seed Stress Test - Reasoning Strategies Rules]] - Full stress test with cooking domain
- [[Seed Stress Test - Reasoning Strategies in Therapeutic Psychology]] - Psychology domain test
- [[AI-Assisted Knowledge Management Seed]] - Original rule (line 2223-2226)

---

*Refinement generated during: SEED_STRESS_TEST heartbeat (2026-04-04)*
*Stress test domain: cooking (varied from previous psychology test)*