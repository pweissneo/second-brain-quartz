---
last-reviewed: 2026-03-12
lifecycle: draft
confidence: emerging
tags:
  - frontier-exploration
  - graph-theory
  - discovery
  - emergent-behavior
---

# Frontier Exploration: Vault Structure and Discovery Bias

## The Gap

The Seed covers how to structure notes (atomicity, linking, navigation) and how to maintain the vault (health checks, self-improvement). But it doesn't address: **how the structure you choose influences what knowledge you discover**.

## The Problem

Every structural choice creates discovery biases:

- **Hub structure** → Favorites what connects to popular hubs
- **Tag taxonomy** → Favors categories you've defined
- **Link patterns** → Favors connections you've already made
- **Note age** → Favors established knowledge over new ideas

An AI agent navigating the vault will find what the structure emphasizes. If the vault is hub-heavy, it will rediscover hub-connected knowledge. If it's tag-heavy, it will stay within defined categories.

## Why This Matters for AI Agents

AI agents using graph traversal will:
1. Start from entry points (_root.md, hubs)
2. Follow links to related notes
3. Discover what's well-connected first
4. May never reach peripheral but valuable knowledge

This creates a **discovery bias** - the agent explores what's structurally central, not what's most relevant or novel.

## Types of Discovery Bias

### 1. Popularity Bias
Well-linked notes get visited more, reinforcing their importance.
- **Signal:** Some notes have 10+ backlinks while others have 2
- **Effect:** Agent over-indexes on "established" knowledge

### 2. Recency Bias
New notes have fewer links, making them harder to discover.
- **Signal:** Notes created in last 7 days are orphaned
- **Effect:** Agent misses recent captures

### 3. Centrality Bias
Notes near hubs are found first.
- **Signal:** All paths go through same 3-4 hub notes
- **Effect:** Agent sees the vault through hub perspectives

### 4. Taxonomy Bias
What's taggable is discoverable; what's not tagged is invisible.
- **Signal:** Heavy use of tags, few cross-links
- **Effect:** Agent stays within defined categories

### 5. Authority Bias
Notes linked from "important" notes seem more important.
- **Signal:** Hub notes link to certain notes preferentially
- **Effect:** Agent assumes hub-linked = authoritative

## Mitigating Discovery Bias

### 1. Random Exploration
Periodically read random notes (not through graph traversal).
```bash
ls *.md | shuf | head -5
```

### 2. Peripheral Promotions
Actively identify valuable but poorly-connected notes.
- Search for high-quality notes with <3 backlinks
- Add links from relevant hubs

### 3. Multi-Path Navigation
Ensure every note can be reached via multiple routes.
- Test: Can you reach note X via 3 different paths?

### 4. Novelty Tracking
Monitor which notes get created but never linked.
- Run: Find notes with 0 incoming links that are >7 days old

### 5. Structured Randomness
In AI prompts, include "explore a random note" as a step.

## Testing for Discovery Bias

1. **Start from random note** → Can you reach _root in 3 hops?
2. **Pick an edge note** → How many distinct paths lead to it?
3. **Query for "unlinked"** → Are there valuable notes waiting to be connected?
4. **Check hub distribution** → Are 3+ hubs covering most paths?

## The Inverse: Structure Enabling Discovery

Well-designed structure can also ENABLE discovery:

- **Bridge notes** connect otherwise separate clusters
- **Unexpected links** between distant topics create serendipity
- **Gateway notes** surface entire topic areas
- **Tag diversity** enables multi-dimensional browsing

## Proposed Seed Rule

**Rule:** Periodically audit for discovery bias — ensure peripheral notes aren't structurally invisible and that multiple paths exist to reach any note.

**Why:** A vault that only reveals its hub-connected knowledge is missing the value of its edge notes. Structural diversity enables more complete knowledge utilization.

**Test:** 
- Can you find 3 valuable notes with <3 backlinks?
- Are there orphaned clusters that need gateway links?
- Does graph traversal from _root.md reach all note clusters?

## Related
- [[Emergence in Knowledge Graphs]] — Related: how connections generate insights
- [[Graph Traversal Efficiency]] — Navigation rules
- [[Hub Node Creation]] — How to create effective hubs
- [[Frontier Exploration - Knowledge Debt]] — Related: maintenance burden
- [[Self-Improvement Cycle]] — Continuous vault improvement
