---
last-updated: 2026-04-04
last-reviewed: 2026-04-08
lifecycle: frontier-exploration
confidence: emerging
author-type: ai-assisted
knowledge-type: conceptual
verification-status: unverified
tags:
  - frontier-exploration
  - verification
  - safety-critical
  - physics
  - foundational
schema-version: "1.0"
---

# Frontier Exploration: Content-Based Safety Detection and Foundational vs Hub Distinction

> How to handle implicit safety-critical knowledge and distinguish foundational from hub notes in verification prioritization.

## The Gap

The Seed's Verification Priority Hierarchy rule (lines 404-441) assumes frontmatter tags like `criticality: high` or `safety-critical: true` already exist on notes. This creates test executability problems in domains like physics where:

1. **Implicit safety-critical knowledge** — Notes contain safety-relevant content WITHOUT frontmatter tags
2. **Foundational ≠ Hub** — Core equations have low backlink counts (everything builds FROM them) but are most critical to verify
3. **Small vault assumption** — Test assumes verification history exists, but new vaults lack this

## Evidence

From `Seed Refinement - Verification Priority Adaptations.md`:
- The refinement note identifies this gap clearly
- It proposes content-based safety scanning using domain keyword lists
- It distinguishes foundational notes (core equations, laws) from hub notes (topic summaries)
- Yet the Seed hasn't integrated this refinement

## What the Seed Is Missing

### Rule Gap: Content-Based Safety Scanning

The Seed tells agents to prioritize notes based on frontmatter tags but doesn't tell them HOW to find safety-critical notes that lack those tags. For physics, chemistry, engineering domains:

```
Current approach: Check if frontmatter has safety-critical: true
Missing: How to detect safety-critical content WITHOUT frontmatter tag
```

### Rule Gap: Foundational vs Hub Distinction

The Seed uses "frequently-referenced" as a proxy for importance, but:
- **Foundational notes** (core equations, fundamental laws) — everything builds FROM them but may have few backlinks (only explicit links)
- **Hub notes** (topic summaries) — everything connects TO them, high backlink count

These require DIFFERENT verification approaches:
- Foundational: correctness (is this right?)
- Hub: completeness (is this comprehensive?)

## Proposed Seed Rule Addition

> **Rule:** For domains with implicit safety-critical knowledge (physics, chemistry, engineering), supplement frontmatter-based detection with content-based safety scanning using domain-specific keyword lists.
>
> **Why:** Domain-specific knowledge often contains safety-relevant content without explicit frontmatter tags. An AI agent cannot rely solely on frontmatter to identify what needs rigorous verification.
>
> **Test:** (1) Can you identify domain-specific safety keywords relevant to your vault? (2) Do notes containing those keywords get flagged for enhanced verification even without frontmatter tags? (3) Is there a domain-appropriate ordering for verification in new vaults without history?

> **Rule:** Distinguish foundational notes (core concepts everything builds FROM) from hub notes (topic summaries everything connects TO) and apply different verification approaches.
>
> **Why:** "Frequently-referenced" conflates two distinct patterns requiring different verification strategies. Foundational notes need correctness checks; hub notes need completeness checks.
>
> **Test:** (1) Can you identify foundational notes in your domain? (2) Do they have different verification approach than hub notes? (3) Is verification ordering based on expected usage frequency rather than backlink count?

## Implementation Example

```yaml
# Domain-specific safety keyword lists
physics-safety-keywords: [radiation, voltage, laser, magnetic-field, cryogenic, vacuum, radioactive, particle-beam]
chemistry-safety-keywords: [toxic, flammable, corrosive, reactive, explosive, carcinogenic]
engineering-safety-keywords: [structural-load, electrical-shock, pressure, temperature-extreme]

# Foundational vs Hub classification
note-category: foundational|hub|applied|reference
verification-approach: correctness|completeness|application|accuracy
```

## Related

- [[Seed Refinement - Verification Priority Adaptations]] — Source of this gap
- [[Seed Stress Test - Verification Priority in Physics]] — Domain stress test
- [[Seed Stress Test - Verification Priority Hierarchy Edge Cases]] — Cross-domain edge cases
- [[Confidence Markers]] — Existing confidence tracking
- [[Frontier Exploration - Safety-Critical Knowledge Thresholds]] — Safety knowledge handling