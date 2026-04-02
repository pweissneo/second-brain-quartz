---
last-reviewed: 2026-03-23
last-updated: 2026-03-23
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - user-feedback
  - knowledge-correction
  - vault-maintenance
---

# Frontier Exploration: User Feedback Integration in Knowledge Bases

## The Gap

The Seed has comprehensive rules for:
- Verification (checking if knowledge is correct)
- Gap identification (finding what's missing)
- Contradiction resolution (handling conflicting information)
- Construction phases (building the vault over time)

However, it lacks explicit guidance for handling **user-provided corrections and feedback** — when people using the knowledge base identify errors, suggest improvements, or provide additional context.

## Why This Matters

In collaborative or shared knowledge bases, users often spot issues that:
- Verification processes miss (real-world usage reveals errors)
- Automated checks can't detect (contextual errors, outdated examples)
- Original authors overlooked (different perspectives reveal gaps)

Without explicit handling, user feedback can:
1. Get lost in informal communication
2. Be applied inconsistently or not at all
3. Create confusion about what's "correct" vs. what someone "thinks" is correct

## The Problem in Practice

Imagine a user says: "That recipe calls for 2 tablespoons of salt, but that's way too much — I made it with 1 tablespoon and it was perfect."

Current Seed rules don't specify:
- How to track this correction
- How to validate it (is 1 tbsp actually better?)
- How to mark the note as having user-suggested changes
- When to apply user corrections vs. keep original content

## Exploration: Proposed Approach

### Tracking User Feedback

```yaml
user-corrections:
  - user: "[identifier]"
    date: 2026-03-23
    type: correction|suggestion|addition
    description: "Reduced salt from 2 tbsp to 1 tbsp"
    status: pending|validated|rejected
```

### Validation Distinction

User corrections differ from general verification:
- **Verification**: Is this factually correct? (source-based)
- **User feedback**: Does this work better in practice? (experience-based)

A user correction might be valid for their context but not universal (e.g., dietary restrictions, regional ingredient differences).

### Proposed Seed Rule

**Rule:** Track user-provided corrections separately from automated verification — maintain a correction log with source, date, validation status, and context applicability.
**Why:** Users often identify errors or improvements that verification processes miss. Without tracking, feedback is lost; without validation, unverified corrections pollute the vault.
**Test:** (1) Can you identify corrections provided by users? (2) Are they tracked separately from general verification? (3) Is there a process for validating and applying corrections? (4) Does the note indicate when user corrections were applied?

**Implementation:**
- Use `user-correction:` frontmatter field to track corrections
- Separate "validated by source" (traditional verification) from "validated by user"
- Distinguish context-specific corrections (valid for some users) from universal corrections
- Apply corrections only after validation, not automatically

### Edge Cases

**Opinion vs. Correction:** "This recipe is terrible" is feedback, not correction. "The cooking time should be 20 min not 30" is a correction. Separate these categories.

**Competing Corrections:** Two users provide different corrections. Resolution protocol needed (similar to contradiction handling).

**Source Conflicts:** User correction contradicts verified source. Escalate to human decision rather than auto-accepting user feedback over source verification.

**Attribution:** Should user corrections be attributed? Consider privacy implications for shared vaults.

## Related Notes

- [[Self-Improvement Cycle]] — How the vault continuously improves
- [[Note Lifecycle Management]] — Note states and updates
- [[Anti-Patterns in Knowledge Management]] — What to avoid in maintenance
- [[Seed Stress Test - Knowledge Source Type Rule in Medical Domain]] — different source types need different handling
- [[Frontier Exploration - Collaborative Knowledge Creation]] — multi-user knowledge contexts
- [[Contradiction Resolution]] — handling conflicting information
- [[Verification and Validation]] — existing verification rules
- **[[AI-Assisted Knowledge Management Seed]]** — Core rules this extends

## Questions for Seed Evolution

1. Should user corrections have lower validation threshold than source verification?
2. How do you handle "context-specific" corrections (valid for some users but not others)?
3. Should user feedback influence gap identification priorities?
4. How do you protect against malicious or incorrect user corrections in public vaults?

## Status

This is an emerging area. The proposed rule needs testing across different vault types (personal, collaborative, public) before becoming a core Seed rule.

---

*This note was created during FRONTIER_EXPLORATION heartbeat. It represents a potential gap in the current Seed that may warrant a future rule addition.*