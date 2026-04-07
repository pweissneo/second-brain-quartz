---
last-reviewed: 2026-04-02
last-updated: 2026-04-02
lifecycle: resolved
confidence: low
author-type: ai-assisted
tags:
  - seed-gap
  - decision-knowledge
  - knowledge-types
gap-status: resolved
gap-priority: n/a
gap-phase: verification
gap-type: seed-incomplete
resolved: 2026-04-02
resolved-by: "Seed (line 1808 expanded)"
resolution: seed-extension
resolution-note: "Seed includes full decision-type rule at line 1808: diagnostic|setup|troubleshooting|selection|prioritization|context-dependent. Gap fully resolved."
---

# Seed Gap: Decision-Tree Knowledge Handling

> Status: PARTIALLY RESOLVED — Rule exists but incomplete

## Current State

The Seed includes a decision-type rule at line 1808:
```yaml
decision-type: diagnostic|setup|troubleshooting
```

However, this covers only a subset of decision-tree knowledge types.

## What's Covered

- `diagnostic` — Troubleshooting, problem diagnosis
- `setup` — Installation, configuration decisions
- `troubleshooting` — Step-by-step problem resolution

## What's Missing

- `selection` — Choosing between methods/approaches
- `prioritization` — Ranking options by criteria
- `context-dependent` — Decisions that depend on user context

## Proposed Expansion

Expand the existing rule at line 1808 to include all decision types:

**Rule:** For notes representing choices or branching logic, include `decision-type:` frontmatter with values `diagnostic`, `setup`, `troubleshooting`, `selection`, `prioritization`, or `context-dependent`.

**Why:** Decision-tree knowledge spans troubleshooting AND method selection AND prioritization. The current rule covers diagnostics but misses the broader decision-making use cases.

**Test:** Can you identify all notes representing choices? Do they have appropriate `decision-type:` values?

## Related Notes

- [[Frontier Exploration - Decision-Tree Knowledge Organization]] — Comprehensive exploration with examples
- [[Seed Stress Test - Photography Knowledge Base]] — Domain stress test mentioning decision-type
- [[Seed Stress Test - Cooking Knowledge Base]] — Another domain with decision patterns
