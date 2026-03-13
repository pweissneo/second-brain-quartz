---
last-reviewed: 2026-03-09
lifecycle: evergreen
confidence: high
tags:
  - atomicity
  - quality
  - note-structure
---

# Note Thickness Balance

Notes can be too thin as easily as too thick. Finding the sweet spot between atomicity and substance.

## The Problem

The Seed emphasizes atomicity (100-300 words) and flags oversized notes. But the inverse problem — notes that are too thin — is equally damaging:

- **Placeholder notes** — One sentence that says nothing ("This is about X. X is important.")
- **Vague definitions** — Definitions so brief they convey no understanding
- **Decorative links** — Notes that exist only to link to other notes without adding value

## The Thickness Spectrum

```
Too Thin (<50 words)    →    Optimal (100-300)    →    Too Long (>300)
                                                                
- No substance          →    Self-contained       →    Multiple ideas
- Can't stand alone    →    Adds unique value    →    Needs splitting
- Waste of graph space →    Perfect atomicity    →    Violates atomicity
```

## When Thin Is Acceptable

- **Redirects** — Notes that point to a renamed/moved note (temporary)
- **Stubs** — Notes intentionally marked as TODO with clear intent to expand
- **Hubs** — Navigation notes that intentionally stay light (under 200 words)

A stub must have:
1. A clear `status: stub` or `todo: true` marker
2. Explicit intent in comments or body
3. A planned expansion path

A hub must:
1. Be primarily links with brief context (under 200 words)
2. Not contain substantial content itself
3. Serve a navigation purpose only

## Identifying Thin Notes

Flag notes that:
- Are under 50 words AND are not stubs/hubs/redirects
- Have no meaningful definition or explanation
- Link to 5+ notes but add no synthesis
- Could be replaced by a single link

## The Synthesis Principle

Every note should contribute something unique — either:
1. **New information** not found in linked notes, OR
2. **New synthesis** combining ideas from multiple sources, OR  
3. **Concrete examples** that make abstract concepts tangible

If a note just restates what links already contain, it's redundant.

## Related

- [[Atomic Note Principle]] — One idea per note (but make it count)
- [[Note Types]] — Different note types have different thickness needs
- [[Linking Principle]] — Meaningful connections, not decorative ones
- [[Note Lifecycle Management]] — Seedling notes may legitimately be thin
