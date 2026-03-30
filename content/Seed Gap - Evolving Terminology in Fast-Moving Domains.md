---
last-reviewed: 2026-03-28
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
knowledge-type: structural
tags:
  - seed-gap
  - terminology-evolution
  - domain-agnostic
  - temporal-knowledge
related:
  - "[[AI-Assisted Knowledge Management Seed]]"
  - "[[Seed Rule Proposal - Voice Consistency]]"
  - "[[Handling Temporal Knowledge]]"
gap-type: seed-missing
gap-status: resolved
gap-priority: high
gap-source: frontier-exploration
discovered: 2026-03-28
resolved: 2026-03-28
resolved-by: "[[AI-Assisted Knowledge Management Seed]]"  # Rule added 2026-03-28, lines 1881-1884
---

# Seed Gap: Evolving Terminology in Fast-Moving Domains

> This note documents a gap in the Seed where existing rules don't adequately address how to handle terminology evolution, deprecated concepts, and emerging language in rapidly-changing knowledge domains.

## The Problem

When building a knowledge base in fast-moving domains (technology, research, medicine, finance), terminology changes frequently:
- Terms become deprecated (replaced by better alternatives)
- Meanings shift (same term, evolved definition)
- New terms emerge (before standardization)
- Sub-field variations (same term, different meaning in different contexts)

The Seed addresses **temporal knowledge** (time-sensitive facts) and **contradictions** (conflicting claims) but lacks explicit guidance for **terminology evolution** — the linguistic dimension of knowledge change.

## Scenario Where Seed Fails

**Scenario:** An AI builds a knowledge base about web development in 2026.

The AI captures:
1. "React Hooks" (introduced 2019) — current standard
2. "React Classes" (2013-2019) — deprecated, replaced by hooks
3. "React Server Components" (2023) — emerging, evolving
4. "useEffect" — specific API, stable

**Questions the Seed doesn't answer:**
1. When capturing "React Classes" — should it be marked as deprecated? How?
2. When "React Hooks" eventually gets replaced — what's the migration path?
3. For emerging terms like "React Compiler" (2024-2025) — capture as emerging with confidence: emerging?
4. When term meanings shift — how to preserve historical context?
5. For sub-field variations — "library" vs "framework" debates, how to handle framework-dependent terminology?

## What the Seed Currently Has

The Seed covers:
- **Temporal knowledge** (Rule 8): Time-sensitive facts with validity periods
- **Contradiction detection** (Rule 12): Resolving conflicting verified claims
- **Obsolescence** (Seed Gap): "When a note has become obsolete" note exists
- **Rapidly-evolving domains** (Edge case): Only as part of diminishing returns testing

What's missing: **Explicit terminology evolution handling**

## Proposed Rule Structure

### Rule: Handle Terminology Evolution in Fast-Moving Domains

**Rule:** For knowledge domains where terminology changes frequently, track term lifecycle status and maintain migration paths between deprecated and current terminology.

**Why:** Without explicit terminology tracking, knowledge bases in fast-moving domains become cluttered with outdated terms, users get confused about current best practices, and historical context is lost. Terminology evolution is distinct from knowledge obsolescence — a concept may still be valid but the name has changed.

**Test:** (1) Can you identify deprecated terms in the vault? (2) Do deprecated terms link to current alternatives? (3) Is terminology status (current/deprecated/emerging) trackable via frontmatter? (4) Can users find current terminology when searching outdated terms?

### Implementation

```yaml
# For terminology notes
terminology-status: current|deprecated|emerging|historical
deprecated-replaced-by: [[Current Term Note]]
deprecated-date: 2024-03  # When marked deprecated
emerging-stability: experimental|unstable|maturing|stable
evolved-from: [[Previous Term Note]]  # For terms that evolved
```

### Frontmatter Schema Addition

```yaml
terminology-lifecycle:
  status: current|deprecated|emerging|archival
  replaced-by: term-name  # if deprecated
  deprecated-date: YYYY-MM
  stability: experimental|unstable|stable|mature
  related-terms:
    - term-name  # synonyms, alternates
```

### Migration Path Structure

When a term is deprecated:
1. Mark old term with `terminology-status: deprecated`
2. Add `deprecated-replaced-by:` pointing to current term
3. Keep old note (don't delete) — it's historical context
4. Update incoming links to prefer new term
5. Create "term history" note if multiple migrations exist

### Search Optimization

Add redirect notes for deprecated terms:
```
# Deprecated: Old Term Name

Redirect: [[New Term Name]]

> This term was replaced in [year]. See [[New Term Name]] for current usage.
```

## Edge Cases

### Edge Case 1: Meaning Shift (Same Term, Evolved Definition)

**Scenario:** "AI" meant "Artificial Intelligence" broadly in 2020, but by 2024 it specifically means "Large Language Models" in common usage.

**Solution:** Track `definition-evolution:` with timeline:
```yaml
definition-evolution:
  - term: AI
    period: 2020-2023
    definition: "Broad simulation of human intelligence"
  - term: AI
    period: 2024-present
    definition: "Specifically, large language models and generative AI"
```

### Edge Case 2: Sub-field Variations

**Scenario:** "Function" means different things in functional programming vs. mathematics vs. spreadsheet logic.

**Solution:** Use disambiguation notes and scope tagging:
```yaml
scope: functional-programming|mathematics|spreadsheet
disambiguated-from: [[Function (Mathematics)]]
```

### Edge Case 3: Emerging Terms Without Consensus

**Scenario:** "Agentic AI" (2024-2025) — emerging, no standardized definition yet.

**Solution:** Capture with explicit uncertainty:
```yaml
terminology-status: emerging
emerging-stability: experimental
confidence: emerging
captured: 2026-03
consensus-expected: 2027  # estimate
```

### Edge Case 4: Company/Brand Specific Terms

**Scenario:** "AWS Lambda" vs generic "serverless functions" — vendor-specific terminology.

**Solution:** Separate generic from vendor-specific:
```yaml
generic-term: serverless-functions
vendor-specific:
  - AWS: Lambda
  - Azure: Functions
  - GCP: Cloud Functions
```

## Related Seed Rules

- [[AI-Assisted Knowledge Management Seed]] — Foundation rules
- [[Handling Temporal Knowledge]] — Temporal fact tracking
- [[Seed Rule Proposal - Voice Consistency]] — Terminology standards
- [[Seed Gap - Knowledge with Inherent Expiration Windows]] — Related temporal aspect

## Test for This Gap

Build a knowledge base in a fast-moving domain (software development, medical research, financial instruments). After 50+ notes:
1. Search for deprecated terminology — can you identify it?
2. When searching outdated terms, do you find current alternatives?
3. Is terminology status queryable via frontmatter?
4. Can users understand the evolution path from old to new?

If any fail, this gap needs addressing.

---

*This note is part of the vault's self-improvement cycle. If this gap is resolved by adding a rule to the Seed, mark this note as `gap-status: resolved` and link the resolving Seed rule.*