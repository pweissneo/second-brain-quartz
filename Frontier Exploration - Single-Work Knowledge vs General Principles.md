---
last-reviewed: 2026-03-10
lifecycle: draft
confidence: emerging
tags:
  - frontier-exploration
  - creative-knowledge
  - single-work
  - atomicity
---

# Frontier Exploration: Single-Work Knowledge vs. General Principles

> How to handle knowledge about individual creative works (compositions, books, paintings) as atomic units versus extracting general principles

## The Problem

In creative domains (music, literature, visual art, film), a distinct type of knowledge exists: **knowledge about a single work** versus **knowledge about general principles**. The Seed's atomicity rule ("one idea per note") assumes ideas are abstract principles, but creative works are often treated as atomic units of knowledge themselves.

### Examples

**Music:**
- Single work: "Beethoven's Symphony No. 5" — 2000+ words analyzing this specific piece
- General principle: "Sonata Form" — the structural framework

**Literature:**
- Single work: "The Great Gatsby — Symbolism of the Green Light"
- General principle: "Symbolism in American Realism"

**Visual Art:**
- Single work: "Van Gogh's Starry Night — Brush Technique Analysis"
- General principle: "Impressionist Brush Techniques"

**Film:**
- Single work: "Citizen Kane — Deep Focus Cinematography"
- General principle: "Deep Focus Photography Techniques"

## Why This Is a Frontier

The Seed handles:
- ✓ Procedural content (recipes, code) with size exceptions
- ✓ Comprehensive principle explanations with exceptions
- ✓ Sequential knowledge (where order IS the knowledge)

But the Seed does NOT address:
- ✗ When a single creative work should be an atomic note
- ✗ How deeply to cover a single work before extracting principles
- ✗ How to link single-work notes to principle notes bidirectionally
- ✗ Whether "analyzing one work extensively" is one idea or many

## The Tension

**Option A: Treat every analysis as a principle**
- Note: "Sonata Form in Beethoven's Fifth"
- Note: "Sonata Form in Mozart's 40th"
- Note: "Sonata Form in Brahms' Third"
- Problem: Fragmented, hard to find, loses the specific insight about each work

**Option B: Treat each work as atomic**
- Note: "Beethoven's Symphony No. 5" (comprehensive, 2000+ words)
- Problem: Violates 100-300 word guideline, may bundle multiple ideas

**Option C: Hybrid approach**
- Note: "Beethoven's Symphony No. 5" (brief overview + links to principle analyses)
- Note: "Sonata Form Analysis — Beethoven's Fifth" (linked principle application)
- Problem: More complex, requires careful linking

## Current Seed Gaps

1. **No guidance on single-work atomicity** — When does "one idea" mean one principle vs. one work?
2. **No word-count exception for comprehensive work analyses** — Unlike recipes/code, creative work analyses aren't procedures
3. **No linking convention** — How should work notes link to principle notes and vice versa?
4. **No guidance on depth** — How deep should a single-work note go before splitting?

## Test Case: Building a Music Composition Knowledge Base

An AI building a music vault with current Seed rules would:
- ✓ Create atomic notes on theory principles
- ✓ Link between concepts
- ✗ Not know whether "Beethoven's Fifth Analysis" should be one note or split
- ✗ Not know how to balance work-specific vs. principle-specific notes
- ✗ May violate atomicity by creating massive work notes, or fragment knowledge by splitting too aggressively

## Proposed Seed Extensions

### Rule: Treat single creative works as potential atomic units when they are frequently referenced

**Why:** A work that is referenced by multiple other notes (performance analyses, historical context, technique examples) benefits from being a single, comprehensive note. Splitting it would fragment knowledge that benefits from being unified.

**Test:** Pick a work mentioned in 5+ other notes. Is it a single atomic note? Can you find all knowledge about this work in one place?

### Rule: Use the "overview + linked deep-dives" pattern for major works

**Why:** Major works (canonical pieces, essential books, important paintings) often have enough depth to warrant both an overview and multiple principle-specific analyses. The overview serves as a hub; deep-dives link back to it.

**Test:** For works with 1000+ words of analysis:
1. Is there an overview note providing context?
2. Are principle-specific analyses linked and do they link back?
3. Can you navigate from principle to work and work to principle?

### Rule: Extract principles from multiple works, not from one

**Why:** A principle extracted from a single work may be idiosyncratic to that work. Principles should be verified across multiple examples before becoming standalone notes.

**Test:** Before creating a principle note from one work analysis:
1. Does this principle appear in at least 2 other works?
2. Is the principle generalizable beyond this specific work?
3. Does the principle note reference multiple works as examples?

### Rule: Tag single-work notes with `type: work-analysis` and principle notes with `type: principle`

**Why:** Structured typing allows filtering and helps AIs understand the note's nature.

**Test:** Can you filter notes by type: work-analysis vs. principle?

## Related

- [[Atomic Note Principle]]
- [[Frontier Exploration - Multi-Modal Knowledge]]
- [[Frontier Exploration - Framework-Dependent Knowledge]]
- [[Stress Test - Self-Contained Notes Rule in Music Composition]]
- [[AI-Assisted Knowledge Management Seed]]
