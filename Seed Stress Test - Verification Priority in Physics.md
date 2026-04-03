---
last-updated: 2026-04-03
last-reviewed: 2026-04-03
lifecycle: seed-stress-test
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
verification-status: unverified
evidence-tier: stress-test-derived
knowledge-source-type: deductive
applicability: universal
recurring: false
utility-type: potential
tags: [seed-stress-test, verification-priority, physics-domain, edge-case]
seealso: [[AI-Assisted Knowledge Management Seed]]
---

# Seed Stress Test: Verification Priority Hierarchy in Physics Domain

> **Date:** 2026-04-03
> **Method:** SEED_STRESS_TEST
> **Domain:** Physics Knowledge Base
> **Rule Tested:** Verification Priority Hierarchy (lines 404-441)

## The Rule Under Test

**Current Seed Rule (lines 404-441):**
> Rule (NEW - 2026-04-01): Apply verification priority hierarchy when verification resources are limited — prioritize in order: (1) safety-critical knowledge, (2) decision-critical knowledge, (3) frequently-referenced knowledge, (4) verification cost-effective knowledge.

**Test:** For your verification backlog: (1) Can you identify notes tagged `criticality: high` or `safety-critical: true`? (2) Do these have `verification-status: verified`? (3) Are hub notes (high backlink count) verified before peripheral notes? (4) Does your verification history prioritize in Level 1→4 order?

## Stress Test Results

### 1. Does the rule make sense for physics?

**Partially.** The prioritization order (safety → decision → frequent → cost-effective) is sensible, but:

- **Safety-critical in physics is different from cooking/medicine:** Physics safety concerns include radiation, high voltage, laser hazards, cryogenic materials, vacuum systems. These are domain-specific and not always tagged with `safety-critical: true`.

- **Decision-critical in physics has different meaning:** In theoretical physics, "decision-critical" might mean foundational (quantum mechanics, thermodynamics) vs. in experimental physics, it might mean procedures that affect experimental outcomes.

- **"Frequently-referenced" breaks for small vaults:** A new physics vault may not have "frequently-referenced" notes — the concept assumes established usage patterns.

### 2. Is the Test executable by an AI?

**Partially.** The test assumes:
- Notes already have `criticality: high` or `safety-critical: true` frontmatter
- Hub notes can be identified by backlink count
- Verification history exists to check priority ordering

**Problems for physics:**
1. **Many physics notes contain implicit safety-critical info without frontmatter:** A note on "High Voltage Safety" would have the tag, but "Capacitor Discharge" or "Particle Accelerator Safety" might not.

2. **Hub identification fails for foundational physics:** In physics, fundamental equations (Maxwell's equations, Schrödinger equation) are referenced constantly but may not have high backlink counts in a small vault — they're foundational, not hubs.

3. **New vaults lack verification history:** The test asks to check "verification history" for priority ordering, but new vaults don't have history.

### 3. Edge Cases Identified

**Edge Case 1: Theoretical vs. Experimental Physics**
- Theoretical physics has virtually no safety-critical knowledge but major decision-critical knowledge (foundational theories)
- Experimental physics has significant safety concerns but may have different decision-critical structure
- The rule doesn't distinguish domain TYPE within physics

**Edge Case 2: Implicit Safety-Critical Knowledge**
- Many physics notes contain safety-relevant content without safety frontmatter:
  - "Capacitor Bank Safety" — explicit (has tag)
  - "Capacitor Discharge Procedures" — implicit (contains safety info but might not have tag)
  - "Radioactive Source Handling" — should be explicit but might not be

**Edge Case 3: Foundational vs. Hub in Physics**
- Foundational notes (fundamental laws, constants) may have LOW backlink counts because everything builds FROM them
- Hub notes (topic summaries) may have HIGH backlink counts but less foundational importance
- The rule conflates "frequently referenced" with "high backlinks" — different things

**Edge Case 4: Cross-Domain Safety**
- Physics knowledge often applies to other domains (engineering, medical, chemistry)
- A physics note about "Ionizing Radiation" is safety-critical for physics AND medical AND engineering
- Current rule doesn't handle multi-domain safety implications

## Proposed Refinements

### Refinement 1: Content-Based Safety Detection

For physics (and similar domains), add content-based safety scanning:
- Scan for physics-specific safety keywords: radiation, voltage, laser, magnetic-field, cryogenic, vacuum, radioactive, particle-beam
- Add implicit safety detection alongside explicit frontmatter
- Tag as `safety-critical: implicit` when content suggests safety relevance but frontmatter doesn't exist

### Refinement 2: Distinguish Foundational from Hub

In physics, clarify:
- **Foundational:** Core equations, fundamental laws, base definitions — verify for correctness
- **Hub:** Topic summaries, reference pages — verify for completeness and links
- Apply different verification approaches: foundational = correctness check, hub = completeness check

### Refinement 3: Handle Small Vault Verification

For vaults without verification history:
- Use expected frequency (how often would a physicist need this?) as proxy for "frequently-referenced"
- Apply domain-specific prioritization: Theoretical physics → verify foundational first; Experimental physics → verify safety procedures first

### Refinement 4: Cross-Domain Safety Tagging

Add multi-domain safety consideration:
- For physics notes with cross-domain applicability, add `safety-applies-to:` field listing affected domains
- Enable safety verification prioritization based on domain stakes (medical > engineering > academic)

## Test Refinement

**Updated Test for physics domain:**
1. Can you identify notes with explicit `safety-critical: true` OR physics-specific safety keywords in content?
2. Do safety-critical notes have verification-status: verified?
3. Are foundational physics notes (core equations, fundamental laws) verified before applied physics notes?
4. For small vaults: Does verification prioritization follow Theoretical → Experimental → Applied order?
5. Do cross-domain physics notes (radiation, high voltage) have safety-applies-to listing affected domains?

## Related Seed Rules

- [[Seed Stress Test - Tool-Dependent Verification in Medical Knowledge]] — similar domain-specific adaptation
- [[Seed Refinement - Note-Type-Aware Link Density Rules]] — note-type awareness approach
- Verification Priority Hierarchy (lines 404-441)

## What I Learned

1. **Verification priority cannot assume frontmatter exists** — domains like physics have implicit safety-critical knowledge that needs content-based detection

2. **"Frequently-referenced" conflates two different concepts** — foundational (everything builds from) vs. hub (everything connects to) — different verification approaches needed

3. **Small vaults need different verification strategies** — history-based prioritization assumes mature vaults with usage data

4. **Cross-domain knowledge has compound verification needs** — physics applied to medicine has different stakes than physics as pure theory

---

**Status:** Edge cases documented, refinements proposed. Consider updating Seed rule with physics-specific adaptations.