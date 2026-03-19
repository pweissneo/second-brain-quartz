---
last-reviewed: 2026-03-18
last-updated: 2026-03-18
lifecycle: active
confidence: emerging
author-type: ai-assisted
status: draft
tags:
  - frontier-exploration
  - perspective
  - knowledge-representation
  - multi-view
---

# Frontier Exploration - Multi-Perspective Knowledge

> Knowledge that is richer when viewed from multiple valid perspectives, rather than one "correct" framing.

## The Problem

The Seed handles:
- Contradictory sources (factual disagreements between sources)
- Subjective knowledge (matters of taste and preference)
- Context-gated knowledge (knowledge that applies in specific conditions)

But there's a distinct category the Seed doesn't explicitly address: **knowledge that benefits from multiple complementary perspectives** where NONE are wrong, but combining them creates richer understanding.

## Examples

### Historical Events
The same historical event can be viewed from multiple perspectives:
- Winners vs. losers
- Economic vs. cultural vs. political angles
- Short-term vs. long-term consequences
- Local vs. global impact

No single perspective is "wrong" - but understanding requires multiple views.

### Technical Decisions
A technical decision (use microservices vs. monolith) has:
- Developer perspective (productivity, complexity)
- Operations perspective (reliability, deployment)
- Business perspective (time-to-market, cost)
- User perspective (performance, reliability)

All valid; none complete alone.

### Personal Knowledge
The same experience viewed from:
- What happened (facts)
- What I felt (emotional)
- What I learned (insight)
- What I'd do differently (reflection)

## The Gap

The Seed has no explicit guidance for:
1. When to add a second perspective vs. when one is sufficient
2. How to structure multi-perspective notes (merged vs. separate)
3. How to signal "this note benefits from multiple views"
4. How to avoid false balance (presenting two sides when one is clearly stronger)

## Proposed Approach

### When to Use Multi-Perspective Structure

Use when:
- The topic genuinely has multiple valid viewpoints
- Each perspective adds information the others lack
- No perspective is clearly "right" or "wrong"
- The reader benefits from seeing multiple angles

Don't use when:
- One perspective is clearly more accurate
- Adding perspectives would dilute the signal
- The topic is already well-covered by a single view

### Proposed Frontmatter

```yaml
perspectives: [perspective-1, perspective-2, perspective-3]
perspective-type: complementary|competing|contextual
complementary-when: "View from X adds Y that view from Z lacks"
```

### Note Structure Options

**Option A: Perspective Sections**
```markdown
# [Topic]

## Perspective 1: [Name]
[Content from this angle]

## Perspective 2: [Name]
[Content from this angle]

## Synthesis
[How these perspectives relate]
```

**Option B: Perspective Tags**
```markdown
# [Topic]

[Main content]

## Additional Perspectives
- [[Perspective Note 1]]
- [[Perspective Note 2]]
```

**Option C: Hub + Spokes**
```markdown
# [Topic - Multi-Perspective Hub]

## Perspectives
- [[Perspective 1]]
- [[Perspective 2]]
- [[Perspective 3]]
```

## Test

For a note claiming to have multiple perspectives:
1. Does each perspective add information the others lack?
2. Is there a genuine reason to present multiple views?
3. Is it clear how the perspectives relate to each other?
4. Does the note avoid false balance (giving equal weight when not warranted)?

## Related

- [[Handling Contradictory Sources]] — Factual conflicts (different from this)
- [[Framework-Dependent Knowledge]] — Different frameworks give different conclusions
- [[Context Frames]] — Different purposes need different presentations
- [[Knowledge Synthesis Quality]] — Combining knowledge from multiple sources