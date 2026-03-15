---
last-reviewed: 2026-03-11
lifecycle: active
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - ethics
  - privacy
  - sensitive-information
---

# Frontier Exploration - Knowledge Ethics and Exclusion

> When should a knowledge base choose NOT to capture knowledge? What wisdom lies in what we choose not to record?

## The Problem

The Seed has extensive rules about:
- What to capture (atomicity, sourcing, verification)
- How to structure (linking, navigation, hierarchy)
- When to update (lifecycle, deprecation)
- How to handle uncertainty (confidence, probabilistic knowledge)

But the Seed is silent on the inverse question: **When is it wiser NOT to capture knowledge?**

This gap creates risks:
- Personal knowledge bases accumulating sensitive data that could be misused
- Professional vaults containing client information that creates liability
- Medical vaults with highly specific personal health information
- Financial vaults with data that could enable identity theft
- Therapeutic journals with intimate details that could cause harm if exposed

## Domains Where This Matters Most

- **Personal vaults**: Diary entries, therapy notes, personal finances
- **Professional vaults**: Client information, patient records, confidential business data
- **Genealogy**: Details about living people that could affect privacy
- **Medical**: Highly specific personal health information
- **Financial**: Account numbers, SSNs, detailed financial records
- **Legal**: Client confidential information

## Current Seed Gaps

1. **No guidance on living person privacy** - How to handle information about living individuals who haven't consented to being documented
2. **No guidance on harm assessment** - When does capturing knowledge create risk of harm?
3. **No guidance on consent** - Should knowledge about others require consent?
4. **No guidance on exclusion criteria** - What types of knowledge should explicitly NOT be captured?
5. **No guidance on secure storage** - Should sensitive knowledge be encrypted or isolated?

## The Complementary Question

This frontier explores the inverse of "Vault Boundaries" (what categories to include):
- **Vault Boundaries**: "What topics belong in my vault?"
- **Knowledge Ethics**: "What specific knowledge should I exclude, even if it fits my topic?"

## Emerging Rule Suggestions

### Rule: Assess harm potential before capturing personal/sensitive information

**Why:** Knowledge that seems harmless today could cause harm if exposed (identity theft, professional liability, personal embarrassment). Pre-capture harm assessment prevents future problems.

**Test:** For notes containing: (1) personal identifiers, (2) financial details, (3) health information, (4) details about others: Can you articulate what harm could result if this note were exposed? Is there a mitigation (encryption, isolation, exclusion)?

### Rule: Exclude or encrypt knowledge about living individuals without consent

**Why:** Capturing information about others without their knowledge creates ethical and legal risk. Even in personal vaults, this principle protects against future harm.

**Test:** For notes mentioning specific living people: (1) Did they consent to being recorded? (2) If no, is the note encrypted or excluded? (3) Could this knowledge cause them harm if exposed?

### Rule: Separate highly sensitive operational data from knowledge content

**Why:** Operational data (passwords, account numbers, client lists) is different from knowledge (principles, patterns, insights). Mixing them creates security vulnerabilities.

**Test:** Can you clearly separate: (1) knowledge that could be shared publicly, (2) knowledge that should stay private but is non-sensitive, (3) knowledge that requires encryption/isolation? Are categories 2-3 isolated from general vault?

### Rule: Mark knowledge with "expiry" when capture is time-sensitive

**Why:** Some knowledge becomes dangerous to keep over time (old passwords, expired credentials, outdated personal details). Explicit expiry dates trigger review.

**Test:** For sensitive notes, is there a: (1) review date, (2) expiry date, or (3) explicit retention policy? Can old sensitive data be automatically flagged for review?

### Rule: Consider "right to be forgotten" for personal knowledge bases

**Why:** Even valid knowledge can become harmful if it persists beyond its usefulness or consent. Personal vaults should have cleanup protocols for outdated personal data.

**Test:** Can you identify notes that should be deleted (not just deprecated) because they: (1) contain outdated personal information, (2) represent knowledge the person would no longer want captured, (3) serve no current purpose?

## Test Case: Genealogy Knowledge Base

An AI building a genealogy vault using only current Seed rules would:
- ✓ Capture family history facts
- ✓ Link ancestors to descendants
- ✓ Mark confidence on uncertain relationships
- ✗ Not distinguish between deceased ancestors (generally safe) and living relatives (privacy concerns)
- ✗ Not know to exclude SSNs, account numbers, or other sensitive data even when found in old records
- ✗ Not ask whether living relatives consent to being included
- ✗ Not know to encrypt or password-protect sensitive branches

## Test Case: Personal Medical Knowledge Base

An AI building a personal health vault using only current Seed rules would:
- ✓ Capture symptom patterns
- ✓ Link conditions to treatments
- ✓ Source medical advice
- ✗ Not know to exclude highly specific identifying details
- ✗ Not know to encrypt the vault
- ✗ Not know that sharing such a vault could affect insurance

## Questions This Frontier Raises

1. Is there a categorical distinction between "knowledge to capture" and "data to store separately"?
2. Should AI agents be trained to refuse to capture certain categories of sensitive information?
3. How do we balance completeness of knowledge against privacy/harm considerations?
4. What's the difference between "knowledge" (principles to learn from) and "data" (details to store securely)?

## Related

- [[Frontier Exploration - Vault Boundaries]] - What topics to include (complementary)
- [[Frontier Exploration - Probabilistic Knowledge]] - Handling uncertainty in captured knowledge
- [[Note Lifecycle Management]] - When to deprecate (partial overlap)
- [[Confidence Markers]] - Current confidence framework
- [[Frontier Exploration - Professional Advice Disclaimer Requirements]] - When knowledge becomes advice requiring disclaimers
- [[AI-Assisted Knowledge Management Seed]] - The Seed this explores
