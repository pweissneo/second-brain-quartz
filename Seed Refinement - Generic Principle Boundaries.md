---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-04-05
lifecycle: seed-refinement
confidence: emerging
gap-status: integrated
gap-source: frontier-exploration
discovered: 2026-04-04
resolved: 2026-04-05
resolved-by: "Seed Refinement note created"
tags:
  - seed-refinement
  - meta-knowledge
  - principle-bounds
  - quality-control
---

# Seed Refinement - Generic Principle Boundaries

## Context

Gap identified via REDUNDANCY_SCAN heartbeat (2026-04-05). The vault contains a frontier exploration note on generic principle boundaries with proposed rules. This refinement proposes integrating those rules into the Seed.

## Problem

The Seed optimizes for specific, actionable, atomic knowledge but doesn't explicitly address what happens when a principle becomes too generic to be useful. Without this boundary, vaults can accumulate:
- Meta-knowledge that explains knowledge itself rather than useful content
- Principles that apply to every domain (and none) without specific guidance
- "Slogans" that sound meaningful but fail the "so what?" test

## What the Frontier Note Proposes

From [[Frontier Exploration - Generic Principle Boundaries]]:

1. **Limit meta-knowledge to 5% of vault** — meta-knowledge about knowledge management is necessary but inert. Too much swamps domain content.

2. **Generic principles must have domain-specific examples** — even general principles become useful when shown in context.

3. **Reject principles equivalent to instructions** — if a note tells you what to do rather than explains something, it's operational guidance, not knowledge.

4. **Test principles against the "So What?" test** — knowledge should change what you DO, not just what you think.

## Proposed Seed Rule

**Rule:** Limit generic meta-knowledge and require domain grounding — meta-knowledge notes should not exceed 5% of vault content, and generic principles must connect to 3+ domain-specific examples.

**Why:** Without explicit limits, vaults accumulate meta-knowledge that sounds profound but adds no specific value. Generic principles without examples are slogans, not knowledge. The 5% threshold keeps meta-knowledge present but not dominant.

**Test:** (1) Count notes tagged `knowledge-type: meta` or with titles about vault/knowledge management — is total <5% of vault? (2) For any principle note, can you give 3 concrete examples in specific domains? (3) Do generic principles link to domain-specific notes that demonstrate the principle in action?

**Implementation:**
```yaml
meta-knowledge-limit: 0.05  # 5% of vault
generic-principle-examples-required: 3
```

**Detection questions for AI agents:**
- Could this apply to ANY domain without modification? → too generic
- Does this suggest specific actions? → if no, too generic
- Would a domain expert find this useful? → if no, probably obvious
- Does this require knowledge of the vault itself? → if yes, meta

**Distinction:** Acceptable meta-knowledge includes conventions, operational reminders, retrieval paths. Reject meta-knowledge that explains "what knowledge IS" vs. "how to use this vault."

## Edge Cases

- **New vaults**: During bootstrap, meta-knowledge naturally exceeds 5% (conventions need to be established first)
- **Single-domain vaults**: 5% threshold still applies, just calculated differently
- **Operational vs. content**: Operational workspace files (AGENTS.md, SOUL.md, etc.) are excluded from meta-knowledge count; domain content is included

## Relationship to Existing Seed

- Complements: Atomic Note Principle (keep notes focused)
- Complements: Link Diversity Rule (at least 2 outgoing links)
- Extends: Exclusion Criteria (adds generic principle detection)
- Distinct from: Meta-knowledge type (addresses quantity limits, not just classification)

## Test for Refinement Completeness

- [x] Frontier note exists with proposed rules — 2026-04-04
- [x] Proposed rules address clear gap in Seed
- [x] Test is executable by AI agent
- [x] Edge cases documented
- [x] Rule added to Seed (2026-04-05) — added to Section 9: Self-Improvement

## Related Notes

- [[Frontier Exploration - Generic Principle Boundaries]] — source frontier exploration
- [[AI-Assisted Knowledge Management Seed]] — core rules
- [[Anti-Patterns in Knowledge Management]] — what to avoid
- [[Linking Principle]] — what makes good links
- [[Seed Gap - Distributed Understanding Threshold]] — related gap on understanding completeness

---

**Refinement created:** 2026-04-05 via REDUNDANCY_SCAN heartbeat
**Discovery method:** Found overlapping coverage between Seed's atomicity/quality rules and frontier note on generic principles. The frontier note has proposed rules that should become Seed rules.