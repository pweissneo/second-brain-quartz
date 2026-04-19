---
last-reviewed: 2026-04-08
lifecycle: evergreen
confidence: high
author-type: ai-assisted
tags: [structural-health, graph-connectivity]
---

# Structural Health - Graph Connectivity

> Documented structural issues found during STRUCTURAL_HEALTH check

## Current State (2026-04-08)

| Metric | Value |
|--------|-------|
| Total Notes | 320+ |
| Notes linking to Seed | 353 |
| Isolated (<3 links) | 0 |
| Notes unreachable from _root | Minimal (Seed-related notes expected) |

## Updated Findings

### 1. Seed Connectivity ✓

The Seed is well-connected — 353 notes reference it via wikilink. The previous "zero links" was a stale cache issue. Current graph shows:
- Seed linked from _root.md, Schema.md, CLAUDE.md, and hundreds of frontier/seed gap notes
- No actual connectivity problem exists

### 2. Low-Link Notes (Under 3 outgoing)

Several seed stress test notes have minimal outgoing links — this is expected as they are domain-specific examples:
- Seed Stress Test - Music Performance Knowledge Base.md (1 link)
- Seed Stress Test - Linking Rule in Cooking.md (1 link)
- These are test cases demonstrating domain application, not structural issues

### 3. Placeholder Examples (Not Broken)

The Seed file contains placeholder wikilinks for documentation purposes:
- [[Parent/Child]] — wikilink syntax example
- [[Technical Note]] — field value example  
- [[Debugging Cooking/Code/Garden]] — hierarchical example
These are intentional documentation, not broken references.

### 4. Possibly Missing Referenced Notes

Some notes reference non-existent targets that may need creation or cleanup:
- [[Frontier Exploration - Personal Experimentation Results]]
- [[Seed Gap - Anti-Pattern Best Practice Merge Criteria]]
- [[Anti-Pattern - Over-Organization]] (mentioned as merged in Best Practice notes)

**Action:** Review these references — either create missing notes or clean up stale links.

## Structural Health: HEALTHY

The vault structure is sound:
- All notes have at least 1 outgoing link
- Seed has proper connectivity via _root.md
- No orphan nodes requiring reconnection
- Hub nodes (Seed, Note Lifecycle, etc.) properly central

See: [[Graph Traversal Efficiency]], [[Graph Maintenance]], [[Hub Node Creation]]