---
last-reviewed: 2026-03-14
lifecycle: active
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - applicability
  - testing
  - metacognitive
---

# The Inverse Test

> A technique for discovering undocumented knowledge boundaries — companion to [[Types of Applicability Boundaries]]

## The Method

For any absolute statement (always/never/every/none), ask inverse questions:

- "Always? Under what conditions?"
- "Never? In what contexts?"
- "What would make this false?"

If you can't answer, the boundary may be undocumented.

## Why It Works

Absolute statements imply universal applicability. But most knowledge has boundaries. The inverse test exposes them.

## Examples

| Absolute Claim | Inverse Questions |
|---------------|-------------------|
| "Never use recursion" | Except when? For what problem sizes? |
| "Always verify sources" | Except for well-known facts? Common knowledge? |
| "Every note needs 3+ links" | What about new notes? Foundational concepts? |

## When to Apply

- When writing new notes with absolute language
- When reviewing notes for completeness
- When testing if a domain has well-documented boundaries

## Related

- [[Types of Applicability Boundaries]]
- [[Frontier Exploration - Metacognitive Knowledge and Thinking Tools]]
- [[Seed Improvement - Scale Scope Metadata]] — use inverse test to discover scale-dependent boundaries
