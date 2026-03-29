---
last-reviewed: 2026-03-29
lifecycle: emerging
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - multi-vault
  - knowledge-relationships
gap-status: identified
gap-priority: medium
gap-phase: discovery
gap-severity: useful
---

# Frontier Exploration: Multi-Vault Knowledge Coordination

> How should an AI agent handle knowledge that naturally spans multiple vaults?

## The Problem

The Seed assumes a single vault, but practical knowledge management often involves multiple vaults:
- Personal knowledge base
- Professional/work vault
- Project-specific vaults
- Shared team vaults

Knowledge doesn't respect vault boundaries:
- A note about "time management" might belong in both personal productivity and work contexts
- Technical documentation might live in both a project vault and a professional reference vault
- Learning notes might connect to both a learning vault and a career vault

## What the Seed Lacks

Current Seed rules don't address:
1. **Cross-vault linking** — When should a note link to content in another vault?
2. **Vault boundaries** — What determines which vault a note belongs in?
3. **Duplicate knowledge** — When is it appropriate to have the same knowledge in multiple vaults vs. reference across vaults?
4. **Vault coordination** — How do you keep related notes synchronized across vaults?
5. **Migration decisions** — When should content move from one vault to another?

## Domain-Specific Considerations

### Different vaults serve different purposes:
- Personal vault: Long-term knowledge, interests, memories
- Professional vault: Career-relevant, work-related
- Project vault: Time-limited, specific outcomes
- Team vault: Shared knowledge, collaboration

### The purpose determines content scope:
- A cooking note might belong in personal (home cooking) or professional (chef's vault)
- A programming note might belong in personal (learning) or professional (work code)
- The vault's stated purpose disambiguates

## Proposed Principles

### Principle 1: Vault Purpose as Filter

Each vault should have a clear one-sentence purpose (like `_root.md`). Content belongs in a vault if it serves that purpose.

**Test:** "Does this note serve the vault's stated purpose?" If yes, include. If no, exclude or reference externally.

### Principle 2: Reference Over Duplicate

When content naturally belongs in multiple vaults, prefer referencing over duplicating:
- Create a "stub" note in the secondary vault that references the primary vault
- Use canonical location for the "real" note
- Only duplicate when the use case is genuinely different

**Test:** "Would someone expect different content in this vault vs. the primary location?" If yes, duplicate with adaptation. If no, reference.

### Principle 3: Cross-Vault Links Are Valid

Links to other vaults are legitimate and useful. The Seed's "every link must be explainable" applies — cross-vault links should pass the same test.

**Test:** "Can I explain why someone would follow this link to another vault?" If yes, keep. If the other vault might not exist for all users, note the dependency.

### Principle 4: Migration Triggers

Content should migrate between vaults when:
- Purpose changes (personal project becomes professional)
- Scope changes (hobby becomes career)
- Vault context changes (individual becomes team)

**Test:** "Has the context for this knowledge fundamentally changed?" If yes, consider migration.

### Principle 5: Coordination Mechanisms

For related content across vaults, establish coordination:
- Shared tags or naming conventions
- Regular cross-vault audits
- Migration and deprecation tracking

**Test:** "Can I find all instances of this topic across vaults?" If no, consider better coordination.

## Edge Cases

**Orphan cross-references:** What happens when the referenced vault doesn't exist or is private? Consider: conditional links, fallback explanations, or avoiding cross-vault links when the vault is personal/private.

**Stale references:** Cross-vault links can break when vaults are reorganized. Include: last-verified dates, regular link audits across vaults.

**Inconsistent definitions:** The same term might have different meanings in different vaults. Use: explicit context in cross-vault links, disambiguation notes.

## See Also

- [[Frontier Exploration - Multi-Vault Architecture]] — Technical architecture considerations
- [[Frontier Exploration - Cross-Vault Knowledge Relationships]] — Different angle
- [[Vault Merging and Migration]] — When vaults combine
- [[AI-Assisted Knowledge Management Seed]] — Single-vault focus