---
redirect_to: [[Best Practice - Multi-Path Knowledge Discovery]]
lifecycle: deprecated
correction-type: superseded
correction-date: 2026-03-31
last-reviewed: 2026-03-24
last-updated: 2026-03-24
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - knowledge-retrieval
  - discovery
  - search
  - knowledge-access
level: principle
schema-version: "1.0"
---

# Frontier Exploration - Knowledge Retrieval vs Recognition

> When building a knowledge base from scratch, AI agents need knowledge they can FIND. But what happens when knowledge exists but the searcher doesn't know what to search for? This gap explores the distinction between retrieval (searching with known terms) and recognition (discovering relevant knowledge through other means).

## The Problem

The Seed optimizes for:
- **Linking** — connecting notes via wikilinks
- **Navigation** — traversable graph structure
- **Searchability** — text-based search

But there's a gap: **What happens when you don't know what you're looking for?**

### Example Scenarios

1. **Term mismatch:** You remember something about "that note about cooking proteins" but it's tagged as "denaturation" — search fails
2. **Unknown unknowns:** You don't even know the concept exists — how do you discover it?
3. **Partial recall:** You remember a concept exists but not its name — can you find it via backlinks or related concepts?
4. **Analogous search:** You search for a problem in domain A but the solution exists only in domain B notes

## Why This Matters for AI Agents

AI agents building knowledge bases face unique retrieval challenges:

1. **Cold start problem:** New agents don't know what terminology the vault uses
2. **Vocabulary drift:** The same concept may have multiple valid terms
3. **Context-dependent naming:** Notes may use domain-specific jargon
4. **Cross-domain discovery:** Knowledge in one domain may apply to another

Without explicit retrieval-vs-recognition guidance, AI agents optimize for link structure but miss making knowledge discoverable through multiple pathways.

## Current Seed Coverage

The Seed covers:
- **Linking:** minimum 2 links per note, diverse link types
- **Navigation:** 3-hop rule, hub creation
- **Tags:** controlled vocabularies, 5-tag limit
- **Search:** flat file structure with wikilinks

What's missing:
1. **Synonym management:** How to handle multiple terms for the same concept
2. **Backlink utilization:** Making discovery via backlinks explicit
3. **Analogous connection:** Cross-domain knowledge transfer pathways
4. **Unknown-unknown discovery:** How AI agents should explore to find gaps

## Proposed Solutions

### 1. Add Synonym Frontmatter

```yaml
synonyms:
  - alternate-term-1
  - alternate-term-2
  - common-misspelling
```

**Why:** Enables retrieval from multiple entry points.

**Test:** Can you find this note using any of its synonyms?

### 2. Require Backlink Diversity

**Rule:** Each note should be discoverable from at least 3 different "angles":
- Direct search (title matches query)
- Backlink discovery (referenced from related notes)
- Tag filtering (shares category with known interest)

**Why:** Redundant discovery paths increase findability.

**Test:** Can you find this note using 3 different navigation approaches?

### 3. Cross-Domain Link Promotion

**Rule:** For general principles that apply across domains, explicitly link to examples in multiple domains.

**Why:** Enables analogous reasoning — finding applicable knowledge in unexpected places.

**Example:** A note about "sensory feedback loops" should link to:
- Cooking (when to flip steak)
- Music (timing feedback)
- Exercise (form correction)

**Test:** Can you find this principle applied in 2+ different domains?

### 4. Exploration Prompts for AI Agents

**Rule:** AI agents should periodically run "unknown unknown" discovery:
- Check notes with no recent backlinks (potentially orphaned in discovery)
- Find concepts that only connect in one direction
- Identify tags with few notes (potential discovery gaps)

**Why:** Proactive discovery prevents knowledge from becoming invisible.

**Test:** Can you identify knowledge that exists but would be missed by typical search patterns?

## Test Criteria

- [ ] Can this note be found via title search? (retrieval)
- [ ] Can this note be found via backlink traversal? (recognition)
- [ ] Can this note be found via tag filtering? (categorical)
- [ ] Does the note have synonyms or alternate terms documented?
- [ ] Can an AI agent discover this note without knowing its exact title?
- [ ] Are cross-domain connections explicit for transferrable knowledge?

## Related Notes

- [[Best Practice - Multi-Path Knowledge Discovery]] — This best practice integrates the solutions proposed here
- [[Frontier Exploration - Knowledge Access Pattern Optimization]]
- [[Frontier Exploration - Cross-Domain Knowledge Synthesis]]
- [[Frontier Exploration - Unknown Unknowns in Vast Domains]]
- [[AI-Assisted Knowledge Management Seed]]
