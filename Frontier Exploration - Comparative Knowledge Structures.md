---
last-reviewed: 2026-03-11
lifecycle: deprecated
confidence: high
tags:
  - frontier-exploration
  - structure
  - atomicity
  - comparison
  - superseded
---

> **⚠️ DEPRECATED:** This note's proposed rule has been incorporated into the Seed.
> See: [[AI-Assisted Knowledge Management Seed]] → Rule: "Structure comparative knowledge based on the nature of the decision"

# Frontier Exploration - Comparative Knowledge Structures

> How should a knowledge base structure notes that compare two or more approaches, tools, methods, or frameworks?

## The Problem

When building a knowledge base, comparative questions arise naturally:
- "Docker vs Kubernetes — when to use which?"
- "SQL vs NoSQL databases"
- "React vs Vue for frontend development"
- "Gas stove vs induction cooktop"

The Seed's atomicity rule (one idea per note) creates tension with comparative notes: is comparing two things one idea or two? How do you structure this without violating atomicity while still providing useful knowledge?

## Current Guidance Gap

The Seed provides:
- Atomicity rules for single-concept notes
- Linking rules for relationships between notes
- Handling contradictory sources (synthesis)

But missing:
- Explicit guidance on comparative note structures
- Criteria for when to compare in one note vs. separate notes
- How to maintain atomicity when the comparison IS the insight

## Analysis

### Option 1: Single Comparative Note

Create one note like "Docker vs Kubernetes" that covers both approaches in one atomic note.

**Pros:**
- Keeps related knowledge together
- Enables direct side-by-side comparison
- Natural unit of thought ("choosing between X and Y")

**Cons:**
- Can become unwieldy if complex
- Violates strict atomicity if both approaches have equal weight
- Harder to link from individual approach notes

**When it works:**
- The comparison itself is the key insight
- Both options are commonly considered together
- The note serves as a decision-making aid

### Option 2: Paired Notes with Links

Create separate atomic notes for each approach, with explicit cross-links.

**Pros:**
- Each note stays atomic
- Each approach can be developed independently
- Links to individual notes from other contexts

**Cons:**
- Comparison requires visiting two notes
- Harder to see tradeoffs at a glance
- May fragment decision-relevant knowledge

**When it works:**
- Each approach is substantial enough for independent treatment
- Comparison is secondary to understanding each approach
- Users typically start by understanding one option

### Option 3: Hub + Spoke

Create a hub note for the comparison category, with atomic notes for each approach.

**Pros:**
- Clear navigation structure
- Scalable for 3+ options
- Hub can contain criteria for decision-making

**Cons:**
- More complex structure
- Requires maintaining multiple files

**When it works:**
- 3+ options to compare
- Ongoing domain with evolving options
- Decision criteria are complex enough to warrant their own note

## Proposed Rule

**Rule:** Structure comparative knowledge based on the nature of the decision:
- If the decision is binary (choose X or Y) and comparison IS the insight → single comparative note
- If each option requires substantial independent development → separate notes with links
- If 3+ options exist or decision criteria are complex → hub + spoke structure

**Why:** Comparative knowledge serves different purposes (decision aid vs. deep understanding). The structure should match the purpose.

**Test:** 
1. Is the primary insight "how X and Y differ" or "when to choose X vs. Y"? → Single note
2. Does each option need 300+ words of independent content? → Separate notes
3. Are there 3+ options OR complex decision criteria? → Hub + spoke

## Edge Cases

- **Temporal comparison:** "2020 vs 2024 approach" — treat as single note with version scope
- **Personal preference:** "My preferred tool" — separate from objective comparison
- **Evolving comparison:** New options emerging — hub structure scales better

## Related
- [[Atomic Note Principle]]
- [[Handling Contradictory Sources]]
- [[Hub Node Creation]]
- [[Frontier Exploration - Learning vs Reference Knowledge Bases]]
