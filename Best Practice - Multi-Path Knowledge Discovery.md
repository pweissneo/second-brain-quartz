---
knowledge-type: meta
last-reviewed: 2026-03-27
last-updated: 2026-03-28
lifecycle: evergreen
confidence: high
verification-status: verified
author-type: ai-assisted
tags:
  - best-practice
  - knowledge-discovery
  - retrieval
  - linking
level: pattern
schema-version: "1.0"
---
knowledge-type: meta

# Best Practice - Multi-Path Knowledge Discovery

> For every note, ensure at least 3 distinct pathways to discovery: search, backlink traversal, and tag filtering.

## Why This Matters

Single-path discovery creates fragile findability. A user who can't guess the exact terminology or location loses access to knowledge that exists. Multiple discovery pathways create redundancy that improves reliability.

## The 3 Pathways

### 1. Direct Search (Title Match)
- Use descriptive, search-friendly titles
- Avoid "How to..." prefixes — use noun phrases instead
- Include key terms users would search for
- Test: Can you find this note by searching its title?

### 2. Backlink Traversal (Navigation)
- Every note should be reachable from related notes
- Bidirectional links preferred over one-way
- Hub notes provide navigation entry points
- Test: Can you navigate to this note from at least 2 other notes?

### 3. Tag/Category Filtering
- Use consistent, controlled vocabulary tags
- Tag should reflect the note's core topic
- Multiple tags create multiple discovery paths
- Test: Does filtering by this note's tags reveal it?

## Synonym Handling

When capturing knowledge, consider alternate terminology users might search with:

```yaml
synonyms:
  - alternate-term-1
  - alternate-term-2
```

**When to add synonyms:**
- Technical terms with common abbreviations (KB/kilobyte)
- Regional terminology variants (bell pepper/capsicum)
- Common misspellings or alternate spellings
- Related concepts users might conflate

**When NOT to add synonyms:**
- Genuinely different concepts (sauté vs stir-fry are different techniques)
- Only marginally related terms
- Excessive synonyms that dilute specificity

## Discovery Orphan Detection

Regular audit for notes that fail multiple pathways:

```yaml
# Notes needing attention
discovery-issues:
  - no-recent-backlinks: true
  - no-tags: true  
  - title-not-descriptive: true
```

**Audit prompts for AI agents:**
- Find notes with no backlinks in the last 30 days
- Identify tags with only 1-2 notes (fragmented categories)
- Check for one-direction links that should be bidirectional
- Find orphaned concepts with no hub entry point

## AI Agent Cold Start Problem

AI agents building knowledge bases face unique retrieval challenges that this principle addresses:

1. **Cold start problem:** New agents don't know what terminology the vault uses
2. **Vocabulary drift:** The same concept may have multiple valid terms
3. **Context-dependent naming:** Notes may use domain-specific jargon
4. **Cross-domain discovery:** Knowledge in one domain may apply to another

### Exploration Prompts for AI Agents

AI agents should periodically run "unknown unknown" discovery:
- Check notes with no recent backlinks (potentially orphaned in discovery)
- Find concepts that only connect in one direction
- Identify tags with few notes (potential discovery gaps)

This proactively prevents knowledge from becoming invisible.

## Cross-Domain Knowledge Transfer

For general principles that apply across domains, explicitly link to examples in multiple domains:

**Example:** A note about "sensory feedback loops" should link to:
- Cooking (when to flip steak)
- Music (timing feedback)
- Exercise (form correction)

This enables analogous reasoning — finding applicable knowledge in unexpected places.

## Implementation

For new notes, verify all 3 pathways exist before marking complete. For existing notes with discovery gaps, add synonyms, additional links, or appropriate tags to strengthen findability.

## Test Criteria

- [ ] Can this note be found via title search? (retrieval)
- [ ] Can this note be found via backlink traversal? (recognition)
- [ ] Can this note be found via tag filtering? (categorical)
- [ ] Does the note have synonyms or alternate terms documented?
- [ ] Can an AI agent discover this note without knowing its exact title?
- [ ] Are cross-domain connections explicit for transferrable knowledge?

## Related

- [[Wikilinks]]
- [[Graph Maintenance]]
- [[Frontier Exploration - Knowledge Retrieval vs Recognition]] — Original exploration (deprecated, merged here 2026-03-31)
- [[Seed Gap - Knowledge Discovery Pathways]]
- [[Frontier Exploration - Knowledge Access Pattern Optimization]]
- [[Frontier Exploration - Cross-Domain Knowledge Synthesis]]
- [[Frontier Exploration - Unknown Unknowns in Vast Domains]]