---
last-reviewed: 2026-04-02
last-updated: 2026-04-02
lifecycle: resolved
confidence: high
author-type: ai-assisted
knowledge-type: principle
verification-status: verified
gap-status: resolved
gap-priority: n/a
gap-type: seed-missing
discovered: 2026-04-01
resolved: 2026-04-01
resolved-by: "AI-Assisted Knowledge Management Seed (Rule added 2026-04-01)"
resolution: seed-extension
gap-source: frontier-exploration
tags:
  - seed-gap
  - domain-selection
  - exploration-exploitation
  - allocation
  - resource-management
  - resolved
---

# Seed Gap - Knowledge Domain Allocation Strategy

## Status: RESOLVED (2026-04-02)

**This gap was resolved when the Seed was updated on 2026-04-01 with domain-level allocation tracking rules.**

## The Problem

The Seed covers:
- Exploration vs exploitation balance at the **note capture level** (add new vs deepen)
- Knowledge portfolio allocation (core/domain/adjacent/exploratory percentages)
- Completion criteria for individual domains

But it lacks explicit guidance on **how to allocate attention and resources across multiple knowledge domains** when the vault contains many topics competing for limited maintenance capacity.

## Why This Matters

A vault with 200+ notes likely spans 5-15 domains. Each domain has:
- Ongoing maintenance needs (verification, updates, reviews)
- Different decay rates (technical domains stale faster than principles)
- Different utility to the vault owner
- Different growth potential

Without explicit allocation strategy, maintenance defaults to:
1. **Recency bias** — Last touched domain gets attention
2. **Ease bias** — Easiest to verify gets processed first
3. **Interest drift** — Following curiosity rather than need

This creates hidden imbalances: some domains overgrow while others wither, despite the portfolio suggesting balanced allocation.

## What's Missing from the Seed

### Domain-Level Allocation Framework
- How to decide what percentage of maintenance effort each domain receives
- How to adjust allocation as domains grow/shrink
- How to handle domains that emerge (new interest) vs. established domains
- How to detect when domain allocation is misaligned with portfolio goals

### Maintenance Effort Forecasting
- Different domains require different maintenance intensity
- Technical domains need more frequent updates than principles
- Verification timelines vary (empirical vs. source-based)
- How to estimate maintenance burden per domain

### Allocation Signals
- When to increase investment in a domain
- When to reduce investment
- When to pause a domain (mark as dormant)
- When to abandon a domain entirely

### Conflict Resolution Between Domains
- When two domains compete for limited verification capacity, how to decide?
- What factors override portfolio allocation (safety-critical, time-sensitive)?
- How to handle domains that interconnect (affects allocation of both)

## What the Current Seed Says

The Seed does include:
- **70-20-10 allocation** (mature vaults: 70% gap-filling, 20% verification/depth, 10% exploration)
- **Knowledge portfolio** (30% core, 40% domain, 20% adjacent, 10% exploratory)
- **Exploration/exploitation** mode switching based on vault age
- **Maintenance burden** evaluation before capturing volatile knowledge
- **Diminishing returns** testing for individual notes

But these operate at the **note level**, not the **domain level**. The bridge is missing.

## Related Existing Notes

- [[The Knowledge Portfolio]] — asset allocation model (30/40/20/10)
- [[Frontier Exploration - Knowledge Prioritization and Focus Decisions]] — completion heuristics, but domain-level allocation is not explicitly addressed
- [[Frontier Exploration - Knowledge Maintenance]] — maintenance burden types, but not domain-level allocation
- [[Frontier Exploration - Automated Vault Health Monitoring]] — health metrics per vault, not per domain
- [[Seed Gap - Domain-Velocity Confidence Decay]] — domain-specific decay rates
- [[Seed Rule - Vault Change Tracking]] — tracks changes but not domain allocation

## Proposed Seed Extension

**Rule:** Apply explicit domain-level allocation strategy — track maintenance effort by domain, align with portfolio targets, and adjust when variance exceeds threshold.

**Why:** Note-level exploration/exploitation balance and domain-level allocation serve different purposes. Without domain-level tracking, the portfolio allocation (30/40/20/10) is just a static target with no mechanism to measure or enforce it. Maintenance drifts to recency and interest rather than intentional design.

**Test:** (1) Can you calculate current allocation percentages by domain? (2) Does allocation align with portfolio targets within 10% variance? (3) When allocation drifts, is there a rebalancing protocol? (4) Are domain-level maintenance forecasts possible?

**Implementation:**

```yaml
# Domain allocation tracking
domain-allocation:
  core:
    target: 0.30
    current: 0.28
    variance: -0.02
    status: balanced  # balanced|over|under
  domain:
    target: 0.40
    current: 0.45
    variance: +0.05
    status: over  # needs rebalancing
  adjacent:
    target: 0.20
    current: 0.17
    variance: -0.03
    status: under
  exploratory:
    target: 0.10
    current: 0.10
    variance: 0
    status: balanced
```

**Maintenance effort per domain:**
```yaml
domain-maintenance:
  domain-name:
    notes-count: 45
    verification-burden: high|medium|low  # based on domain velocity
    last-rebalanced: 2026-03-15
    effort-allocation: 0.35  # what % of maintenance time
    health-score: 0.82
```

**Rebalancing triggers:**
- Any domain >15% over/under target for >30 days
- Total maintenance backlog exceeds threshold
- New domain emerges (requires allocation decision)
- Domain marked as dormant

**Allocation adjustment methods:**
- **Increase** — Process more notes from under-allocated domain
- **Decrease** — Pause processing in over-allocated domain
- **Transfer** — Move notes between domains (rare)
- **Split** — Create new domain for subset (rare)

**Domain classification criteria:**
- Core: Foundational principles, key frameworks (universal)
- Domain: Primary specialization area (your field)
- Adjacent: Connected fields (cross-pollination potential)
- Exploratory: New frontiers (experiments, emerging)

## Test for Gap Closure

- [x] Seed includes domain-level allocation guidance — **RESOLVED** (Seed rule added 2026-04-01)
- [x] Portfolio percentages translate to domain maintenance targets — **RESOLVED**
- [x] Rebalancing triggers and methods are defined — **RESOLVED**
- [x] Maintenance effort forecasting by domain is addressed — **RESOLVED**
- [x] Conflict resolution between domains is specified — **RESOLVED**

## Resolution Confirmation

✅ **Gap RESOLVED via Seed extension (2026-04-01)**

The Seed now includes explicit domain-level allocation tracking:
- **Rule:** Track maintenance effort by domain, measure variance from portfolio targets (30% core, 40% domain, 20% adjacent, 10% exploratory), rebalance when variance exceeds 15% for >30 days
- **Test:** (1) Calculate current allocation percentages by domain, (2) Check variance stays within 15%, (3) Use rebalancing protocol when threshold exceeded, (4) Estimate maintenance burden by domain

This bridges the gap between note-level exploration/exploitation and the portfolio allocation model.