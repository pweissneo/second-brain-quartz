---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-04-03
last-updated: 2026-04-03
lifecycle: seed-refinement
confidence: emerging
tags:
  - seed-refinement
  - legal-knowledge
  - authority-type
  - domain-specific
  - verification
---

# Seed Refinement - Legal Authority Type Distinction

> Integrating jurisdiction and authority type handling into the Seed for high-stakes domains.

## Background

The Seed Gap "Jurisdiction and Legal Authority Type Handling" identified that the Seed lacks explicit rules for:
1. Jurisdiction-dependent validity mapping
2. Legal authority type distinction (binding vs. persuasive vs. analytical)

These gaps are critical for legal knowledge bases and similar high-stakes domains where authority type determines verification approach.

## Integration into Seed

### Rule: Distinguish Authority Types in High-Stakes Domains

**Rule:** For knowledge in high-stakes domains (legal, medical, financial, safety), use `authority-type:` frontmatter to distinguish the nature of the claim:

- **Authoritative**: Primary sources that establish binding rules (statutes, cases, regulations, core experiments)
- **Persuasive**: Secondary sources that influence but don't establish (commentary, analysis, non-controlling precedent)
- **Analytical**: Personal interpretation or synthesis of authoritative sources

**Why:** In high-stakes domains, verification approach depends on authority type. Authoritative claims require direct source verification; persuasive claims need source quality assessment; analytical claims need methodology transparency. Without authority type distinction, all claims are treated equally, misallocating verification effort.

**Test:** For high-stakes domain notes: (1) Can you classify each note by authority type? (2) Do authoritative claims cite specific primary sources? (3) Do analytical claims include methodology or perspective disclosure?

**Implementation:**
```yaml
authority-type: authoritative|persuasive|analytical
authority-level: primary|secondary|tertiary  # for legal: constitution/statutes > cases > commentary
source-citation: specific citation or "personal analysis"
methodology-disclosure: for analytical claims
```

### Rule: Track Jurisdiction-Dependent Validity

**Rule:** For knowledge that applies only in specific jurisdictions or contexts, use `validity-jurisdiction:` frontmatter to map applicability.

**Why:** Knowledge that applies in jurisdiction A but not B appears universally applicable without jurisdiction mapping. This leads to incorrect knowledge transfer and verification failures.

**Test:** For jurisdiction-dependent notes: (1) Does frontmatter list applicable jurisdictions? (2) Are excluded jurisdictions identified? (3) Is there a link to alternative notes for other jurisdictions?

**Implementation:**
```yaml
validity-jurisdiction:
  applies-to: ["US-federal", "US-CA"]
  excludes: ["UK", "EU"]
  alternatives: [[note-for-uk], [note-for-eu]]
```

## Edge Cases

1. **Multi-jurisdiction knowledge**: Some knowledge applies broadly (international treaties) — use `applies-to: global` or list all applicable jurisdictions
2. **Jurisdiction transition**: Laws change jurisdiction — track `validity-period:` with start/end dates
3. **Conflicting authorities**: When authoritative sources conflict, treat as contradiction per existing rules
4. **Unknown authority type**: Default to `analytical` with methodology disclosure until verified

## Relationship to Existing Rules

This refinement extends:
- **Verification Priority Hierarchy** — Level 1 (critical) now includes authoritative claims in high-stakes domains
- **Source Quality Hierarchy** — Adds domain-specific authority levels for legal/medical/financial
- **Confidence Markers** — Authority type informs appropriate confidence levels

## See Also

- [[Seed Gap - Jurisdiction and Legal Authority Type Handling]] (source gap note)
- [[Seed Stress Test - Legal Knowledge Bases]] (stress test revealing gap)
- [[Frontier Exploration - Professional Advice Disclaimer Requirements]]
- [[Seed Refinement - Domain-Specific Extensions]] (general extension pattern)
