---
last-reviewed: 2026-03-28
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
tags:
  - seed-gap
  - legal-knowledge
  - jurisdiction
  - knowledge-type
gap-status: identified
gap-priority: high
gap-phase: analysis
gap-type: seed-missing
discovered: 2026-03-28
---

# Seed Gap: Jurisdictional Knowledge Representation and Legal Knowledge Type Distinction

> How should knowledge bases handle knowledge that varies by jurisdiction, and distinguish authoritative legal claims from interpretive analysis?

## Gap Summary

Two related gaps in the current Seed:

1. **Jurisdictional Knowledge Representation** — The Seed lacks rules for organizing knowledge about the same topic under different jurisdictional rules (e.g., contract formation in US common law vs. civil law)

2. **Legal Knowledge Type Distinction** — The Seed's general knowledge types don't capture legal-specific types: authoritative (binding law), persuasive (non-binding argument), analytical (your interpretation)

## Problem 1: Jurisdictional Conflict

When organizing legal or regulatory knowledge across jurisdictions, notes may contain different rules that are ALL CORRECT in their respective contexts. The current "Contradictory Sources" rule assumes sources actually contradict each other, but jurisdictional variation is different — both sources are correct, just in different contexts.

**Example:** "Contract formation requirements"
- US Common Law: requires consideration
- Civil Law: offer + acceptance sufficient
- UNIDROIT: different requirements still

The Seed doesn't address how to organize these variants.

### Proposed Seed Rules

**Rule: Track jurisdiction-dependent validity**

> For knowledge that varies by jurisdiction, include explicit `jurisdiction-validity:` mapping in frontmatter.

```yaml
jurisdiction-validity:
  applies-to: [US-common-law, UK, Australia]
  does-not-apply-to: [civil-law-jurisdictions]
  conflict-resolution: "For civil law, see [[Contract Formation - Civil Law]]"
```

**Test:** For notes about jurisdiction-dependent rules: (1) Is jurisdiction-validity mapped? (2) Does it explicitly list applicable jurisdictions? (3) Is there a hub note linking jurisdictional variants?

**Rule: Create hub notes for multi-jurisdiction topics**

> When knowledge about the same topic differs across jurisdictions, create a hub note linking to atomic jurisdictional variants.

**Test:** For topics with jurisdictional variation: (1) Is there a hub? (2) Can you quickly identify which jurisdiction a note applies to?

## Problem 2: Legal Knowledge Type Distinction

The Seed has general knowledge types (canonical, analysis, personal) but legal knowledge requires more specific distinctions:

- **Authoritative** — what the law says (binding)
- **Persuasive** — what someone argues (non-binding)
- **Analytical** — your interpretation (not verified)
- **Practical** — how to navigate the legal system

This matters for verification: authoritative legal sources (statutes, cases) are verified differently than your analysis.

### Proposed Seed Rules

**Rule: Distinguish legal authority types**

> For legal knowledge, use `legal-authority-type:` to distinguish binding authority from non-binding argument.

```yaml
legal-authority-type: primary  # statutes, cases - binding
legal-authority-type: secondary  # treatises, articles - persuasive
legal-authority-type: analytical  # your interpretation - not verified
legal-authority-type: practical  # how-to navigate legal system
```

**Test:** For legal notes: (1) Is legal-authority-type specified? (2) Can you tell whether this is "what the law says" vs "what I think it means"?

**Rule: Require primary source citation for authoritative legal claims**

> Notes tagged `legal-authority-type: primary` must cite specific statutes, cases, or regulations.

**Test:** For authoritative legal claims: (1) Are specific sources cited? (2) Can you look up the primary source?

## Gap Severity

| Gap | Severity | Reasoning |
|-----|----------|-----------|
| Jurisdiction-validity mapping | high | Without it, knowledge appears universally applicable |
| Legal authority type distinction | critical | Verification meaningless without distinguishing binding from non-binding |
| Hub structure for multi-jurisdiction topics | medium | Important for comparative/contextual research |

## Related

- [[Seed Gap - Comparative and Cross-Jurisdictional Legal Knowledge]] (parent gap)
- [[Frontier Exploration - Professional Advice Disclaimer Requirements]] (related disclaimer rules)
- [[Seed Stress Test - Legal Knowledge Bases]] (stress test that identified this)
- [[Handling Contradictory Sources]] (handles actual contradiction, not jurisdictional variation)
- [[Confidence Markers]] (should extend with legal-specific confidence)