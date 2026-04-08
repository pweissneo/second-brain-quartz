---
last-reviewed: 2026-04-08

last-updated: 2026-04-06
confidence: high
lifecycle: seed-gap
author-type: ai-assisted
frontier-type: exploration
gap-status: analyzed
gap-priority: medium
gap-source: redundancy-scan
domain-target: multi-genre-knowledge-bases
resolved-by: merged with [[Frontier Exploration - Genre-Aware Knowledge Organization]]
---

# Frontier Exploration - Genre-Subdomain Classification in Knowledge Bases

> ⚠️ **Redundancy merged 2026-04-06:** This note was merged with [[Frontier Exploration - Genre-Aware Knowledge Organization]] during redundancy scan. Content consolidated into the merged note.

## Gap Status

**Identified:** 2026-04-05
**Analyzed:** 2026-04-06
**Status:** seed-gap - content merged
**Priority:** medium (affects vaults with multi-genre domains)
**Resolution:** Merged with [[Frontier Exploration - Genre-Aware Knowledge Organization]] for redundancy

---
*This note is kept as a redirect. See [[Frontier Exploration - Genre-Aware Knowledge Organization]] for the consolidated content.*

## The Gap

The Seed provides extensive guidance for domain-specific knowledge organization, but lacks explicit rules for how **genre-like subdomains** (classifications within a domain) should affect knowledge organization differently than the domain itself.

## What the Seed Currently Covers

- Domain-level organization (cooking vs. woodworking vs. medicine)
- Cross-domain knowledge transfer
- Domain-velocity and verification rules
- Domain-specific communication styles

## What's Missing: Genre-Level Organization

Within any domain, there are genre-like classifications that fundamentally change:
1. **Terminology interpretation** — the same term means different things
2. **Prerequisite structure** — different learning paths required
3. **Verification sources** — what counts as authoritative differs
4. **Knowledge type classification** — same content gets different type

## Examples Across Domains

### Music Composition
- "Chord" in classical theory vs jazz voiceleading vs electronic production
- Verification: scholarly sources vs recorded performances vs working code
- Prerequisite chains differ: counterpoint (classical) vs chord-scale theory (jazz)

### Writing
- Fiction vs poetry vs creative nonfiction have different:
  - Verification methods (narrative coherence vs meter/rhyme vs factual accuracy)
  - Structural conventions
  - Success criteria

### Visual Arts
- Medium-specific techniques (oil vs watercolor vs digital)
- Different verification approaches (historical permanence vs colorfastness vs render accuracy)

### Medicine
- Western vs traditional vs integrative approaches
- Different verification hierarchies (FDA trials vs traditional use vs practitioner consensus)

### Law
- Common law vs civil law vs religious law systems
- Different source authorities and precedent structures

### Cooking
- Cuisine regions affect ingredient assumptions and technique applicability
- Already partially covered but could be generalized

## Why This Matters for AI Knowledge Management

When an AI agent builds a knowledge base in a domain with multiple genres:
- Without genre-aware rules, it applies uniform conventions
- Terminology conflicts go undetected
- Verification approaches may be inappropriate for the specific genre
- Prerequisite structures get conflated

## Proposed Seed Addition

**Rule:** Identify genre-like classifications within your domain and establish explicit boundary rules for:
- Terminology scope (does this term mean the same across all genres?)
- Prerequisite differences (what knowledge is assumed vs needs explicit capture?)
- Verification approach (what sources count as authoritative for this genre?)
- Knowledge type classification (does type shift based on genre context?)

**Test:** For a knowledge base with multiple genre-like classifications:
1. Can you distinguish knowledge by genre?
2. Do genre-specific notes have appropriate prerequisite structures?
3. Do terminology definitions include genre scope?
4. Is verification approach consistent with genre norms?

**Implementation:**
```yaml
genre-scope: [list applicable genres]
genre-boundaries:
  terminology-conflicts:
    - term: "example-term"
      genre-a-definition: "definition in genre A"
      genre-b-definition: "definition in genre B"
  verification-source-hierarchy:
    genre-a: [primary-source, secondary-source]
    genre-b: [different-primary, different-secondary]
  knowledge-type-shifts:
    - content: "same content type"
      genre-a-type: factual
      genre-b-type: procedural
```

## Relationship to Existing Seed Rules

This extends:
- [[Frontier Exploration - Domain-Specific Communication Styles and Norms]] (terminology varies by context)
- [[Seed Gap - Domain-Specific Extensions]] (domain-level extensions, not genre-level)
- [[Seed Stress Test - Construction Phase Model in Music Composition]] (genre-specific structure)

This is different from:
- Domain-level classification (classical music IS a domain, not a genre within music)
- Cross-domain transfer (moving knowledge between genres is different from moving between domains)

## Gap Status

**Identified:** 2026-04-05
**Status:** seed-gap - needs proposed rule
**Priority:** medium (affects vaults with multi-genre domains)
**Next step:** Write proposed rule in Rule/Why/Test format for Seed integration

---
See also: [[Frontier Exploration - Genre-Aware Knowledge Organization]], [[Seed Gap - Domain-Specific Extensions]], [[Frontier Exploration - Domain-Specific Communication Styles and Norms]]