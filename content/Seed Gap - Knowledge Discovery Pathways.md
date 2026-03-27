---
last-reviewed: 2026-03-26
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - knowledge-discovery
  - retrieval
  - gap
gap-status: identified
gap-priority: medium
gap-phase: analysis
gap-source: frontier-exploration
---

# Seed Gap - Knowledge Discovery Pathways

## Gap Identification

**What gap occurred:** The Seed provides robust rules for knowledge retrieval (searching with known terms) and linking (connecting known concepts), but lacks explicit guidance for **recognition-based discovery** — finding relevant knowledge when you don't know exactly what you're looking for.

**What rule is missing from the Seed:** A rule addressing how AI agents should help users discover knowledge they don't know to search for, including synonym handling, backlink traversal, cross-domain connections, and exploration prompts.

## Evidence

This gap manifests when:
- Users remember concepts but use different terminology (search fails)
- Users don't know a concept exists (unknown unknowns)
- Users have partial recall and need recognition-based discovery
- Users search in one domain but relevant knowledge exists in another

## Proposed Rule

**Rule:** Implement multi-path knowledge discovery — ensure every note can be found through at least 3 distinct pathways: direct search (title match), backlink traversal (from related notes), and tag/category filtering.

**Why:** Single-path discovery creates fragile findability. Users who can't guess the exact terminology or location lose access to knowledge that exists. Multiple discovery pathways create redundancy that improves reliability.

**Test:** Can any note in the vault be found via (1) title search, (2) backlink traversal from a related note, and (3) tag filtering? If any note fails all 3 pathways, it is effectively invisible to some users.

## Implementation

Add frontmatter for synonym handling:
```yaml
synonyms:
  - alternate-term-1
  - alternate-term-2
```

Add exploration prompts for AI agents:
- Check notes with no recent backlinks (potential discovery orphans)
- Find concepts with only one-direction connections
- Identify tags with few notes (potential discovery gaps)

## Related

- [[Frontier Exploration - Knowledge Retrieval vs Recognition]]
- [[AI-Assisted Knowledge Management Seed]]
- [[Frontier Exploration - Multi-Vault Architecture]]
- [[Seed Rule Proposal - Personal Experimentation Tracking]]