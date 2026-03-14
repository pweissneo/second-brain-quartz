---
last-reviewed: 2026-03-14
lifecycle: active
confidence: emerging
author-type: ai-assisted
tags:
  - seed-stress-test
  - linking
  - graph-structure
---

# Stress Test: Diverse Link Types Rule

## Seed Rule Being Tested
**Rule:** Use diverse link types — relevance, contrast, analogy, cause/effect, category membership.
**Why:** Homogeneous links create a flat graph; diverse connection types enable richer traversal and insight.
**Test:** Categorize links in a random sample of 5 notes. Are at least 3 different link types represented across the sample?

## The Challenge

The Seed mentions link types but doesn't define them precisely:
- What counts as "relevance" vs "category membership"?
- Is "part of" the same as "category membership"?
- How do we distinguish "analogy" from "relevance"?
- Is "prerequisite" a link type or a relationship?

## Edge Cases Found

### Edge Case 1: Overlapping Categories

**Problem:** "relevance" is too broad. Nearly any link could be called "relevant."

Example:
- Note A links to Note B because B explains a concept in A
- Is this "relevance"? "cause/effect"? "prerequisite"?

All could apply, making categorization inconsistent.

**Verdict:** The rule needs clearer definitions or should be removed as unenforceable.

### Edge Case 2: Hub Notes Have Homogeneous Links

**Problem:** Hub notes by definition have links to their member notes — all category membership.

Example: A hub "Chess Openings" links to:
- [[Sicilian Defense]]
- [[Ruy Lopez]]
- [[French Defense]]

All are "category membership" links. By the current rule, this violates diversity.

**Verdict:** Hub notes are inherently homogeneous. The rule should exclude hubs or define hub links as a valid category.

### Edge Case 3: Sequential Knowledge Links

**Problem:** Sequential notes (history, processes) often have cause/effect links only.

Example: "The Great Depression" links to:
- [[Stock Market Crash 1929]]
- [[Bank Failures]]
- [[Unemployment]]

All cause/effect. Is this a violation?

**Verdict:** Sequential knowledge legitimately has homogeneous links. The rule should acknowledge this exception.

### Edge Case 4: Atomic Notes Have Few Links

**Problem:** Atomic notes (one idea) may only have 1-2 natural links.

Example: "Sicilian Defense" links to:
- [[Open Games]] (category)
- [[Black's Counterattack Strategy]] (concept)

That's 2 links, both category membership. Is this a violation?

**Verdict:** Atomic notes shouldn't be penalized for having fewer but meaningful links.

### Edge Case 5: No Clear Typing System

**Problem:** The Seed doesn't define HOW to tag link types.

Options:
1. Frontmatter on each note listing link types
2. Wikilink syntax extensions: [[concept|analogy:similar concept]]
3. Separate relationship notes
4. Just human judgment (not machine-testable)

**Verdict:** Without a defined system, AI agents cannot apply this rule.

## Proposed Refinement

### Option A: Remove the rule
The rule is unenforceable without clear definitions. Link diversity emerges naturally from good note-writing.

### Option B: Define explicit link types with tests

```yaml
link-type: prerequisite  # Must understand first
link-type: example       # Illustrates the concept
link-type: contrast      # Opposite or alternative
link-type: extension    # Builds on or adds to
link-type: analogy      # Similar pattern in different domain
link-type: category     # Member of a group
```

**Test:** For each link, can you assign ONE type? If multiple apply, pick the most specific.

### Option C: Apply only to non-hub, non-sequential notes

The rule only applies to:
- Regular notes (not hubs)
- Non-sequential content (not history, processes)
- Notes with 3+ outgoing links

## What Works

1. The intuition is correct — diverse connections create richer graphs
2. Hub notes are already protected by convention
3. Link diversity often emerges naturally from good atomicity

## What Breaks

1. The test is subjective ("categorize links") — not executable by AI
2. No way to input/link type information into notes
3. Hub notes and sequential notes are penalized unfairly

## Recommendation

The Seed should either:
1. **Remove** this rule as unenforceable, OR
2. **Define** a proper link typing system with frontmatter fields, OR
3. **Narrow** the rule to only apply to non-hub, non-sequential notes with 3+ links

## Related

- [[Linking Principle]]
- [[Hub Node Creation]]
- [[Graph Traversal Efficiency]]
- [[Seed Stress Test - Chess Knowledge Base]]
