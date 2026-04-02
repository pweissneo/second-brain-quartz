---
last-reviewed: 2026-04-01
lifecycle: emerging
confidence: low
author-type: ai-assisted
tags:
  - frontier
  - multi-vault
  - deduplication
  - migration
domain: knowledge-management
---

# Frontier Exploration - Cross-Vault Knowledge Deduplication

> How should AI agents handle duplicate or overlapping knowledge when managing multiple vaults or merging content from external sources?

## The Problem

When managing multiple knowledge vaults or importing content from external sources, duplicate knowledge naturally emerges:
- The same concept captured in different vaults with different naming
- Notes that overlap in coverage but aren't identical
- Conflicting information from different source vaults

The Seed currently lacks explicit rules for:
1. Detecting cross-vault duplicates
2. Deciding which version to keep
3. Merging or linking duplicate content
4. Preserving source attribution when importing

## Current Seed Coverage

- [[Seed Gap - Multi-Vault Migration Knowledge]] — addresses migration between vaults
- [[Seed Refinement - Knowledge Consistency Across Vaults]] — addresses consistency
- [[Frontier Exploration - Multi-Vault Knowledge Coordination]] — addresses coordination

What's missing: explicit duplicate detection and resolution strategies.

## Duplicate Types

### Type 1: Exact Duplicates
Same content, possibly different filenames.
- Same note created independently in multiple vaults
- Copy-paste from external source without tracking origin

**Detection:** Hash comparison, identical content
**Resolution:** Keep one, redirect others

### Type 2: Near-Duplicates  
Similar content with minor variations.
- Same concept explained differently
- Same source processed differently
- Updated version vs original

**Detection:** Similarity matching (Jaccard, embedding cosine)
**Resolution:** Merge to best version, preserve divergence if meaningful

### Type 3: Overlapping Coverage
Different notes covering some of the same ground.
- Note A covers topics X, Y
- Note B covers topics Y, Z

**Detection:** Link analysis, keyword overlap
**Resolution:** Link between notes, clarify scope boundaries

### Type 4: Conflicting Information
Same claim with different conclusions.
- Source A says X is true
- Source B says X is false

**Detection:** Claim extraction, contradiction detection
**Resolution:** Keep both with confidence markers, don't auto-merge

## The Questions

1. **When is merging appropriate?** When should duplicates become one note vs staying linked?

2. **What gets preserved?** When merging, how do we preserve the reasoning behind different versions?

3. **How do we track origin?** When importing from external vaults, what's the provenance model?

4. **When should duplicates stay separate?** What cases warrant keeping duplicates intentionally?

5. **How does deduplication interact with verification?** Does merging affect verification status?

## Potential Seed Rule

**Rule:** When cross-vault duplicates are detected, apply type-specific resolution:
- Type 1 (exact): Merge to canonical note, redirect others with provenance link
- Type 2 (near): Keep higher-quality version, link to divergent content as alternative view
- Type 3 (overlap): Clarify scope boundaries via explicit links, don't merge
- Type 4 (conflict): Keep both with confidence markers, never auto-merge contradictions

**Why:** Not all duplicates are equal. Exact duplicates should consolidate; overlapping content should stay distinct but linked; conflicts should remain visible.

**Test:** (1) Can you identify the duplicate type? (2) Does your resolution follow type-specific rules? (3) Is provenance preserved? (4) Are conflicts flagged, not hidden?

## Edge Cases

### Edge Case 1: Same Note, Different Verification Status
Vault A has verified version, Vault B has unverified. Which to keep?

**Question:** Does verification status override content quality in merge decisions?

### Edge Case 2: Personal vs Shared Vaults
Duplicate between personal vault and team vault. Who owns canonical version?

**Question:** How does vault ownership affect deduplication authority?

### Edge Case 3: Historical Versions
You discover your vault has old versions of notes that were improved. Keep history?

**Question:** Should deduplication preserve version history, or just current state?

### Edge Case 4: Imported Content
You import a large vault. Some notes are duplicates, some are new, some conflict.

**Question:** What's the batch import deduplication workflow? Process all at once or iteratively?

## Related Notes

- [[Seed Gap - Multi-Vault Migration Knowledge]]
- [[Seed Refinement - Knowledge Consistency Across Vaults]]
- [[Frontier Exploration - Multi-Vault Knowledge Coordination]]
- [[Handling Contradictory Sources]] — for Type 4 conflicts
- [[Knowledge Base Utility Assessment]] — for evaluating which version to keep

## Open Questions

1. Should AI agents proactively scan for cross-vault duplicates, or only when prompted?
2. What's the performance tradeoff between thorough deduplication and vault size?
3. How do we handle duplicates in public vs private vaults differently?
4. Should deduplication be part of routine maintenance or a separate workflow?

---

**Confidence:** This is early-stage exploration. The Seed doesn't currently address cross-vault deduplication explicitly. More stress testing needed.