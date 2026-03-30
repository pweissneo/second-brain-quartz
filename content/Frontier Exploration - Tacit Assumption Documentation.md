---
last-updated: 2026-03-29
last-reviewed: 2026-03-29
lifecycle: evergreen
confidence: medium
author-type: ai-assisted
gap-status: identified
gap-priority: medium
gap-source: frontier-exploration
---

# Frontier Exploration - Tacit Assumption Documentation

## The Problem

Many notes contain knowledge that assumes specific background context the reader may not have. Unlike explicit prerequisites (wikilinks to other notes), tacit assumptions are unspoken requirements that cause confusion or misapplication when missing.

**Example:** A note about "deglazing a pan" assumes the reader knows:
- What "deglazing" means (the word is the technique)
- That the pan should be hot but not smoking
- That wine/cstock adds flavor (not just "liquid")
- That you need to scrape the bottom (fond)

An AI building a knowledge base about cooking might capture "deglazing technique" without realizing it assumes knowledge that isn't in the vault.

## Gap Identification

The current Seed addresses:
- Prerequisite tracking (explicit wikilinks)
- Knowledge depth (can a note answer questions)
- Gap identification via undefined links

But it does NOT address:
- Tacit assumptions that aren't documented as links
- Context that "goes without saying" in a domain
- Background knowledge that enables understanding but isn't central to the note
- Cultural or experiential knowledge that practitioners forget they have

## Proposed Rule

**Rule:** For notes containing domain-specific techniques, procedures, or specialized concepts, document tacit assumptions in a dedicated "Assumes" section or frontmatter field.
**Why:** Without explicit assumption documentation, knowledge capture creates false confidence — a note exists but isn't actually usable without background knowledge the vault doesn't contain. This creates "knowing-doing gaps" where the knowledge appears present but cannot be applied.
**Test:** Can you identify 3+ tacit assumptions for any note about a technique or procedure? Does the note document them?

**Implementation:**
```yaml
assumes-knowledge:
  - "Basic knife skills"
  - "Understanding of heat management"
  - "Familiarity with standard terminology"
context-required:
  - "Ingredient availability (seasonal)"
  - "Equipment access (specialized tools)"
```

## Edge Cases

**Edge case:** Tacit assumption documentation can become as verbose as the knowledge itself. Prioritize assumptions that would cause failure or error if missing, not complete background coverage.

**Edge case:** In multi-domain vaults, tacit assumptions vary by reader expertise. The same note may assume "basic math" for some readers and "calculus" for others. Document assumptions at the lowest common denominator or note the variation.

**Edge case:** Tacit assumptions change over time. What was assumed in 2020 may not be assumed in 2025 (new tools, changed terminology). Review assumption documentation during note lifecycle reviews.

## See Also

- [[Frontier Exploration - Prerequisite Knowledge Tracking]]
- [[Frontier Exploration - Knowledge Prioritization and Focus Decisions]]
- [[Seed Gap - Knowledge Prioritization Decision Framework]]
