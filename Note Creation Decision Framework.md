---
last-reviewed: 2026-04-03
lifecycle: evergreen
confidence: high
author-type: ai-assisted
tags:
  - methodology
  - decision-making
  - note-creation
knowledge-type: conceptual
retrieval-mode: search
storage-pattern: atomic
verification-approach: logical-consistency
---

# Note Creation Decision Framework

> When should I create a new note vs. extend an existing one?

This is distinct from **Note Insertion Strategy**, which covers *where* to place knowledge in the graph. This framework addresses *whether* to create at all.

## Rule

**Rule:** Create a new note when the incoming knowledge represents a distinct atomic idea that could stand alone; extend an existing note when the knowledge is a variation, example, or elaboration of an existing concept.

**Why:** Without explicit criteria for note creation vs. extension, agents default to creating new notes (easier, more visible) even when extending existing notes would strengthen the graph. This creates fragmentation where related ideas are scattered across multiple thin notes instead of concentrated in robust, interconnected ones.

**Test:** For incoming knowledge: (1) Can this idea be expressed in one sentence as a standalone insight? (2) Does it have its own prerequisite structure? (3) Would it naturally link to 2+ existing notes in a way that isn't just "related to"? (4) Could someone search for this specifically and expect a dedicated result? If yes to 2+ criteria, create new. Otherwise, extend existing.

## Decision Tree

```
New knowledge arrives →

1. Does it contradict existing knowledge?
   → YES → Handle via [[Handling Contradictory Sources]]
   → NO  → Continue

2. Does it introduce a NEW concept/term/idea?
   → YES → Create new note
   → NO  → Continue

3. Does it add a SPECIFIC example to an existing principle?
   → YES → Extend existing (add to examples section)
   → NO  → Continue

4. Does it represent a VARIATION of an existing idea?
   → YES → Could this variation recur? 
            (examples: domain variants, context variants)
            → YES → Create new note with cross-link
            → NO  → Extend existing with context caveat
   → NO  → Continue

5. Does it represent a NEW PREREQUISITE for existing knowledge?
   → YES → Create new note, link as prerequisite
   → NO  → Continue

6. Does it refine, update, or correct existing knowledge?
   → YES → Update in place with correction markers
   → NO  → Consider: Is this worth capturing at all?
```

## Examples

**Create new when:**
- New term: "When I learn 'reduction' as a cooking technique, that's a new concept note"
- New prerequisite: "Before learning sous-vide, you need to understand temperature control"
- Domain-specific variant: "Debugging in cooking" vs. "Debugging in code" (same problem type, different domain)
- Standalone insight: "Notes with >3 links have 40% higher retrieval success"

**Extend existing when:**
- Adding an example to a principle
- Adding a domain-specific elaboration that doesn't warrant its own note
- Adding a clarification or caveat to existing knowledge
- Adding a variation that likely won't recur

## Edge Cases

**Stub notes:** If the knowledge is partially formed but worth capturing, create a stub note rather than extending existing notes with vague content. Use `lifecycle: stub` to mark it.

**Expansion triggers:** A note should spawn a new note when:
- It accumulates 5+ examples that could be reorganized
- It mentions a concept >3 times without that concept having its own note
- It has prerequisites that don't exist yet
- It contains a "see also" list of >5 items (hub candidate)

**Contraction triggers:** An existing note should be split when:
- It's >1000 words AND covers multiple distinct ideas
- It has sections that could each stand alone with 2+ links
- Different audiences need different entry points (beginner vs. advanced)
- One section is consistently referenced without the rest

## Integration with Seed

This framework complements:
- **[[Note Insertion Strategy]]** — where to place new knowledge (graph position)
- **[[Atomic Note Principle]]** — what makes a note atomic (size/boundary)
- **[[Hub Node Creation]]** — when to create hub notes (connectivity threshold)
- **[[Note Lifecycle Management]]** — when to deprecate or merge notes

## Test (for AI agents)

Run on your last 10 note creations:
1. How many could have been extensions instead?
2. How many link to ≥2 existing notes as something other than "related"?
3. How many have standalone value vs. would be better as examples in existing notes?

If >30% of recent creations could be extensions, you're over-creating. If <10%, you may be under-creating and losing granularity.

---

**See also:**
- [[Frontier Exploration - Note Completion Criteria]]
- [[Frontier Exploration - Hub Node Creation]]
- [[Note Lifecycle Management]]
- [[Atomic Note Principle]]
