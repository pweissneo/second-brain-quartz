---
last-reviewed: 2026-03-27
lifecycle: superseded
confidence: high
author-type: ai-assisted
verification-status: verified
tags:
  - frontier-exploration
  - comparative-knowledge
  - structure
  - superseded
superseded-by: [[AI-Assisted Knowledge Management Seed]]
superseded-date: 2026-03-23
notes: "Rule was incorporated into Seed. This note retained for historical reference."
---

# Frontier Exploration - Comparative Knowledge Structures

> How should a knowledge base structure notes that compare approaches, tools, or methods?

## The Problem

Knowledge bases often need to compare alternatives:
- "X vs Y" — which is better?
- Tool comparisons — "A vs B vs C"
- Method comparisons — "Approach 1 vs Approach 2"
- Framework comparisons — covered in [[Frontier Exploration - Integrated Rules History]]

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
Epistemologically equivalent but mutually incompatible (see [[Frontier Exploration - Integrated Rules History]]):
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

See [[Frontier Exploration - Integrated Rules History]] for full guidance.

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
- [[Frontier Exploration - Integrated Rules History]]
- [[Frontier Exploration - Domain Jargon vs Plain Language]]
- [[Frontier Exploration - Equivalent Alternatives and Contextual Selection]] — Related: covers equivalent alternatives that all produce valid results
- [[AI-Assisted Knowledge Management Seed]]

---

# Appendix: Competing Organizational Structures (Merged)

> This content was merged from [[Frontier Exploration - Competing Organizational Structures]] (2026-04-03). It covers a related but distinct topic: when the same knowledge can be organized in multiple valid ways.

## The Problem

Some knowledge domains have no single "correct" organizational structure. The same content can be legitimately organized by:
- **Chronology** (when things happened) vs. **causation** (why they happened)
- **Taxonomy** (what category) vs. **function** (what it does)
- **Difficulty** (beginner to advanced) vs. **purpose** (problem-solving sequence)
- **Abstraction level** (concrete to abstract) vs. **prerequisites** (foundational to applied)

For example:
- A **cooking knowledge base** could be organized by cuisine (Italian, Japanese), by technique (roasting, steaming), by ingredient (chicken, rice), or by meal type (breakfast, dinner)
- A **programming knowledge base** could be organized by language (Python, JS), by paradigm (OOP, functional), by problem type (sorting, searching), or by project type (web, data science)
- A **music knowledge base** could be organized by genre, by theory (harmony, rhythm), by instrument, or by skill level

## Why This Matters for AI Agents

Current Seed rules assume an "optimal" structure exists. But for domains with competing valid structures:
1. An AI agent may waste effort trying to find the "right" organization when multiple equally valid options exist
2. Different users may have different mental models and expect different organization
3. The choice of organization affects what connections are visible and discoverable

## Proposed Approach

### Structure-Choice Hubs

**Rule:** For knowledge domains with competing organizational structures, create explicit structure-choice hub notes that document the available organizational models and link to content organized by each model.

**Why:** Without explicit structure-choice hubs, AI agents and users must guess at the "correct" organization. Documenting multiple valid structures preserves the organizational flexibility that experts expect while making the choices explicit.

**Test:** For a domain with competing structures: (1) Can you identify 2+ valid organizational models? (2) Does a hub document each model's approach? (3) Can users and AI agents choose their preferred navigation path?

**Implementation:**
```yaml
organizational-models:
  - name: "By Technique"
    approach: "Organizes content by cooking method (roasting, steaming, frying)"
    when-to-use: "When learning techniques independent of ingredients"
    related-model: "By Ingredient"
  - name: "By Ingredient"
    approach: "Organizes content around specific ingredients"
    when-to-use: "When you have ingredients and need recipes"
```

### Alternative: User-Configurable Views

Instead of choosing one structure, allow multiple parallel organizations of the same atomic notes. This is different from duplicate notes — it's the same notes, reorganized.

**Test:** Can users navigate the same knowledge through different organizational lenses without duplication?

## Edge Cases

- **Dominant structure:** Some domains have one clearly superior organization (medical anatomy by system, not by alphabet). Don't force multiple models when one is clearly better.
- **Transitional domains:** Emerging fields may not yet have established organizational conventions. Allow structure to emerge organically.
- **Personal vs. shared:** Personal vaults may use personal mental models; shared vaults need more explicit conventions.

## Related Notes

- [[Hub Node Creation]]
- [[Knowledge Graph Structure]]
- [[Note Insertion Strategy]]
- [[Seed Stress Test - Cooking Knowledge Base]] — Example of competing organizational structures in cooking (cuisine vs. technique vs. ingredient)
