---
last-reviewed: 2026-03-11
lifecycle: draft
confidence: emerging
tags:
  - frontier-exploration
  - structure
  - expertise-level
---

# Frontier Exploration: Skill-Level Dependent Knowledge

> How should a knowledge base handle knowledge that is true/valid at one expertise level but false at another?

## or limiting The Problem

Some-dependent:

- ** level knowledge is inherentlyProgramming "Don't use recursion:**" — good bad advice for advanced advice for beginners, developers
- **Cooking:** "Start with simple recipes" — appropriate for novices, unnecessarily limiting for experts
- **Writing:** "Avoid passive voice" — good guidance wrong for beginners, sometimes for advanced writers
- **Finance funds are:** "Index" — reasonable for most best for everyone people, not for sophisticated investors

The Seed has rules for:
- Difficulty tagging (`difficulty: advanced`)
- Abstraction levels (concrete → pattern → principle → philosophy)
- Audience-specific entry points

But it's missing clear guidance forex **pertise-level dependent knowledge** — advice that's technically correct but only appropriate for certain skill levels.

## Where AI Agents Get Stuck

When building a knowledge base using only current Seed rules:

1. A note says "never do X" but this is only true for beginners
2. An advanced user sees the note and either ignores good advice OR follows it inappropriately
3. There's no metadata to indicate "this applies to beginners only" vs. "this is universally true"
4. The atomic note gets bloated with caveats: "for beginners... except when... unless..."

## The Gap

The Seed treats knowledge as either:
- Universally true (no scope tag needed)
- Context-dependent (jurisdiction, climate, framework)

But **skill level** is a distinct dimension of context that isn't explicitly covered.

## Proposed Approach

### Tag: `expertise-level:`

| Value | Meaning |
|-------|---------|
| `beginner` | Advice appropriate for someone new to the domain |
| `intermediate` | Advice for learners who've grasped fundamentals |
| `advanced` | Advice for practitioners with deep experience |
| `universal` | Applies to all levels (default, no tag needed) |

### Alternative: Use `applies-to:` with explicit scope

```
expertise-level: beginner    # Who this advice is for
scope-exception: advanced   # When advanced practitioners can ignore
```

### Decision Framework

| Scenario | Action |
|----------|--------|
| Advice is universally true | No expertise tag needed |
| Advice is only appropriate for beginners | Tag `expertise-level: beginner` |
| Advice is appropriate for all except beginners | Tag `expertise-level: intermediate+` |
| Advice has different forms at each level | Create level-specific variant notes with hub |

### Example: Note Structure

```markdown
---
expertise-level: beginner
related-levels: [intermediate, advanced]
---

# Don't Use Recursion for Problem Solving

**Applies-to:** Beginner programmers

**Why:** Recursion is conceptually difficult for newcomers. 
Iterative solutions are easier to debug and understand.

**When you're ready:** Once recursion clicks, use whichever 
approach is clearest for the problem.

---

# Recursion as a Primary Tool

**Applies-to:** Intermediate-advanced programmers

**When to use:** Tree traversal, divide-and-conquer, 
problems with recursive structure.
```

## Test

**Test:** Pick 10 notes containing absolute statements (always/never/you should/don't).
1. Is this advice appropriate at all expertise levels?
2. If no, does it have expertise-level metadata?
3. Can a beginner distinguish beginner-appropriate advice from universal advice?

## Rule Proposal

**Rule:** For knowledge that is only appropriate at certain expertise levels, tag with `expertise-level:` and consider creating level-specific variants linked by a hub.
**Why:** Advice that's correct for beginners can be wrong for experts, and vice versa. Without expertise tagging, readers cannot assess applicability.
**Test:** Pick 10 notes with absolute statements. Can you categorize each as universal, beginner-only, intermediate-only, or advanced-only? Do they have appropriate expertise-level metadata?

## Relationship to Existing Rules

- **Differs from difficulty tagging:** `difficulty: advanced` means "hard to understand" not "only for advanced practitioners"
- **Differs from abstraction levels:** An abstract principle can be learned at any level; expertise-level knowledge is about practical advice validity
- **Complements audience entry points:** Entry points serve different audiences; expertise tags serve readers at different levels within the same audience

## Related Notes

- [[Atomic Note Principle]] — atomicity still applies, consider splitting if level-specific notes get too long
- [[Frontier Exploration - Framework-Dependent Knowledge]] — related: context-dependent validity
- [[Hub Node Creation]] — level-specific variants can be linked via hub
- [[Stress Test - Expertise Level Rule in Foreign Language Learning]] — Stress test validating this rule
