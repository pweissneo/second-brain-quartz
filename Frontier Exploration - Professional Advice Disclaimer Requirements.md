---
last-reviewed: 2026-03-13
lifecycle: emerging
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - disclaimers
  - liability
  - professional-advice
---

# Frontier Exploration: Professional Advice Disclaimer Requirements

> When does knowledge become "advice" requiring disclaimers? How should knowledge bases handle liability-sensitive content?

## The Problem

The Seed provides excellent guidance on knowledge quality, confidence markers, and source attribution. But it doesn't address a critical practical question: **When does information become advice requiring a disclaimer?**

Knowledge bases often capture:
- Medical information (symptoms, treatments, medications)
- Financial information (investment strategies, tax strategies, retirement planning)
- Legal information (rights, contracts, regulations)
- Professional recommendations (career advice, relationship guidance)

Without explicit disclaimer guidance, vaults can:
1. **Implied liability** — Readers may assume the vault is recommending actions
2. **Professional gatekeeping concerns** — Only licensed professionals can give advice in some domains
3. **Harm potential** — Bad financial or medical advice can cause real damage

## Where AIs Get Stuck

An AI building a knowledge base on "personal finance" might:
- Create notes like "The best investment strategy for retirement" — implying a recommendation
- Document specific tax strategies without noting they may not apply to everyone
- Present opinions as facts without distinguishing advice from information

The same applies to medical vaults ("treatments for X"), legal vaults ("how to sue"), and career vaults ("best careers for...").

## The Gap in Current Seed Rules

The Seed has:
- `knowledge-type: canonical|analysis|personal` — distinguishes fact from opinion
- `application-scope: public|professional-only|licensed-practitioner` — handles credentialing
- Confidence markers — signals reliability

But it lacks:
- **Disclaimer requirements** — when to add "this is not advice" language
- **Recommendation detection** — identifying when a note crosses from information to advice
- **Scope limitation** — "this applies to X situation, not Y"

## Proposed Rule Framework

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

### Frontmatter fields for disclaimer tracking:

```yaml
disclaimer-required: true
disclaimer-type: medical|financial|legal|professional
disclaimer-text: "This is informational only and does not constitute advice."
applies-to:
  - "Adults with stable income"
  - "US residents"
does-not-apply-to:
  - "Those with significant debt"
  - "Non-US residents"
advisory-type: recommendation|analysis|opinion
```

### Disclaimer placement:
- **Top of note** — For notes that are primarily advisory
- **Section-level** — For notes that mix information and advice
- **Frontmatter only** — For notes that mention advisory topics tangentially

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
- [[Frontier Exploration - Professional Credentialing Requirements]] — For who can give advice
- [[Frontier Exploration - Expertise-Level Dependent Knowledge]] — For who can understand advice
- [[Frontier Exploration - User Situational Constraints]] — For contextual limitations
- [[Frontier Exploration - Knowledge Ethics and Exclusion]] — For harm prevention
