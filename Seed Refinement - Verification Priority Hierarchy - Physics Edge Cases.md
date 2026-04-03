---
last-updated: 2026-04-03
last-reviewed: 2026-04-03
lifecycle: seed-refinement
confidence: emerging
author-type: ai-assisted
knowledge-type: seed-refinement
verification-status: unverified
tags:
  - seed-refinement
  - verification-priority
  - physics-domain
  - content-based-detection
  - small-vault
  - cross-domain
  - implicit-safety
---

# Seed Refinement: Verification Priority Hierarchy — Physics Domain Edge Cases

> **Status:** Draft — edge cases identified for Seed incorporation
> **Date:** 2026-04-03

## Background

The verification priority hierarchy rule was added to the Seed on 2026-04-01 with this structure:

- **Level 1 (Critical):** Safety-critical knowledge (could cause harm if wrong)
- **Level 2 (High):** Hub notes, core principles, foundational definitions
- **Level 3 (Medium):** Frequently-searched notes, entry points
- **Level 4 (Low):** Expensive-to-verify knowledge, redundant notes

Stress testing this rule against the physics domain reveals significant edge cases that are not addressed by the current rule.

## Edge Cases Discovered

### 1. Content-Based Safety Detection (CRITICAL GAP)

**Problem:** The rule assumes notes already have `safety-critical: true` frontmatter. In physics, many notes contain safety-relevant content without this tag.

**Examples:**
| Note Title | Contains Safety Info | Has safety-critical Tag |
|------------|----------------------|-------------------------|
| High Voltage Safety | Yes (explicit) | Probably yes |
| Capacitor Bank Discharge | Yes (explicit) | Maybe |
| Capacitor Discharge Procedures | Yes (implicit) | Probably not |
| Radioactive Source Handling | Yes (critical) | Should be, might not be |
| Maxwell's Equations | No | No |
| Quantum Tunneling | No | No |

**Proposed resolution:**
- Add content-based safety scanning for physics-specific keywords: radiation, voltage, laser, magnetic-field, cryogenic, vacuum, radioactive, particle-beam, high-energy
- Tag as `safety-critical: implicit` when content suggests safety relevance but frontmatter doesn't exist
- Update test to check both explicit tags AND content keywords

**Test update:**
```
For physics domain:
1. Scan for explicit safety-critical: true
2. Also scan content for physics-specific safety keywords
3. Combine results for verification prioritization
```

**Impact:** High — affects any domain with implicit safety-critical knowledge

---

### 2. Foundational vs. Hub Distinction

**Problem:** The rule conflates "frequently-referenced" with "high backlink count." In physics, these are different things:

