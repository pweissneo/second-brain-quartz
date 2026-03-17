---
last-reviewed: 2026-03-15
lifecycle: active
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - context-frame
  - knowledge-presentation
---

# Frontier Exploration: Knowledge Context Frames

> How to handle knowledge that requires different presentations for different purposes.

## The Problem

The same underlying knowledge may need different presentations depending on context:
- Patient education vs. clinical documentation vs. policy writing
- Tutorial vs. reference vs. scholarly article
- Beginner explanation vs. expert brief

The Seed currently handles expertise levels but not purpose-specific presentations.

## What the Seed Covers

- Expertise levels (beginner/intermediate/advanced)
- Context frame tagging
- Audience adaptation

## What's Missing

### Gap: Purpose-Specific Knowledge Presentation

The Seed doesn't address:
- When to create purpose-specific variants of the same knowledge
- How to organize variants (hub + linked notes vs. single note with sections)
- When variants diverge enough to be separate notes vs. sections in one note
- How to maintain consistency across variants

### Proposed Rule

**Rule:** For knowledge that legitimately requires different presentations for different purposes, use hub + variants pattern with explicit `context-frame` tagging.

**Rule:** Distinguish context frames from expertise levels — frame is about purpose, level is about complexity.

## Examples

| Knowledge | Patient Ed | Clinical | Policy |
|-----------|-----------|----------|--------|
| Diabetes management | Simple explanations | Clinical protocols | Coverage rules |

Each variant has different emphasis, detail level, and terminology.

## Test Criteria

- [ ] Can you identify knowledge that needs different presentations?
- [ ] Do variants use consistent `context-frame` tagging?
- [ ] Can users find the appropriate variant for their purpose?

## Related
- [[Frontier Exploration - Expertise-Level Dependent Knowledge]]
- [[Frontier Exploration - Knowledge Base Onboarding]]
- [[Domain-Specific Knowledge Bases]]
- [[Note Types and Templates]]
- [[AI-Assisted Knowledge Management Seed]]
