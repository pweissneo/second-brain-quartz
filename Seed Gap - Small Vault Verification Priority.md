---
gap-status: analyzed
last-reviewed: 2026-04-03
lifecycle: analyzed
confidence: high
author-type: ai-assisted
knowledge-type: seed-gap
gap-type: test-weakness
gap-phase: discovery
gap-priority: high
gap-severity: useful
gap-source: seed-stress-test
discovered: 2026-04-03
tags:
  - seed-gap
  - verification-priority
  - small-vault
  - bootstrap
  - edge-case
seealso:
  - Seed Stress Test - Verification Priority in Physics
  - Seed Refinement - Verification Priority in Cooking Domain
  - AI-Assisted Knowledge Management Seed
---
gap-status: analyzed

# Seed Gap: Verification Priority for Small/New Vaults

## Gap Identified

The Verification Priority Hierarchy rule assumes the vault has:
1. Existing notes with `safety-critical: true` or `criticality: high` frontmatter
2. Hub notes identifiable by backlink count
3. Verification history to check priority ordering

For small/new vaults (<50 notes), none of these assumptions hold:
- No usage data exists to determine "frequently-referenced"
- Hub identification via backlinks fails when vault has few notes
- No verification history exists to check priority ordering

## Evidence from Stress Tests

### Physics Domain (2026-04-03)
> "Hub identification fails for foundational physics: In physics, fundamental equations (Maxwell's equations, Schrödinger equation) are referenced constantly but may not have high backlink counts in a small vault — they're foundational, not hubs."
> "New vaults lack verification history: The test asks to check 'verification history' for priority ordering, but new vaults don't have history."

### Cooking Domain (2026-04-01)
> "In cooking, safety-critical knowledge is embedded in non-safety notes — a note titled 'Sautéing Fundamentals' contains Level 1 knowledge but might not have safety-related frontmatter."

## Root Cause

The Seed rule conflates two different concepts:
1. **Actual usage frequency** — requires historical data (only exists in mature vaults)
2. **Expected utility** — can be estimated without usage data (applies to all vaults)

The current test assumes the former, but small vaults need the latter.

## Proposed Rule Addition

**Rule (PROPOSED):** For vaults without verification history (<50 notes or <60 days old) OR where backlink-based prioritization fails (foundational science domains), use domain-type-aware expected-utility prioritization:
- Theoretical domains (physics, math, philosophy): verify foundational principles first (core equations, fundamental laws)
- Practical domains (cooking, repair, crafting): verify safety-critical procedures first
- Creative domains (writing, music, design): verify core techniques first
- Applied domains (medicine, engineering, law): verify safety-critical knowledge first
- For domains with implicit safety knowledge: scan content for safety keywords before relying on frontmatter

**Why:** Small vaults and foundational science domains lack usage data. Domain-type-aware expected utility provides a principled alternative when history doesn't exist or when backlink-based priority conflates "foundational" with "hub."

**Edge Cases from Physics:**
- Content-based safety detection needed (radiation, voltage, laser keywords in content)
- Foundational ≠ hub in physics (core equations have LOW backlinks)
- Cross-domain safety implications (physics → medicine, engineering)

**Test:**
1. Is this vault <50 notes OR <60 days old? OR does this domain have foundational concepts (core laws/equations)?
2. If yes, apply domain-type-aware expected utility
3. For safety-critical claims without frontmatter: scan content for domain-specific safety keywords
4. Distinguish foundational (builds FROM) from hub (connects TO) — different verification approaches

## Related Seed Rules

- [[AI-Assisted Knowledge Management Seed]] — Verification Priority Hierarchy (lines 404-441)
- [[Seed Refinement - Verification Priority in Cooking Domain]]
- [[Seed Stress Test - Verification Priority in Physics]]
- Construction Phase Model (handles relaxed standards during bootstrap)
- Exploration/Exploitation balance (addresses new vs mature vaults)

## Additional Evidence from Physics Stress Test (2026-04-03)

The physics domain stress test reinforces this gap with specific findings:

**Edge Case 1: Content-Based Safety Detection**
- Many physics notes contain safety-critical content (radiation, high voltage, laser hazards) without frontmatter tagging
- Current rule assumes `safety-critical: true` frontmatter exists
- Physics-specific safety keywords in content: radiation, voltage, laser, magnetic-field, cryogenic, vacuum, radioactive, particle-beam

**Edge Case 2: Foundational vs. Hub Conflation**
- Core equations (Maxwell's, Schrödinger) have LOW backlinks but HIGH foundational importance
- Hubs have HIGH backlinks but lower foundational importance
- Current rule uses backlink count as proxy for "frequently-referenced" - fails in physics

**Edge Case 3: Cross-Domain Safety**
- Physics knowledge applies to medicine (ionizing radiation), engineering (high voltage)
- Current rule doesn't track cross-domain safety implications

See: [[Seed Refinement - Verification Priority Hierarchy - Physics Edge Cases.md]]

## Gap Status

**Status:** analyzed — root cause identified, solution proposed
**Proposed resolution:** Update Seed verification priority rule with small-vault-specific edge case using domain-type-aware expected utility prioritization