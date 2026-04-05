---
last-reviewed: 2026-04-05
lifecycle: evergreen
confidence: high
author-type: ai-assisted
knowledge-type: procedural
access-pattern: decision
tags:
  - workflow
  - review
  - maintenance
  - process
---

# Weekly Review Process

> Practical implementation of review protocols for knowledge base maintenance.

## Purpose

The weekly review ensures the knowledge base remains healthy, coherent, and improving. It's the practical execution of the REFLECT mode from the Self-Improvement Cycle.

## When to Run

- Every 7 days minimum
- After major milestones ( Seed rule additions, domain expansions)
- When staleness metrics indicate stagnation

## The Review Protocol

### Phase 1: Health Check (5 min)

1. **Orphan scan:** Are there notes with no incoming or outgoing links?
2. **Depth check:** Can all notes reach root in ≤3 hops?
3. **Link quality:** Any notes with >10 outgoing links (hub candidates)?

### Phase 2: Gap Assessment (10 min)

1. **Backlog review:** Are there items in the backlog >7 days old?
2. **Prerequisite audit:** Any undefined wikilinks (links to non-existent notes)?
3. **Retrieval test:** Can you find specific knowledge when needed?

### Phase 3: Quality Audit (10 min)

1. **Recent notes:** Review notes created in last 7 days for Seed compliance
2. **Stale notes:** Any notes not reviewed in >30 days?
3. **Conflict check:** Any unresolved contradictions in the vault?

### Phase 4: Prioritization (5 min)

Based on findings, prioritize next week's work:

| Finding | Action |
|---------|--------|
| Many orphans | CONNECT mode |
| Broken links | FIX or create missing notes |
| Stale content | VERIFY or DEPRECATE |
| Backlog buildup | REFLECT on priorities |

## Output

After each review, log:
- **Date:** When review completed
- **Health metrics:** Orphan rate, average depth, link count
- **Issues found:** List of specific problems
- **Actions taken:** What was fixed
- **Next priorities:** 3 focus areas for next week

## Integration with Heartbeat

The weekly review complements heartbeat-driven work:
- **Heartbeat:** Daily incremental improvements
- **Weekly Review:** Strategic assessment and course correction

## Related

- [[Self-Improvement Cycle]] — The broader cycle this implements
- [[Graph Maintenance]] — Ongoing structural maintenance
- [[Note Lifecycle Management]] — How notes age and when to retire them
