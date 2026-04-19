---
last-reviewed: 2026-04-08
last-updated: 2026-04-08
confidence: emerging
author-type: ai-assisted
tags: [frontier-exploration, context-window, token-budget, retrieval-optimization, ai-optimization]
---

# Frontier Exploration - Context-Window-Aware Knowledge Organization

> How should knowledge be structured for AI agents with limited context windows? What rules help maximize useful retrieval within token budgets?

## The Problem

Modern AI models have finite context windows (4K to 128K tokens). When building knowledge bases for AI-assisted retrieval, the question becomes: **how should knowledge be structured so that the most useful pieces fit within available context?**

This differs from human navigation (where we click through links) and from traditional search (where we retrieve single answers). In AI-assisted retrieval:
- The vault passes context to the AI
- The AI reasons over all provided context simultaneously
- Token budget constrains how much can be passed
- Better structure = better reasoning within budget

## What's Missing from the Seed

The Seed covers:
- Atomicity (one idea per note)
- Linking (meaningful connections)
- Navigation (traversal paths)
- Access patterns (lookup vs learning vs decision)

But it lacks guidance on:
- **Context budget optimization** — how to structure for limited token budgets
- **Priority tiering for context** — what's essential vs supplementary vs referencable
- **Retrieval unit sizing** — how large should each retrieval chunk be?
- **Cross-reference compression** — when to inline vs link vs summarize

## Key Questions to Explore

1. **Retrieval unit sizing**: Given a 32K context window, what's the optimal note size for retrieval? Too small = many notes needed. Too large = limited diversity.

2. **Essential vs supplementary**: For any piece of knowledge, what's the minimum viable context to understand it, and what's deferrable to follow-up?

3. **Compression vs inline**: When should knowledge be inlined into higher-level notes vs kept separate with links?

4. **Priority ordering**: What determines what gets included in the first retrieval pass vs later passes?

## Hypotheses to Test

- **Hypothesis 1**: Retrieval-optimized notes should aim for 200-400 words (fits in ~50-100 tokens of context + reasoning room)
- **Hypothesis 2**: Every important note should have a one-sentence "summary" variant for quick inclusion
- **Hypothesis 3**: Hub notes should be smaller (<150 words) since they're navigation, not knowledge
- **Hypothesis 4**: Cross-references should be compressible: `[[Note Name]]` rather than full description

## Test Scenarios

### Test 1: Medical knowledge base
- Context window: 16K tokens
- Query: "patient presents with chest pain, what do I need?"
- Test: Can relevant knowledge fit? What's the minimum viable set?

### Test 2: Cooking recipe retrieval
- Context window: 8K tokens  
- Query: "explain sous-vide chicken breast"
- Test: Can technique + timing + temp all fit with room for AI reasoning?

### Test 3: Troubleshooting tree
- Context window: 12K tokens
- Query: "network connectivity issue"
- Test: Can diagnostic tree fit with decision context?

## Edge Cases to Map

- **Dense domains** (medicine, law): High information density per concept
- **Sparse domains** (philosophy, creative): Lower density, more context needed for reasoning
- **Multi-step procedures**: Sequential knowledge that needs full chain
- **Prerequisite chains**: What must precede what

## Implementation Sketch

Frontmatter for context-window optimization:
```yaml
context-optimized: true
context-tier: essential|supplemental|reference
context-summary: "One-sentence summary for quick inclusion"
context-size-notes: 250  # approximate tokens when included
requires-context-tier: essential  # minimum tier for usefulness
```

## Related Seed Rules

- [[Frontier Exploration - Knowledge Graph Query Optimization]] — addresses related retrieval questions
- [[Frontier Exploration - Context-Switch Validity]] — context dependencies
- [[Seed Refinement - Knowledge Graph Retrieval Optimization]] — April 8, 2026 refinement

## Open Questions

1. Should the Seed include explicit context-budget tests?
2. What's the minimum viable summary length per knowledge type?
3. How do we handle domains with inherently high information density?

---

**This is frontier exploration** — testing hypotheses about context-window-aware organization. The goal is to eventually add a Seed rule if the hypotheses hold.