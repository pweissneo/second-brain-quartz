---
last-reviewed: 2026-03-26
last-updated: 2026-03-26
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
schema-version: "1.0"
tags:
  - seed-rule
  - atomicity
  - distributed-knowledge
  - synthesis
---

# Seed Rule: Distributed Understanding Handling

> Knowledge that requires synthesizing across multiple notes must be explicitly marked to prevent inappropriate splitting.

## Rule

**Rule:** Identify and explicitly mark notes requiring distributed understanding — notes where complete comprehension requires synthesizing 3+ sources that are not independently useful.

**Why:** The atomicity rule optimizes for reusable components ("split if parts are independently useful"). But some knowledge has value in the relationships between concepts, not the concepts themselves. Splitting distributed notes destroys integrated value that cannot be reconstructed from individual parts. Without explicit marking, AI agents may incorrectly split these notes following the atomicity rule.

**Test:** Can you identify notes where: (a) each component is not independently meaningful, (b) the whole is greater than sum of parts, (c) understanding requires reading multiple notes in sequence?

## Implementation

Use frontmatter to mark distributed understanding notes:
```yaml
distributed-understanding: true
required-components:
  - [[Note A]]
  - [[Note B]]
  - [[Note C]]
synthesis-note: [[Hub note that connects them]]
```

## When to Use

This applies to:
- **Creative composition knowledge** — flavor profiles that combine ingredient notes, musical ideas that combine theory notes
- **Complex procedural knowledge** — legal concepts requiring both procedural and substantive understanding
- **Theory-to-practice domains** — physics concepts that require lab notes to fully comprehend
- **Interconnected systems** — home automation where devices only make sense in combination

## How to Identify

Ask for each note >300 words:
1. Could a reader fully understand this from this note alone?
2. Are there prerequisite notes that this note explicitly builds on?
3. Does the note reference other notes for "background" or "context"?

If yes to 2-3, consider marking as distributed understanding.

## Relationship to Other Rules

This is distinct from:
- **Prerequisite tracking** — prerequisites are what you need BEFORE, distributed is what you need TOGETHER
- **Hub notes** — hubs organize, distributed notes require synthesis
- **Multi-note reading** — some notes recommend further reading but don't require it

## Related

- [[Atomic Note Principle]]
- [[Frontier Exploration - Knowledge Synthesis Quality]]
- [[Seed Gap - Distributed Understanding Threshold]]