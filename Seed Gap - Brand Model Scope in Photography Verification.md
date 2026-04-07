---
last-reviewed: 2026-04-03
last-updated: 2026-04-03
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
knowledge-type: gap
tags:
  - seed-gap
  - equipment-scope
  - photography
  - verification
  - brand-specific
gap-status: integrated
resolved: 2026-04-03
resolved-by: Seed (line ~4153 expanded with photography/audio examples)
---

# Seed Gap: Brand/Model Scope in Photography Verification

## Gap Identification

**Source:** [[Seed Stress Test - Photography Knowledge Base]] (2026-03-22)

**Problem:** Photography knowledge bases face unique verification challenges where a technique that works on Canon cameras may not work identically on Sony. The Seed has equipment-tier for craft domains (woodworking, metalworking) and equipment-scope for automotive/electronics, but lacks explicit guidance for camera brand/model scope in verification-status.

**Current State:**
- Equipment-tier exists for craft domains: `equipment-tier: professional|home-workshop|hand-tools-only`
- Equipment-scope exists for automotive: `equipment-scope: make: [Toyota, Honda], year: [2015-2022]`
- BUT: No explicit camera brand/model scope in verification-status for photography

**Why This Matters:**
1. A photography technique verified on a Canon EOS R5 may not apply to Sony A7IV
2. Autofocus systems, menu structures, and sensor technology differ by brand
3. Users need to know WHICH camera a technique has been tested on
4. The Seed's verification-status field doesn't capture this scope

## Proposed Rule

**Rule:** For equipment-dependent knowledge domains where results vary significantly by brand/model (photography, videography, audio), include equipment-scope in verification-status — specify which specific gear the knowledge was tested on.

**Why:** Without equipment-scope in verification, users cannot determine if a technique applies to their specific gear. A note claiming "verified" without equipment scope misleads users into assuming universal applicability when the technique may only work on specific brands.

**Test:** For equipment-dependent notes: (1) Does verification-status include `equipment-scope` or `tested-gear` field? (2) Can a user determine if this applies to their specific camera/lens? (3) Are equipment-specific limitations documented?

**Implementation:**
```yaml
verification-status: verified
equipment-scope:
  brand: Canon  # Canon|Nikon|Sony|Fuji|Legacy
  model: EOS R5  # specific model or family
  lens: RF 50mm f/1.2L  # if lens-specific
tested-conditions:
  - lighting: natural-light
  - subject: portrait
  - firmware: "15.1"
applicability-transferability: brand-specific  # brand-specific|multi-brand|universal
```

**Alternative approach:** Use separate fields for verification:
```yaml
verification-status: brand-verified
brand-verified: [Canon EOS R5, Canon EOS R6]
model-verified: [Canon]
equipment-scope-note: "Tested on Canon ecosystem; Sony/Nikon behavior may differ"
```

## Related Seed Rules

- [[AI-Assisted Knowledge Management Seed]] — Primary Seed rules
- [[Seed Stress Test - Photography Knowledge Base]] — Source of gap identification
- Edge case (NEW - 2026-03-23): Equipment tier for craft domains (line 313-333)
- Edge case (expanded): Equipment scope for automotive (line 4153-4160)

## Gap Status

- **Status:** RESOLVED (2026-04-03)
- **Priority:** medium
- **Phase:** implementation
- **Discovered:** 2026-04-02
- **Discovered by:** Seed Stress Test - Photography Knowledge Base
- **Resolved by:** Seed edge case expanded (line ~4153) with photography/audio equipment examples
- **Resolution notes:** The Seed's equipment-scope guidance now explicitly includes photography (brand, model, lens) and audio equipment (brand, model, firmware) as examples. Gap is now addressed via expanded edge cases.
- **Review date:** 2026-05-02

---

## Resolution Notes (2026-04-03)

This gap was identified during SEED_STRESS_TEST. The Seed's equipment-scope edge case (formerly automotive/electronics only) has been expanded to explicitly include photography and audio equipment examples. The gap is now resolved — the Seed now provides explicit guidance for camera brand/model scope in verification-status.

The gap note is kept as documentation of the identification-resolution process but is now marked resolved.
