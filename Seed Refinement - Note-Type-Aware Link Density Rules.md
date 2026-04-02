---
last-reviewed: 2026-04-02
last-updated: 2026-04-02
lifecycle: seed-refinement
confidence: high
author-type: ai-assisted
knowledge-type: analysis
verification-status: verified
tags:
  - seed-refinement
  - link-density
  - structural-health
  - edge-case
  - merged
---

# Seed Refinement: Note-Type-Aware Link Density Rules

> **STATUS: INTEGRATED INTO SEED (2026-04-02)** — The refinement rule has been added to the Seed at line 1884. This note serves as documentation of the discovery process.

**Source:** Seed stress test across woodworking, creative writing, and cooking domains
**Date:** 2026-03-31
**Method:** Domain-specific stress testing of the 2-outgoing-links rule

## The Rule Under Test

**Current Seed Rule (line 4442):** "Review the 10 most recent notes. Do they each have at least 2 outgoing links?"

**Related rules:**
- Line 1732: Orphan scan flags notes with <2 outgoing links lacking `foundational: true` or `specialized: true`
- Line 1192: Thinking tools must link to at least 2 domain applications

## What the Stress Tests Revealed

### Woodworking Domain Findings

From [[Seed Stress Test - 2-Outgoing-Links Rule in Woodworking]]:

1. **Safety warnings** — A note like "Table Saw Kickback Safety" should be linked TO by equipment notes, not required to link OUT. Safety notes serve a different purpose than exploratory notes.

2. **Equipment-specific techniques** — Notes that assume specific tools (table saw, planer) may not connect naturally for users with different equipment tiers. The rule measures structural density but not cross-tier accessibility.

3. **Cross-domain knowledge** — Finish chemistry bridges materials science, health, and technique. A single-domain vault may not have natural links for cross-domain knowledge.

### Creative Writing Findings

From [[Seed Stress Test - Link Explainability Rule in Creative Writing]]:

1. **Spoiler-sensitive links** — Linking to notes with spoilers may harm reader experience even if explainable.

2. **Character hub links** — Links serve different purposes (instance vs principle) depending on traversal direction.

3. **Quote-as-evidence links** — Evidence links differ from learning links but use the same link count metric.

### Cooking Domain Findings

From [[Seed Stress Test - Linking Rule in Cooking]]:

1. **Single-instance ingredients** — Niche spices used in one recipe legitimately have one link.

2. **Technique-to-ingredient vs technique-to-technique** — Different link types serve different purposes.

## The Core Insight

The "at least 2 outgoing links" rule treats all notes as having the same purpose — exploratory navigation. But notes serve different functions:

| Note Type | Link Expectation | Rationale |
|-----------|-----------------|------------|
| **Exploratory** | ≥2 outgoing | Enable navigation to related concepts |
| **Reference/Definition** | ≥2 backlinks | Enable discovery via filtering/category |
| **Safety** | Backlinks from protected note | Users reach via equipment, not explore from |
| **Foundational** | May have <2 | Everything references them |
| **Specialized** | May have <1 | Single-use entities |
| **Filter/Category** | Backlinks | Users navigate TO for filtering |

## The Gap

The Seed treats link density as a uniform metric but:
1. Notes that are navigated TO (reference, safety, filters) have different needs than notes navigated FROM (exploratory)
2. Equipment-tier accessibility is not measured
3. Cross-domain knowledge needs bridging but the rule assumes domain containment

## Proposed Refinement

**Rule (refined):** Apply note-type-aware link density expectations:

> **Test:** For each note, identify its primary function, then apply the appropriate link check:
> - Exploratory notes: ≥2 outgoing links
> - Reference/definition notes: ≥2 backlinks OR linked from hub
> - Safety-critical notes: Backlinks from the equipment/procedure they protect
> - Foundational notes: `foundational: true` tag present
> - Specialized notes: `specialized: true` tag present
> - Filter/category notes: ≥2 backlinks

**Implementation:**
```yaml
note-type: exploratory|reference|safety|foundational|specialized|filter
# Exploratory: should have outgoing links (enable navigation)
# Reference: should have backlinks (enable discovery)
# Safety: should be referenced by equipment/procedure notes
# Foundational: allowed <2 links, tagged foundational: true
# Specialized: allowed <2 links, tagged specialized: true
# Filter: should have backlinks for filtering navigation
```

**Equipment-tier connectivity test:**
> For equipment-dependent notes: Does frontmatter include `equipment-tier:`? Is there a tier-agnostic hub note that users with different equipment can navigate to?

**Cross-domain bridging test:**
> For notes that reference adjacent domains: Is there a bridging hub note that connects the domain to adjacent domains?

## What I Learned

1. **Link density is a proxy for graph health, not a direct measure** — Different note types have different link behaviors; uniform rules create false positives.

2. **The direction of links matters** — Safety notes should be discovered via backlinks, not explored via outgoing links.

3. **Equipment-tier accessibility is invisible to the rule** — A note that assumes specific equipment may have 2 outgoing links but zero useful connections for users with different tools.

4. **The rule assumes domain containment** — Cross-domain knowledge legitimately has fewer in-domain links.

5. **Backlinks are underutilized** — The rule focuses on outgoing links but discovery happens via backlinks for many note types.

---
**See also:**
- [[Seed Stress Test - 2-Outgoing-Links Rule in Woodworking]]
- [[Seed Stress Test - Link Explainability Rule in Creative Writing]]
- [[Seed Stress Test - Linking Rule in Cooking]]
- [[AI-Assisted Knowledge Management Seed]] (lines 1732, 4442)
