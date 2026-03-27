---
last-reviewed: 2026-03-26
last-updated: 2026-03-26
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
verification-status: unverified
tags:
  - seed-gap
  - knowledge-modality
  - stress-test-findings
schema-version: "1.0"
gap-source: seed-stress-test
gap-type: seed-missing
---

# Seed Gap: Knowledge Modality Rule Refinements

> The knowledge-modality rule exists in the Seed but lacks refinements identified through domain-specific stress testing.

## What's Already in the Seed

The Seed includes this rule at line 2240:

> **Rule:** For domains with distinct knowledge modalities (how knowledge is used), tag notes with `knowledge-modality:` to distinguish use cases.
>
> **Implementation:** Use `knowledge-modality:` frontmatter with domain-appropriate values:
> - Music: `performance`, `analysis`, `compositional`, `hybrid`
> - Medicine: `diagnosis`, `prognosis`, `treatment`, `hybrid`
> - Engineering: `theoretical`, `practical`, `design`, `hybrid`

## What the Seed Is Missing

Stress testing in cooking and music domains revealed refinements that the current rule doesn't address:

### Gap 1: Multi-Modal Notes Need Mixed Tagging

**Problem:** Many notes naturally serve multiple modalities. A cooking note about "cooking rice" serves:
- lookup (what ratio to use)
- technique (how to control heat)
- troubleshooting (why is it mushy?)

**Missing:** Allow `knowledge-modality: mixed` with explicit `modalities-served:` list

```yaml
knowledge-modality: mixed
modalities-served:
  - lookup
  - technique
  - troubleshooting
```

### Gap 2: Context Scope Missing

**Problem:** The same knowledge applies differently in different contexts:
- "Knife skills" for home cooking vs. professional chef
- "Sear meat" in different kitchen setups

**Missing:** Add `context-scope:` field to capture applicability context

```yaml
knowledge-modality: technique
context-scope: home-cooking|professional|field|historical
```

### Gap 3: Framework Tagging for Competing Approaches

**Problem:** Domains often have competing methodological approaches (traditional vs. modernist cuisine, classical vs. contemporary music). The rule doesn't address this.

**Missing:** Add framework tagging to distinguish methodological approaches

```yaml
knowledge-modality: technique
framework: traditional|modernist|classical|contemporary
```

### Gap 4: Compositionality Distinction

**Problem:** Some knowledge is atomic (follow as complete unit like a recipe), while other knowledge is composable (combine with others like techniques).

**Missing:** Add `compositionality:` field

```yaml
knowledge-modality: recipe
compositionality: atomic  # Follow as complete unit

knowledge-modality: technique
compositionality: composable  # Can be combined with others
```

### Gap 5: Subjectivity Dimension

**Problem:** Cooking has significant personal/subjective knowledge ("I prefer medium-rare") that doesn't fit the universal/personal spectrum.

**Missing:** Add `subjectivity:` dimension

```yaml
subjectivity: universal|personal|contextual
# Universal: food safety temperatures (always true)
# Personal: "I prefer X over Y"
# Contextual: "Too spicy for children"
```

### Gap 6: Temporal Scope for Evolving Knowledge

**Problem:** Techniques evolve. "The French Laundry's sous vide approach" is now historical. The rule doesn't address temporal validity.

**Missing:** Add `temporal-scope:` field

```yaml
knowledge-modality: technique
temporal-scope: current|historical|evolving
```

## Proposed Seed Rule Addition

> **Rule:** Extend knowledge-modality rule with mixed modality support, context scope, framework tagging, compositionality, subjectivity, and temporal scope.
>
> **Why:** Domain-specific stress testing reveals the basic knowledge-modality rule needs refinements to handle multi-modal notes, context dependencies, competing frameworks, atomic vs. composable knowledge, subjectivity, and temporal evolution. Without these, the rule fails practical application in domains like cooking, music, and game design.
>
> **Test:** For domain-specific notes: (1) Are multi-modal notes tagged with `mixed` and explicit `modalities-served`? (2) Do notes include `context-scope` when applicability varies by context? (3) Do competing-framework domains include `framework` tagging? (4) Is `compositionality` used to distinguish atomic vs. composable? (5) Does `subjectivity` capture personal vs. universal knowledge? (6) Is `temporal-scope` used for evolving knowledge?

## Related

- [[Seed Stress Test - Knowledge Modality Rule in Cooking]] — Detailed stress test findings
- [[Frontier Exploration - Music Knowledge Type Distinctions]] — Original gap identification
- [[Seed Stress Test - Board Game Design Knowledge Base]] — Additional modality examples
- [[Frontier Exploration - Knowledge Context Frames]] — Related context handling