---
last-reviewed: 2026-03-10
lifecycle: evergreen
confidence: emerging
tags:
  - frontier-exploration
  - structure
  - multi-domain
related:
  - "[[AI-Assisted Knowledge Management Seed]]"
  - "[[Atomic Note Principle]]"
  - "[[Graph Traversal Efficiency]]"
---

# Frontier Exploration: Cross-Domain Knowledge

> **Status:** This exploration has been incorporated into the Seed (Section 8: Domain Agnosticism). This note now serves as a validated example and deeper exploration.
>
> How should a knowledge base handle topics that span multiple domains?

## The Problem

Some knowledge naturally crosses domain boundaries:

- **Nutrition** spans medicine (biochemistry), cooking (culinary arts), and agriculture (food sourcing)
- **Sports medicine** spans medicine and athletics
- **Culinary physics** spans cooking and physics
- **Legal tech** spans law and software

The Seed provides excellent guidance for single-domain vaults but is silent on cross-domain organization.

## Where AI Agents Get Stuck

When building a knowledge base on "nutrition" using only current Seed rules:

1. Should notes live in a "medicine" folder, "cooking" folder, or a new "nutrition" section?
2. How do hub notes handle multi-domain topics?
3. Should there be separate atomic notes in each domain, or unified notes covering all angles?
4. How do scope tags interact when one note spans multiple domains?

## Analysis: What the Seed Actually Says

The Seed **explicitly recommends flat structure** — no nested folders. This is the right call: folders impose hierarchy that constrains discovery.

But flat structure doesn't solve the cross-domain problem. A vault with 500 notes on nutrition, medicine, and cooking needs organization.

## Proposed Approach

### Principle: Domain Tags + Cross-Domain Hubs

1. **Tag by domain**: Every note gets domain tags (`domain: medicine`, `domain: cooking`)
2. **Create cross-domain hubs**: Topics that naturally span domains get dedicated hub notes
3. **Atomicity still applies**: Each note contains one idea, but ideas can reference multiple domains

### Example Structure

> **Note:** The following are illustrative examples of how cross-domain knowledge could be structured.

```
Nutrition (cross-domain hub)
  ├─ links to Macronutrients (domain: biochemistry) *[illustrative]*
  ├─ links to Meal Planning (domain: cooking) *[illustrative]*
  ├─ links to Food Sourcing (domain: agriculture) *[illustrative]*
  └─ links to Dietary Guidelines (domain: medicine) *[illustrative]*

Macronutrients (biochemistry note)
  - tags: domain: biochemistry, domain: medicine
  - links to Protein, Carbohydrates, Lipids *[illustrative]*

Protein (atomic note)
  - tags: domain: biochemistry
  - 100-300 words, one idea *[illustrative]*
```

### When to Split vs. Unify

| Scenario | Action |
|----------|--------|
| Same concept, different domain contexts | Unify with multi-domain tags |
| Same topic, different guidance per domain | Create domain-specific variant notes |
| Intersection creates new knowledge | Create cross-domain hub |

## Test

**Test:** Pick a topic in your vault that spans 2+ domains.
1. Can you identify all domains it spans?
2. Does each domain-specific aspect have its own atomic note?
3. Is there a hub note that connects the domains?
4. Are domain tags applied consistently?

If any answer is "no", the cross-domain structure needs work.

## Rule Proposal

**Rule:** For knowledge spanning multiple domains, use domain tags on atomic notes and create cross-domain hub notes that connect domain-specific perspectives.
**Why:** Single-domain vaults are simple; cross-domain vaults need explicit structure to avoid fragmentation or duplication. Tags enable filtering, hubs enable navigation.
**Test:** Can you identify all domains represented in a cross-domain topic? Can you navigate from the hub to domain-specific atomic notes?

## Related Notes

- [[Frontier Exploration - Jargon vs Plain Language]] — related to serving different reader types
- [[Hub Node Creation]] — structural guidance
- [[Atomic Note Principle]] — still applies to cross-domain notes
