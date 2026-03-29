---
last-reviewed: 2026-03-28
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
tags:
  - seed-gap
  - legal-knowledge
  - jurisdiction
  - comparative-law
  - unauthorized-practice
gap-status: identified
gap-priority: high
gap-phase: analysis
gap-type: seed-missing
discovered: 2026-03-27
---

# Seed Gap: Comparative and Cross-Jurisdictional Legal Knowledge

> How should a knowledge base handle knowledge that spans multiple legal jurisdictions with potentially conflicting rules?

## The Problem

The Seed Stress Test - Legal Knowledge Bases identifies jurisdiction as a critical field for legal notes. But it doesn't address what happens when you need to compare or synthesize across jurisdictions — which is increasingly common in:
- International business (contracts governed by foreign law)
- Comparative legal research
- Multi-jurisdictional compliance
- Immigration and citizenship knowledge
- International travel/advisory knowledge

## Gap Description

**The Seed lacks guidance on organizing knowledge about the SAME topic under different jurisdictional rules.**

Example: "Contract formation" might have different requirements under:
- US Common Law (consideration required)
- Civil Law (offer and acceptance sufficient)
- UNIDROIT Principles (different still)
- Consumer protection laws (additional requirements)

How should these be organized? The Seed has no rule for this.

## Related Gap: Conflict of Laws

When jurisdictions have DIRECTLY CONFLICTING rules, the Seed provides no guidance on:
- Which jurisdiction's rule should "win" in a given context
- How to track when conflict-of-laws rules apply
- How to represent that something is lawful in one place but not another

**Example:** An AI building a knowledge base about "dual-use goods" might capture:
- US: Export controlled to certain countries
- EU: Different control list, different countries
- No jurisdiction: Not controlled

The Seed doesn't address how to represent this "jurisdiction-dependent validity" concept.

## Gap: Unauthorized Practice of Law Risk

When building a legal knowledge base as a non-lawyer (or for use by non-lawyers), there's a critical risk the Seed doesn't address:

**How do you document legal knowledge without giving legal advice?**

The current Seed has:
- Confidence levels
- Source verification
- Access control

But it lacks:
- Guidance on when legal knowledge crosses into "legal advice" territory
- How to flag notes that should NOT be used as advice
- Distinction between "here's how contracts generally work" vs "you should sign this contract"

**This is a SAFETY-CRITICAL gap for legal knowledge bases** — incorrect legal advice can cause real harm (financial loss, legal liability, deportation, etc.).

## Gap: Legal Knowledge Type Distinction

The Seed's Knowledge Type System mentions:
- Factual (what is)
- Procedural (how to)
- Conceptual (principles)
- Analytical (evaluation)

But legal knowledge has additional types:
- **Authoritative** (what the law says — binding)
- **Persuasive** (what someone argues — non-binding)
- **Analytical** (your interpretation)
- **Practical** (how to navigate the legal system)

The Seed doesn't address this distinction, which affects how legal knowledge should be verified and presented.

## Proposed Seed Rules

### Rule: Track Jurisdiction-Dependent Validity

> For knowledge that varies by jurisdiction, include explicit `jurisdiction-validity:` mapping showing which jurisdictions the knowledge applies to.

**Why:** Legal knowledge is jurisdiction-specific. A note saying "contracts require consideration" is only true for common law jurisdictions. Without explicit validity mapping, knowledge appears universally true when it's not.

**Test:** For notes about legal rules: (1) Is there a `jurisdiction-validity:` field? (2) Does it explicitly list which jurisdictions the rule applies to? (3) Is there a note explaining what to do in excluded jurisdictions?

**Implementation:**
```yaml
jurisdiction-validity:
  applies-to: [US-common-law, UK, Australia]
  does-not-apply-to: [civil-law-jurisdictions]
  conflict-resolution: "For civil law jurisdictions, see [[Contract Formation - Civil Law]]"
```

### Rule: Document Legal Advice Boundaries

> For legal knowledge bases accessible to non-lawyers, explicitly distinguish descriptive legal knowledge from prescriptive legal advice, and flag notes that could be misinterpreted as advice.

