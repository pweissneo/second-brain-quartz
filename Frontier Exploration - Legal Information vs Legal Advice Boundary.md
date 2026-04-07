---
last-reviewed: 2026-03-31
last-updated: 2026-03-31
lifecycle: seed-extension
confidence: emerging
verification-status: verified
author-type: ai-assisted
knowledge-type: structural
verification-mode: source
tags:
  - frontier-exploration
  - legal-knowledge
  - advice-vs-information
  - safety-boundaries
schema-version: "1.0"
gap-status: integrated
---

# Frontier Exploration: Legal Information vs Legal Advice Boundary

## The Problem

When an AI builds a legal knowledge base, the Seed doesn't distinguish between:
- **Legal information** (descriptive): "Contract formation under common law requires consideration"
- **Legal advice** (prescriptive): "You should include this clause in your contract"

Both are "legal knowledge" but have vastly different risk profiles. The first is educational; the second could constitute unauthorized practice of law if acted upon without a lawyer's involvement.

## Where the Seed Falls Short

Current Seed has:
- Disclaimers for high-stakes domains (medical, legal, financial) - line 2324-2325
- Confidence markers
- Source verification rules

What's missing:
- **`legal-content-type:`** frontmatter to distinguish descriptive from prescriptive content
- Explicit **`advice-warning:`** flag for prescriptive legal content
- Guidance on when legal knowledge crosses into "advice" territory
- The unauthorized practice of law risk is not explicitly addressed

## Why This Matters

Without this distinction:
1. An AI might present descriptive legal information with the same confidence as prescriptive advice
2. Readers can't distinguish what's general education vs what requires professional consultation
3. The vault lacks the metadata to flag content that needs human lawyer review
4. Verification standards should differ - descriptive can cite sources; prescriptive needs stronger warnings

## Test Scenario

An AI building a legal knowledge base about "starting a small business" would capture:
- How to register an LLC (information)
- What contracts you need (information)  
- "You should use this specific contract template" (advice - problematic)

Current Seed has no rule to flag the third case.

## Proposed Seed Rule

**Rule:** For legal knowledge bases, distinguish between descriptive legal information (how law works) and prescriptive legal advice (what you should do). Tag prescriptive content with explicit warnings.

**Why:** Prescriptive legal content (advice, recommendations, specific actions) can constitute unauthorized practice of law and create liability. Descriptive content (explanations of legal concepts, how laws work) is safer. The Seed's disclaimer rule addresses the need for warnings but doesn't require distinguishing information from advice.

**Test:** For legal notes: (1) Is there a `legal-content-type:` field (descriptive/prescriptive)? (2) If prescriptive, is there an `advice-warning:` tag? (3) Is there a disclaimer note linked?

**Implementation:**
```yaml
legal-content-type: descriptive  # how law works - educational
legal-content-type: prescriptive  # what you should do - may need professional
advice-warning: consult-lawyer  # for prescriptive content
legal-disclaimer: "This is general information, not legal advice"
```

## Related Notes

- [[Seed Gap - Comparative and Cross-Jurisdictional Legal Knowledge]] - has related gap
- [[AI-Assisted Knowledge Management Seed]] - line 2324 mentions liability disclaimers but not info/advice distinction
- [[Safety-Critical Knowledge Thresholds]] - covers safety but not legal safety
- [[Professional Advice Disclaimer Requirements]] - related but broader