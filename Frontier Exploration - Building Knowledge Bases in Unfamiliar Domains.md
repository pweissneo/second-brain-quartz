---
last-reviewed: 2026-03-14
lifecycle: active
confidence: emerging
author-type: ai-assisted
review-by: 2026-03-21
tags:
  - frontier-exploration
  - ai-assistance
  - knowledge-gap
  - domain-learning
---

# Frontier Exploration: Building Knowledge Bases in Unfamiliar Domains

> What to do when the AI doesn't understand the topic it's helping to document

## The Problem

The Seed assumes an AI agent can:
- Understand the domain it's working in
- Identify what constitutes quality knowledge
- Recognize when knowledge is contradictory
- Apply domain-appropriate judgment

But what happens when helping build a knowledge base in an unfamiliar domain? An AI asked to help organize notes on cardiac surgery, NMR spectroscopy, or antique furniture restoration faces a fundamental problem: **it doesn't know what it doesn't know**.

## Current Seed Gaps

### 1. No Rule for Recognizing Domain Ignorance

The Seed has rules about:
- Confidence markers
- Source verification
- When to defer to human experts

But it's missing:
- How to recognize when you (the AI) lack domain understanding
- What signals indicate unfamiliarity vs. familiar domains
- When to explicitly ask for clarification vs. make assumptions

### 2. No Guidance on Asking Domain-Specific Questions

The Seed covers:
- What frontmatter fields to include
- How to structure atomic notes
- How to verify claims

But it's missing:
- What questions to ASK to understand a domain
- How to identify domain-specific terminology you don't know
- How to learn enough to be useful without pretending to be an expert

### 3. No Framework for Unknown Unknowns in Domains

The Seed has:
- Rules for tracking knowledge gaps
- Guidance on discovering unknown unknowns through community resources

But it's missing:
- How to distinguish "I don't know this" from "this isn't known"
- When domain knowledge is genuinely uncertain vs. just not captured
- How to flag "this needs human expert review" for AI-generated content

## Why This Matters

A knowledge base built in an unfamiliar domain is at risk of:
1. **False confidence** - AI presents uncertain information as certain
2. **Missing critical knowledge** - Unknown gaps go undetected
3. **Incorrect structure** - Domain-appropriate organization is wrong
4. **Terminology errors** - Domain terms used incorrectly

## Proposed Seed Rules (Draft)

### Rule: Explicit Unknown Marker for Domain-Specific Claims

**Rule:** When generating or processing knowledge in unfamiliar domains, tag notes with `domain-familiarity:` indicating the AI's assessed understanding level.

**Why:** Readers and users need to know whether knowledge was generated with domain expertise or in "learning mode." A note about cardiac surgery written by an AI without medical training should be clearly labeled.

**Test:** Can you identify which notes were generated in familiar vs. unfamiliar domains? Do unfamiliar-domain notes carry appropriate uncertainty markers?

**Implementation:**
```yaml
domain-familiarity: assessed  # AI has verified understanding
domain-familiarity: learning   # AI is learning the domain
domain-familiarity: unknown    # Domain is unfamiliar
domain-expertise-source: [human-expert-review, external-verification]
```

### Rule: Require Human Verification for High-Stakes Domains

**Rule:** For domains with safety, health, or financial implications, require explicit human expert verification before marking any AI-generated content as verified.

**Why:** AI can assist but cannot replace domain expertise in high-stakes areas. The Seed's confidence markers assume AI can assess reliability, but unfamiliar domains require human oversight.

**Test:** Can you identify AI-generated notes in high-stakes domains? Do each have explicit human verification markers?

**Implementation:**
```yaml
verification-required: human-expert
expert-reviewed-by: [name or role]
verification-date: YYYY-MM-DD
```

### Rule: Use Socratic Questioning for Domain Discovery

**Rule:** When building a knowledge base in an unfamiliar domain, explicitly ask foundational questions before generating structure:
- What are the core concepts a beginner would need?
- What terminology is domain-specific?
- What are the common mistakes beginners make?
- What does "quality" look like in this domain?

**Why:** The Seed provides structure rules but not discovery rules. In unfamiliar domains, AI needs a systematic approach to learning enough to be helpful.

**Test:** For the last 5 notes added in an unfamiliar domain: Could a domain expert identify what the AI didn't understand?

## Test Cases

### Test Case 1: Medical Domain
- AI has no medical training
- Helping organize notes on treatment protocols
- **Current risk:** AI might present unverified medical advice
- **Needed:** Explicit unfamiliarity marker, human verification requirement

### Test Case 2: Hobby Domain (Woodworking)
- AI understands basic woodworking but not specialty techniques
- Helping document advanced joinery methods
- **Current risk:** Might miss subtle quality indicators
- **Needed:** Domain-familiarity: partial, ask clarifying questions

### Test Case 3: Professional Domain (Law)
- AI has training data but not licensed expertise
- Helping organize legal research notes
- **Current risk:** Might give incorrect legal advice
- **Needed:** Explicit disclaimer, non-substitution notice, human review required

## Related Notes

- [[Seed Improvement - Safety-Critical Knowledge Metadata]] — Related to high-stakes domain handling
- [[Frontier Exploration - Knowledge Base Utility Assessment]] — How to measure if KB is working
- [[Frontier Exploration - Unknown Unknowns in Vast Domains]] — Discovering what you don't know
- [[AI-Assisted Knowledge Management]] — General AI-KB interaction

## Open Questions

1. How can an AI accurately assess its own domain familiarity?
2. What's the minimum domain knowledge needed to be helpful vs. harmful?
3. How do you balance "admitting ignorance" with "being useful"?
4. Should unfamiliar-domain knowledge be treated differently in confidence calculations?
