---
last-reviewed: 2026-03-11
lifecycle: draft
confidence: emerging
tags:
  - frontier-exploration
  - negative-knowledge
  - failure-modes
---

# Frontier Exploration: Negative Knowledge Capture

## The Gap

The Seed has rules for:
- Anti-patterns in knowledge management
- Deprecating notes that are no longer valid
- Marking disproven theories as "historical-superseded"
- Warnings in procedural content

But there's no comprehensive guidance on **capturing negative knowledge** — knowledge about what doesn't work, failure modes, common mistakes, and lessons learned from things going wrong.

## Why This Matters

A knowledge base that only captures successes is incomplete. Knowing what doesn't work:
- Prevents repeated mistakes
- Builds better judgment
- Helps others avoid pitfalls
- Creates realistic expectations

## The Problem for AI Agents

Without explicit rules for negative knowledge:
1. When does failure mode info deserve its own note vs. a warning in another note?
2. How do you link negative knowledge to the positive alternative?
3. How do you prevent the vault from becoming discouragingly negative?
4. What's the threshold for "common enough mistake" to warrant a dedicated note?

## Where Negative Knowledge Applies

**Programming:** "Common bugs in language X" vs. "How to write language X"
**Cooking:** "Why your sauce broke" vs. "How to make sauce"
**Gardening:** "Why your tomatoes died" vs. "How to grow tomatoes"
**Medicine:** "Common misdiagnoses for symptom X" vs. "How to diagnose X"

## Proposed Seed Rule

**Rule:** Capture negative knowledge as dedicated notes when the failure is common enough to help others, or when the failure mode is non-obvious. Link negative notes bidirectionally to their positive counterparts.
**Why:** Negative knowledge has value but risks discouraging users if overdone. Dedicated notes work for common/non-obvious failures; inline warnings work for rare/obvious ones.
**Test:** Can you identify at least 3 negative knowledge notes in your vault? Do they link to related positive knowledge (what to do instead)?

**Rule:** For negative knowledge notes, structure with: (1) What goes wrong, (2) Why it goes wrong, (3) How to recognize it, (4) How to prevent or recover.
**Why:** "Don't do X" is less useful than understanding the mechanism and solution.
**Test:** Pick a negative knowledge note. Does it explain the "why" and "how to fix" rather than just stating the failure?

**Rule:** Tag negative knowledge notes with `type: negative-knowledge` to enable filtering — let users choose whether to see pitfalls.
**Why:** Some users want complete information; others prefer positive framing. Tagging enables choice.
**Test:** Can you filter notes to show/hide negative knowledge? Are negative notes appropriately tagged?

## Distinction: Negative Knowledge vs. Anti-Patterns

- **Anti-patterns** are about knowledge MANAGEMENT (e.g., "creating duplicate notes")
- **Negative knowledge** is about domain-specific failures (e.g., "screasing meat too long makes it tough")

Both are valuable but serve different purposes.

## The "Constructive Balance" Problem

Too much negative knowledge can:
- Discourage users
- Create analysis paralysis
- Make the vault feel pessimistic

Guideline: For every dedicated negative knowledge note, there should be a corresponding positive note showing the right approach. Don't let the negative overwhelm the positive.

## Test for AI Agents

1. Can you identify negative knowledge notes in the vault?
2. Do negative notes link to what to do instead (not just what not to do)?
3. Is there a positive/negative balance, or is the vault too pessimistic?
4. Are negative notes tagged for optional filtering?

## Related
- [[Anti-Patterns in Knowledge Management]] — Anti-patterns for vault structure (not domain content)
- [[Note Lifecycle Management]] — Deprecation and supersession
- [[Stress Test - Note Lifecycle Rule Across Domains]] — Example of lifecycle in practice
- [[Confidence Markers]] — Related: signaling reliability
- [[Frontier Exploration - Procedural Knowledge Verification]] — Related: verifying that positive procedures work
