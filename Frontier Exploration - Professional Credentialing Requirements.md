---
last-reviewed: 2026-04-06
last-updated: 2026-04-06
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
application-scope: public
knowledge-type: meta
retrieval-mode: hybrid
storage-pattern: atomic
verification-approach: self-referential
access-pattern: decision
tags:
  - frontier-exploration
  - verification
  - credentialing
  - professional-knowledge
  - disclaimers
  - liability
---

# Frontier Exploration - Professional Knowledge Scope and Disclaimer Requirements

> When does knowledge become "advice" requiring disclaimers? How should knowledge bases handle liability-sensitive content? Who can safely verify and apply knowledge in regulated domains?

## The Gap

The Seed includes `verification-status: unverified | tested | community-validated` for procedural content, but this assumes anyone can verify the content. In high-stakes domains like medicine, law, and engineering, **who verifies matters as much as whether it's verified**.

Additionally, the Seed lacks guidance on when information crosses into "advice" territory requiring disclaimers.

## Why This Matters

### Credentialing Requirements

- **Medical procedures**: A layperson can follow surgery instructions but cannot verify they're safe
- **Legal advice**: General legal information ≠ legal counsel for a specific case
- **Engineering specs**: Structural calculations require professional stamps

An AI agent applying current rules would treat all "tested" knowledge as equally reliable, regardless of whether the tester had requisite expertise.

### Disclaimer Requirements

Knowledge bases often capture:
- Medical information (symptoms, treatments, medications)
- Financial information (investment strategies, tax strategies, retirement planning)
- Legal information (rights, contracts, regulations)
- Professional recommendations (career advice, relationship guidance)

Without explicit disclaimer guidance, vaults can:
1. **Implied liability** — Readers may assume the vault is recommending actions
2. **Professional gatekeeping concerns** — Only licensed professionals can give advice in some domains
3. **Harm potential** — Bad financial or medical advice can cause real damage

## The Problem for AI Agents

When building a knowledge base on medicine:
1. AI finds "How to treat hypertension" 
2. Seed rules say add `verification-status: verified`
3. AI assumes it's safe to recommend
4. But treating hypertension requires medical license, diagnosis, monitoring

The Seed doesn't distinguish between:
- Knowledge that's **safe to know** (educational)
- Knowledge that's **safe to apply** (requires professional credentialing)

Similarly, an AI building a knowledge base on "personal finance" might:
- Create notes like "The best investment strategy for retirement" — implying a recommendation
- Document specific tax strategies without noting they may not apply to everyone
- Present opinions as facts without distinguishing advice from information

## Proposed Rule Framework

### Rule: Application Scope Tagging

**Rule:** For knowledge domains where application requires professional licensing or credentialing, include an `application-scope` field: `public | professional-only | licensed-practitioner`

- `public`: Safe for general knowledge and application (e.g., basic first aid)
- `professional-only`: Requires relevant credentials to apply (e.g., prescribing medication)
- `licensed-practitioner`: Requires specific licensure (e.g., performing surgery)

**Why:** Knowledge that is accurate but requires professional credentialing to safely apply can cause harm if treated as universally actionable. Scope tagging enables appropriate use.

**Test:** For knowledge in regulated professions (medicine, law, engineering): (1) Can a layperson apply this knowledge safely? (2) Does application require licensing? (3) If yes to 2, is the note tagged with appropriate scope?

### Rule: Detect when information becomes advice

**Why:** Information (describing how things work) and advice (recommending a course of action) have different liability implications. A knowledge base should distinguish between "here's how the tax code works" (information) and "you should contribute to a 401k" (advice).

**Test:** Can you categorize each note as either:
1. **Information** — Describes how something works (neutral, no recommendation)
2. **Advice** — Recommends a specific action or approach (requires disclaimer)
3. **Analysis** — Applies general principles to a specific situation (requires disclaimer + scope limitations)

