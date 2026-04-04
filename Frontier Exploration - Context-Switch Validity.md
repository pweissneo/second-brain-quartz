---
last-reviewed: 2026-04-04
last-updated: 2026-04-04
lifecycle: emerging
confidence: emerging
author-type: ai-assisted
knowledge-type: conceptual
gap-status: identified
gap-priority: high
tags:
  - frontier-exploration
  - context-validity
  - contextual-truth
  - equivalence
---

# Frontier Exploration - Context-Switch Validity

> How should knowledge bases handle knowledge that is true in some contexts but false in others — where truth is not time-dependent but context-dependent?

## The Gap

The Seed covers:
- **Temporal validity** — knowledge that changes over time ("verify within 30 days")
- **Temporal validity bounds** — "true until event X"
- **Context-gated knowledge** — knowledge that requires certain context to be relevant

But it does NOT cover:
- **Context-switch validity** — knowledge that is factually TRUE in one context but FALSE in another, independent of time

This is distinct from:
- Contradictory sources (one is wrong)
- Subjective preferences (no right answer)
- Equivalent alternatives (all valid in all contexts)
- Context-gated knowledge (only relevant in certain contexts)

## The Core Problem

Some knowledge looks like a fact but is actually a context-conditional fact:

| Statement | True In | False In |
|-----------|--------|----------|
| "Tap water is safe to drink" | Most developed countries | Many developing countries |
| "You can legally brew beer at home" | Most US states, UK, Germany | Utah, Norway, some US localities |
| "This recipe makes 5% ABV beer" | With typical ingredients | At high altitudes, with different yeast |
| "Standard voltage is 120V" | US, Japan | EU, UK, Australia |
| "You need a license to drive" | Most jurisdictions | Some countries for certain vehicles |

The knowledge itself is accurate — but only in certain contexts. Without tracking this, knowledge bases make false universal claims.

## Why This Matters for Seed Construction

When an AI builds a knowledge base from scratch using only Seed rules:

1. **False universalization risk**: Capturing "tap water is safe" without context makes it look universally true
2. **Verification without scope**: Verifying the fact doesn't capture its bounded applicability
3. **Cross-context transfer errors**: Knowledge from one context applied to another produces failures
4. **No validity scope**: The Seed has no field or rule for "applies in context X, Y"

## Domain Examples

### Brewing Beer (Home Brewing)
- "All-grain brewing produces better beer" — TRUE for experienced brewers, FALSE for beginners (mash efficiency issues)
- "You can bottle carbonate with sugar" — TRUE in most contexts, FALSE in some jurisdictions (different carbonation methods required)
- "High altitude requires flavor adjustments" — TRUE above 3000ft, FALSE at sea level

### Legal Knowledge
- "You can record a conversation without consent" — True in single-party consent states (US), false in two-party consent states
- "This business structure limits liability" — True in most jurisdictions, false where specific structures aren't recognized

### Health & Safety
- "Seat belt angles differ by vehicle" — Critical for safety, varies by car model
- "This medication is available over the counter" — Varies by jurisdiction

### Technology
- "This adapter works" — Varies by region (power standards), device model, protocol version
- "This file format is supported" — Varies by software version, OS

### Knowledge Base Construction
- "2+ outgoing links is sufficient" �� True for most domains, false for highly technical domains needing more context

## The Challenge

Context-switch validity creates several challenges:

1. **Implicit context assumptions**: Authors capture knowledge assuming their context is universal
2. **Scope detection difficulty**: Without explicit marking, AI can't detect context-conditional facts
3. **Verification limitations**: Verifying in one context doesn't validate across all contexts
4. **Cross-context application failures**: Users apply knowledge from wrong context

## Proposed Solution Patterns

### 1. Validity Scope Field

For knowledge with context boundaries:

```yaml
---
validity-scopes:
  - context: geographic
    regions: [US, CA, UK, AU]
    note: Not applicable in EU regions with different standards
  - context: expertise-level
    levels: [intermediate, advanced]
    note: Not applicable for beginners
```

### 2. Contextual Fact Note Template

When capturing potentially context-conditional facts:

```markdown
# Fact Name

## The Claim
[Precise statement]

## Validity Contexts
- **True in contexts**: [A, B, C]
- **False/unknown in contexts**: [D, E, F]

## Why Context Matters
[Explanation of what changes between contexts]
```

### 3. Seed Rule Addition

**Proposed Rule:**
> When capturing factual knowledge, explicitly state the validity scope — all contexts where the claim is true, not just where it has been verified.

**Why:** Knowledge that is true in one context but false in another is not partially true — it has bounded applicability. Without scope, knowledge bases universalize locally true claims.

**Test:** Can you identify at least one context where this claim would NOT hold?

## Connection to Existing Seed Work

This connects to:
- [[Frontier Exploration - Knowledge Validity Window Handling]] — extends temporal validity to context validity
- [[Frontier Exploration - Equivalent Alternatives and Contextual Selection]] — extends alternative context-sensitivity
- [[Seed Gap - Knowledge Type Taxonomy and Retrieval Optimization]] — context-switch could be a distinct knowledge type

## Open Questions

- How should the Seed test for context-switch validity during verification?
- Should context-scopes be searchable/filterable in knowledge bases?
- How do we handle unknown contexts (we don't know where it ISN'T true)?
- Should context-switch validity be distinguished from context-gated (applicability vs relevance)?