---
last-reviewed: 2026-03-17
last-updated: 2026-03-17
lifecycle: active
confidence: high
author-type: ai-assisted
verification-status: verified
domain: legal-knowledge
tags:
  - stress-test
  - domain-adaptation
  - legal
  - personal-knowledge
  - ratio
---

# Seed Stress Test: 5:1 Personal-to-General Ratio in Legal Knowledge Base

> Stress testing the "5:1 personal-to-general knowledge ratio" rule in legal knowledge bases.
> Date: 2026-03-17

## Rule Under Test

**Rule:** Apply the 5:1 personal-to-general knowledge ratio — capture insights, decisions, and experiences (personal) over restatable facts (general).

**Why:** Personal knowledge compounds and provides unique value no web search can match. General knowledge takes maintenance effort but offers little unique value.

**Test:** Pick 10 recent notes. For each: (1) Could a web search replace this note in <30 seconds? (2) Does it contain original insight, decision, or experience? Ratio should be 5:1 personal to general.

## Stress Test: Legal Knowledge Base

### 1. Does the rule make sense for law?

**Analysis:**

Legal knowledge is heavily precedent-based. Much of law IS "general knowledge" in the sense that it consists of:
- Statutes and regulations (publicly available)
- Case law holdings (published opinions)
- Legal treatises and form books (reference materials)

However, personal legal experience provides UNIQUE value:
- How a specific judge ruled on similar facts
- What arguments succeeded or failed in practice
- Which procedural strategies worked
- Client-specific outcomes and lessons learned

**Finding:** The rule PARTIALLY applies. The ratio concept is sound, but the ratio itself may need adjustment for legal domains.

### 2. Is the Test actually executable by an AI?

**Problem 1: "Could a web search replace this note in <30 seconds?"**

For legal knowledge, this is nuanced:
- **Statutes**: Yes, instantly searchable on platforms like Westlaw, Lexis, or even government sites
- **Case law**: Partially — you can FIND the case, but finding relevant cases takes hours of research
- **Legal strategy**: No — this is the personal knowledge that can't be replaced

**Problem 2: "Does it contain original insight, decision, or experience?"**

Legal notes often contain:
- Case summaries (restating what courts said — general)
- Annotations with personal notes (insight — personal)
- Strategy recommendations based on experience (personal)
- Procedural reminders from past cases (personal)

**Modified Test for Legal:**

1. **For case summaries:** (1) Does this add anything beyond the holding? (2) Does it include procedural context, judge tendencies, or outcome details not in the official opinion? If yes to either, count as personal.
2. **For statutes/regulations:** (1) Does this include jurisdiction-specific implementation notes? (2) Does it document how courts have interpreted this provision? If yes, count as personal.
3. **For procedural knowledge:** (1) Does this include lessons from actual practice? (2) Does it document what worked or didn't work? Count as personal.

### 3. Edge Cases Discovered

**Edge Case 1: Jurisdiction-Specific Knowledge**

A note about "California LLC formation" is technically "general" (statutes are public), but for a practitioner in California, it provides unique value no generic source can match because it includes:
- Local filing nuances
- Common rejection reasons
- Practice tips from California-specific experience

**Recommendation:** Add `jurisdiction:` frontmatter. Notes with jurisdiction-specific implementation details count as personal even if the underlying law is public.

**Edge Case 2: Attorney-Client Privilege Constraints**

Much of a lawyer's most valuable personal knowledge CANNOT be captured due to confidentiality obligations:
- Specific client strategies
- Case details that would reveal client identity
- Settlement discussions and negotiation tactics

This creates a structural gap: the ratio can't be achieved for many high-value areas.

**Recommendation:** Document this constraint. For legal vaults, allow notes to be tagged with `confidentiality-constrained: true` and exclude from ratio calculations.

**Edge Case 3: Legal Research Methodology**

How to find relevant cases is personal expertise that's hard to capture but extremely valuable:
- Which databases to search
- Search term strategies
- Citation tracking approaches
- Knowing when to broaden vs. narrow searches

These "knowing how to know" notes are highly personal and shouldn't be penalized for being "about research" rather than "about law."

**Recommendation:** Add `thinking-tool: true` notes for legal research methodology. These count as personal by virtue of being expertise-developed, not just factual.

**Edge Case 4: Professional Judgment and Interpretation**

Legal knowledge often involves interpretation:
- How courts have interpreted a statute (general)
- How YOU expect a specific court to interpret it based on recent rulings (personal)
- What arguments resonate with specific judges (deeply personal)

The line between general legal analysis and personal judgment is blurry.

**Recommendation:** Add `analysis-type:` frontmatter with values `canonical` (established law), `interpretation` (informed analysis), or `personal-experience` (from your practice).

**Edge Case 5: Temporal Validity**

Legal knowledge has unique temporal properties:
- A case interpretation from 5 years ago may be outdated
- Statutory changes can invalidate previous notes
- Judge tendencies evolve

This affects the "could a web search replace this" test — old notes might now be searchable but no longer accurate.

**Recommendation:** Add `temporal-validity:` with `current`, `historical`, or `superseded` values. Notes about changed laws should be marked superseded rather than counted as general.

## Proposed Seed Rule Update

Add to the 5:1 ratio rule:

**Edge case (stress test 2026-03-17):** In legal knowledge bases, the 5:1 ratio needs significant modification due to domain-specific constraints:

- **Jurisdiction-specific implementation:** Notes about statutes/regulations that include jurisdiction-specific filing tips, common pitfalls, or practice insights count as personal even if the underlying law is public. Use `jurisdiction:` field to mark.
- **Confidentiality constraints:** Attorney-client privilege prevents capturing many high-value personal experiences. Allow `confidentiality-constrained: true` tag to exclude from ratio calculations.
- **Research methodology as personal knowledge:** Legal research strategies (search techniques, database selection, citation tracking) are expertise-developed and count as personal, even though they're "about how to find law" not "the law itself."
- **Interpretation vs. authority:** Distinguish `analysis-type: canonical` (established law), `analysis-type: interpretation` (informed analysis), `analysis-type: personal-experience` (from your practice).
- **Temporal validity:** Add `temporal-validity: current|historical|superseded` to account for law changes.

**Modified test for legal:** For legal notes: (1) Does this include jurisdiction-specific implementation details beyond the statute text? (2) Does this document personal experience or judgment? (3) Is it about legal research methodology? (4) Does it include temporal validity markers? Count notes as personal if yes to any.

## Links

- [[AI-Assisted Knowledge Management Seed]]
- [[Seed Stress Test - 5-1 Ratio in Parenting Knowledge Base]]
- [[Frontier Exploration - Legal Knowledge Bases]]
- [[Seed Stress Test - Diminishing Returns Rule in Machine Learning Data Science]] (for comparison on high-stakes domain adaptation)
