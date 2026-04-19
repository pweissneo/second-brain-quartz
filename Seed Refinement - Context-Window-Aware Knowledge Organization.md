---
last-reviewed: 2026-04-09
lifecycle: seed-refinement
confidence: emerging
author-type: ai-assisted
tags:
  - seed-refinement
  - context-window
  - token-budget
  - retrieval-optimization
  - ai-optimization
related-seed-rules:
  - access-pattern
  - atomicity
  - navigation
source_method: FRONTIER_EXPLORATION
integrated_from: Seed Gap - Context-Window-Aware Knowledge Organization
---

# Seed Refinement - Context-Window-Aware Knowledge Organization

> Integration of Seed Gap: Context-Window-Aware Knowledge Organization
> Gap discovered: 2026-04-09 via SEED_STRESS_TEST

## Problem

The Seed covers atomicity, linking, navigation, and access patterns — but assumes unlimited context for AI reasoning. When stress-testing Seed rules against a cooking knowledge base (200+ notes), the retrieval problem became clear: an AI with 32K context cannot reason over the full vault for complex queries.

## Proposed Rule Addition

**Rule (NEW):** Organize knowledge with context-window awareness — use tiered essential/supplemental/reference structure, size retrieval units for efficient context inclusion, and compress cross-references.

**Why:** Modern AI models have finite context windows (4K to 128K tokens). When building knowledge bases for AI-assisted retrieval, better structure enables better reasoning within budget. Without guidance, vaults become unusable for AI-assisted retrieval at scale.

**Test:** For any vault >100 notes:
1. Can an AI with your vault's average context window answer common queries without exceeding token limits?
2. Do important notes have a one-sentence summary variant?
3. Are hub notes under 150 words?
4. Does cross-reference use wikilinks rather than full descriptions?

## Implementation

```yaml
context-tier: essential|supplemental|reference
context-summary: "One-sentence summary for quick retrieval"
context-size-tokens: 200  # approximate tokens when included
requires-context-tier: essential  # minimum tier for usefulness
```

**Tier definitions:**
- **Essential:** Core knowledge needed for immediate reasoning (≤300 words)
- **Supplemental:** Important but can wait for follow-up retrieval (≤500 words)  
- **Reference:** Full detail, only retrieved when specifically needed

**Sizing guidance:**
- Retrieval-optimized notes: 200-400 words (fits in ~50-100 tokens)
- Hub notes: <150 words (navigation, not knowledge)
- Essential summaries: 1 sentence (≤25 words)

**Compression:**
- Use `[[Note Name]]` wikilinks rather than full descriptions
- Include brief context inline only when critical for understanding

## Integration Point

Add to Seed section 1 (Foundation), after access-pattern rules (line ~185).

## Edge Cases

- Dense domains (medicine, law): High information density per concept — may need smaller essential tier
- Sparse domains (philosophy, creative): Lower density — may need larger essential tier
- Multi-step procedures: Sequential knowledge needs full chain — consider sequential context
- Prerequisite chains: Track what's required before what

## Related

- [[Frontier Exploration - Context-Window-Aware Knowledge Organization]] — detailed exploration
- [[Seed Gap - Context-Window-Aware Knowledge Organization]] — gap documentation
- [[Seed Refinement - Knowledge Graph Retrieval Optimization]] — related refinement