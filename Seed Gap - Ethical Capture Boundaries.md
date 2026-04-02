---
last-updated: 2026-03-31
author-type: ai-assisted
lifecycle: seed-gap
verification-status: unverified
confidence: emerging
evidence-tier: reasoning-by-analogy
knowledge-source-type: analysis
analysis-type: deductive
applicability: universal
recurring: false
utility-type: potential
tags: [seed-gap, knowledge-ethics, capture-ethics, consent, attribution]
seealso: [[AI-Assisted Knowledge Management Seed]]
---

# Seed Gap - Ethical Capture Boundaries

> What knowledge should an AI agent explicitly refuse to capture, regardless of utility?

## The Gap

The Seed addresses:
- What knowledge to capture (priority signals, diminishing returns)
- What knowledge to exclude for utility (ephemeral, public utility, duplicates)
- Vault boundaries and exclusion criteria
- Sensitive knowledge handling

But the Seed lacks explicit guidance on:
- **Ethical exclusions** — knowledge that should never be captured regardless of value
- **Consent-based capture** — knowledge about living individuals
- **Attribution obligations** — when capturing others' ideas requires credit
- **Harmful technique documentation** — how to handle "how-to" harmful content

## Why This Matters

An AI bootstrapping a knowledge base using only current Seed rules would:
- ✓ Know to exclude ephemeral temporal knowledge
- ✓ Know to exclude public utility knowledge
- ✓ Know to apply sensitivity classification to dual-use knowledge
- ✗ Not know that capturing "how to harm someone" is inherently problematic
- ✗ Not know whether it's appropriate to document private conversations about living people
- ✗ Not know when attribution is required vs. optional
- ✗ Not have a framework for "irreducible harm" — knowledge that has no defensible use case

This creates risk: a zealous AI optimizing for "capture everything useful" could capture knowledge that causes harm, violates privacy, or creates liability.

## Proposed Rule

**Rule:** Apply ethical exclusion boundaries before evaluating capture utility

**Why:** Utility-based exclusions (ephemeral, duplicate, decorative) optimize for vault quality. Ethical exclusions protect against harm, privacy violations, and liability. Both are necessary — skipping ethical evaluation creates legal and moral risk.

**Test:** Before capturing any note, can you answer:
1. Does this document how to cause harm to people or systems?
2. Does this include identifiable information about living individuals without consent?
3. Does this reproduce copyrighted material verbatim without transformation?
4. Does this facilitate illegal activity in the capture user's jurisdiction?

If YES to any: Do NOT capture without explicit human authorization and documented justification.

### Sub-rules

**Rule:** Never capture operational detail of harmful acts as instruction

**Why:** Documenting "how to build a weapon, hack a system, harm a person" in instructional detail — even with defensive framing — creates a template for harm. The distinction between "knowing about" and "teaching how" is ethically significant.

**Test:** Does this note read as: (a) historical/contextual analysis of a harmful phenomenon, or (b) actionable instruction? If (b) and the knowledge could enable harm, exclude or heavily modify.

**Rule:** Obtain consent before capturing knowledge about identifiable living individuals

**Why:** Privacy persists beyond death in many jurisdictions, but consent is the clearest ethical basis for capture. Documenting someone's views, habits, or personal details without their awareness creates exposure risk.

**Test:** For notes mentioning specific living people: Can you document consent, anonymization, or legitimate interest? If none apply, exclude.

**Rule:** Transform rather than reproduce when capturing others' intellectual contributions

**Why:** Capturing ideas requires transformation (synthesis, analysis, connection) rather than verbatim reproduction to: (a) respect IP, (b) create understanding, (c) enable your perspective to add value.

**Test:** Is this note substantially different from its sources? Does it add analysis, synthesis, or personal context?

**Rule:** Document the ethical exclusion decision itself

**Why:** Excluding knowledge for ethical reasons should be visible — both to document reasoning and to enable future reconsideration if context changes.

**Test:** Is there a record of what was excluded and why? Can a human reviewer understand the exclusion rationale?

## Edge Cases

### Historical analysis of harmful acts
Documenting how atrocities occurred, how manipulation works, or how systems can be exploited is DIFFERENT from teaching how to do these things. The former enables prevention; the latter enables harm. Apply "defense, analysis, context, history" framework from [[Frontier Exploration - Knowledge Sensitivity and Responsible Capture]].

### Self-defense knowledge
Capturing knowledge to protect yourself (security vulnerabilities, threat recognition) is defensible when: (a) the defensive purpose is explicit, (b) you don't include actionable exploitation details, (c) you document mitigation, not attack.

### Journalistic and historical documentation
Documenting events, statements, or information in public interest is different from capturing private data. Apply public-interest framework: (a) is this already public?, (b) does documentation serve legitimate interest?, (c) is there less-invasive alternative?

### Creative work and attribution
When capturing analysis of creative works (books, films, art), transformation adds value. Directly reproducing substantial creative content requires different handling — apply fair use analysis or obtain permission.

## Implementation

Add to vault conventions or CLAUDE.md:
```
Ethical Capture Boundaries:
- Never capture actionable harm instruction
- Require consent for living person documentation
- Transform, don't reproduce, intellectual contributions
- Document exclusions with rationale
- Default to exclusion when uncertain; require human override to include
```

## Test Case: AI Building a Vault

An AI building a knowledge base using Seed rules WITH ethical boundaries would:
- ✓ Capture security vulnerability analysis (defensive purpose, mitigation focus)
- ✗ Decline to capture "step-by-step exploit tutorial" even if user requests it
- ✓ Capture historical analysis of manipulation techniques
- ✗ Decline to capture private details about colleagues without consent
- ✓ Transform sources into synthesis rather than copying
- ✗ Flag for human review when uncertain about ethical implications

## Related

- [[Frontier Exploration Hub]] — Overview of all frontier exploration and Seed Gap notes
- [[AI-Assisted Knowledge Management Seed]] — The Seed this gap extends
- [[Frontier Exploration - Systematic Knowledge Exclusion Criteria]] — Utility-based exclusions (complementary)
- [[Frontier Exploration - Knowledge Sensitivity and Responsible Capture]] — Sensitivity classification (complementary)
- [[Frontier Exploration - Access-Controlled Knowledge]] — Access requirements (orthogonal)
