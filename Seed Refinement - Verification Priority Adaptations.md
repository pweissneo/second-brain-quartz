---
last-updated: 2026-04-03
last-reviewed: 2026-04-03
lifecycle: seed-refinement
confidence: emerging
author-type: ai-assisted
knowledge-type: refinement
verification-status: unverified
evidence-tier: stress-test-derived
knowledge-source-type: deductive
applicability: domain-specific
recurring: false
utility-type: actual
tags: [seed-refinement, verification-priority, physics-domain, edge-case, implicit-safety, foundational]
seealso: [[AI-Assisted Knowledge Management Seed]]
---

# Seed Refinement: Verification Priority Adaptations for Implicit Safety and Foundational Knowledge

> **Date:** 2026-04-03
> **Type:** Seed Refinement
> **Source:** Seed Stress Test - Verification Priority in Physics
> **Target Rule:** Verification Priority Hierarchy (lines 404-441)

---

## The Gap

The Verification Priority Hierarchy rule has a critical test executability issue: it assumes frontmatter tags (`criticality: high`, `safety-critical: true`) already exist on notes. This fails in domains like physics where:

1. **Implicit safety-critical knowledge** — Notes contain safety-relevant content without frontmatter tags
2. **Foundational ≠ Hub** — Core equations have low backlink counts (everything builds FROM them) but are the most critical to verify
3. **Small vault assumption** — Test assumes verification history exists, but new vaults lack this

---

## Rule Refinement

**Rule (REFINEMENT):** For verification priority, supplement frontmatter-based detection with content-based safety scanning and distinguish foundational from hub notes.

**Why:** The current test assumes frontmatter tags exist, but domain-specific knowledge often has implicit critical elements that need content analysis. Additionally, "frequently-referenced" conflates two distinct concepts: foundational notes (everything builds FROM) vs. hub notes (everything connects TO) — requiring different verification approaches.

**Test:** For your verification backlog:
1. Can you identify notes with explicit `criticality: high` OR `safety-critical: true` frontmatter?
2. For notes WITHOUT these tags: Does content contain domain-specific safety keywords requiring implicit criticality detection?
3. Are foundational notes (core equations, fundamental laws) verified separately from hub notes (topic summaries)?
4. For small vaults without verification history: Does prioritization follow domain-appropriate ordering?

**Implementation:**

### 1. Content-Based Safety Detection

For domains with implicit safety-critical knowledge (physics, chemistry, engineering), scan for domain-specific safety keywords alongside frontmatter:

```yaml
# Domain-specific safety keyword lists
physics-safety-keywords: [radiation, voltage, laser, magnetic-field, cryogenic, vacuum, radioactive, particle-beam]
chemistry-safety-keywords: [toxic, flammable, corrosive, reactive, explosive, carcinogenic]
engineering-safety-keywords: [structural-load, electrical-shock, pressure, temperature-extreme]

# Tag implicit safety-critical notes
safety-critical: implicit  # Content suggests safety relevance but no frontmatter
safety-critical: explicit  # Frontmatter tag present
```

### 2. Distinguish Foundational from Hub

In domains where fundamental concepts (laws, equations, definitions) are referenced constantly but may not have high backlink counts:

```yaml
note-category: foundational|hub|applied|reference
verification-approach: correctness|completeness

# Foundational = correctness check (is this right?)
# Hub = completeness check (is this comprehensive?)
# Applied = application check (does this work as described?)
# Reference = accuracy check (is this accurate?)
```

### 3. Small Vault Verification Strategy

For vaults without verification history, use domain-appropriate ordering:

```yaml
# Physics: Theoretical → Experimental → Applied
verification-order: [foundational-laws, core-equations, experimental-procedures, applied-formulae, practical-applications]

# Replace "frequently-referenced" with "expected-usage-frequency"
# Based on: how often would a practitioner in this domain need this?
expected-usage-frequency: constant|regular|occasional|rare
```

### 4. Cross-Domain Safety Tagging

For knowledge with multi-domain applicability:

```yaml
safety-applies-to: [physics, medical, engineering]  # List affected domains
safety-domain-stakes: [critical, high, medium]  # Stakes per domain
```

**Edge case:** In physics specifically:
- Theoretical physics → verify foundational first (errors propagate to everything)
- Experimental physics → verify safety procedures first (physical harm risk)
- Applied physics → verify against domain stakes (higher for medical/engineering)

---

## Test Refinement

**Updated Test for domains with implicit safety-critical knowledge:**

1. Do notes with explicit `safety-critical: true` have verification-status: verified?
2. For notes WITHOUT this frontmatter: Does content contain domain-specific safety keywords suggesting implicit criticality?
3. Are foundational notes (core equations, fundamental laws) verified separately from hub notes using appropriate verification approaches?
4. For small vaults: Does verification ordering follow domain-appropriate priority (theoretical → experimental → applied)?
5. For cross-domain notes: Is safety-applies-to documented with domain-stakes?

---

## Related Seed Rules

- [[Seed Stress Test - Verification Priority in Physics]] (source of this refinement)
- Verification Priority Hierarchy (lines 404-441)
- [[Seed Stress Test - Tool-Dependent Verification in Medical Knowledge]] (similar domain adaptation pattern)
- [[Seed Refinement - Note-Type-Aware Link Density Rules]] (note-type awareness approach)

---

## What I Learned

1. **Test executability ≠ rule validity** — A rule can be correct but have tests that assume pre-existing conditions that don't exist in practice

2. **Content analysis needed for implicit knowledge** — Domains like physics have safety-critical content without frontmatter tags, requiring keyword-based detection

3. **Foundational and hub serve different purposes** — Conflating "frequently-referenced" with "high backlinks" fails for fundamental knowledge that everything builds FROM

4. **Small vaults need domain-appropriate defaults** — History-based prioritization assumes mature vaults; new vaults need ordering based on domain structure

---

**Status:** Refinement complete. Ready for Seed integration consideration.