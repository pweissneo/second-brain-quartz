---
last-reviewed: 2026-04-01
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
tags:
  - seed-gap
  - multi-vault
  - migration
gap-status: analyzed
gap-priority: medium
gap-source: frontier-exploration
discovered: 2026-03-31
analyzed: 2026-04-01
analysis-conclusion: "Partially addressed. Seed has scattered rules about platform migration (avoid plugin lock-in, portable formats, migration paths) but lacks comprehensive multi-vault migration guidance. This is a niche use case - the current rules address the most common scenario (platform transition). Full multi-vault migration framework would be useful but not critical."
---

# Seed Gap: Multi-Vault Migration Knowledge

> How should knowledge bases handle migration between vaults, platform transitions, and vault merging?

## The Problem

The Seed covers knowledge management within a single vault but doesn't address:
1. **Migration** — moving knowledge from one vault to another
2. **Platform transition** — moving from Obsidian/Quartz to another platform
3. **Vault merging** — combining multiple vaults into one
4. **Fork handling** — managing diverged copies of the same knowledge base

Without migration guidance, agents lack rules for:
- What to do when vaults have conflicting conventions
- How to handle duplicate notes with different metadata
- Preserving link integrity across vault boundaries
- Managing schema differences between source and target

## Why This Matters

Real-world knowledge management involves:
- Platform changes (Obsidian → Quartz, Roam → Logseq)
- Organizational restructuring (personal → team vault)
- Domain separation (one vault → multiple specialized vaults)
- Merging acquisitions (two vaults → combined)

Without explicit migration rules:
- Links break during migration
- Metadata gets lost or inconsistently applied
- Duplicate notes proliferate
- Historical context disappears

## Current Seed Gaps

The Seed addresses:
- Vault construction and structure
- Verification and staleness
- Naming conventions and schema
- Cross-vault coordination ([[Frontier Exploration - Multi-Vault Knowledge Coordination]])

But it doesn't explicitly cover:
- Migration decision framework (when to migrate vs. archive)
- Schema translation rules (field mapping between platforms)
- Duplicate resolution strategy (which copy to keep)
- Link rewrite patterns (updating internal links post-migration)
- Historical preservation (keeping migration history)

## Proposed Rule Framework

### Rule 1: Migration Decision

**Rule:** Before migrating, assess whether migration adds value greater than the migration cost.
**Why:** Migration has costs (time, potential data loss, link rewriting). Not every vault needs to move. Assess: platform limitations, workflow fit, community support.
**Test:** (1) Does current platform have a fundamental limitation? (2) Does target platform solve it? (3) Is the migration cost worth the benefit?

### Rule 2: Pre-Migration Audit

**Rule:** Audit source vault before migration — document convention differences, identify non-transferable features, map schema fields.
**Why:** Different platforms support different features. Know what's portable vs. what's lost before starting.
**Test:** Can you list (1) features that won't transfer, (2) schema fields needing mapping, (3) links requiring rewriting?

### Rule 3: Duplicate Resolution

**Rule:** When merging vaults with overlapping notes, resolve duplicates by keeping the more complete/more recent version and archiving the other with `merged-into:` link.
**Why:** Deleting loses history; keeping both creates confusion. Archive with reference maintains both knowledge and context.
**Test:** For each duplicate pair: (1) Which has more links? (2) Which was updated more recently? (3) Keep winner, archive loser with link.

### Rule 4: Link Preservation

**Rule:** After migration, verify all internal links resolve — update wikilinks to target platform format if different.
**Why:** Links are the structural backbone. Broken links undermine vault utility. Systematic verification catches breakage.
**Test:** Run link-checker; all internal links resolve to valid targets.

## Edge Cases

- **Template migration:** Some platforms use templates differently; document what becomes a template vs. frontmatter
- **Plugin dependencies:** Dataview queries, embedded scripts may not transfer; identify and document
- **Historical links:** Links to now-deleted notes should become dead-link markers, not redirects
- **Access control:** Permissions don't transfer between platforms; re-document access assumptions

## Test Cases

**Scenario 1: Obsidian to Quartz migration**
1. Audit: Dataview queries won't work in Quartz
2. Decide: Keep Obsidian for active work, use Quartz for publishing
3. Migrate: Export to Markdown, rewrite links to Quartz format
4. Verify: Check all internal links

**Scenario 2: Merging two personal vaults**
1. Audit: Both use different naming conventions (date-prefixed vs. noun-phrase)
2. Resolve: Pick one convention, rename notes consistently
3. Merge: Combine files, deduplicate by title
4. Verify: Check for conflicting frontmatter

## Related Notes

- [[Frontier Exploration - Multi-Vault Knowledge Coordination]]
- [[Seed Refinement - Anti-Pattern Merge Pattern]]
- [[AI-Assisted Knowledge Management Seed]]

## Gap Status

This is a **frontier exploration** — the rule framework above is a draft proposal that needs:
1. Stress testing with real migrations
2. Refinement of edge cases
3. Integration with existing Seed rules
