---
gap-status: identified
lifecycle: seed-gap
confidence: high
last-reviewed: 2026-04-04
author-type: ai-assisted
status: resolved
resolved-date: 2026-04-04
resolved-by: "Seed rule integrated (line 2030+, 2026-04-02)"
tags:
  - seed-gap
  - link-density
  - knowledge-type
  - taxonomy
  - correlation
---
gap-status: identified

# Seed Gap: Knowledge Type and Link Density Correlation

> **STATUS: RESOLVED** — The Seed now includes note-type-aware link density rules that address this gap (2026-04-02). This note is kept for historical documentation.

## The Problem (Documented for Reference)

The [[AI-Assisted Knowledge Management Seed]] defines a uniform rule: every note must link to at least 2 other notes. However, different knowledge types have different natural connectivity patterns:

- **Factual (reference)** notes: specific values, product names, measurements — often reference targets with fewer natural connections
- **Conceptual** notes: broad ideas that naturally connect to many related concepts
- **Procedural** notes: step-by-step workflows that connect to prerequisites and alternatives
- **Experiential** notes: personal notes that connect to context and outcomes
- **Relational** notes: relationships that connect bidirectionally
- **Meta** notes: about the vault itself

The current rule uses tags like `foundational: true` and `specialized: true` as exemptions, but doesn't leverage the knowledge type taxonomy to create type-specific link density expectations.

## Evidence from Stress Tests

Reviewing Seed Stress Tests reveals consistent patterns:

1. **Coffee Brewing** ([[Seed Stress Test - Link Density Rule in Coffee Brewing]]): Specific bean varietals, water chemistry parameters, and brew ratios are flagged as edge cases because they're factual reference knowledge with limited natural connections.

2. **Gardening** ([[Seed Stress Test - Gardening Knowledge Base]]): Specific plant varieties, seasonal timing notes, and harvest metrics are identified as potential orphans.

3. **Astronomy** ([[Seed Stress Test - Link Density Rule in Amateur Astronomy]]): Celestial objects are explicitly exempted as domain-specific entities.

The pattern: **factual/reference knowledge** consistently struggles with uniform link density requirements while **conceptual and procedural** notes naturally meet them.

## Proposed Rule Addition

**Rule:** Apply knowledge-type-aware link density requirements:

| Knowledge Type | Minimum Links | Rationale |
|--------------|---------------|------------|
| conceptual | 3+ | Broad concepts connect to definitions, examples, related concepts, applications |
| procedural | 2+ | Procedures connect to prerequisites, alternatives, troubleshooting |
| factual | 1+ (or reference index) | Specific facts are reference targets; they're discovered via indexes |
| experiential | 1+ | Personal knowledge connects to context; discovery via temporal indexes |
| relational | 2+ | Relationships are bidirectional by nature |
| meta | 2+ | Vault metadata connects to content and process |

**Alternative approach (simpler):** Tag factual/reference notes with `type: reference-target` and exempt from link density requirements. Use reference indexes for discovery instead.

## Test

Can an AI agent:
1. Classify each note by knowledge type?
2. Apply type-specific link density expectations?
3. Verify factual notes are accessible via reference indexes?
4. Distinguish reference-target notes from concept-developing notes?

## Why This Matters

Without type-aware link density:
- AI agents flag false positives (valid notes labeled as orphans)
- Factual reference knowledge gets inflated with artificial links
- The distinction between "notes to discover from" vs "notes to look up" is lost

Type-aware link density preserves the integrity of different knowledge types while maintaining graph health.

## Related Notes

- [[Seed Gap - Knowledge Type Taxonomy and Retrieval Optimization]] — Knowledge type taxonomy
- [[Seed Stress Test - Link Density Rule in Coffee Brewing]] — Domain-specific edge case
- [[AI-Assisted Knowledge Management Seed]] — Link density rule