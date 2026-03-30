---
last-reviewed: 2026-03-24
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - ai-agent
  - vault-construction
  - decision-making
---

# Frontier Exploration - AI Vault Construction Decision Framework

> How AI agents should make structural decisions when building knowledge bases from scratch

## The Problem

The Seed provides extensive guidance on:
- How to structure individual notes (atomicity, size, formatting)
- How to link notes together (minimum links, diverse types)
- How to organize with hubs and navigation
- How to maintain quality over time

But the Seed assumes an existing vault with existing decisions. When an AI agent builds a vault from scratch, it faces **foundational decisions** that have no guidance:

- Should I create a hub first or individual notes first?
- When encountering a new domain, what's the first note I should create?
- How do I decide the initial vault structure before I know what topics will emerge?
- When should I create a new note vs. extend an existing one?

## The Bootstrap Paradox

The Seed's 3-hop rule and hub density rules assume an existing structure to evaluate. But when building from zero:

1. **First note**: There's no graph to evaluate — the first note creates the initial structure
2. **Initial linking**: The "minimum 2 links" rule can't apply to early notes
3. **Hub creation**: The "5+ related notes" threshold requires notes to exist first

This creates a chicken-and-egg problem for AI construction.

## Construction Order Heuristics

### For New Domains

When encountering a new domain to capture:

1. **Create a domain hub first** (even if empty initially) — provides a landing point
2. **Add the first 2-3 atomic notes** — establish the domain scope
3. **Create linking structure** — connect notes before adding more
4. **Refine hub** — expand hub with links once 3+ notes exist

Rationale: A domain without a hub creates orphans. Notes without links become invisible.

### For Unknown Topic Vagueness

When the domain boundaries are unclear:

1. Start with **one broad placeholder note** defining the topic space
2. Add **specific notes** as concrete examples emerge
3. **Split the placeholder** into hubs when 3+ distinct subtopics appear
4. Keep the placeholder as a "gateway" note, not atomic content

### Decision Framework

| Situation | Recommended Action |
|-----------|-------------------|
| New domain discovered | Create domain hub, then 3 atomic notes |
| Unclear domain boundaries | Start with broad placeholder, refine later |
| Multiple related topics emerge | Create hub before adding more notes |
| Isolated important concept | Create with `foundational: true` tag |
| Note could be two topics | Split immediately, link both ways |

## The First Note Problem

When building a completely new vault, what should the first note be?

### Recommended First Note Structure

1. **`_root.md`** — Required by Seed, defines vault purpose
2. **Primary domain hub** — The main topic area (e.g., "Cooking", "Programming")
3. **One atomic note** — A concrete example in that domain

This creates: purpose → structure → content flow.

### Anti-patterns

- Starting with 10+ unrelated notes (no structure)
- Creating hubs without any content (empty navigation)
- Linking everything to root (no intermediate hubs)

## Construction Phase Model

### Phase 1: Skeleton (notes 1-20)
- Focus: Establish hubs and basic structure
- Accept: Lower link density, some orphans
- Priority: Get structure in place

### Phase 2: Flesh (notes 20-100)
- Focus: Add content, create missing links
- Accept: Some redundancy as topics clarify
- Priority: Connect existing notes

### Phase 3: Muscle (notes 100+)
- Focus: Quality, refinement, depth
- Accept: Slower growth, higher standards
- Priority: Verify, cross-link, mature

### Phase 4: Maturity (notes 200+)
- Focus: Maintenance, edge cases
- Accept: Diminishing returns on expansion
- Priority: Exploitation over exploration

## Rule Relaxation During Construction

The Seed's rules assume a mature vault. During construction, relax:

| Rule | Relaxed Threshold for Construction |
|------|-----------------------------------|
| Minimum 2 links | 1 link acceptable for first 10 notes |
| 3-hop maximum | 4 hops acceptable until hubs established |
| 100-300 word size | Accept 50-100 word notes until domain clarifies |
| Hub at 5+ notes | Create hub at 3+ notes for new domains |

**Critical**: These relaxations must be temporary. Track construction phase and tighten rules as vault matures.

## Testing Construction Quality

At each phase, ask:

- **Phase 1**: Can I trace from root to any note in ≤3 hops?
- **Phase 2**: Are most notes linked to at least 1 other note?
- **Phase 3**: Does link diversity include 3+ types?
- **Phase 4**: Can I verify >50% of notes?

## Seed Rule Suggestion

The Seed should include a construction-timeout rule:

> **Rule:** After 50 notes, evaluate whether initial structural decisions are working. If graph metrics (orphan rate, hop depth, link density) don't meet mature-vault standards, refactor before continuing.
> **Why:** Early structural mistakes compound. It's cheaper to fix at 50 notes than 500.
> **Test:** At 50 notes: (1) Orphan rate <10%? (2) Average hop depth <3? (3) Link diversity score >2?

## Related Notes

- [[Frontier Exploration - Vault Growth Velocity and Sustainable Expansion]]
- [[Frontier Exploration - Multi-Vault Architecture]]
- [[Graph Traversal Efficiency]]
- [[Knowledge Graph Structure]]
