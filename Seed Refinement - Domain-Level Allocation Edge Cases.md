---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-04-02
last-updated: 2026-04-02
lifecycle: seed-refinement
confidence: emerging
verification-modality: simulation
---

# Seed Refinement: Domain-Level Allocation Edge Cases

## Background

The Seed's domain-level allocation rule (added 2026-04-01) states:

> **Rule:** For vaults spanning multiple domains, track domain-level allocation — calculate current maintenance effort by domain, measure variance from portfolio targets (30% core, 40% domain, 20% adjacent, 10% exploratory), and rebalance when variance exceeds 15% for >30 days.

## Domain Selection Problem

**Problem:** The rule assumes domains are clearly delineated, but some knowledge spans multiple domains or doesn't fit neatly into any single domain.

### Edge Case 1: Multi-Domain Notes

A note about "contract formation" could be:
- Legal domain (contract law principles)
- Business domain (business relationships)
- Philosophy domain (agreement theory)

**Question:** How do you allocate such a note to a single domain? Does "current allocation" count partial ownership?

**Implication:** If multi-domain notes exist (they do in this vault), simple count-based allocation gives wrong signals.

### Edge Case 2: Cross-Domain Hubs

The Seed explicitly recommends creating cross-topic hubs for universal problems:
- [[Problem Debugging]]
- [[Problem Decision-Making]]
- [[Problem Risk Assessment]]

These hubs span all domains. How are they allocated?

**Implication:** Either exclude them from allocation (which means domain percentages don't sum to 100%), or allocate them proportionally to their linked domains (complex).

### Edge Case 3: Emergent Domains

Domains can emerge from note clusters that weren't planned:
- "AI knowledge management" emerged in this vault
- "Cooking + nutrition" might combine

**Implication:** Fixed domain list may not match reality. What's the protocol for adding domains?

### Edge Case 4: Domain Velocity Differentiation

The rule mentions "maintenance burden" but doesn't define HOW to calculate it. Some initial thoughts:

| Domain | Verification Frequency | Reason |
|--------|----------------------|--------|
| Hardware/tools | High (new models) | Product cycles |
| Recipes | Medium (ingredients change) | Seasonal |
| Philosophy | Low (evergreen) | Stable |
| Legal | Very high (laws change) | Legislative updates |

But this is qualitative. How does an AI agent actually MEASURE current maintenance burden?

### Edge Case 5: What Does "Current" Mean?

The test asks: "Can you calculate current allocation percentages by domain?"

But there are multiple interpretations:
- **By creation date** — how many notes created in domain?
- **By last-reviewed date** — how many notes touched recently?
- **By verification need** — how many notes need verification?
- **By maintenance effort** — how much time spent on domain?

These can give wildly different results. The rule needs to specify.

## Proposed Refinements

### Refinement 1: Define Allocation Metric

**Current:** Ambiguous ("current allocation")

**Proposed:** Use verification-need-weighted allocation, not note-count allocation.

```yaml
# Instead of counting notes, weight by verification urgency
domain-allocation:
  woodworking:
    target: 0.30
    verification-weighted: 0.45  # many old notes need review
    status: over-allocated
```

**Why:** A domain with 10 old notes that need verification is more "allocated" than a domain with 50 new notes that are fresh.

### Refinement 2: Exclude Infrastructure Notes from Allocation

**Current:** Might count hubs, templates, and infrastructure notes

**Proposed:** Exclude from allocation:
- Cross-topic hubs (universal problem hubs)
- Schema/metadata notes
- Seed rule notes themselves
- Template notes

```yaml
# Only count content notes
allocation-scope: content-only  # vs all-notes
```

### Refinement 3: Add Emergent Domain Protocol

**Current:** Silent on how to handle new domains

**Proposed:** When note clusters form new domain:
1. Create domain entry with `emergent: true`
2. Set initial allocation based on linked existing domains
3. Reallocate over 60-day window (not instant)

### Refinement 4: Specify "Current" Definition

**Current:** Unclear

**Proposed:** Use 90-day rolling window for "current" calculation:

```
current-allocation = notes touched in last 90 days / total touches in last 90 days
```

This captures active maintenance, not static note count.

## What Was Learned

From legal domain stress test:

1. **Jurisdiction can function as sub-domain** — Legal has "federal vs state" which is like "domain vs adjacent" in the portfolio model
2. **Authority hierarchy != domain allocation** — Legal's source hierarchy (constitution > statute > case law) is orthogonal to domain allocation
3. **Multi-jurisdiction notes** — Legal knowledge that spans jurisdictions is analogous to multi-domain knowledge

The domain-level allocation rule is a good start but needs these clarifications to be actionable.

## See Also

- [[Seed Stress Test - Legal Knowledge Bases]] — original stress test
- [[Seed Gap - Domain-Level Resource Allocation]] — gap this rule addressed
- [[Frontier Exploration - Domain Jargon vs Plain Language]] — domain delineation challenges