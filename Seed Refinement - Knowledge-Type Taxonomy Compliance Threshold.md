---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-04-08
lifecycle: seed-refinement
confidence: emerging
tags:
  - seed-refinement
  - compliance
  - taxonomy
  - enforcement
---

# Seed Refinement: Knowledge-Type Taxonomy Compliance Threshold
> Gap identified: Seed mandates knowledge-type taxonomy but doesn't specify compliance requirements.
## The Gap
The Seed's Knowledge Type Taxonomy rule (2026-04-03) requires:
- Classify every note by primary knowledge type
- Apply type-specific storage, retrieval, and verification rules
- Answer "what knowledge type answers this query?"
However, the Seed doesn't specify:
1. **Compliance threshold** — What percentage of notes must have knowledge-type before the vault is considered "compliant"?
2. **Enforcement mechanism** — How should an AI agent handle non-compliant notes?
3. **Migration path** — How to add knowledge-type to notes that lack it?
## Evidence
Current vault audit (2026-04-08):
- Total notes: 647
- Notes with knowledge-type: 281 (43.4%)
- Notes without knowledge-type: 366 (56.6%)
This means the vault is not in compliance with its own Seed rule.
## Proposed Seed Rule Addition
> **Rule:** A knowledge-type taxonomy is considered "enforced" when >=80% of notes have knowledge-type frontmatter. Below this threshold, the vault should flag non-compliance and prioritize taxonomy migration.
>
> **Why:** Without a compliance threshold, the Seed rule is aspirational but not measurable. An AI agent needs a clear target to determine whether the vault meets its own standards.
> **Test:** (1) What percentage of notes have knowledge-type? (2) If below 80%, is there a migration plan? (3) Is knowledge-type being added to new notes at creation time?
> **Rule:** When adding knowledge-type frontmatter to existing notes, use a semi-automated approach: batch-process notes by knowledge-type likelihood (procedural=has steps, conceptual=explains why, factual=definitions, experiential=first-person, relational=compares things, meta=about knowledge itself).
> **Why:** Manual classification of 366+ notes is tedious; batch heuristics accelerate compliance without sacrificing accuracy for most notes.
> **Test:** Can you classify notes into knowledge types using heuristic rules? What percentage of classifications are ambiguous and require human review?
## Related
- [[Seed Refinement - Knowledge Type Taxonomy Complete]] — Completed taxonomy integration
- [[AI-Assisted Knowledge Management Seed]] — Core Seed rules
- [[Note Lifecycle Management]] — Note aging and migration