**Why:** Legal knowledge in a vault can be misread as legal advice. An AI agent building a legal KB might not distinguish "here's how the law works" from "you should do X." This creates liability. The Seed's safety-critical rules address physical safety but not legal safety.

**Test:** For legal notes: (1) Is there a `legal-content-type:` field (descriptive/prescriptive)? (2) Are prescriptive notes explicitly flagged with `advice-warning: consult-qualified-professional`? (3) Is there a disclaimer note linked from all legal content?

**Implementation:**
```yaml
legal-content-type: descriptive  # describes how law works
legal-content-type: prescriptive  # tells you what to do
legal-advice-warning: true
legal-jurisdiction: US-federal
legal-advice-disclaimer: "This is general legal information, not legal advice. Consult a qualified attorney."
```

### Rule: Handle Jurisdictional Conflict Representation

> When knowledge about the same topic differs across jurisdictions, create separate atomic notes for each jurisdictional version and a hub note that links to all variants.

**Why:** Contradictory sources rule handles one source vs another. But jurisdictional conflict is different — both sources may be correct, just in different contexts. The Seed doesn't distinguish "source A contradicts source B" from "source A is correct in jurisdiction X, source B is correct in jurisdiction Y."

**Test:** For topics with jurisdictional variation: (1) Is there a hub note linking to jurisdictional variants? (2) Can you quickly identify which jurisdiction a note applies to? (3) Is there guidance on selecting the right jurisdiction for a given situation?

### Rule: Separate Legal Research from Legal Opinion

> Legal knowledge bases must clearly distinguish what the law IS (from primary sources) from what the AI or user BELIEVES the law to be (interpretation/analysis).

**Why:** This is an extension of the Source Type classification but specifically for legal. Primary legal sources (statutes, cases) are authoritative. Your interpretation is not. The Seed's verification rules don't distinguish between these — but for legal knowledge, this distinction is critical.

**Test:** For a legal note: (1) Is it clear whether this is a summary of primary sources or original analysis? (2) Are primary source citations provided? (3) Is there a `verification: original-interpretation` tag for analysis notes?

## Gap Severity Assessment

| Gap | Severity | Reasoning |
|-----|----------|-----------|
| Jurisdiction-validity mapping | high | Without it, legal knowledge appears universally applicable when it's not |
| Legal advice boundaries | critical | Risk of unauthorized practice of law; real harm possible |
| Jurisdictional conflict representation | medium | Important for international/comparative contexts |
| Legal research vs opinion separation | high | Verification without this distinction is meaningless for legal |

## Interaction with Existing Seed Rules

- **Contradictory Sources**: Extends to handle "correct in different contexts" vs "actually contradictory"
- **Safety-Critical Knowledge**: Applies to legal safety (not just physical safety)
- **Confidence Markers**: Should include legal-specific confidence (binding vs persuasive authority)
- **Source Classification**: Extends with legal-specific source types (primary, secondary, tertiary)
- **Verification**: Legal verification requires checking if authorities are still good law

## Questions for Seed

1. Should the Seed include a general "context-dependent validity" concept that applies beyond legal?
2. How granular should jurisdiction tracking get? (Country? State? Municipality?)
3. Should vaults have an "advisory" field that flags notes requiring professional consultation?
4. How do you verify legal knowledge that's jurisdiction-dependent?

## Related Notes

- [[Seed Stress Test - Legal Knowledge Bases]]
- [[Frontier Exploration - Jurisdiction-Dependent Knowledge]]
- [[Handling Contradictory Sources]]
- [[Safety-Critical Knowledge Thresholds]]
- [[Frontier Exploration - Professional Advice Disclaimer Requirements]]

## Test for Seed

```
Building a legal knowledge base:
1. Can you identify which jurisdiction a legal rule applies to?
2. Do notes distinguish "what the law says" from "what I think it means"?
3. Are prescriptive legal notes flagged with warnings?
4. Can you compare how different jurisdictions handle the same topic?
5. Do you have guidance on when to consult a real lawyer?
```