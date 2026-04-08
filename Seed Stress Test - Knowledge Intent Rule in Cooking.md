---
last-reviewed: 2026-04-08
lifecycle: draft
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
tags:
  - seed-stress-test
  - knowledge-intent
  - creative-domains
  - cooking-domain
---

# Seed Stress Test: Knowledge Intent Rule in Cooking Domain

> Testing the knowledge-intent rule against cooking knowledge base.
> Date: 2026-04-08
> Domain: Cooking (culinary arts)

## Original Rule

**Rule (NEW - 2026-04-05):** For creative-aesthetic hybrid domains, add `knowledge-intent:` tagging to distinguish technical execution from aesthetic intent.

**Why:** In creative domains, the same technique can serve different purposes — some verifiable (technical correctness), some subjective (aesthetic judgment). Without intent tagging, AI agents optimize for technical correctness while missing the artistic dimension.

**Test:** (1) Can you filter notes by knowledge-intent (technical/aesthetic/hybrid)? (2) For aesthetic notes, does verification acknowledge subjectivity? (3) Do hybrid notes link to both technical basis and aesthetic rationale?

## Stress Test: Cooking Domain

### Test 1: Technical vs Aesthetic in Cooking

**Question:** Does cooking have both technical and aesthetic dimensions?

**Analysis:**
- Technical: "sear at 400°F for 2 minutes per side" (verifiable, objective)
- Aesthetic: "present with the sauce draped artistically" (subjective, opinion-based)
- Hybrid: "the dish should have a golden-brown crust that provides textural contrast" (both technical sear AND aesthetic presentation)

**Result:** The rule PASSES - cooking clearly has both dimensions that need distinction.

### Test 2: Consistency of Application

**Question:** Is knowledge-intent being applied consistently across the vault?

**Analysis:**
- `Distinguishing Craft Criticism from Aesthetic Judgment.md` uses `knowledge-intent: hybrid` ✓
- Most other cooking notes do NOT have knowledge-intent frontmatter ✗

**Result:** The rule FAILS in practice - the taxonomy exists but isn't being applied to new notes.

### Test 3: Verification Acknowledgment

**Question:** Do aesthetic notes acknowledge subjectivity in verification?

**Analysis:**
- Notes tagged with aesthetic intent should have modified verification expectations
- Current verification-status assumes objective truth - aesthetic notes need `verification-basis: taste-based` or similar

**Result:** The rule is INCOMPLETE - verification methodology doesn't account for aesthetic knowledge.

### Test 4: Hybrid Note Linking

**Question:** Do hybrid notes link to both technical basis AND aesthetic rationale?

**Analysis:**
- A note about "plating" should link to technical (temperature, timing) AND aesthetic (color, composition) related notes
- Current linking patterns don't distinguish these dimensions

**Result:** The rule is INCOMPLETE - linking conventions don't account for dual-nature notes.

## Gap Summary

The knowledge-intent rule works conceptually for cooking but:

1. **Application inconsistency:** Rule exists but isn't applied to most notes
2. **Verification mismatch:** No methodology for verifying aesthetic claims
3. **Linking gap:** No convention for dual-link structure in hybrid notes

## Proposed Refinements

### Refinement 1: Mandatory knowledge-intent for creative-domain notes

**Rule:** Notes in creative-aesthetic domains MUST include knowledge-intent frontmatter.

**Why:** Without mandatory tagging, the rule has no teeth - it becomes optional guidance that's ignored in practice.

**Test:** Can you filter all notes in creative domains by knowledge-intent? Is compliance 100%?

### Refinement 2: Aesthetic verification basis

**Rule:** Add verification-basis field for knowledge that cannot be objectively verified.

**Why:** Current verification assumes objective truth. Aesthetic knowledge requires different treatment - "aligned with tradition" rather than "verified as correct."

**Implementation:**
```yaml
verification-basis: objective|subjective|taste-based
verification-outcome: verified|aligned|context-dependent
```

### Refinement 3: Hybrid linking convention

**Rule:** Hybrid notes must link to both technical and aesthetic related notes.

**Why:** Readers need to navigate to either dimension depending on their need.

**Implementation:**
```yaml
technical-links: [[technical-note-1]], [[technical-note-2]]
aesthetic-links: [[aesthetic-note-1]], [[aesthetic-note-2]]
```

## Related Notes

- [[AI-Assisted Knowledge Management Seed]] — Original knowledge-intent rule
- [[Distinguishing Craft Criticism from Aesthetic Judgment]] — Proper application example
- [[Seed Stress Test - Verification Priority Rule in Music Performance]] — Similar domain testing

## Summary

The knowledge-intent rule needs:
1. Mandatory application in creative domains
2. Verification methodology refinement for aesthetic knowledge
3. Explicit dual-linking for hybrid notes
