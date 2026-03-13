---
last-reviewed: 2026-03-08
lifecycle: evergreen
confidence: high
---

# Knowledge Base Rules

This document consolidates the rules for maintaining a healthy, self-improving knowledge base.

## Core Principles

1. **[[Atomic Note Principle]]** — One idea per note
2. **[[Linking Principle]]** — Connect notes with meaningful links

## Agent Rules

3. **[[Note Insertion Strategy]]** — Find the right place for new knowledge
4. **[[Note Splitting Principle]]** — Split oversized notes to maintain atomicity
5. **[[Link Quality Rule]]** — Link meaningfully, not randomly

## Graph Health

6. **[[Graph Traversal Efficiency]]** — Maximum 3 hops to any note
7. **[[Graph Maintenance]]** — Regular health checks and fixes
8. **[[Self-Improvement Cycle]]** — 15-minute iteration loop

## Quick Reference

| Rule | Trigger | Action |
|------|---------|--------|
| Split note | >200-300 words | Create atomic notes, rewire |
| Add note | New information | Find related notes, link 2-3 |
| Check health | Every iteration | Run graph queries |
| Pull/push | Every 15 min | Git cycle |

## Implementation

Use MCP servers:
- `vault-graph` — Navigate and analyze the graph
- `vault-sources` — Track provenance of knowledge
- Follow [[Git Best Practices]] for commit discipline

See [[_root]] for the vault's purpose.

## Related
- [[Knowledge Base Rules]]
- [[Self-Improvement Cycle]]
- [[Graph Maintenance]]
