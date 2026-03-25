---
last-reviewed: 2026-03-20
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
tags:
  - vault-management
  - migration
  - structural
---

# Frontier Exploration: Vault Merging and Migration

The Seed provides extensive guidance for building a single vault from scratch, but says nothing about **combining two existing vaults** or **migrating a vault to a new platform**. These are common real-world scenarios with no testable rules.

## The Problem Space

### Vault Merging

When combining two vaults (e.g., merging a personal knowledge base with a work knowledge base, or combining vaults from different phases of life), you face:

1. **Duplicate detection** - Two notes covering the same topic with different content
2. **Schema conflicts** - Different frontmatter standards, tag vocabularies, or naming conventions
3. **Link breakage** - Links that pointed to notes now in the other vault
4. **Contradiction resolution** - Both vaults have verified but conflicting knowledge
5. **Structural incompatibility** - Different hub structures, different root purposes
6. **Quality disparity** - One vault follows Seed rules, the other doesn't

### Platform Migration

When moving a vault from one tool to another (Obsidian → Quartz, Roam → Logseq, etc.):

1. **Link format conversion** - Wikilinks vs Markdown links vs HTML links
2. **Metadata loss** - Some tools don't support all frontmatter fields
3. **Plugin dependency** - Notes relying on community plugins may break
4. **Attachment handling** - Images, PDFs, and other assets need relinking
5. **Search index rebuild** - New search engine, different ranking algorithms

## Where the Current Seed Fails

The Seed assumes you control the vault's structure from day one. When merging or migrating:

- **Atomicity rules** may conflict - what's atomic in one vault may not be in another
- **Verification status** from different vaults may use different standards
- **Link density expectations** don't account for vaults with different purposes
- **Schema versions** may be incompatible

## Preliminary Insights

### For Vault Merging

**Insight 1: Purpose hierarchy wins.** When vaults have different purposes, the merged vault needs a clear primary purpose. Notes that don't serve the primary purpose become candidates for archival or separate vault creation.

**Insight 2: Canonical over duplicate.** Rather than keeping both versions of similar notes, establish a canonical vault (usually the one with better structure) and migrate content into it. This preserves the Seed's consistency guarantees.

**Insight 3: Link bridging.** Create "bridge notes" that summarize content from the other vault rather than importing everything. This maintains modularity while enabling discovery.

### For Platform Migration

**Insight 1: Test migration first.** Migrate a subset (20-30 notes) first to identify breaking changes. Full migration without testing creates irreversible damage.

**Insight 2: Preserve link graphs.** The structural knowledge (how notes connect) is more valuable than the specific link syntax. Rebuild links in new format rather than just converting syntax.

**Insight 3: Deprecation strategy.** Notes relying on plugin features need a migration path: either convert to standard Markdown or document as deprecated.

## Test Scenarios

### Merging Test

Given two vaults with different purposes:
1. Identify all cross-vault links (notes in Vault A that link to notes in Vault B)
2. Categorize each as: merge, bridge, or archive
3. Identify duplicate topics (similar titles or >70% content overlap)
4. Resolve duplicates using purpose-alignment heuristic
5. Report unresolved conflicts

### Migration Test

Given a source vault and target platform:
1. List all non-standard syntax (plugins, special features)
2. Categorize each as: convert, replace, or document-as-deprecated
3. Verify all attachments are accessible post-migration
4. Confirm search returns equivalent results

## Related Notes

- [[Frontier Exploration - Multi-Vault Architecture]] - Different from merging; managing multiple vaults intentionally
- [[Frontier Exploration - Knowledge Consistency Across Vaults]] - Consistency when maintaining multiple vaults
- [[Seed Rule - Construction Phase Model]] - May need adaptation for post-merge vaults

## Questions for Future Exploration

1. Should the Seed include "merge readiness" as a vault property?
2. What's the maximum schema version difference allowed for safe merging?
3. How do you preserve trust signals (verification status) from an untrusted vault?
4. Can automation detect when two vaults are mergeable vs should remain separate?
