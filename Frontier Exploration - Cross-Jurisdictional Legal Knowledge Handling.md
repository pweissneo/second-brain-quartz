---
last-reviewed: 2026-03-31
lifecycle: frontier-exploration
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - legal-knowledge
  - jurisdiction
  - cross-jurisdictional
  - domain-specific
---

# Frontier Exploration: Cross-Jurisdictional Legal Knowledge Handling

> How should a knowledge base track knowledge that applies differently across legal jurisdictions?

## The Problem

Legal knowledge (and similar jurisdiction-dependent knowledge like regulations, policies, tax rules) varies by:
- Country (US vs. UK vs. Germany)
- State/Province (California vs. New York)
- Municipality (city-specific ordinances)
- International treaties and conventions

A note about "contract formation" might cover:
- US federal common law
- California Civil Code
- New York General Obligations Law
- UK Contract Act 1999

Without explicit jurisdiction tracking, AI agents cannot determine which rules apply to a given situation.

## Proposed Seed Rule

**Rule:** Notes about jurisdiction-dependent knowledge (legal, regulatory, policy) must explicitly track which jurisdictions they apply to. When covering multiple jurisdictions, clearly label which rules apply where.

**Why:** Jurisdiction-dependent knowledge (especially legal) varies by geographic/political boundary. Without explicit jurisdiction tracking, AI agents cannot distinguish which rules apply where, leading to incorrect knowledge application.

**Test:** For jurisdiction-dependent notes: (1) Does the note have a `jurisdiction:` field? (2) When covering multiple jurisdictions, is it clear which rule applies where? (3) Can you identify conflicting rules across jurisdictions?

## Implementation

### Frontmatter Schema

```yaml
jurisdiction: US-Federal|US-State|International|Municipal
jurisdiction-scope: [US, CA, NY]  # array of applicable jurisdictions
jurisdiction-conflict: true|false  # whether jurisdictions have different rules
conflict-resolution: note which jurisdiction takes precedence
```

### Note Structure Pattern

For multi-jurisdiction topics:

```markdown
# Contract Formation Requirements

## US Federal (Common Law)
- [rules here]

## California
- [differences from federal]

## New York
- [differences from federal]

## Conflicts and Notes
- When federal and state rules conflict, federal preempts
- State-specific variations noted above
```

## Edge Cases

### Edge Case: Federalism Overlap

In US federal system, federal law preempts state law in certain areas. Track:
- Preempted areas (immigration, bankruptcy, copyright)
- Concurrent jurisdiction (family law, contract law)
- State-exclusive (most criminal law, property)

### Edge Case: International Treaties

Treaties create obligations that supersede domestic law in some areas. Track:
- Treaty ratification date
- Which countries are parties
- Reservations and declarations

### Edge Case: Historical Jurisdiction Changes

Jurisdictions change over time (countries split, territories change hands). For historical legal knowledge:
- Track effective date of jurisdiction
- Note when jurisdiction ended
- Link to successor jurisdictions

## Related Notes

- [[Seed Stress Test - Legal Knowledge Bases]]
- [[Seed Gap - Jurisdiction and Legal Authority Type Handling]]
- [[Frontier Exploration - Legal Information vs Legal Advice Boundary]]
- [[AI-Assisted Knowledge Management Seed]]