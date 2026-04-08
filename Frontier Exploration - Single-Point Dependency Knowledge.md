---
tags:
  - frontier-exploration
  - knowledge-architecture
  - self-reference
created: 2026-03-16
confidence: emerging
lifecycle: evergreen
last-reviewed: 2026-04-08
last-updated: 2026-04-08
author-type: ai-assisted
verification-status: unverified
access-pattern: decision
knowledge-type: meta
---

# Frontier Exploration - Single-Point Dependency Knowledge

## The Problem

Some knowledge in a vault exists in a fragile state — it is true (or useful) only because a single other piece of information is not yet known or doesn't exist. This is different from:

- **Contradictory sources** — we have conflicting evidence
- **Unverified knowledge** — we could test but haven't yet  
- **Discredited knowledge** — we have evidence it's false
- **Provisional knowledge** — subject to change with more evidence

This is **dependency knowledge** — knowledge that would be invalidated, reversed, or fundamentally changed by discovering one specific piece of information that currently doesn't exist or isn't known.

## Examples

1. **Belief-invalidation knowledge**: "I believe X is true because I haven't seen evidence Y" — if Y is ever discovered, the belief must be abandoned
2. **Placeholder reasoning**: "Assuming A is true, then B follows" — but A is unknown
3. **Absence-based conclusions**: "No successful method exists for X" — currently true but could be invalidated by a future discovery
4. **Single-witness knowledge**: "Source A claims X" — vulnerable to being contradicted by a single new source
5. **Temporal uniqueness claims**: "This is the only known example" — depends on complete knowledge of all examples

## Why This Matters for AI Knowledge Bases

When an AI builds a knowledge base from scratch using only the current Seed rules, it may capture these fragile truths without any mechanism to:
1. Recognize their fragility
2. Track what would invalidate them
3. Automatically revisit them when new information arrives
4. Distinguish them from robust knowledge

## Challenges for Seed Rules

Current Seed rules address:
- Confidence markers (but not specifically for dependency fragility)
- Contradictory sources (but not single-point dependency)
- Temporal knowledge (but not this specific fragility type)
- Diminishing returns (but not this type of knowledge quality)

## Potential Seed Enhancement

**Rule idea:** Tag knowledge with single-point dependencies differently from other provisional knowledge:

```yaml
dependency-type: single-point  # vs multi-point, robust
dependency-condition: "What would invalidate this"
invalidation_threshold: 1  # How many new discoveries would change this
```

**Test:** Can you identify knowledge in your vault that would be fundamentally changed by a single new piece of information? Do you track what that information would be?

## Concrete Examples Across Domains

### Scientific Research
- "No known cure exists for this disease" — invalidated by a single successful treatment
- "This species has never been observed in the wild" — invalidated by one sighting
- "This chemical reaction has never been documented" — invalidated by one experiment

### Technical Knowledge
- "This API endpoint has no rate limit" — invalidated by one documentation update
- "This library has no known security vulnerabilities" — invalidated by one CVE
- "This combination of tools has never been tested" — invalidated by one test attempt

### Historical/Literary
- "This is the only surviving manuscript of this work" — invalidated by one discovery
- "No primary source exists for this event" — invalidated by one document discovery
- "This author never visited this location" — invalidated by one letter or record

### Personal Knowledge
- "I've never tried this restaurant" — invalidated by one visit
- "This route is the fastest" — invalidated by one traffic pattern
- "No one in my network knows about X" — invalidated by one introduction

## Proposed Seed Rule

**Rule:** For knowledge that depends on a single piece of missing information for its validity, document the dependency explicitly with `dependency-type: single-point` and `invalidation-condition:` frontmatter.

**Why:** Single-point dependency knowledge is uniquely fragile — unlike multi-point (requires multiple discoveries to invalidate) or robust knowledge (no single discovery changes it), single-point knowledge can be invalidated by one new piece of information. Without explicit tracking, AI agents cannot:
1. Recognize this fragility
2. Prioritize finding the invalidating information
3. Automatically revisit when new information arrives
4. Distinguish from robust knowledge when answering queries

**Test:**
1. Can you identify knowledge in your vault that would be fundamentally changed by a single new piece of information?
2. Does that knowledge explicitly document what would invalidate it?
3. Is there a mechanism to flag these notes for periodic re-evaluation?
4. Do you treat single-point dependency knowledge differently from robust knowledge in query responses?

**Implementation:**
```yaml
dependency-type: single-point  # single-point | multi-point | robust
invalidation-condition: "What single discovery would change this"
invalidation-source-type: experiment | document | observation | source | record
priority: high | medium | low  # how urgent to resolve
last-checked: 2026-04-08
```

## Related Notes

- [[Frontier Exploration - Incomplete and Provisional Knowledge]] — overlaps with provisional knowledge
- [[Handling Contradictory Sources]] — different from contradictory (we have conflicting evidence)
- [[Frontier Exploration - Unknown Unknowns in Vast Domains]] — related but broader (includes what we don't know we don't know)
- [[Confidence Markers]] — confidence should be lower for single-point dependency knowledge
- [[Frontier Exploration - Knowledge Re-Evaluation Triggers]] — when to revisit notes

## Questions to Explore

1. How should an AI agent identify single-point dependencies vs robust knowledge?
2. Should these notes have different lifecycle rules?
3. How do you track "what would change this" without knowing what you don't know?
4. Is this fundamentally different from "unknown unknowns" or a subset of it?

---

*This is a frontier note — not a mature Seed rule. It captures an emerging insight about knowledge management that may develop into testable rules over time.*
