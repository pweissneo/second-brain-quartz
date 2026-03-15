---
last-reviewed: 2026-03-14
lifecycle: active
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - knowledge-type
  - learning-resources
  - domain-agnostic
related:
  - "[[Frontier Exploration - Knowledge Base Onboarding]]"
  - "[[Confidence Markers]]"
  - "[[Note Types and Templates]]"
---

# Frontier Exploration: Learning Resource Knowledge

## The Gap

The Seed covers many knowledge types: factual, procedural, conceptual, temporal, probabilistic, troubleshooting, etc. However, it lacks explicit guidance for **learning resource knowledge** — knowledge about courses, books, tutorials, videos, podcasts, and other materials designed to teach something.

This is distinct from:
- **Domain knowledge** (the subject being learned)
- **Meta-learning knowledge** (how to learn effectively)
- **Source provenance** (where information comes from)

A learning resource is itself a container of knowledge, with its own metadata (quality, completeness, difficulty, cost, format) that affects how it should be used.

## Why It Matters

When building a learning-focused knowledge base, you inevitably accumulate resources:
- "Take the Andrew Ng ML course"
- "Read Chapter 3 of this book for more depth"
- "This video explains the concept well"

Without explicit handling, resources get captured as:
1. Ad-hoc links in notes (loses metadata)
2. Separate notes per resource (becomes unwieldy at scale)
3. Mixed with domain knowledge (confuses "learning X" with "knowing X")

## Proposed Structure

### Resource Note Pattern

```yaml
---
type: learning-resource
resource-type: course | book | video | article | podcast | tutorial | documentation
platform: (e.g., Coursera, YouTube, O'Reilly)
difficulty: beginner | intermediate | advanced
cost: free | paid | subscription
duration-hours: 
completion-status: not-started | in-progress | completed
rating: 1-5
relevance-to-vault: high | medium | low
---
```

### Resource vs. Domain Distinction

**Resource note**: "The [[Course Name]] explains [[Concept X]] well"
- Purpose: Direct learner to external material
- Contains: Quality assessment, difficulty, applicability

**Domain note**: "[[Concept X]] is defined as..."
- Purpose: Capture the knowledge itself
- Contains: Explanation, examples, connections

## Proposed Seed Rule

**Rule:** When capturing learning resources (courses, books, videos), use dedicated resource notes with structured metadata separate from domain knowledge notes.
**Why:** Resources have different lifecycle needs (review for quality, track completion) than domain knowledge. Mixing them creates false confidence (thinking you've learned something when you've just bookmarked a resource) and makes the vault unwieldy.
**Test:** Pick 5 notes that reference external learning materials. (1) Is each resource captured in a dedicated note? (2) Does each have difficulty/cost/quality metadata? (3) Is domain content clearly separated from resource references?

## Edge Cases

1. **Free YouTube video vs. paid course**: Both are resources but have different reliability expectations. Cost metadata helps calibrate trust.

2. **Outdated resources**: A 2015 programming tutorial may be obsolete. Resource notes need temporal validity tracking similar to temporal knowledge.

3. **Multi-topic resources**: One course covers many concepts. Should you create one resource note or split? Rule: One resource note per course, link to multiple domain topics it covers.

4. **Personal notes on resources**: "This course helped me understand X" vs. "This course covers X". Distinguish resource metadata (rating, applicability) from personal learning notes.

5. **Resource recommendations vs. personal knowledge**: "Everyone should take this course" is different from "I learned X from this course". Distinguish universal recommendations from personal learning history.

## Relationship to Existing Rules

- **Confidence Markers**: Resources can have confidence (highly recommended vs. niche/controversial)
- **Lifecycle Management**: Resources can be "not-started", "in-progress", "completed", "outdated"
- **Source Quality Tiers**: Resources can be rated by production quality (professional course vs. amateur video)
- **Expertise-Level Tags**: Resources have target skill level

## Related Notes

- [[Frontier Exploration - Knowledge Base Onboarding]] — Learning resources are often part of onboarding
- [[Confidence Markers]] — Resource quality can use confidence levels
- [[Note Lifecycle Management]] — Resources have completion lifecycle
- [[Stress Test - Expertise Level Rule in Foreign Language Learning]] — Resources have difficulty levels
- [[Frontier Exploration - User Situational Constraints]] — Resources may have format/time/cost constraints
