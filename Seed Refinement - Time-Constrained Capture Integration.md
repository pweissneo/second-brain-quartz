---
last-reviewed: 2026-04-07
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
knowledge-type: meta
access-pattern: decision
tags:
  - seed-refinement
  - time-constraints
  - capture-optimization
  - partial-capture
gap-source: compliance-audit
---

# Seed Refinement - Time-Constrained Knowledge Capture

> Integrating time-budgeted capture rules into the Seed

## Finding

**Compliance Gap:** The Seed lacks explicit guidance for time-constrained knowledge capture. A frontier exploration note (`Frontier Exploration - Time-Constrained Knowledge Capture.md`) proposes rules that remain unintegrated.

**Impact:** Without time-constrained capture rules, AI agents operating under time pressure either capture nothing (perfectionism) or capture noise (quantity over quality). Quick captures become unfindable orphans that break graph connectivity.

## Proposed Seed Integration

### Rule: Time-Budgeted Capture

**Rule (PROPOSED):** When operating under time constraints, ensure every capture includes baseline elements that maintain graph connectivity:
1. **One wikilink** — establishes connection in the knowledge graph
2. **One source or provenance** — establishes credibility
3. **A clear question or summary** — even if brief

**Why:** Without connectivity and provenance, partial captures become orphans that are difficult to complete later. These baseline elements ensure even quick captures contribute to the graph structure and remain findable.

**Test:** 
- Can you identify notes made under time constraints (via `capture-budget:` frontmatter)?
- Do time-constrained captures have at least one link and one source?
- Can incomplete notes be identified via `lifecycle: incomplete`?

### Implementation

```yaml
# Frontmatter for time-constrained captures
capture-budget: 1m     # Quick capture (<2 minutes)
capture-budget: 5m    # Standard capture  
capture-budget: 15m    # Extended capture
capture-budget: 30m+   # Full processing

lifecycle: incomplete
completion-priority: high|medium|low
estimated-completion: 5m|15m|30m|1h+
```

## Relationship to Existing Seed Rules

- **Complements** `Best Practice - Progress Over Perfection` — quality vs. completeness tradeoff
- **Extends** `Frontier Exploration - Anticipatory Knowledge Capture` — related but about future needs
- **Builds on** capture priority sequence — time-constrained capture is a specific case of prioritization

## Test Criteria

- [ ] Can you identify notes made under time constraints?
- [ ] Do time-constrained notes have at least one link and one source?
- [ ] Are incomplete notes identifiable via lifecycle?
- [ ] Is there a completion path for partial captures?

## Notes

This is an integration proposal. The frontier exploration note contains the detailed reasoning and edge cases. Once integrated, the frontier note can be deprecated.

## Related Notes

- [[Frontier Exploration - Time-Constrained Knowledge Capture]] — Source frontier exploration
- [[Best Practice - Progress Over Perfection]] — Related quality tradeoff guidance
- [[Frontier Exploration - Anticipatory Knowledge Capture]] — Related future-needs capture
- [[Note Lifecycle Management]] — Incomplete note lifecycle
- [[Knowledge Capture Strategy]] — Capture approach guidance

---

**Confidence:** emerging — needs stress testing across domains
**Lifecycle:** seed-extension — candidate for Seed integration