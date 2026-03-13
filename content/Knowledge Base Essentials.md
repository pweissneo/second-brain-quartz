# Knowledge Base Essentials

> The minimal set of rules to bootstrap a healthy, self-improving knowledge base on any topic.

---

## The 3 Core Principles

### 1. Atomic Notes
Every note contains **one single idea**. Maximum ~200-300 words.

```
✅ Good: "# Zettelkasten Method - core principles"
❌ Bad: Combined note about Zettelkasten AND tools AND examples
```

### 2. Meaningful Linking
Every note links to **2-3 related notes**. Links must be content-driven.

```markdown
[[Concept]] - brief explanation of how it connects
```

### 3. Graph Navigation
Maximum **3 hops** to reach any note from a hub. Create hub notes as entry points.

---

## Getting Started (Phase 1: Foundation)

### Week 1 Roadmap
| Day | Action |
|-----|--------|
| 1-2 | Create `_root.md` with vault purpose; add 3 foundational notes: Atomic Note Principle, Linking Principle, Graph Traversal Efficiency |
| 3-4 | Process 1 existing document into atomic notes, add frontmatter with tags |
| 5-7 | Review notes and add 2-3 links each; run `graph_hubs` to see connectivity |

### Growth Targets
| Week | Target Nodes |
|------|-------------|
| 1 | 10 |
| 2 | 25 |
| 3 | 50 |
| 4 | 100 |

### Common Mistakes
1. **Don't over-organize** - Links emerge, don't force
2. **Don't capture everything** - Process before saving
3. **Don't neglect maintenance** - Regular health checks

## The 5 Essential Rules

| Rule | Trigger | Action |
|------|---------|--------|
| **Atomic** | Note >300 words | Split into atomic notes |
| **Link** | New note added | Link to 2-3 related notes |
| **Hub** | Topic grows | Create hub note as entry point |
| **Traverse** | Finding info | Max 3 hops from hub |
| **Health** | Regular check | Fix isolated notes |

---

## Quick Start Template

```markdown
# [Topic] Knowledge Base

## Purpose
[What does this vault cover?]

## Core Principles
- [[Atomic Note Principle]]
- [[Linking Principle]]

## Hub Notes
- [Topic] Hub → main entry point

## Daily Practice
- Capture → Process → Link → Review
```

## Agent Rules (For AI-Assisted Maintenance)

| Rule | Trigger | Action |
|------|---------|--------|
| **Split** | Note >200-300 words | Create atomic notes, rewire |
| **Add note** | New information | Find related notes, link 2-3 |
| **Check health** | Every iteration | Run graph queries |
| **Pull/push** | Regular cadence | Git cycle |

---

## Implementation

Use MCP servers for graph navigation:
- `vault-graph` — Navigate and analyze the graph
- `vault-sources` — Track provenance of knowledge
- Follow [[Git Best Practices]] for commit discipline

---

## Why This Works

1. **Atomic** → Reusable across contexts
2. **Linked** → Discoverable, navigable
3. **Hub-based** → 3-hop traversal
4. **Maintained** → Self-improving

The compound effect: more notes → more connections → more emergence → more value.

---

## Before vs After Example

### Before (Violates Atomicity)
```markdown
# JavaScript Notes
- Variables: let, const, var
- Functions: function vs arrow functions
- Arrays: map, filter, reduce
```
*Problem: 4 ideas in one note, hard to link*

### After (Atomic)
```markdown
# JavaScript Variables
- let for reassignable, const for constants

# JavaScript Functions
- Arrow functions don't bind 'this'
```
*Each note: one idea, linkable, reusable*

---

## Related
- [[Knowledge Base Workflow]]
- [[Self-Improvement Cycle]]
- [[Atomic Note Principle]]
- [[Linking Principle]]
- [[Graph Traversal Efficiency]]
- [[Graph Maintenance]]

---
last-reviewed: 2026-03-08
lifecycle: evergreen
confidence: high
