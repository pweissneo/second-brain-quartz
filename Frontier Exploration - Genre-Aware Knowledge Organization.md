---
last-updated: 2026-04-06
confidence: high
lifecycle: seed-gap
author-type: ai-assisted
frontier-type: exploration
gap-status: resolved
merged-from: [[Frontier Exploration - Genre-Subdomain Classification in Knowledge Bases]]
gap-priority: medium
gap-source: redundancy-scan
domain-target: multi-genre-knowledge-bases
discovered: 2026-04-05
resolved: 2026-04-06
resolved-by: merged from redundant note, consolidated into Seed Gap proposal
---

# Frontier Exploration - Genre-Aware Knowledge Organization

> ⚠️ **Redundancy resolved 2026-04-06:** Content merged and consolidated from redundant note [[Frontier Exploration - Genre-Subdomain Classification in Knowledge Bases]]. This note now serves as the consolidated Seed Gap proposal.

**Status change:** gap-status changed from "evergreen" to "seed-gap" with gap-status "proposed" after redundancy consolidation.

## The Problem

The Seed provides extensive domain-specific extension guidance, but lacks explicit rules for how **genre** (as a classification layer within domains) should affect knowledge organization differently than the domain itself.

In music composition specifically:
- A "sonata" knowledge base needs different structure than "jazz improvisation" knowledge base
- "Classical music theory" assumes certain foundational knowledge
- "Jazz theory" builds on but diverges from classical foundations
- Genre affects: prerequisites, verification sources, terminology interpretation, and even what counts as "correct"

## Where the Seed Falls Short

1. **Terminology ambiguity:** The same term means different things across genres
   - "Chord" in classical theory vs jazz voiceleading vs functional harmony
   - "Resolution" has different meanings in classical vs minimalism

2. **Prerequisite structure varies by genre:**
   - Classical composition requires counterpoint fundamentals
   - Jazz composition assumes chord-scale theory
   - These aren't just different notes—they require different learning paths

3. **Verification sources differ:**
   - What counts as "verified" in classical: published analyses, scholarly sources
   - In jazz: recorded performances, practitioner consensus
   - In electronic music: working code, audible results

4. **Genre affects knowledge type classification:**
   - A chord progression in classical context → factual/relational
   - Same progression in jazz context → procedural (voice leading is action)
   - Same progression in electronic context → technical (needs implementation)

## What Rules Are Missing

**Rule (needed):** For multi-genre vaults, establish explicit genre boundaries with clear differentiation rules — similar to how domain-velocity needs different verification rules, genre requires different organizational assumptions.

**Why:** Without genre-aware rules, an AI organizing a music vault will apply uniform conventions ignoring how genre fundamentally changes what knowledge is relevant, how it should be verified, and what prerequisites matter.

**Test:** For a music knowledge base: (1) Can you distinguish knowledge by genre? (2) Do genre-specific notes have appropriate prerequisite structures? (3) Do terminology definitions include genre scope? (4) Is verification approach consistent with genre norms?

## Analogous Issues in Other Domains

This isn't unique to music. Similar genre-like classifications exist in:
- **Writing:** fiction vs poetry vs creative nonfiction
- **Visual arts:** different mediums require different techniques
- **Cooking:** cuisine region affects ingredient assumptions
- **Medicine:** Western vs traditional vs integrative approaches
- **Law:** common law vs civil law vs religious law systems

## Proposed Seed Addition

**Rule:** Identify genre-like classifications within your domain and establish explicit boundary rules for:
- Terminology scope (does this term mean the same across all genres?)
- Prerequisite differences (what knowledge is assumed vs needs explicit capture?)
- Verification approach (what sources count as authoritative?)
- Knowledge type classification (does type shift based on genre context?)

**Implementation:**
```yaml
genre-scope: classical|contemporary-jazz|electronic|folk|other
genre-boundaries:
  terminology-conflicts:
    - term: "chord"
      classical-definition: "simultaneous pitch combination"
      jazz-definition: "harmonic unit with implied extensions"
  verification-source-hierarchy:
    classical: [scholarly-publication, score-analysis, historical-practice]
    jazz: [recorded-performance, practitioner-tradition, theoretical-text]
```

---
See also: [[Seed Gap - Domain-Specific Extensions]], [[Frontier Exploration - Domain-Specific Communication Styles and Norms]], [[Seed Stress Test - Construction Phase Model in Music Composition]]