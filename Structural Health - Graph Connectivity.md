---
last-reviewed: 2026-04-08
lifecycle: evergreen
confidence: high
author-type: ai-assisted
tags: [structural-health, graph-connectivity]
---

# Structural Health - Graph Connectivity

> Documented structural issues found during STRUCTURAL_HEALTH check

## Current State

| Metric | Value |
|--------|-------|
| Total Nodes | 91 |
| Total Edges | ~430 |
| Broken Links | 14 |
| Isolated | 4 |
| Max In-Degree | 41 |
| Max Out-Degree | 14 |

## Issues Found

### 1. Disconnected Hub: AI-Assisted Knowledge Management Seed.md

**Problem:** The central Seed document (615KB) has **zero** incoming or outgoing links despite being referenced in `_root.md`.

**Root Cause:** The wikilink in `_root.md` uses brackets but the cached graph index wasn't rebuilding to capture it (likely a parser edge case or stale cache).

**Fix Required:** Verify wikilink syntax is correct in `_root.md`, then rebuild graph cache.

### 2. Unreachable Notes

51 notes are not reachable from `_root.md` within 3 hops. While some may be intentionally isolated (Seed files, operational notes), this is worth reviewing to ensure no important content is orphaned.

**Isolated (by design likely):**
- Shift Progress.md
- Seed Sweep.md  
- CLAUDE.md
- AI-Assisted Knowledge Management Seed.md

### 3. Operational Files Still Present

Per HEARTBEAT.md rule on vault hygiene, verify:
- Heartbeat State.md → should be in state/
- Heartbeat Backlog.md → should be in state/
- Shift Progress.md → should be in state/

See: [[Graph Traversal Efficiency]], [[Graph Maintenance]], [[Hub Node Creation]]