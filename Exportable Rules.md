---
protected: true
last-reviewed: 2026-03-09
lifecycle: evergreen
confidence: high
author-type: ai
---
# Exportable Rules

> **Purpose:** Drop these rules into any AI agent context file (e.g., CLAUDE.md, AGENTS.md) to bootstrap a high-quality, AI-maintained knowledge graph on any topic.

*This document is auto-maintained by heartbeat. Every rule is demonstrated by at least one vault note.*

---

## Quick Reference

### Core Principles
- **Atomic:** One idea per note, 100-300 words max
- **Linked:** 2-3 connections per note minimum
- **Hubbed:** 3-hop maximum to any node
- **Maintained:** Regular health checks, updates

### Anti-Patterns
- Note Hoarding, Over-Organization, Link Inflation, Perfectionism, Neglecting Maintenance

See [[Anti-Patterns in Knowledge Management]] for details.

---

## Structure Rules

### Atomic Note Principle
Each note contains exactly **one single idea**. ~100-300 words.

```
✅ Good: "# Zettelkasten Method - slip-box principles"
❌ Bad: Combined note about Zettelkasten AND tools AND examples
```

**Demonstrated by:** [[Atomic Note Principle]]

### Note Types
Different notes serve different functions:
- **Atomic Notes** - Single idea, building blocks
- **Hub Notes (MOC)** - Notes for navigation
- **Structure Notes** - System documentation
- **Project Notes** - Time-bound, outcome-focused
- **Reference Notes** - External source storage

**Demonstrated by:** [[Note Types and Templates]]

---

## Maintenance Rules

### Self-Improvement Cycle (Every 15 Minutes)
```
1. git pull origin main
2. Run graph queries (hubs, isolated)
3. Read 2-3 random notes
4. Fix violations, add links
5. git add -A && git commit -m "[Type] What - Why"
6. git push origin main
```

**Demonstrated by:** [[Self-Improvement Cycle]]

### Graph Maintenance
Regular health checks:
- Run `graph_isolated_nodes` to find orphaned notes
- Run `graph_hubs` to identify central concepts
- Rebuild index: `graph_build_index(force:true)`

**Demonstrated by:** [[Graph Maintenance]]

### Note Insertion Strategy
When adding new knowledge:
1. Search existing nodes: `graph_search(query)`
2. Analyze neighbors: `graph_get_neighbors(node)`
3. Find the most specific fit
4. Create atomic node if needed
5. Link to 2-3 related nodes

**Demonstrated by:** [[Note Insertion Strategy]]

### Handling Temporal and Outdated Knowledge
Keep notes accurate:
- Add `created` and `modified` frontmatter
- Use deprecation markers for superseded concepts
- Per [[Note Lifecycle Management]]: update, don't abandon
- Quarterly review per [[Graph Maintenance]]

**Demonstrated by:** [[Handling Temporal Knowledge]]

---

## The Pipeline
Input → Capture → Process → Connect → Maintain

1. **Input** - Collect from books, articles, videos
2. **Capture** - Quick save to inbox, add source reference
3. **Process** - Extract key points, write in your own words
4. **Connect** - Add 2-3 meaningful links per note
5. **Maintain** - Regular health checks, update outdated notes

See [[Knowledge Base Workflow]] for daily practice.

---

## MCP Tools Reference
See [[Graph Navigation MCP]] for tool details.

## Quick Start Template
```markdown
# My Knowledge Vault
## Purpose: [What topic?]
## Principles: [[Atomic Note Principle]], [[Linking Principle]]
## Maintenance: Run [[Self-Improvement Cycle]] regularly
```

---

## Related
- [[Graph Traversal Efficiency]] - Finding your way around
- [[Linking Principle]] - How to connect notes meaningfully
- [[Anti-Patterns in Knowledge Management]] - What to avoid
- [[Frontier Exploration - Illustrative vs Factual Examples]] - Example types
- [[Frontier Exploration - Vault Boundaries]] - What to include/exclude
- [[Frontier Exploration - Framework-Dependent Knowledge]] - Context-dependent validity
- [[Frontier Exploration - Jargon vs Plain Language]] - Different expertise levels
- [[Frontier Exploration - Multi-Modal Knowledge]] - Media beyond text
- [[Frontier Exploration - Cross-Domain Knowledge]] - Multi-domain topics

---

## Sources & References

This note synthesizes guidance from the following vault notes:
- [[AI-Assisted Knowledge Management Seed]] - Core ruleset this document exports
- [[Atomic Note Principle]] - Atomicity definition
- [[Note Types and Templates]] - Note type categorization
- [[Self-Improvement Cycle]] - Maintenance cadence
- [[Graph Maintenance]] - Health check procedures
- [[Note Insertion Strategy]] - Knowledge integration process
- [[Handling Temporal Knowledge]] - Accuracy maintenance
- [[Knowledge Base Workflow]] - Daily practice pipeline
- [[Graph Navigation MCP]] - Tool reference

---

*Last updated: 2026-03-09*
