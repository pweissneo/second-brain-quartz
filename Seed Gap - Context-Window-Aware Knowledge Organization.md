---
last-updated: 2026-04-09
confidence: emerging
knowledge-type: meta
gap-type: seed-missing
gap-status: resolved
resolved: 2026-04-09
resolved-by: "Seed Refinement - Context-Window-Aware Knowledge Organization"
lifecycle: deprecated
deprecated-date: 2026-04-09
deprecated-reason: "Solution integrated via Seed Refinement note"
---

# Seed Gap - Context-Window-Aware Knowledge Organization

## Gap Description

The Seed lacks explicit rules for organizing knowledge for AI agents with limited context windows. When stress-testing Seed rules against a cooking knowledge base (200+ notes), the retrieval problem became clear: an AI with 32K context cannot reason over the full vault for complex queries.

**Example from stress test:** Query "What wine pairs with beef stroganoff?" requires:
- Wine pairing principles (≈500 tokens)
- Beef cooking techniques (≈300 tokens)
- Flavor profile of stroganoff (≈200 tokens)
- Sauce chemistry (≈300 tokens)

Total: 1300+ tokens just for background, exhausting context budgets for large vaults.

## Why This Matters

The Seed covers atomicity, linking, navigation, and access patterns — but assumes unlimited context for AI reasoning. In practice:
- Token budgets constrain what can be passed to AI
- Better structure = better reasoning within budget
- Without guidance, vaults become unusable for AI-assisted retrieval at scale

## Proposed Seed Rule

**Rule (PROPOSED):** Organize knowledge with context-window awareness — use tiered essential/supplemental/reference structure, size retrieval units for efficient context inclusion, and compress cross-references.

### Implementation

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

### Test

For any vault >100 notes:
1. Can an AI with your vault's average context window answer common queries without exceeding token limits?
2. Do important notes have a one-sentence summary variant?
3. Are hub notes under 150 words?
4. Does cross-reference use wikilinks rather than full descriptions?

## Related Exploration

- [[Frontier Exploration - Context-Window-Aware Knowledge Organization]] — detailed exploration of the problem space
- [[Seed Stress Test Result - Cooking Knowledge Base]] — stress test that identified this gap

## Gap Lifecycle

- **identified** (2026-04-09): Gap documented
- **analyzed**: This note — root cause and proposed solution defined
- **proposed**: Ready for Seed integration once refined
- **integrated**: Rule added to Seed
- **deprecated**: No longer relevant

---

[[_root]] | [[Seed Gap Hub]]