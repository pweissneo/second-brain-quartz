---
last-updated: 2026-04-08
lifecycle: seed-refinement
confidence: high
author-type: ai-assisted
knowledge-type: meta
verification-status: verified
evidence-tier: stress-test-derived
knowledge-source-type: deductive
applicability: universal
recurring: true
utility-type: confirmed
tags: [seed-refinement, verification-priority, small-vault, stub-notes, domain-adaptation]
seealso:
  - "[[AI-Assisted Knowledge Management Seed]]"
  - "[[Seed Stress Test - Verification Priority in Physics]]"
  - "[[Seed Stress Test - Stub Notes Rule in Mathematics Knowledge Base]]"
---

# Seed Refinement: Verification and Completeness Rules Need Domain Adaptation

> **Date:** 2026-04-08  
> **Method:** SEED_STRESS_TEST  
> **Insight Source:** Physics + Mathematics domain stress tests

## What I Learned

Running Seed stress tests across multiple domains revealed three recurring patterns where the Seed's generic rules fail:

### 1. Verification Priority Assumes Frontmatter Exists

**Problem:** The verification priority rule (lines 634-659) assumes notes already have `safety-critical: true` or `criticality: high` frontmatter. In domains like physics, safety-critical knowledge is often implicit in content without frontmatter tags.

**Example:** "Capacitor Discharge Procedures" contains safety-critical information but may not have the `safety-critical: true` tag.

**Refinement:** Add content-based safety detection. Scan for domain-specific safety keywords when frontmatter is missing, and flag as `safety-critical: implicit` for review.

### 2. "Frequently-Referenced" Conflates Foundational vs Hub

**Problem:** The Seed conflates "frequently-referenced" with high backlink count. In physics and mathematics, foundational notes (fundamental equations, core laws) may have LOW backlink counts because everything builds FROM them, not TO them.

**Example:** Maxwell's equations are referenced constantly but may not have high backlinks — they're foundational, not hubs.

**Refinement:** Distinguish verification approach for foundational vs hub notes:
- **Foundational:** Core equations, fundamental laws — verify for correctness
- **Hub:** Topic summaries — verify for completeness and links
- Apply different verification approaches, not just different priorities

### 3. Stub Notes Word Count Fails for Domain-Unit Concepts

**Problem:** The stub notes rule uses word count as a proxy for completeness, but mathematics has legitimately complete short notes: theorem statements, notation elements, abbreviation definitions.

**Example:** "gcd: greatest common divisor" is 4 words and completely defines the term.

**Refinement:** Add domain-unit concept exception — notes that define domain-standard notation, abbreviations, or theorem statements are complete regardless of word count.

### 4. Small Vault Verification Needs Different Strategy

**Problem:** Verification priority tests assume verification history exists. New vaults have no usage data to determine "frequently-referenced."

**Refinement:** For small vaults (<50 notes), use expected frequency as proxy — how often would a practitioner need this knowledge? Apply domain-specific ordering: Theoretical → Experimental → Applied for physics; Foundational → Procedural → Applied for mathematics.

## Seed Rule Updates Needed

### Update 1: Verification Priority (lines 634-659)

Add content-based safety detection and small-vault fallback:

```markdown
**Rule (REFINED - 2026-04-08):** Apply verification priority hierarchy when verification resources are limited — prioritize in order: (1) safety-critical knowledge, (2) decision-critical knowledge, (3) frequently-referenced knowledge, (4) verification cost-effective knowledge.

**Why:** Verification resources are always limited. Without explicit priority, agents default to recency or interest, leaving critical knowledge unverified.

**Test:** For your verification backlog: (1) Can you identify notes tagged `criticality: high` or `safety-critical: true`? (2) Do these have `verification-status: verified`? (3) Are hub notes (high backlink count) verified before peripheral notes? (4) Does your verification history prioritize in Level 1→4 order?

**Edge case (REFINED - 2026-04-08):** For domains with implicit safety-critical knowledge (physics, chemistry, engineering), add content-based safety scanning. Scan for domain-specific safety keywords (radiation, voltage, pressure, temperature thresholds, chemical hazards) and flag as `safety-critical: implicit` when frontmatter is missing but content suggests safety relevance.

**Edge case (REFINED - 2026-04-08):** Distinguish foundational from hub. In physics and mathematics, foundational notes (core equations, fundamental laws) may have LOW backlink counts because everything builds FROM them. Apply different verification: foundational = correctness check, hub = completeness check.

**Edge case (NEW - 2026-04-08):** For small vaults (<50 notes) without verification history, use expected frequency as proxy. Ask "How often would a practitioner need this?" rather than "How often has this been referenced?" Apply domain-specific ordering when no history exists.
```

### Update 2: Stub Notes Rule

Add domain-unit concept exception:

```markdown
**Edge case (REFINED - 2026-04-08):** Domain-unit concepts — standard notation elements, measurement units, abbreviation definitions, theorem statements — may legitimately fall below word-count thresholds. Examples:
- Mathematics: "gcd: greatest common divisor" (4 words, complete)
- Physics: "F = ma" (3 characters, complete definition)
- Music: "piano: soft dynamic" (3 words, complete)

**Test:** For short notes, check: (1) Is this a domain-standard notation element? (2) Is this a complete abbreviation expansion? (3) Is this a theorem/lemma statement with all conditions? If yes to any, word count doesn't apply.
```

## Related Seed Rules to Review

- Verification Priority Hierarchy (lines 634-659) — needs refinement
- Stub Notes Rule — needs domain-unit exception
- Domain-aware capture sequence — already handles small vault strategy

## Status

Insight captured. Consider integrating into Seed at next update cycle.