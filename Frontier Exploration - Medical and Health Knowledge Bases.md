---
last-reviewed: 2026-03-24
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - domain-specific
  - medical
  - sensitive-information
level: pattern
verification-status: unverified
schema-version: "1.0"
---

# Frontier Exploration - Medical and Health Knowledge Bases

## The Gap

The Seed includes rules for **infrastructure-dependent domains** (home automation, networking), **workshop-dependent craft domains** (woodworking, metalworking), and **jurisdiction-dependent knowledge** (legal, financial). However, there's a critical gap: **medical and health knowledge bases** — domains where knowledge carries potential for real-world harm, has strict privacy requirements, and requires special verification standards.

## Why This Matters

Medical knowledge differs fundamentally from other domains:

- **Harm potential**: Bad coding advice crashes a program; bad medical advice can harm a person
- **Privacy sensitivity**: Medical information is PHI (Protected Health Information) with legal protections
- **Verification complexity**: Medical consensus changes as research evolves; yesterday's "best practice" may be today's "contraindicated"
- **Liability exposure**: Sharing medical advice carries legal risk that other domains don't have
- **Source hierarchy**: Peer-reviewed studies, clinical guidelines, and anecdotal experience form distinct verification tiers

The Seed's current verification rules assume knowledge is "true or false" but medical knowledge often exists in probabilistic space — "this treatment works for 70% of patients with this condition" requires different handling than " tomatoes are red."

## Current Seed Coverage

The Seed has:
- Infrastructure-dependent domain rules (network, hardware, geographic, power configs)
- Workshop-dependent craft rules (equipment-tier for woodworking)
- Jurisdiction-dependent knowledge (legal, financial scope)
- Verification hierarchy (empirical, theoretical, anecdotal)
- Confidence markers (high, emerging, low)

**What's missing:**
- No guidance on medical disclaimer requirements
- No PHI/privacy handling for medical notes
- No rules for time-sensitive medical guidelines (treatments that change)
- No distinction between general health knowledge vs. personal medical records
- No guidance on conflicting medical sources (two studies, opposite conclusions)
- No liability-aware knowledge capture rules

## Proposed Rule Additions

### Rule 1: Medical Disclaimer Requirements

**Rule:** For knowledge bases containing medical or health information, include prominent disclaimer metadata and content warnings.
**Why:** Medical knowledge applied incorrectly can cause harm. Without explicit disclaimers, AI agents may present medical information as authoritative advice rather than information for the user to verify with professionals.
**Test:** Does a note about medical topics include `disclaimer-required: true` frontmatter? Is there a clear disclaimer in the note content that medical information should be verified with healthcare providers?

### Rule 2: Medical Information Privacy

**Rule:** Medical knowledge bases must not contain personally identifiable health information (PHI) unless explicitly encrypted and access-controlled.
**Why:** Medical information is protected in most jurisdictions (HIPAA in US, GDPR in EU). Storing PHI in a knowledge base creates legal liability and privacy risks.
**Test:** Can you find any notes containing specific personal medical details (diagnoses, medications, test results tied to individuals)? If yes, are they encrypted or access-controlled?

### Rule 3: Medical Source Verification Tier

**Rule:** Medical claims must be tagged with source verification tier: `peer-reviewed`, `clinical-guideline`, `professional-consensus`, or `anecdotal`.
**Why:** Medical knowledge ranges from well-established (peer-reviewed studies replicated multiple times) to speculative (single case reports). AI agents need to distinguish these tiers to appropriately present confidence.
**Test:** Pick 5 notes with medical claims. Do they have source-verification tags? Can you determine the evidence level for each claim?

### Rule 4: Temporal Medical Guidelines

**Rule:** Medical notes referencing treatments, medications, or protocols must include `guideline-date` or `review-date` frontmatter.
**Why:** Medical guidelines change. A treatment recommended in 2020 may be outdated by 2026. Without dating, AI agents can't distinguish current from obsolete guidance.
**Test:** Do medical protocol notes include a date? Can you determine if the guidance is current?

### Rule 5: Conflicting Medical Sources

**Rule:** When capturing medical knowledge from sources with conflicting conclusions, note both positions and flag the conflict explicitly.
**Why:** Medicine has genuine controversies where experts disagree. Presenting one side as definitive when alternatives exist misrepresents the evidence.
**Test:** If two notes cover the same medical topic with different conclusions, is the conflict documented? Is there a note explaining the different perspectives?

## Edge Cases

1. **General health vs. personal medical records**: General advice ("eat more vegetables") differs from personal medical records ("Patient X has diabetes"). The latter should likely not be in a knowledge base at all due to privacy.

2. **Self-experimentation data**: If the user tracks their own health data (sleep, diet, exercise), what's the privacy implication? This is their own data but still sensitive.

3. **Medical myths and misconceptions**: Sometimes the "gap" in medical knowledge is the myth itself. Should the vault capture "myth: vitamin C prevents colds" for debunking purposes?

4. **Jurisdiction variation**: Medical guidelines vary by country. A note about "recommended treatment" is incomplete without specifying jurisdiction.

5. **Emergency vs. routine**: Knowledge for medical emergencies (CPR, Heimlich) has different stakes than routine advice (vitamin supplements). Should emergency knowledge be more strictly verified?

## Related Notes

- [[AI-Assisted Knowledge Management Seed]] (verification, confidence rules)
- [[Frontier Exploration - Infrastructure-Dependent Domains]] — Related: domain-specific requirements
- [[Frontier Exploration - Jurisdiction-Dependent Knowledge]] — Overlapping: geographic variation
- [[Seed Stress Test - Cooking Domain]] — Related: embodied knowledge differs by domain
- [[Handling Temporal Knowledge]] — Related: time-sensitive information