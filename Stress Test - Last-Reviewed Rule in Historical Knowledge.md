---
last-reviewed: 2026-03-15
last-updated: 2026-03-15
confidence: emerging
author-type: ai-assisted
tags:
  - seed-stress-test
  - quality-maintenance
  - domain-edge-case
---

# Stress Test: Last-Reviewed Rule in Historical Knowledge

> Testing: "Every note should have a `last-reviewed` date, updated on each review. Test: Do all notes have a `last-reviewed` field? Flag notes not reviewed in the last 30 days."

## Domain: Art History / Classical Studies

**Why this domain?** Historical knowledge about art, archaeology, and classical studies represents a category where knowledge is fundamentally static — events, artworks, and historical facts from ancient periods do not change. Yet the Seed's current test (30-day review cycle) would flag these notes as "stale" despite them being eternally accurate.

## Edge Cases Identified

### 1. Ancient History Notes
A note like "The Parthenon was built in 447-432 BCE" will never change. Requiring monthly reviews wastes effort and creates noise.

**Current behavior:** AI flags note as needing review after 30 days
**Problem:** No new information can emerge about ancient history
**Proposed fix:** Add `review-interval: never` or `review-interval: historical` for notes covering pre-modern history

### 2. Foundational Concept Notes
Core definitions in any domain (e.g., "What is a sonnet?", "Definition of chiaroscuro") are stable knowledge that doesn't decay.

**Current behavior:** Flags for review after 30 days
**Problem:** These notes are "done" — they're reference anchors
**Proposed fix:** Add `lifecycle: evergreen` or `review-interval: annual` for foundational notes

### 3. Mathematical/Logical Proofs
Notes containing proofs, axioms, or theorems don't need review — they're either correct or they're not.

**Current behavior:** Would flag for monthly review
**Problem:** Reviewing a proof monthly serves no purpose
**Proposed fix:** Add domain-specific tag `knowledge-type: formal` with `review-interval: never`

### 4. Canonical Artworks/Texts
Notes about Shakespeare, Homer, or Beethoven are definitive knowledge that doesn't change.

**Current behavior:** 30-day flagging
**Problem:** Canonical knowledge doesn't "go stale"
**Proposed fix:** Add `canonicity: canonical` tag with extended review interval

## The Deeper Problem

The 30-day test conflates two different concepts:
1. **Currency** — whether information is up-to-date (relevant for time-sensitive knowledge)
2. **Accuracy** — whether information is correct (relevant for static knowledge)

For historical/foundational knowledge, accuracy doesn't change — only currency does for contemporary events. The current rule treats all knowledge as if it could become outdated, which is false for:
- Ancient history (pre-1900)
- Formal systems (mathematics, logic)
- Canonical works (classic literature, art)
- Foundational definitions

## Proposed Rule Refinement

Replace the universal 30-day test with a domain-aware approach:

```markdown
**Rule:** Every note should have a `last-reviewed` date OR a `review-interval` specification, updated on each review.
**Why:** Review frequency should match knowledge decay rate. Static knowledge (historical facts, proofs, canonical works) doesn't need the same review cadence as time-sensitive knowledge.
**Test:** 
1. Does each note have either `last-reviewed` OR `review-interval`?
2. For notes with `last-reviewed`: calculate days since review
3. Compare against `review-interval` (default: 30 days for unknown domains)
4. Flag only when: days-since-review > review-interval
```

**New frontmatter options:**
```yaml
review-interval: 30d        # Default for general knowledge
review-interval: 90d        # For stable technical knowledge  
review-interval: 180d      # For reference material
review-interval: annual     # For evergreen content
review-interval: historical # For ancient history (review when new discoveries)
review-interval: never      # For formal systems (math, logic)
```

**Domain-specific defaults:**
- Ancient history (pre-1900): review-interval: historical
- Mathematics/logic: review-interval: never
- Classical literature/art: review-interval: historical
- Modern events (post-1900): 30d default
- Technical documentation: 90d default

## Test for This Refinement

Can an AI agent determine the appropriate review interval without human guidance?

1. If note contains date ranges entirely before 1900 → historical
2. If note is a mathematical proof or axiom → never
3. If note has `lifecycle: evergreen` → annual
4. If note is about contemporary events → 30d
5. Otherwise → use vault default

## Related Seed Rules

- [[AI-Assisted Knowledge Management Seed#Every note should have a last-reviewed date]] — parent rule
- [[AI-Assisted Knowledge Management Seed#Notes with confidence high should have last-reviewed within a domain-appropriate timeframe]] — partial fix that needs expansion
- [[Stress Test - Confidence Markers Rule Across Domains]] — related testing

## Conclusion

The current 30-day universal test fails for historical and foundational knowledge. The rule needs domain-aware review intervals that match knowledge decay rates. Static knowledge should require far less frequent review than time-sensitive knowledge.
