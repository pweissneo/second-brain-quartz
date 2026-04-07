---
last-reviewed: 2026-04-03
last-updated: 2026-04-03
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
tags:
  - seed-gap
  - legal-knowledge
  - jurisdiction
  - knowledge-type
gap-status: integrated
gap-priority: high
gap-phase: integrated
gap-type: seed-missing
discovered: 2026-03-28
resolved: 2026-04-03
resolved-by: [[Seed Refinement - Legal Authority Type Distinction]]
---

# Seed Gap: Jurisdiction and Legal Authority Type Handling

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

## Proposed Seed Rules

### Rule 1: Track Jurisdiction-Dependent Validity

**Rule:** For knowledge that varies by jurisdiction, use frontmatter to explicitly map applicability — list jurisdictions where this applies, does not apply, and link to alternatives for excluded jurisdictions.

**Why:** Without explicit jurisdiction-validity mapping, notes appear universally applicable when they're jurisdiction-specific. Users and AI agents cannot distinguish "this is true everywhere" from "this is true in jurisdiction X but not Y."

**Test:** For jurisdiction-dependent notes: (1) Does frontmatter list applicable jurisdictions? (2) Are excluded jurisdictions identified? (3) Is there a link to the note covering excluded jurisdictions?

**Implementation:** Use `jurisdiction-validity` frontmatter with applies-to, excludes, and alternative fields.

**Note:** This complements existing `jurisdiction:` field. `jurisdiction:` says WHAT jurisdiction a note covers. `jurisdiction-validity:` says WHEN the knowledge applies (and where it doesn't).

### Rule 2: Create Hub Notes for Multi-Jurisdiction Topics

**Rule:** When the same topic has different rules in different jurisdictions, create a hub note linking to atomic jurisdictional variants.

**Why:** Without hub structure, users must search to find the jurisdiction-specific variant. Hubs enable quick navigation and make multi-jurisdiction research efficient.

**Test:** For topics with jurisdictional variation: (1) Is there a hub note? (2) Can you quickly identify which jurisdiction a note applies to from the hub?

### Rule 3: Distinguish Legal Authority Types

**Rule:** For legal knowledge, use `legal-authority-type:` frontmatter to distinguish binding primary sources from non-binding persuasive authority and personal analysis.

**Why:** Legal claims have explicit hierarchy — statutes and controlling cases are binding; secondary sources and commentary are persuasive; your interpretation is not verified. Without this distinction, verification is meaningless.

**Test:** For legal notes: (1) Is `legal-authority-type:` specified? (2) Can you tell whether this is "what the law says" vs "what I think it means"?

### Rule 4: Require Primary Source Citation for Authoritative Legal Claims

**Rule:** Notes tagged as authoritative legal sources must cite specific statutes, cases, or regulations with full citations.

**Why:** Primary legal authority must be verifiable against the actual source. Vague citations to "the law" don't enable verification.

**Test:** For authoritative legal claims: (1) Are specific sources cited with case citation or statute number? (2) Can you look up the primary source independently?

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