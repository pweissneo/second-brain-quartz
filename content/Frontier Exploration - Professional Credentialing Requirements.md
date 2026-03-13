---
last-reviewed: 2026-03-10
lifecycle: draft
confidence: emerging
author-type: ai-assisted
tags:
- frontier-exploration
- verification
- credentialing
- professional-knowledge
---

# Frontier Exploration - Professional Credentialing Requirements for Knowledge Verification

## The Gap

The Seed includes `verification-status: unverified | tested | community-validated` for procedural content, but this assumes anyone can verify the content. In high-stakes domains like medicine, law, and engineering, **who verifies matters as much as whether it's verified**.

## Why This Matters

- **Medical procedures**: A layperson can follow surgery instructions but cannot verify they're safe
- **Legal advice**: General legal information ≠ legal counsel for a specific case
- **Engineering specs**: Structural calculations require professional stamps

An AI agent applying current rules would treat all "tested" knowledge as equally reliable, regardless of whether the tester had requisite expertise.

## The Problem for AI Agents

When building a knowledge base on medicine:
1. AI finds "How to treat hypertension" 
2. Seed rules say add `verification-status: tested`
3. AI assumes it's safe to recommend
4. But treating hypertension requires medical license, diagnosis, monitoring

The Seed doesn't distinguish between:
- Knowledge that's **safe to know** (educational)
- Knowledge that's **safe to apply** (requires professional credentialing)

## Proposed Rule

**Rule:** For knowledge domains where application requires professional licensing or credentialing, include an `application-scope` field: `public | professional-only | licensed-practitioner`

- `public`: Safe for general knowledge and application (e.g., basic first aid)
- `professional-only`: Requires relevant credentials to apply (e.g., prescribing medication)
- `licensed-practitioner`: Requires specific licensure (e.g., performing surgery)

**Why:** Knowledge that is accurate but requires professional credentialing to safely apply can cause harm if treated as universally actionable. Scope tagging enables appropriate use.

**Test:** For knowledge in regulated professions (medicine, law, engineering): (1) Can a layperson apply this knowledge safely? (2) Does application require licensing? (3) If yes to 2, is the note tagged with appropriate scope?

## Edge Cases

1. **Educational vs. clinical**: Medical school textbooks are educational (public scope), clinical guidelines for treatment are professional-only
2. **First aid**: Basic first aid is public scope; advanced interventions are professional-only
3. **Self-help vs. professional services**: Tax preparation software (public) vs. tax attorney representation (professional)
4. **Tiered access**: Some knowledge exists in both public and professional versions (over-the-counter vs. prescription medications)

## Related
- [[Confidence Markers]]
- [[Stress Test - 3-Hops Rule in Genealogy]]
- [[Frontier Exploration - Knowledge Abstraction Levels]]
- [[Frontier Exploration - Professional Advice Disclaimer Requirements]] - When advice requires disclaimers