### Rule: Add required disclaimers for regulated domains

**Why:** Medical, financial, and legal knowledge have specific disclaimer requirements. A knowledge base that omits them may create implied liability or mislead readers.

**Test:** For notes in regulated domains:
- Medical: Does the note include "This is informational only, not medical advice" when describing treatments?
- Financial: Does the note include "Past performance does not guarantee future results" or similar disclaimer for recommendations?
- Legal: Does the note include "This is general information, not legal advice"?

### Rule: Scope advice to specific contexts

**Why:** Even legitimate advice has limitations. "Invest in index funds" may be good advice for someone with a long time horizon but bad advice for someone near retirement.

**Test:** For advisory notes:
1. Can you identify who this advice applies to?
2. Can you identify who this advice does NOT apply to?
3. Are limitations explicitly stated?

## Implementation Guidance

### Frontmatter fields for scope and disclaimer tracking:

```yaml
application-scope: public|professional-only|licensed-practitioner
disclaimer-required: true
disclaimer-type: medical|financial|legal|professional
disclaimer-text: "This is informational only and does not constitute advice."
applies-to:
  - "Adults with stable income"
  - "US residents"
does-not-apply-to:
  - "Those with significant debt"
  - "Non-US residents"
advisory-type: information|recommendation|analysis
```

### Disclaimer placement:
- **Top of note** — For notes that are primarily advisory
- **Section-level** — For notes that mix information and advice
- **Frontmatter only** — For notes that mention advisory topics tangentially

## Edge Cases

1. **Educational vs. clinical**: Medical school textbooks are educational (public scope), clinical guidelines for treatment are professional-only
2. **First aid**: Basic first aid is public scope; advanced interventions are professional-only
3. **Self-help vs. professional services**: Tax preparation software (public) vs. tax attorney representation (professional)
4. **Tiered access**: Some knowledge exists in both public and professional versions (over-the-counter vs. prescription medications)
5. **Basic concepts**: Compound interest, budgeting fundamentals, basic first aid principles are public scope even in regulated domains

## Domain-Specific Guidance

### Medical Knowledge
- Always include disclaimer for treatment, diagnosis, or medication recommendations
- Note: "Consult a healthcare professional" is standard
- Exception: Basic first aid that is universally accepted

### Financial Knowledge  
- Include disclaimer for any investment recommendation
- Note: "Not financial advice" + "Consult a financial advisor"
- Exception: Basic savings concepts (compound interest, budgeting fundamentals)

### Legal Knowledge
- Include disclaimer for any guidance on legal action
- Note: "Not legal advice" + "Consult an attorney"
- Exception: General legal information (how courts work, basic rights)

### Professional Advice (career, relationships, etc.)
- Include disclaimer when giving prescriptive advice
- Note: "This is one perspective, not professional guidance"
- Consider: Some advice domains have no licensing but still require care

## The Test

**For application scope:**
For knowledge in regulated professions: (1) Can a layperson apply this knowledge safely? (2) Does application require licensing? (3) If yes to 2, is the note tagged with appropriate scope?

**For disclaimer requirements:**
Pick 10 notes that could be interpreted as advice (medical, financial, legal, professional). Can you identify:
1. Which ones require disclaimers?
2. What type of disclaimer is needed?
3. Is the disclaimer present?

**For scope limitations:**
For advisory notes, can you identify:
1. Who the advice applies to?
2. Who it does NOT apply to?
3. Are limitations explicit?

## Related Concepts

- [[Confidence Markers]] — For signaling reliability
- [[Frontier Exploration - Expertise-Level Dependent Knowledge]] — For who can understand advice
- [[Frontier Exploration - User Situational Constraints]] — For contextual limitations
- [[Frontier Exploration - Systematic Knowledge Exclusion Criteria]] — For harm prevention
- [[Frontier Exploration - Legal Knowledge Base Gaps]] — For legal domain specifics
