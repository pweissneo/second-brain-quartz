---
last-reviewed: 2026-03-11
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - comparative-knowledge
  - structure
---

# Frontier Exploration - Comparative Knowledge Structures

> How should a knowledge base structure notes that compare approaches, tools, or methods?

## The Problem

Knowledge bases often need to compare alternatives:
- "X vs Y" — which is better?
- Tool comparisons — "A vs B vs C"
- Method comparisons — "Approach 1 vs Approach 2"
- Framework comparisons — covered in [[Frontier Exploration - Framework-Dependent Knowledge]]

The Seed has rules for:
- Atomicity (one idea per note)
- Linking (meaningful connections)
- Synthesis (presenting multiple perspectives)

But it's missing guidance on HOW to structure comparative knowledge.

## Where AI Agents Get Stuck

When building a knowledge base with comparisons using only current Seed rules:

1. Should "X vs Y" be one note or two?
2. How do you present multiple alternatives without bias?
3. When does comparison become opinion vs fact?
4. How do you handle "it depends" conclusions?

## Types of Comparisons

### Binary Comparisons
Two options, the comparison IS the insight:
- "REST vs GraphQL"
- "Zettelkasten vs PARA"
- "Spaced Repetition vs Cramming"

### Multi-Option Comparisons
Three or more alternatives:
- "JavaScript Frameworks: React vs Vue vs Angular"
- "Note-Taking Apps: Obsidian vs Logseq vs Roam"

### Framework Comparisons
Epistemologically equivalent but mutually incompatible (see [[Frontier Exploration - Framework-Dependent Knowledge]]):
- "Copenhagen vs Many-Worlds"
- "Keynesian vs Austrian Economics"

## Proposed Approach

### Binary Comparisons: Single Note
When the comparison itself is the insight (not the individual items):

```
# REST vs GraphQL

## When to Use REST
- Simple resources
- Caching important
- Standardized operations

## When to Use GraphQL
- Complex data requirements
- Mobile apps (bandwidth)
- Rapid prototyping

## Verdict
"It depends" — choose based on your specific needs.
```

Test: Is the primary insight "how X and Y differ" or "when to choose X vs Y"? → Single note.

### Multi-Option Comparisons: Hub + Spoke
When each option needs substantial development:

```
# JavaScript Frameworks [Hub]

## React
> **Note:** The links below are illustrative examples demonstrating the hub+spoke pattern — they are hypothetical notes showing how to structure multi-option comparisons, not links to existing notes.

- React Overview (hypothetical)
- React Pros (hypothetical)
- React Cons (hypothetical)

## Vue
> **Note:** The links below are illustrative examples demonstrating the hub+spoke pattern — they are hypothetical notes showing how to structure multi-option comparisons, not links to existing notes.

- Vue Overview (hypothetical)
- Vue Pros (hypothetical)
- Vue Cons (hypothetical)

## Angular
> **Note:** The links below are illustrative examples demonstrating the hub+spoke pattern — they are hypothetical notes showing how to structure multi-option comparisons, not links to existing notes.

- Angular Overview (hypothetical)
- Angular Pros (hypothetical)
- Angular Cons (hypothetical)
```

Test: Does each option need 300+ words of independent content? → Separate notes with hub.

### Framework Comparisons: Neutral Presentation
When comparing epistemologically equivalent frameworks:

1. Present in alphabetical or historical order (not by perceived correctness)
2. Acknowledge evidence standards vary by framework
3. Don't synthesize a "winner" when none exists

See [[Frontier Exploration - Framework-Dependent Knowledge]] for full guidance.

## Test for AI Agents

1. Is this a binary comparison where the comparison IS the insight? → Single note
2. Do each of 3+ options need substantial independent development? → Hub + spoke
3. Are these competing frameworks that are epistemologically equivalent? → Neutral presentation
4. Can you present both sides without bias?

## Rule Proposal

**Rule:** Structure comparative knowledge based on the nature of the decision:
- Single comparative note for binary choices where comparison IS the insight
- Separate notes with links when each option requires substantial independent development
- Hub + spoke for 3+ options or complex decision criteria

**Why:** The structure should match the purpose — decision aid vs. deep understanding.

**Test:** For a comparative note: (1) Is the primary insight "how X and Y differ"? → Single note. (2) Does each option need 300+ words? → Separate notes. (3) Are there 3+ options? → Hub + spoke.

## Related
- [[Handling Contradictory Sources]] — Related: comparative analysis often involves handling contradictory sources
- [[Frontier Exploration - Framework-Dependent Knowledge]]
- [[Frontier Exploration - Jargon vs Plain Language]]
- [[Frontier Exploration - Equivalent Alternatives and Contextual Selection]] — Related: covers equivalent alternatives that all produce valid results
- [[AI-Assisted Knowledge Management Seed]]
