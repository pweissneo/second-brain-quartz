---
last-reviewed: 2026-03-22
last-updated: 2026-03-22
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
knowledge-type: frontier
tags:
- knowledge-lifecycle
- deprecation
- obsolescence
- maintenance
- software-engineering
---

# Frontier Exploration: Knowledge Deprecation and Obsolescence Management

> This note explores a gap in the Seed: how to handle knowledge that becomes outdated, deprecated, or obsolete over time.

## The Problem

In fast-moving domains (software engineering, technology, research), knowledge has a shelf life. The Seed addresses:

- Note lifecycle (evergreen, staging, draft)
- Verification status (verified, unverified, contested)
- Temporal knowledge (knowledge that changes over time)

But it lacks explicit guidance on:

- **Deprecation workflow** — how to mark knowledge as deprecated
- **Obsolescence tracking** — how to know when knowledge has expired
- **Cascade updates** — what depends on deprecated knowledge
- **Retirement vs. retention** — when to delete vs. archive deprecated notes

## Where AI Gets Stuck

Imagine building a knowledge base about a programming language or framework using only current Seed rules:

1. **Version migration:** A note describes API v1. API v2 releases. The note is now partially wrong. Seed says nothing about versioned knowledge.

2. **Tool deprecation:** A note recommends a library that has known security vulnerabilities. Seed says verify knowledge, but not what to do when verification reveals the knowledge itself is harmful.

3. **Pattern abandonment:** A best practice from 2020 is now an anti-pattern in 2026. The vault has both notes but no relationship between them.

4. **Cascading staleness:** A foundational note becomes outdated. Without explicit deprecation tracking, the AI doesn't know which dependent notes need review.

## Gap Analysis

The Seed needs rules for:

| Gap | Current Coverage | Needed |
|-----|------------------|--------|
| Deprecation workflow | None | How to mark, communicate, update |
| Obsolescence detection | Temporal knowledge (date-based) | Version/context-based expiration |
| Dependency tracking | Basic wikilinks | "depends on" + "deprecated by" |
| Archive vs. delete | None | Clear criteria |

## Domain-Specific Manifestations

### Software Engineering
- API versions, library versions, language versions
- Security vulnerabilities discovered post-publication
- Best practices that become anti-patterns
- Deprecated features and their replacements

### Scientific Research
- Studies superseded by newer research
- Methods proven ineffective
- Hypotheses rejected
- Retracted papers

### Business/Strategy
- Market conditions that changed
- Competitors acquired or defunct
- Regulations that changed
- Tools or vendors discontinued

### Personal Knowledge
- Skills that became obsolete
- Recommendations for products discontinued
- Health/fitness information outdated by new research

## Proposed Rule Concepts

### Rule: Implement Knowledge Deprecation Workflow

**Rule:** For knowledge that is no longer recommended but may still have value, implement a deprecation workflow: mark deprecated, add replacement reference, set review date, communicate status.

**Why:** Without explicit deprecation, users can't distinguish between current and outdated knowledge. Deprecated notes left as-is create confusion and potential harm.

**Test:** 
1. Can you identify deprecated notes? (deprecation-status field)
2. Do deprecated notes link to replacements?
3. Is there a deprecation date and reason?
4. Is the deprecation communicated in note summary?

**Implementation:**
```yaml
deprecated: true
deprecated-date: 2026-03-22
deprecated-reason: "Security vulnerability discovered"
replaced-by: [[New Alternative Note]]
deprecation-urgency: critical|high|medium|low
review-after: 2026-06-01  # when to reconsider deletion
```

### Rule: Track Knowledge Dependency Chains

**Rule:** For notes that other notes depend on, maintain explicit dependency tracking to enable cascade updates when foundational knowledge changes.

**Why:** In interconnected vaults, changing one note may require updating others. Without dependency tracking, the vault accumulates inconsistencies.

**Test:**
1. Can you identify all notes that depend on a given note?
2. When a core note changes, is there a process to review dependents?
3. Are critical dependencies flagged differently?

### Rule: Establish Obsolescence Detection Triggers

**Rule:** Define domain-specific obsolescence triggers and scan for them periodically: version changes, security advisories, retraction notices, date-based expiration.

**Why:** Knowledge doesn't become obsolete on its own — external events trigger obsolescence. Without monitoring, vaults drift out of sync with reality.

**Test:**
1. Are there defined triggers for your domain?
2. Is there a scanning process?
3. Are trigger events captured in notes?

**Example triggers by domain:**
- Software: new version releases, security CVE publication, EOL announcements
- Research: new studies, retractions, consensus shifts
- Business: competitor changes, regulation updates, product discontinuation
- Personal: 6+ months since review for time-sensitive topics

### Rule: Distinguish Archive from Delete

**Rule:** Deprecated knowledge with historical value should be archived, not deleted. Delete only when: no historical value, actively harmful, or storage cost exceeds value.

**Why:** Deleted knowledge is unrecoverable. Archive preserves context for understanding past decisions while clearly marking current status.

**Test:**
1. Can you distinguish archived from current notes?
2. Do archived notes explain why they were archived?
3. Is there a retrieval path from current to archived notes?

## Open Questions

1. **How aggressive should deprecation be?** Over-deprecation creates noise; under-deprecation creates risk.

2. **What's the half-life of knowledge by domain?** Software might need 6-month review cycles; historical knowledge might need 10-year.

3. **Should deprecated notes count against verification ratio?** A deprecated-but-accurate note is different from an unverified note.

4. **How to handle partially deprecated knowledge?** Some parts still valid, some outdated.

## Related Notes

- [[Note Lifecycle Management]] — existing lifecycle concept
- [[[Frontier Exploration - Knowledge Maintenance]]] — related to maintenance burden
- [[Handling Contradictory Sources]] — conflict resolution
- [[Seed Stress Test - Version Scope Rule in Data Science ML]] — version handling in specific domain

## Conclusion

The Seed needs explicit deprecation management. This is distinct from lifecycle (draft → evergreen) because deprecation is about time-based decay, not quality-based staging. A note can be evergreen quality but deprecated content.

**Next steps:** 
1. Test proposed rules in a software engineering vault
2. Refine obsolescence triggers by domain
3. Develop deprecation scanning automation
4. Add to Seed if validated
