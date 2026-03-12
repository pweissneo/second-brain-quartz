---
last-reviewed: 2026-03-12
lifecycle: evergreen
confidence: high
level: principle
tags:
  - domain
  - adaptation
  - seed-extension
---

# Domain-Specific Knowledge Bases

A knowledge base can be customized for any field. Here's how to adapt for different domains.

## The Universal Principles

All domains benefit from:
- [[Atomic Note Principle]]
- [[Linking Principle]]
- [[Graph Traversal Efficiency]]

The difference is **content**, not structure.

---

## Research & Academia

**Focus:** Literature review, citations, reproducibility

**Additions:**
- Track paper metadata (authors, year, venue)
- Link to [[Progressive Summarization]] for paper distillation
- Use vault-sources MCP for provenance
- Connect methodology notes across papers

**Hub nodes:**
- Literature Review
- Methodology
- Key Theories

---

## Software Development

**Focus:** Code patterns, architecture decisions, debugging

**Additions:**
- Link code concepts to implementation notes
- Document why (not just what)
- Track stack decisions
- Connect to [[Self-Improvement Cycle]] for tech updates

**Hub nodes:**
- Architecture Patterns
- Debugging Guides
- Tech Stack
- Code Patterns — Reusable solutions to common problems
- Debugging Tactics — Systematic approaches to fixing bugs
- Tool Mastery — IDE, CLI, and environment configs
- Architecture Decisions — Trade-offs and reasoning

### Integration with Zettelkasten

- Each bug fix → atomic note
- Each pattern discovered → atomic note
- Link solutions to problems via `graph_related`

### Capture Workflow for Devs

```
1. Read code/article → Extract key insight
2. Write atomic note (~100-200 words)
3. Tag: #pattern, #bug, #tool, #architecture
4. Link to 2-3 related notes
5. Push to vault
```

### Domain-Specific Tools

- **Dendron** — VS Code-native PKM
- **Obsidian** + Shell commands
- **Git-based snippets** with frontmatter

### Knowledge Types in Dev

| Type | Example | Lifecycle |
|------|---------|-----------|
| Bug Solution | "Fix for CORS error" | Seed → Evergreen |
| Pattern | "Factory pattern use cases" | Seed → Evergreen |
| Tool Config | "tmux.conf essentials" | Evergreen |
| Decision | "Why chose PostgreSQL" | Evergreen

---

## Trading & Finance

**Focus:** Strategies, indicators, market analysis

**Additions:**
- Link indicators to strategies
- Document backtest results
- Connect to [[The Forgetting Curve]] for recall
- Track market regimes

**Hub nodes:**
- Trading Strategies
- Technical Indicators
- Risk Management

---

## Personal Life

**Focus:** Goals, relationships, health, habits

**Additions:**
- Link habits to goals
- Track progress over time
- Connect to [[The Forgetting Curve]] for reviews

**Hub nodes:**
- Goals
- Relationships
- Health
- Habits

---

## General Adaptation Steps

1. **Identify hub nodes** for your domain
2. **Create templates** for common note types
3. **Set up tagging** for domain-specific categories
4. **Define entry points** for new knowledge

---

## Related
- [[Knowledge Base Workflow]]
- [[Atomic Note Principle]]
- [[Frontier Exploration - Multi-Vault Architecture]]
