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
  - domain-agnostic
---

# Seed Refinement: Reasoning Strategy Implementation Gaps

## Overview

The Seed includes rules for reasoning strategies and query answering, but lacks explicit implementation guidance for key components. The Seed Stress Test on Reasoning Strategies Rules (testing against cooking domain) revealed several gaps where the Seed has rules in name but not in implementation detail.

## Gaps Identified

### 1. Query Decomposition Strategy

**Current state:** Seed has query type recognition (line 113: query-patterns mapping query to knowledge type).

**Missing:** Decision tree for HOW to decompose different query types.

| Query Type | Current Guidance | What's Missing |
|------------|------------------|----------------|
| How-to | Maps to procedural | What steps to follow |
| Why | Maps to conceptual | What decomposition strategy |
| Recommendation | Maps to relational | When to decompose vs direct answer |
| Troubleshooting | Maps to factual | How many sub-queries is appropriate |

**Proposed Test:** For any query requiring 3+ sub-queries, can you articulate WHY this decomposition is appropriate?

### 2. Traversal Strategy Selection

**Current state:** None.

**What's missing:** Explicit criteria for choosing between breadth-first, depth-first, hub-first, or link-hop traversal.

| Strategy | Best For | When NOT to Use |
|----------|----------|-----------------|
| Breadth-first | Overview, quick answers | When depth matters |
| Depth-first | Deep analysis | When missing nuance |
| Hub-first | Structured domains | When hubs are weak |
| Link-hop | Discovery, exploration | When answer is urgent |

**Proposed Test:** Can you justify your traversal strategy choice BEFORE executing the query?

### 3. Relevance Scoring Formula

**Current state:** None.

**What's missing:** Explicit scoring criteria. Current implementation relies on keyword matching or semantic search without explicit formula.

**Proposed Test:** Can you articulate your relevance scoring criteria BEFORE running the query?

### 4. Confidence Aggregation Method

**Current state:** None explicit.

**What's missing:** How to combine confidence levels from multiple notes.

| Method | Formula | When to Use |
|--------|---------|-------------|
| Minimum | min(c1, c2) | When notes are dependent |
| Maximum | max(c1, c2) | When notes are independent |
| Average | (c1 + c2) / 2 | Default |
| Weighted | weighted average | When sources have different reliability |

**Proposed Test:** For notes with different confidence levels, can you justify your aggregation method?

### 5. Gap Classification System

**Current state:** Has gap detection for safety-critical and embodied knowledge (lines 262-272).

**Missing:** General gap classification taxonomy.

| Gap Type | Detection Method | Action |
|----------|-------------------|--------|
| missing-note | Query returns no results | Create note |
| incomplete-note | Low word count, few links | Expand note |
| outdated-note | last-reviewed > threshold | Update or verify |
| contradictory | Multiple notes conflict | Reconcile |
| unverified | No verification evidence | Add verification |

**Proposed Test:** For every gap detected, can you classify it and suggest an action?

### 6. Synthesis Documentation Format

**Current state:** Mentions "document synthesis logic" without specifying format.

**What's missing:** Required structure for how to document which notes contributed and how they were combined.

**Proposed Test:** Can another agent reproduce your answer by following your synthesis documentation?

### 7. Reasoning Metrics Tracking

**Current state:** None explicit.

**What's missing:** What metrics to track and how to measure reasoning success.

| Metric | Definition | Collection |
|--------|------------|------------|
| completion-rate | % queries with answers | Log every query |
| gap-detection-rate | % queries with gaps found | Tag gaps during reasoning |
| gap-resolution-rate | % gaps resolved | Track gap lifecycle |

**Proposed Test:** Can you report your reasoning metrics for the last 100 queries?

## Proposed Seed Rule Additions

### Rule: Define Query Decomposition Strategy

**Rule:** For complex queries, apply explicit decomposition strategy based on query type — specify sub-questions, their dependencies, and expected answer type for each.

**Why:** Without explicit decomposition strategy, agents improvise different approaches for similar queries, leading to inconsistent results. Strategy selection should be a deliberate decision, not an afterthought.

**Test:** (1) Can you identify the query type? (2) Is decomposition strategy appropriate for that type? (3) Can you justify why this decomposition vs alternatives?

### Rule: Select Traversal Strategy Based on Query Intent

**Rule:** Choose traversal strategy based on query intent — breadth-first for overview queries, depth-first for analysis, hub-first for structured domains, link-hop for discovery.

**Why:** Different traversal strategies produce different results for the same query. Without explicit strategy selection, agents default to one approach for all queries, missing opportunities for optimization.

**Test:** (1) Can you identify query intent? (2) Is traversal strategy appropriate? (3) Can you explain why this strategy vs alternatives?

### Rule: Document Relevance Scoring Criteria

**Rule:** Before executing any query, articulate explicit relevance scoring criteria — what factors contribute, their weights, and the scoring formula.

**Why:** Implicit scoring leads to inconsistent results. Making criteria explicit enables evaluation, debugging, and improvement.

**Test:** Can you write down your scoring formula before running the query?

### Rule: Aggregate Confidence Using Explicit Method

**Rule:** When aggregating confidence from multiple notes, use explicit method (minimum/maximum/average/weighted) based on note dependencies and document the choice.

**Why:** Different aggregation methods yield different results. Without explicit method selection, agents produce inconsistent confidence levels.

**Test:** For notes with different confidence levels, can you justify your aggregation method and its result?

### Rule: Classify and Track Knowledge Gaps

**Rule:** When gaps are detected during reasoning, classify them using taxonomy (missing/incomplete/outdated/contradictory/unverified) and track them for resolution.

**Why:** Gap detection without classification leads to lost insights. Classification enables pattern analysis and systematic gap resolution.

**Test:** For every gap detected, can you classify it with type, severity, and proposed action?

## Related Notes

- [[Seed Stress Test - Reasoning Strategies Rules]] - Full stress test with cooking domain examples
- [[Seed Gap - Reasoning Trace Documentation]] - Resolved gap on reasoning trace
- [[AI-Assisted Knowledge Management Seed]] - Foundation rules being refined

---

*Refinement generated during: SEED_STRESS_TEST heartbeat (2026-04-04)*