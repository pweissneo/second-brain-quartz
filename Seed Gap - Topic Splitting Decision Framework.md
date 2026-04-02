---
last-reviewed: 2026-04-01
last-updated: 2026-04-01
lifecycle: seed-gap
confidence: medium
author-type: ai-assisted
tags:
  - seed-gap
  - frontier-exploration
  - knowledge-organization
  - topic-division
gap-type: seed-missing
gap-phase: analysis
gap-status: proposed
---

# Seed Gap: Topic Splitting Decision Framework

## The Gap

The Seed has clear guidance for:
- **Merging**: When notes are redundant → merge into one stronger note
- **Atomicity**: When to keep procedural content together vs split reusable parts
- **Multi-vault**: When to split one vault into multiple

But it lacks guidance for the in-between case: **When should a single topic be conceptually split into multiple notes within the same vault?**

## Why This Matters

Without a topic-splitting framework, AI agents face ambiguity:

1. **Growing notes**: A note starts covering "cooking techniques" but expands to include knife skills, heat management, sauce making, and ingredient preparation — when should it become multiple notes?

2. **Hub creation**: When does a topic warrant a hub note vs just keeping all content in one place?

3. **Child note threshold**: When should subtopics become separate child notes vs sections within a parent note?

4. **Breadth vs depth**: The Seed tells us to balance exploration/exploitation, but not when a growing topic should branch vs deepen in place

## Current Seed Coverage (Incomplete)

The Seed covers:
- Note size (100-300 words) — but this is about length, not conceptual scope
- Atomicity for procedures — but this is about workflow coherence, not topic division
- Multi-vault splitting — but this is about vault-level, not note-level

What's missing: **A decision framework for splitting a topic into multiple related notes.**

## Related Existing Notes

- [[Note Creation Decision Framework]] — When to create new notes (complementary)
- [[Hub Node Creation]] — When to create hub notes
- [[Note Types and Templates]] — Note classification
- [[Seed Refinement - Diminishing Returns Testing Across Domains]] — Related to growth decisions

## Proposed Rule Structure

A topic-splitting rule would need:

1. **Trigger conditions**: When does a note need splitting?
   - Multiple distinct concepts covered (not just length)
   - Different audiences for different parts
   - Parts useful independently
   - Internal navigation becomes difficult

2. **Splitting strategies**:
   - Hub-and-spoke: One hub linking to specialized child notes
   - Sequential: Note series with bidirectional links (prerequisites)
   - Parallel: Alternative approaches to same problem
   - Layered: Overview + detailed deep-dives

3. **Preservation rules**:
   - Keep internal links between split parts
   - Update all incoming links to correct parts
   - Maintain cross-reference in parent note

## Domain Testing Needed

This framework would need stress testing across domains:
- **Cooking**: "Cooking techniques" → knife skills, heat, sauces, ingredients?
- **Programming**: "Debugging" → debugging tools, debugging strategies, debugging specific languages?
- **Gardening**: "Plant care" → watering, soil, pruning, seasonal care?

## Seed Integration Point

This gap relates to:
- Note lifecycle management (when notes evolve past original scope)
- Knowledge graph structure (how topology changes with growth)
- Construction phase model (when to apply stricter splitting rules)

## Status

**Identified**: 2026-03-28  
**Phase**: Analysis  
**Status**: Proposed  
**Related Seed rules**: Note creation, atomicity, multi-vault architecture

---

## Proposed Rule (Rule/Why/Test Format)

**Rule:** Apply topic-splitting when a note meets 2+ trigger conditions — multiple distinct concepts, different audiences, independently useful parts, or difficult internal navigation.

**Why:** Without explicit splitting triggers, AI agents default to only merging (reducing redundancy) but never splitting (managing growth), causing note bloat and conceptual overload.

**Test:** For notes >300 words: (1) Does it cover 2+ distinct concepts? (2) Could parts serve different audiences? (3) Are parts independently reusable? (4) Is internal navigation becoming complex? If 2+ yes → split using hub-and-spoke, sequential, parallel, or layered strategy.

---

## Did I Learn Something New?

Yes. The Seed has robust guidance for merging redundant notes but almost no guidance for splitting growing topics. These are complementary operations — merge reduces noise, split manages growth — yet the Seed treats them asymmetrically. This creates an asymmetry in the vault's ability to handle both expansion (new topics) and growth (existing topics expanding).

The gap identification rule itself could be extended to include "topic expansion detection" — scanning for notes that cover multiple distinct concepts that could benefit from splitting.