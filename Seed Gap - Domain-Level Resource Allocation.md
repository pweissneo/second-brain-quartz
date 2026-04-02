---
last-reviewed: 2026-04-02
last-updated: 2026-04-02
lifecycle: deprecated
confidence: n/a
author-type: ai-assisted
knowledge-type: principle
verification-status: n/a
gap-status: deprecated
gap-priority: n/a
gap-type: seed-missing
gap-source: frontier-exploration
discovered: 2026-04-01
analyzed: 2026-04-02
analysis-conclusion: "Resolved by Seed update 2026-04-01. Duplicate of Seed Gap - Knowledge Domain Allocation Strategy, which has more complete resolution tracking."
tags:
  - seed-gap
  - deprecated
  - redirect
redirect_to: [[Seed Gap - Knowledge Domain Allocation Strategy]]
correction-type: merged
correction-date: 2026-04-02
corrected-by: [[Seed Gap - Knowledge Domain Allocation Strategy]]
---

# Seed Gap: Domain-Level Resource Allocation

> **DEPRECATED (2026-04-02):** This Seed Gap has been merged into [[Seed Gap - Knowledge Domain Allocation Strategy]]. That note has more complete resolution tracking and should be referenced instead.

## Original Content (Preserved for Reference)

**Seed-missing** — The Seed covers note-level maintenance but lacks domain-level resource allocation guidance.

### The Problem

The Seed includes exploration/exploitation balance at the note level (70/30 for new vaults, 80/20 for mature vaults) but when a vault contains 200+ notes across multiple domains, there's no guidance for **how to allocate maintenance effort across domains**.

### Real-World Scenario

Imagine a vault with:
- 80 woodworking notes (high verification burden)
- 50 cooking notes (medium verification)
- 40 philosophy notes (low verification)
- 30 gardening notes (seasonal verification)

Maintenance capacity: ~20 notes/month. **How should the AI decide which domain to process?**

### Why This Matters

Without domain-level allocation guidance:
1. Portfolio targets are unenforceable
2. Maintenance is reactive
3. Domains can starve
4. Growth becomes unbalanced

### Proposed Seed Rule

> **Rule:** Track and maintain domain-level allocation — calculate current allocation by domain, measure variance from portfolio targets, and rebalance when threshold exceeded.

### Implementation

```yaml
domain-allocation:
  woodworking:
    target: 0.30
    current: 0.40
    variance: +0.10
  philosophy:
    target: 0.15
    current: 0.10
    variance: -0.05
```

### Resolution

This gap was resolved when the Seed was updated on 2026-04-01 with domain-level allocation tracking rules. See [[Seed Gap - Knowledge Domain Allocation Strategy]] for the complete resolution.

---

**Redirect:** This note has been deprecated and merged into [[Seed Gap - Knowledge Domain Allocation Strategy]]. All links should now point to that note.