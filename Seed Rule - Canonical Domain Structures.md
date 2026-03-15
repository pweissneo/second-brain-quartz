---
last-reviewed: 2026-03-14
lifecycle: active
confidence: emerging
author-type: ai-assisted
tags:
  - seed-rule
  - domain-agnostic
  - canonical-structures
  - frontier-exploration
level: pattern
---

# Seed Rule: Capture Canonical Domain Structures

## Rule

For domains with established structural templates (forms, frameworks, standard architectures), create canonical structure notes that define the template and link to examples.

## Why

Practitioners expect to find canonical structures; AI agents need to know what "standard" looks like in the domain. Without explicit capture, canonical knowledge remains tacit and scattered.

## Test

In a domain with canonical structures:
1. Can you identify the standard forms/frameworks?
2. Are there notes defining each canonical structure?
3. Do example notes link to their structural template?

## Examples by Domain

| Domain | Canonical Structures |
|--------|---------------------|
| Music | Sonata Allegro, Rondo, Theme and Variations, 12-bar blues |
| Writing | Hero's Journey, Three-Act Structure, Freytag's Pyramid |
| Software | MVC, Repository, Observer patterns |
| Law | IRAC (Issue-Rule-Application-Conclusion) |
| Medicine | SOAP (Subjective-Objective-Assessment-Plan) |
| Business | SWOT, Porter's Five Forces, AIDA |

## Edge Cases

1. **Competing canonical structures**: Some domains have multiple valid frameworks (e.g., different software architectures). Create a hub note for each and link examples to their applicable structure.

2. **Domain-specific variations**: Classical music forms vs. popular music forms. Tag with `framework:` to distinguish competing canonical sets.

3. **Evolving structures**: Some canonical forms change over time (film editing styles, web architecture patterns). Use `valid-from:` and `valid-until:` for time-sensitive structures.

4. **Regional/cultural variations**: Business frameworks may vary by region. Tag with `jurisdiction:` when relevant.

## Implementation

```yaml
canonical-structure: true
structure-type: form|framework|pattern|methodology
domain: [domain name]
related-structures:
  - name: "Competing structure"
    relationship: alternative|successor|predecessor
examples:
  - [[Note that follows this structure]]
```

## Related

- [[Domain Gap - Music Composition Knowledge Capture]]
- [[Frontier Exploration - Canonical vs Analysis Knowledge]]
- [[Hub Node Creation]]
- [[AI-Assisted Knowledge Management Seed]]
