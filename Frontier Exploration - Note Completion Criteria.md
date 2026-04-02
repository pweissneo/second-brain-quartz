---
last-reviewed: 2026-03-21
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - note-lifecycle
  - completion-criteria
related-seed-rule: diminishing-returns-testing
---

# Frontier Exploration: Note Completion Criteria

> When is a note "done"? The Seed addresses when to STOP adding new notes to a topic, but lacks guidance on when an individual note itself is complete.

## The Problem

The Seed's diminishing returns test asks: "Should I add this NEW note to an existing topic?"

But it doesn't answer:
- When has a specific note received "enough" development?
- How do you know when to stop expanding a note vs. leaving it as-is?
- What's the difference between a "mature" note and an "incomplete" note?

## Why This Matters

In domains like woodworking, a note about "table saw safety" could theoretically grow infinitely:
- Basic safety rules
- Specific blade types
- Dust collection
- Push techniques
- Joint-specific guidance
- Beginner vs. advanced considerations
- Tool-specific variations

Without completion criteria, notes either:
1. Keep growing indefinitely (bloat)
2. Get abandoned mid-development (inconsistent quality)
3. Get deleted as "redundant" (loss of useful content)

## Proposed Solution

Add a **Note Maturity Model** to the Seed:

### Maturity Stages

1. **Seed** (just created): Core definition or single insight. Tag: `maturity: seed`
2. **Sprouting** (1-3 links, basic structure): Has basic connections but needs development. Tag: `maturity: sprouting`
3. **Growing** (4+ links, examples added): Connected to graph, has supporting evidence. Tag: `maturity: growing`
4. **Mature** (comprehensive, stable): No obvious gaps, stable over time. Tag: `maturity: mature`
5. **Evergreen** (foundational, referenced widely): Core reference note. Tag: `maturity: evergreen`

### Completion Criteria by Stage

**Seed → Sprouting:**
- [ ] One clear definition or core claim
- [ ] At least 1 outgoing link to related concept
- [ ] Basic frontmatter (purpose, tags)

**Sprouting → Growing:**
- [ ] 2+ outgoing links to related concepts
- [ ] At least 1 example or application
- [ ] Evidence or source cited
- [ ] Links TO this note from at least 1 other note

**Growing → Mature:**
- [ ] Links to 3+ related notes (prerequisites, applications, alternatives)
- [ ] Multiple examples or applications
- [ ] Known limitations or edge cases documented
- [ ] Stable over 30+ days without major changes
- [ ] Has incoming links from 2+ different notes

**Mature → Evergreen:**
- [ ] Referenced as prerequisite by 5+ notes
- [ ] No updates needed in last 90 days
- [ ] Covers the complete concept for the vault's scope
- [ ] Serves as primary entry point for its topic

## Application in Woodworking

Consider "Table Saw Joinery" note:

| Stage | What it looks like | When to promote |
|-------|-------------------|-----------------|
| Seed | "A table saw can cut joints" | Created |
| Sprouting | Links to " dado blades" and "joinery types" | Has 2+ links |
| Growing | Examples: dados, tenons, rabbets. Source: woodworking book | Has examples + source |
| Mature | Covers 5+ joint types, safety notes, tool requirements | Stable 30+ days |
| Evergreen | Referenced by 10+ project notes | Referenced widely |

## Test for Seed

**Rule:** Apply stage-appropriate standards — don't expect Seed-stage notes to have what Mature-stage notes have.

**Why:** Expecting complete notes at creation time creates capture friction. Notes should evolve through stages naturally.

**Test:** Can you categorize your notes by maturity stage? Do most notes have a clear next developmental step?

## When to Stop

A note is "complete enough" when:
1. It serves its stated purpose without requiring additional context
2. Adding more would be expansion (new topic) not deepening (same topic)
3. The vault's scope doesn't require more detail
4. Further development would better serve a NEW note

## Questions for the Seed

1. Should completion criteria be domain-specific?
2. How do you handle notes that are "perpetually growing"?
3. Should there be a maximum maturity stage per vault size?

---

**Related:** [[Diminishing Returns Testing]] - When to stop adding NEW notes
**Related:** [[Note Lifecycle Management]] - How notes evolve over time
**Related:** [[Graph Maintenance]] - Vault health checks
