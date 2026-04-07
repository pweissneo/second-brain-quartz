---
last-reviewed: 2026-04-06
last-updated: 2026-04-06
lifecycle: emerging
confidence: medium
author-type: ai-assisted
tags:
  - frontier-exploration
  - privacy
  - anonymization
  - sensitive-knowledge
---

# Frontier Exploration - Privacy-Preserving Knowledge Capture

> When knowledge contains sensitive information that could harm a person if disclosed, how should a knowledge base handle it? What strategies enable learning from sensitive experiences while protecting privacy?

## The Problem

The Seed provides guidance on knowledge capture, verification, and organization. But it doesn't address a common real-world scenario:

- **You learn something valuable from a private conversation** — a friend's medical diagnosis, a colleague's workplace situation, someone's financial struggle
- **You witness an event with personal information** — a family member's health event, a neighbor's legal issue
- **You process sensitive data** — notes from therapy, personal diary entries, medical information

The default guidance is "capture what's valuable" — but some knowledge has high value AND high privacy risk. Excluding it entirely loses the learning; capturing it raw creates liability.

## What Is "Sensitive" Knowledge?

Knowledge may require privacy protection when it contains:

1. **PII (Personally Identifiable Information):** Names, addresses, phone numbers, SSNs, account numbers
2. **Health information:** Medical conditions, diagnoses, treatments, mental health
3. **Financial details:** Income, debts, account balances, transaction amounts
4. **Relationship details:** Private facts about specific people
5. **Professional secrets:** Proprietary information, confidential business details
6. **Location data:** Where someone lives, their daily patterns

Not all sensitive knowledge needs protection — context matters. Information shared publicly is different from information shared in confidence.

## Anonymization Strategies

### Strategy 1: Abstraction

Replace specific details with generalized categories.

| Before | After |
|--------|-------|
| "My friend Sarah, who works at Acme Corp..." | "A colleague in the tech industry..." |
| "My uncle's lung cancer diagnosis..." | "A family member's serious diagnosis..." |
| "$150,000 salary" | "Upper-middle income" |

**When to use:** When the lesson is about the TYPE of situation, not specific details.

**Trade-off:** Loses specificity that might be useful later. Harder to reconnect if you need the original context.

### Strategy 2: Placeholder Substitution

Use generic labels consistently.

- Use "Person A" instead of names
- Use "Company X" instead of company names
- Use timestamps like "Q1 2024" instead of specific dates

**When to use:** When you might need to reference multiple people/events and need to distinguish them, but don't need exact identities.

**Trade-off:** Requires careful tracking of what placeholder maps to what. Still creates risk if mapping is discovered.

### Strategy 3: Structural Extraction

Extract the knowledge principle without the instance.

| Instance (sensitive) | Principle (safe) |
|-------------------|----------------|
| "My friend lost their job and couldn't pay rent" | " job loss creates cascading financial risk" |
| "That lawyer gave bad advice" | "verify credentials before hiring professionals" |
| "My neighbor's injury was misdiagnosed" | "second opinions matter for serious conditions" |

**When to use:** When the value is the lesson/processing, not the specific story.

**Trade-off:** Loses the narrative context that might be valuable for future reference or for teaching others.

### Strategy 4: Exclusion + Reference

Don't capture the sensitive content at all. Reference that the learning exists.

```
[[Topic: Career change during health crisis]]
# Learning captured but not stored due to privacy
# Summary: Important lesson about health insurance
```

**When to use:** When you don't need the knowledge yourself, just need to know you processed it.

**Trade-off:** The actual knowledge is lost. Only metadata remains.

### Strategy 5: Technical Protection

Use Vault-level protections:
- Encryption (if tool-supported)
- Access control (private vault vs shared)
- Separate storage (different file, different vault)

**When to use:** When you need exact preservation and have technical means.

**Trade-off:** Adds complexity. May limit usefulness (can't easily reference in other contexts).

## Trade-offs Between Strategies

| Strategy | Utility | Privacy | Reusability | Complexity |
|----------|---------|--------|------------|-----------|
| Abstraction | Medium | Medium | Medium | Low |
| Placeholder | High | Medium | High | Medium |
| Structural | Low | High | Medium | Low |
| Exclusion | Very Low | High | None | Low |
| Technical | High | High | Varies | High |

## Stakes Categories

Different knowledge types have different privacy stakes:

**High stakes (requires anonymization or exclusion):**
- Health information about specific people
- Financial account details
- Professional confidential information
- Anything shared in strict confidence

**Medium stakes (abstraction sufficient):**
- General lessons from personal experiences
- Pattern-level observations about people
- Career-related learnings

**Low stakes (capture as-is acceptable):**
- Your own preferences and experiences
- Public figure observations
- Factual knowledge without personal details

## Domain-Specific Considerations

### Medical Knowledge

HIPAA and similar regulations may actually REQUIRE protection:
- Don't capture patient details (even if you "anonymize" — still risky)
- Capture the principle: "what to ask doctors" not "what my friend was told"
- Store medical knowledge as generic health information, not derived from specific cases

### Legal Knowledge

Attorney-client privilege creates special considerations:
- Don't capture what you learned from a lawyer in consultation
- Capture the general legal principle separately
- Note: "I paid $X for legal consultation on topic Y" is financial knowledge, not legal knowledge

### Financial Knowledge

Your own financial details are sensitive:
- Capture your GENERAL financial approach, not specific account numbers
- Use ranges: "moderate savings rate" not "$50,000 in savings"
- Separate tactical knowledge (what accounts to use) from strategic (how to think about saving)

### Therapeutic/Emotional Processing

Processing private emotional experiences:
- Capture the processed insight, not the raw experience
- "I noticed I react X when Y" is different from detailed recounting
- Journal entries might need their own protected space

## Integration with Seed Rules

### Atomicity

The atomicity principle must account for privacy:
- A sensitive note with 3 atomic parts could still be sensitive when reassembled
- Break into privacy-safe chunks

### Verification

Verification of anonymized knowledge is tricky:
- Can't verify details without potentially restoring identifying information
- Verify the principle: "is this a useful framing?" not "is this exact?"
- Accept self-consistency verification for privacy-protected notes

### Deletion

Privacy-protected notes may need different deletion criteria:
- Standard: no links = delete
- Privacy: consider "could this be reconstituted with harm?" before standard deletion
- May need secure deletion beyond git rm

## Test

**Test:** For any note containing potentially sensitive information about specific people:
1. Could someone be identified from this note? (If yes to any: name, employer, location, specific dates)
2. Was this shared in confidence?
3. Would disclosure cause harm to anyone?
4. Is there an alternative capture strategy that preserves the learning?

If 1-2 AND 3 are true, apply anonymization strategy before fully capturing.

## Questions for Future Seed Development

1. Should the Seed include explicit privacy-level tagging?
2. Is structural extraction sufficient for experiential knowledge, or do we need technical protections?
3. How should shared vaults handle privacy differently from personal vaults?
4. What's the liability for anonymized-but-still-identifiable knowledge?
5. Should some domains (medical, legal) have explicit privacy-first rules?

## See Also

- [[Frontier Exploration - Liability-Excluding Knowledge]]
- [[Frontier Exploration - Knowledge Sensitivity and Responsible Capture]]
- [[Seed Gap - Ethical Capture Boundaries]]
- [[Frontier Exploration - Knowledge Exclusion and Boundary Management]]
- [[Confidence Markers]] (for privacy as a confidence type)