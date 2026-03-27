---
last-reviewed: 2026-03-26
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
knowledge-type: structural
gap-status: identified
gap-priority: medium
gap-type: seed-missing
discovered: 2026-03-26
gap-source: frontier-exploration
tags:
  - seed-gap
  - reasoning-trace
  - ai-behavior
  - query-response
---

# Seed Gap - Reasoning Trace Documentation

## The Gap

The Seed covers query answering strategies and reasoning strategies for AI agents (lines 1477-1513), but lacks explicit guidance for documenting the **reasoning trace** — the step-by-step path the AI took to generate an answer. Without reasoning traces, users cannot verify the AI's logic, audit how conclusions were reached, or improve the vault based on reasoning failures.

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

Current: Minimal guidance on "document synthesis logic"

Missing:
- What fields to capture (query, decomposition, notes consulted, confidence path, conclusion)
- Format for machine-readable traces
- What level of detail is appropriate (verbose for complex, concise for simple)

### 2. Source Tracking

Which sources were consulted and how were they weighted?

Current: Confidence aggregation rules exist

Missing:
- Explicit list of notes consulted (not just confidence scores)
- Why each source was chosen (relevance, quality, recency)
- What was rejected and why
- How sources were combined

### 3. Gap Detection During Query

How to document when knowledge was insufficient?

Current: "Detect and flag knowledge gaps encountered during reasoning"

Missing:
- What triggered the gap detection (no results, low confidence, contradiction)
- What the AI tried that failed
- What additional knowledge would have helped

### 4. Confidence Path

How does confidence flow from sources to conclusion?

Current: Confidence aggregation exists

Missing:
- Explicit confidence path documentation
- Which sources contributed most to final confidence
- Where confidence dropped along the path

### 5. User-Visible Reasoning

How much of the trace should users see?

Current: None specified

Missing:
- Summary level for end users
- Detailed level for auditing
- When to show vs. hide reasoning

## Proposed Seed Rules

### Rule: Capture reasoning trace for all substantive queries

**Why:** Substantive queries (those requiring synthesis beyond simple retrieval) should produce reasoning traces that can be audited, verified, and learned from. Without traces, reasoning is invisible and unimprovable.

**Test:** For the last 10 substantive answers generated: (1) Can you identify what notes were consulted? (2) Can you trace the logic path from sources to conclusion? (3) Are gaps during reasoning documented? (4) Can you identify where confidence changed along the path?

**Implementation:**
```yaml
reasoning-trace:
  query: "The original query"
  decomposition:
    - sub-question-1
    - sub-question-2
  sources-consulted:
    - note: "[[Note Name]]"
      relevance: high|medium|low
      contribution: "What this contributed"
  sources-rejected:
    - note: "[[Note Name]]"
      reason: "Why rejected (irrelevant, low quality, etc.)"
  confidence-path:
    - source-confidence: 0.8
      adjustment: "downgraded for age"
      final-confidence: 0.7
  gaps-encountered:
    - trigger: "No results for X"
      attempted: ["approach 1", "approach 2"]
      resolution: "Used broader search"
  conclusion: "Final answer"
  confidence: 0.7
```

### Rule: Document gap detection with attempted resolution

**Why:** When reasoning encounters gaps, what the AI tried and how it resolved (or didn't) is valuable vault feedback. This reveals structural problems that can be fixed.

**Test:** For queries where the AI flagged knowledge gaps: (1) Is the gap trigger documented? (2) Are resolution attempts recorded? (3) Do gap patterns inform vault improvement?

**Implementation:**
```yaml
gap-during-reasoning:
  gap-type: prerequisite-gap|utility-gap|connection-gap|verification-gap
  trigger: "What revealed the gap"
  attempted-resolutions:
    - approach: "Broadened search"
      result: "Found partial answer"
    - approach: "Asked user clarification"
      result: "Received additional context"
  final-resolution: "answered-with-partial-confidence"
  vault-improvement-needed:
    - "Add note on X prerequisite"
    - "Strengthen connection between Y and Z"
```

### Rule: Include confidence path in trace

**Why:** Confidence isn't static — it changes as the AI weighs sources, identifies contradictions, or encounters uncertainty. Documenting this path reveals where reasoning is strong vs. weak.

**Test:** For answers with confidence below high: (1) Can you identify where confidence dropped? (2) What triggered each drop? (3) Can you see the reasoning chain from confident sources to uncertain conclusion?

**Implementation:**
```yaml
confidence-path:
  - stage: "initial-retrieval"
    confidence: 0.9
    note: "3 high-quality sources found"
  - stage: "cross-reference"
    confidence: 0.7
    adjustment: "contradiction found between sources A and B"
  - stage: "gap-fill"
    confidence: 0.6
    adjustment: "inferred missing link"
  - stage: "final"
    confidence: 0.65
    rationale: "Some uncertainty from source conflict + inference"
```

### Rule: Make reasoning trace accessible for auditing

**Why:** Reasoning traces are only useful if they can be reviewed. The Seed should specify what level of access users and AI agents have to reasoning history.

**Test:** For recent AI-generated answers: (1) Can users access the reasoning trace? (2) Can AI agents query reasoning history? (3) Are traces retained long enough for pattern analysis?

**Implementation:**
```yaml
reasoning-access:
  user-visible: summary  # none | summary | full
  ai-queryable: true
  retention-days: 90
  storage-location: reasoning-trace-index
```

### Rule: Use reasoning failures to improve vault structure

**Why:** Reasoning traces reveal systematic problems — consistent gaps, missing connections, poor source quality. This feedback should drive vault improvement.

**Test:** Over last 30 days: (1) Can you identify patterns in reasoning failures? (2) Do gaps inform note creation priorities? (3) Are structural issues being fixed based on reasoning analysis?

**Implementation:**
```yaml
# Periodic audit
reasoning-audit:
  frequency: monthly
  metrics:
    - average-confidence
    - gap-detection-rate
    - source-rejection-rate
    - common-gap-patterns
  output:
    - priority-note-creations
    - structural-improvements
    - verification-priorities
```

## Related Seed Rules

- [[Query Answering Strategy]] — Current reasoning guidance
- [[Reasoning Success Rate]] — Tracking query completion
- [[Gap Detection During Query]] — Current gap handling
- [[Confidence Aggregation]] — How confidence combines

## Test for Gap Closure

Can you:
1. Document full reasoning trace for substantive queries?
2. Track sources consulted and rejected with rationale?
3. Document gap detection with attempted resolutions?
4. Include confidence path showing where confidence changed?
5. Make traces accessible for auditing?
6. Use reasoning failures to improve vault structure?

If yes to all 6, the gap is closed.

## See Also

- [[Frontier Exploration - AI Reasoning Transparency]]
- [[Knowledge Gap Detection Patterns]]
- [[Vault Health Metrics Beyond Structural]]