---
protected: true
last-reviewed: 2026-03-28
lifecycle: evergreen
tags:
  - structure
confidence: high
author-type: ai-assisted
---
# Exportable Rules

> **Purpose:** Drop these rules into any AI agent context file (e.g., CLAUDE.md, AGENTS.md) to bootstrap a high-quality, AI-maintained knowledge graph on any topic.

*This document is auto-maintained by heartbeat. Every rule is demonstrated by at least one vault note.*

---

## Quick Reference

### Core Principles
- **Atomic:** One idea per note, 100-300 words max (but procedural content can exceed)
- **Linked:** 2-3 connections per note minimum
- **Hubbed:** 3-hop maximum to any node (4 hops for sequential domains)
- **Maintained:** Regular health checks, updates
- **Verified:** Maintain verification ratio (50%+ within 30 days for mature vaults)
- **Protected:** 26 structural pillars (protected: true) must never be merged or deleted

### Anti-Patterns
- Note Hoarding, Over-Organization, Link Inflation, Perfectionism, Single-Source Dependency, Tool Overfocus, Missing Negative Knowledge

Every anti-pattern has a corresponding best practice. See [[Anti-Patterns in Knowledge Management]] for details.

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
- **Structure Notes** - System documentation (see [[Schema.md]])
- **Project Notes** - Time-bound, outcome-focused
- **Reference Notes** - External source storage
- **Seed Rules** - The core ruleset (in [[AI-Assisted Knowledge Management Seed]])
- **Seed Gaps** - Proposed rules that need testing
- **Seed Stress Tests** - Rules tested across domains

**Demonstrated by:** [[Note Types and Templates]]

---

## Quality Rules

### Confidence & Verification
The Seed tracks multiple quality dimensions:
- **Confidence:** high, medium, low, emerging
- **Verification status:** verified, unverified, testing, failed
- **Knowledge source type:** intuition, analysis, authority, experiment
- **Evidence tier:** tested methodology → personal discovery
- **Consensus level:** mainstream, debated, emerging, fringe

**Demonstrated by:** [[Confidence Markers]], [[AI-Assisted Knowledge Management Seed]]

### Knowledge Presentation Calibration
Present knowledge based on its quality dimensions:
- High certainty (verified, high confidence, mainstream): Direct statements
- Medium certainty: Qualified statements with light hedging
- Low certainty (unverified, emerging, fringe): Tentative language with explicit uncertainty
- Contested: Balanced presentation with multiple perspectives

**Demonstrated by:** [[Frontier Exploration - Knowledge Presentation Calibration]]

---

## Maintenance Rules

### Self-Improvement Cycle (Regular Heartbeats)
> Note: The 15-minute cycle was aspirational. Realistically, 3-4 heartbeats per day (morning, midday, afternoon, evening) provides regular maintenance without burnout.

See [[Graph Maintenance]] for the current recommended frequency.
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

## Vault Health Metrics

### Construction Phase Model
Apply relaxed standards during bootstrap, tighten as vault matures:
- **Skeleton (1-20 notes):** Minimum 1 link, 4 hop depth, 50+ words
- **Flesh (20-100 notes):** Transition to full rules at 50 notes
- **Muscle (100-200 notes):** Full rules apply
- **Maturity (200+ notes):** Full Seed rules, 70% gap-filling, 20% verification

**Completion criteria:** orphan rate <10%, hub coverage >80%, verification ratio >50%, schema stable 60+ days, compliance score >85%

### Capture-to-Verify Ratio
- **New vaults (<50 notes):** 70/30 capture/verify
- **Mature vaults (>200 notes):** 30/70 capture/verify
- Pause capture when unverified exceeds 40%

**Demonstrated by:** [[AI-Assisted Knowledge Management Seed]]

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
See [[Graph Traversal Efficiency]] for tool details.

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
- [[Best Practices Hub]] - Positive alternatives to anti-patterns
- [[Frontier Exploration Hub]] - Emerging ideas being tested
- [[Seed Gaps - Domain-Specific Extensions]] - Proposed rules for specific fields
- [[AI-Assisted Knowledge Management Seed]] - Full ruleset
- [[Frontier Exploration - Illustrative vs Factual Examples]] - Example types
- [[Frontier Exploration - Framework-Dependent Knowledge]] - Context-dependent validity
- [[Frontier Exploration - Jargon vs Plain Language]] - Different expertise levels
- [[Frontier Exploration - Multi-Modal Knowledge]] - Media beyond text
- [[Frontier Exploration - System Interactions and Cross-Domain Knowledge]] - Multi-domain topics

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
- [[Graph Traversal Efficiency]] - Tool reference
- [[Confidence Markers]] - Quality tracking
- [[Frontier Exploration - Knowledge Presentation Calibration]] - How to present knowledge based on quality

---

*Last updated: 2026-03-28*
