---
redirect_to: [[Frontier Exploration - Bootstrapping Knowledge Bases in Unfamiliar Domains]]
lifecycle: deprecated
correction-type: merged
correction-date: 2026-03-31
corrected-by: [[Frontier Exploration - Bootstrapping Knowledge Bases in Unfamiliar Domains]]
---

> ⚠️ **This note has been merged into [[Frontier Exploration - Bootstrapping Knowledge Bases in Unfamiliar Domains]]**
> 
> The content has been incorporated into the larger note, which provides comprehensive coverage of both emerging domain bootstrapping and building knowledge bases in unfamiliar domains.
> 
> **Why merge:** Both notes covered overlapping territory but the larger note (218 lines vs 106 lines) provides more comprehensive guidance on domain familiarity assessment, human verification requirements, and bootstrap sequences. They have been consolidated into one comprehensive note.
> 
> **Related:** [[AI-Assisted Knowledge Management Seed]] | [[Frontier Exploration - Unknown Unknowns in Vast Domains]]

> How do you build a knowledge base in a domain with no established conventions, no existing structure, and no prior art?

## The Problem

All Seed rules assume some existing structure to build upon:
- Hub notes require 5+ related notes to emerge
- Link density assumes existing connections to evaluate
- Diminishing returns testing needs baseline comparisons
- Verification relies on source quality hierarchies

But emerging domains (new technologies, interdisciplinary fields, novel hobbies) lack these prerequisites. An AI asked to build a knowledge base on "quantum computing for grocery store inventory optimization" or "AI-assisted pottery" faces a bootstrapping paradox: the rules need structure to apply, but structure hasn't been built yet.

## When This Applies

- New technologies without established best practices
- Interdisciplinary fields that span multiple domains
- Niche hobbies without mainstream documentation
- Personal domains with no prior art
- Rapidly evolving fields where conventions haven't stabilized

## Seed Gap Analysis

### What the Seed Covers
- [[AI-Assisted Knowledge Management Seed]] (contains Construction Phase Model guidance) - relaxed standards during early vault growth
- [[Frontier Exploration - Unknown Unknowns in Vast Domains]] - discovering what you don't know
- [[Frontier Exploration - Bootstrapping Knowledge Bases in Unfamiliar Domains]] - AI learning new topics
- [[AI-Assisted Knowledge Management Seed]] (contains Diminishing Returns guidance) - when to stop adding notes

### What's Missing
1. **Bootstrapping heuristics**: Explicit guidance for the "zero to one" phase where no notes exist yet
2. **Convention emergence triggers**: When to lock in conventions vs. continue experimenting
3. **Minimal viable structure**: What's the smallest graph that provides value?
4. **Domain stability assessment**: How to know if a domain is stable enough for conventions

## Proposed Approach

### Phase 1: Rapid Capture (First 10 Notes)
- Capture anything that seems relevant - no quality gates
- Use broad, tentative categories (not atomic - just buckets)
- Tag everything as `bootstrapping: true`
- Accept high redundancy initially

### Phase 2: Pattern Detection (Notes 10-30)
- Look for natural clusters that emerged
- Identify which captures got used vs. ignored
- Begin distinguishing signal from noise
- Create loose hub structures

### Phase 3: Convention Lock-In (Notes 30-50)
- Define naming conventions based on what emerged
- Establish atomicity standards for this domain
- Create first "foundational" notes
- Begin enforcing Seed rules with relaxed thresholds

### Phase 4: Maturation (50+)
- Apply standard Seed rules
- Increase quality standards
- Focus on depth over breadth
- Begin verification workflows

## Key Questions for Seed

1. Should there be a "bootstrapping mode" frontmatter that relaxes all Seed rules?
2. How many notes trigger convention lock-in? Is it domain-dependent?
3. What's the minimum viable knowledge graph for any domain?

## Test for This Rule

**Rule:** In emerging domains, apply relaxed standards until 30 notes exist, then evaluate structure quality.

**Test:**
1. Does the domain have established conventions in external sources?
2. Are there 30+ notes capturing initial knowledge?
3. Can you identify natural clusters that emerged without forcing?
4. Is there a proposed convention set based on observed patterns?

If yes to 1: Apply standard rules (domain has prior art)
If yes to 2-3 but no to 4: Continue bootstrapping, create convention proposal
If yes to 4: Lock in conventions, transition to maturation

## Related Notes

- [[AI-Assisted Knowledge Management Seed]] (Construction Phase Model)
- [[Frontier Exploration - Unknown Unknowns in Vast Domains]]
- [[Frontier Exploration - Bootstrapping Knowledge Bases in Unfamiliar Domains]]
- [[Frontier Exploration - Knowledge Prioritization and Focus Decisions]]
