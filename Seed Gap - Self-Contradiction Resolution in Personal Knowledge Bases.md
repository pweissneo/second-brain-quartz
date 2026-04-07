---
last-reviewed: 2026-04-06
last-updated: 2026-04-06
lifecycle: seed-gap-resolved
confidence: emerging
author-type: ai-assisted
verification-status: unverified
tags:
  - knowledge-evolution
  - self-contradiction
  - seed-gap
  - temporal-knowledge
  - resolved
schema-version: "1.0"
---

# Seed Gap: Self-Contradiction Resolution in Personal Knowledge Bases

> STATUS: RESOLVED — See [[Seed Refinement - Self-Contradiction and Evolved Perspective Handling]] for the implemented solution.

## The Gap

The Seed covers external source contradictions and field-level temporal knowledge, but lacks guidance for **internal self-contradictions** — when the vault's maintainer has evolved their view on a topic and the vault contains both old and new perspectives.

## Why This Matters

1. **Personal knowledge is not static** — Unlike external sources, your own understanding evolves through experience
2. **Vaults persist** — Notes outlive the context in which they were written
3. **Without tracking, learning is lost** — The "why" behind perspective shifts is valuable meta-knowledge
4. **False confidence risk** — A note saying "X is correct" next to "X is incorrect" creates confusion

## Distinction from Existing Seed Coverage

| Scenario | Covered? | Rule/Note |
|----------|----------|-----------|
| Source A vs Source B disagree | ✅ | [[Handling Contradictory Sources]] |
| Field evolved, old knowledge superseded | ✅ | [[Handling Temporal Knowledge]] |
| Your view changed from X to Y | ❌ | MISSING |
| Experiment showed your hypothesis wrong | Partially | [[Frontier Exploration - Personal Experimentation Results]] |

## Proposed Rule

**Rule:** Track personal knowledge evolution with explicit evolution metadata — when your view on a topic changes, update the old note with evolution context and create/update the new perspective note.

**Why:** Without explicit tracking, vaults accumulate contradictory personal knowledge that erodes trust. The evolution itself is valuable learning — what caused the shift, what evidence triggered it, what assumptions were wrong.

**Test:** (1) For any note claiming a recommendation/position, can you trace prior contradictory positions? (2) Do notes that represent superseded views have evolution-history frontmatter? (3) Is there a "what-changed" or "reason-for-change" field linking old and new perspectives?

**Implementation:**
```yaml
evolution-history:
  - date: 2024-06
    position: "Approach X is best"
    reason: "Initial testing showed good results"
  - date: 2025-03
    position: "Approach Y is better"
    reason: "Longer testing revealed X has hidden costs"
    what-changed: "Discovered maintenance overhead"
    evidence: "6 months of production use"
```

**Alternative implementation:** Use explicit supersession pattern — note A says "Use X" and links to note B saying "Use Y" with note B containing `supersedes: [[Note A]]` and `supersession-reason:`.

## Edge Cases

- **Rapid iteration fields** (software, fashion): View changes frequently; consider `belief-stability: high|medium|low` frontmatter
- **Irreversible changes** (health, safety): Changes based on negative outcomes need explicit "this nearly caused harm" context
- **Collaborative vaults**: Multiple people may have different evolution histories; distinguish with `author-evolution:`

## Related Notes

- [[Frontier Exploration - Self-Contradiction and Evolved Perspective]]
- [[Handling Contradictory Sources]]
- [[Handling Temporal Knowledge]]
- [[Seed Gap - Recurring and Periodic Knowledge]] (temporal patterns)
- [[Seed Rule - Vault Change Tracking]]