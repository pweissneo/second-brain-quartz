---
last-reviewed: 2026-03-13
lifecycle: active
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - vault-health
  - automation
---

# Frontier Exploration - Vault Health Automation

> What automated checks could an AI perform to keep a knowledge base healthy?

## The Problem

The Seed includes manual health check procedures, but an AI could automate many of these checks. What should be automated vs. left to humans?

## Current Automated Checks (via MCP)

- `graph_isolated_nodes` — Find orphan notes
- `graph_hubs` — Identify highly connected notes
- `graph_search` — Full-text search
- `graph_build_index` — Rebuild graph index

## Potential Automated Improvements

### 1. Link Quality Scoring
**What:** Analyze each note's outgoing links for quality
**Why:** Catch link inflation or meaningless connections automatically
**Test:** Can you score every link with a "why follow?" explanation?

### 2. Note Freshness Tracking
**What:** Identify notes not reviewed in X days
**Why:** Catch stale content that needs updating
**Test:** Can you list notes with last-reviewed > 90 days ago?

### 3. Atomicity Verification
**What:** Check word counts and summarize ability
**Why:** Catch multi-idea notes automatically
**Test:** Can you verify every note is < 300 words (or justified)?

### 4. Completeness Scoring
**What:** Check if hub notes have sufficient children
**Why:** Identify gaps in topic coverage
**Test:** Can you score each hub's coverage 1-5?

## Proposed Seed Rules

### Rule: Run automated health checks before each commit

**Why:** Automated checks catch structural problems before they compound. Waiting for manual review allows issues to accumulate.

**Test:** Can you run these automated checks and verify they pass before committing?
- [ ] Orphan scan (graph_isolated_nodes)
- [ ] Broken link scan
- [ ] Note freshness check (notes >90 days since last-reviewed)
- [ ] Hub density check

### Rule: Track health metrics over time — note count, link density, orphan count, average note size

**Why:** Without metrics, improvement is anecdotal. With metrics, it's verifiable.

**Test:** Can you produce these 5 metrics right now? Are they trending in the right direction?

## The Human-AI Balance

Some things should remain human:
- Judgment on content quality
- Creative synthesis of ideas
- Deciding when to deprecate

Automation should handle:
- Structural checks
- Link validation
- Freshness tracking

## Testable Insights

1. **Automation scales better than manual review** — As vaults grow, automated checks become essential.
2. **Human judgment remains essential** — Automation can flag issues but cannot decide what to do about them.
3. **Health metrics should be visible** — Tracking them publicly creates accountability.

## Related

- [[Graph Maintenance]]
- [[Self-Improvement Cycle]]
- [[AI-Assisted Knowledge Management Seed]]
- [[Note Lifecycle Management]] — Note lifecycle stages
- [[Hub Node Creation]] — Creating hubs
- [[Frontier Exploration - Knowledge Debt]] — Knowledge debt tracking