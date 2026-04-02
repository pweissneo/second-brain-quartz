---
protected: false
last-reviewed: 2026-03-21
last-updated: 2026-03-21
lifecycle: seed-extension
confidence: high
author-type: ai-assisted
tags:
  - seed-stress-test
  - 2-plus-links
  - linking-rules
  - domain-adaptation
---

# Seed Stress Test: 2+ Links Rule Across Multiple Domains

**Tested Rule:** Every note must link to at least 2 other notes OR be tagged with `foundational: true` OR be tagged with `specialized: true`.

> This note consolidates stress testing of the 2+ links rule across multiple domains. The edge cases discovered have been incorporated into the [[AI-Assisted Knowledge Management Seed]].

## Domain Analysis Summary

| Domain | Key Edge Cases Discovered | Seed Updated |
|--------|-------------------------|--------------|
| Board Game Design | Component primitives, mechanic primitives, workflow phases, genre filters, case studies, specifications, temporal scope, parameters | ✓ |
| Fashion & Clothing | Foundational fabrics, standard terminology, trend-specific, body-specific, occasion-specific, cultural clothing | ✓ |
| Genealogy | Deep ancestors, terminal nodes, spouses, source notes, timeline notes | ✓ |
| Music Composition | Motif definitions, chord progression terminals, notation examples, temporal layers | ✓ |

## Core Findings

The 2+ Links Rule works across all tested domains with appropriate edge cases. Key findings:

1. **Physical/material primitives** in creative domains may legitimately have fewer outgoing links
2. **Workflow/phase notes** in sequential processes need relaxed thresholds
3. **Filter/category notes** serve different navigation purpose than conceptual notes
4. **Domain-specific terminology** functions like standard vocabulary
5. **Temporal knowledge** may have inherently bounded connectivity

## Edge Cases Now in Seed

The following edge cases have been incorporated into the Seed:

- `component-type: primitive` — for core physical components
- `mechanic-type: primitive` — for fundamental player actions
- `workflow-phase: true` — for sequential process stages
- `category-type: genre-filter` — for filter-oriented notes
- `type: specification` — for technical standards
- `type: parameter` — for parameter/filter notes
- `temporal-scope: legacy` — for temporally-bounded knowledge

## Detailed Domain Analysis

For detailed analysis of each domain, see:
- [[Seed Stress Test - 2+ Links Rule in Board Game Design]] — Game components, mechanics, design phases
- [[Seed Stress Test - 2+ Links Rule in Fashion and Clothing]] — Fabrics, colors, trends, body-specific
- [[Seed Stress Test - 2+ Links Rule in Genealogy]] — Ancestors, family structures, sources
- [[Seed Stress Test - 2+ Links Rule in Music Composition]] — Motifs, notation, temporal layers

## Conclusion

The 2+ Links Rule is robust across domains when combined with appropriate edge cases. The rule's intent (preventing orphaned, invisible notes) is valid, but implementation requires domain-specific adaptations for:
- Physical/material primitives
- Sequential workflows
- Filter/category structures
- Temporal knowledge
- Standard terminology

---
See also:
- [[AI-Assisted Knowledge Management Seed]] — Source rules with incorporated edge cases
- [[Linking Principle]]
- [[Graph Maintenance]]
- [[Knowledge Graph Structure]]