- **Foundational:** Core equations (Maxwell's equations, Schrödinger equation), fundamental constants, base definitions — everything builds FROM them, but they may have LOW backlink counts
- **Hub:** Topic summaries, reference pages, overview notes — everything connects TO them, high backlink counts but less foundational

**Proposed resolution:**
- Distinguish verification approach:
  - **Foundational:** Verify for correctness (is the equation right?)
  - **Hub:** Verify for completeness and links (is it comprehensive? are links correct?)
- Use different verification methods for each type

**Impact:** Medium — applies to any domain with foundational content

---

### 3. Small Vault Verification Strategy

**Problem:** The test asks to check "verification history" for priority ordering. New physics vaults don't have this data.

**Current rule gap:** Assumes mature vault with usage patterns

**Proposed resolution:**
For vaults without verification history:
- Use **expected frequency** as proxy: "How often would a physicist need this?"
- Apply domain-specific ordering:
  - **Theoretical physics:** Verify foundational (core theories) first
  - **Experimental physics:** Verify safety procedures first
  - **Applied physics:** Verify practical applications first

**Impact:** High — affects all new vaults

---

### 4. Cross-Domain Safety Implications

**Problem:** Physics knowledge often applies to OTHER domains (engineering, medical, chemistry). The rule doesn't handle this.

**Examples:**
| Physics Note | Applies To | Stakes |
|--------------|------------|--------|
| Ionizing Radiation | Medical, Engineering | High (lives) |
| High Voltage | Engineering, Construction | High (death) |
| Laser Safety | Medical, Manufacturing | Medium-High |
| Thermodynamics | Engineering | Medium |
| Quantum Mechanics | Academic only | Low |

**Proposed resolution:**
- Add `safety-applies-to:` frontmatter for cross-domain knowledge
- Enable verification prioritization based on domain stakes:
  - Medical application = highest priority
  - Engineering = high priority
  - Academic = lower priority

**Impact:** Medium — applies to foundational sciences

---

### 5. Theoretical vs. Experimental Physics Verification

**Problem:** Physics has fundamentally different subdomains with different verification needs:

- **Theoretical physics:** Verify for logical consistency, mathematical correctness
- **Experimental physics:** Verify for procedure accuracy, safety compliance
- **Computational physics:** Verify for code correctness, boundary conditions

**Current rule gap:** No subdomain-aware prioritization

**Proposed resolution:**
- Add `physics-subdomain: theoretical|experimental|computational` frontmatter
- Apply different verification approaches by subdomain:
  - Theoretical: peer review, logical consistency check
  - Experimental: safety audit, procedure verification
  - Computational: test validation, boundary condition check

**Impact:** Medium — applies to multi-subdomain knowledge bases

---

## Proposed Seed Rule Update

Add these edge cases to the verification priority hierarchy rule:

### Content-Based Safety Detection

> **Edge case (NEW - 2026-04-03):** The verification priority rule assumes notes already have `safety-critical: true` frontmatter. Many domains (physics, chemistry, engineering) have implicit safety-critical knowledge that exists in content without frontmatter tagging. Add content-based safety scanning: scan for domain-specific safety keywords and tag as `safety-critical: implicit` when frontmatter is missing but content suggests safety relevance. The test should check both explicit frontmatter AND content keywords.

### Foundational vs. Hub Distinction

> **Edge case (NEW - 2026-04-03):** The rule conflates "frequently-referenced" with "high backlink count." In physics and other foundational sciences, core equations (foundational) may have LOW backlink counts (everything builds FROM them) while topic summaries (hubs) have HIGH backlink counts. Distinguish verification approach: foundational notes verify for correctness; hub notes verify for completeness. Apply different verification methods to each type.

### Small Vault Verification

> **Edge case (NEW - 2026-04-03):** For vaults without verification history (new vaults), use expected frequency as proxy: "How often would someone in this domain need this knowledge?" Apply domain-specific ordering for small physics vaults: Theoretical → Experimental → Applied. This enables prioritization without usage history.

### Cross-Domain Safety Tagging

> **Edge case (NEW - 2026-04-03):** For knowledge that applies to multiple domains, add `safety-applies-to:` frontmatter listing affected domains. Prioritize verification based on domain stakes: medical > engineering > academic > personal. Physics knowledge applied to medicine has higher verification priority than pure theoretical physics.

### Subdomain-Aware Verification

> **Edge case (NEW - 2026-04-03):** For multi-subdomain domains like physics, apply different verification approaches: theoretical (logical consistency), experimental (safety + procedure), computational (test validation). Add subdomain frontmatter to enable appropriate verification method selection.

---

## Summary Table

| Edge Case | Gap | Proposed Solution | Domains Affected |
|-----------|-----|-------------------|------------------|
| Content-based safety | Assumes frontmatter exists | Scan content for safety keywords | Physics, chemistry, engineering |
| Foundational vs. Hub | Conflates two concepts | Different verification methods | Foundational sciences |
| Small vault strategy | Assumes usage history | Use expected frequency proxy | New vaults |
| Cross-domain safety | No multi-domain handling | safety-applies-to field | Sciences, engineering |
| Subdomain differences | No subdomain awareness | Subdomain-specific methods | Physics, medicine, etc. |

---

## Related Seed Notes

- [[AI-Assisted Knowledge Management Seed]] — Original rule (lines 443-481)
- [[Seed Stress Test - Verification Priority in Physics]] — Full stress test
- [[Seed Refinement - Verification Priority Hierarchy - Woodworking Edge Cases]] — Similar approach for woodworking
- [[Seed Refinement - Verification Priority in Cooking Domain]] — Cooking domain edge case (already merged)