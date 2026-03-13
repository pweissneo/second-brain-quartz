---
last-reviewed: 2026-03-11
lifecycle: draft
confidence: emerging
author-type: ai-assisted
tags:
- seed-stress-test
- procedural-content
- verification
- edge-case
---

# Stress Test: Verification-Status Rule in Home Repair/DIY

## Seed Rule Being Tested
**Rule:** For procedural content (recipes, code, tutorials, technical specs), include a verification-status field: `unverified` | `tested` | `community-validated`.

**Why:** Procedural content that hasn't been tested may cause harm (medical procedures, broken code, faulty repairs) or waste time. Readers and AI agents need to know whether the steps have been verified.

**Test:** Pick 10 notes containing procedural content. Can you categorize each by verification status? Are any unmarked?

**Edge case:** Domain-standard procedures (well-known algorithms, classic recipes) may be marked as `community-validated` by virtue of widespread use. New or experimental procedures should be marked `unverified` until tested.

**Edge case:** AI agents cannot verify procedural content by execution - they should mark procedural notes as `unverified` unless source explicitly states testing was performed.

## Application to Home Repair/DIY Knowledge Base

### Where the Rule Works Well

1. **Standard Woodworking Joints**: Dovetail, mortise-and-tenon, box joints are well-documented and `community-validated` by centuries of use.

2. **Basic Plumbing Fixes**: Unclogging drains, replacing washers, fixing leaky faucets — these are standard procedures with many verified sources.

3. **Electrical Basics**: Replacing outlets, installing light fixtures, running new wiring (where permitted) — these have clear code requirements and established procedures.

### Edge Case 1: Regional Code Variations

**Problem:** Building codes vary significantly by jurisdiction. A procedure that's `tested` in one location may violate codes elsewhere.

1. **Electrical grounding**: US (NEC), UK (BS 7671), EU (IEC standards) have different requirements
2. **Plumbing vent sizing**: Different in each code jurisdiction
3. **Smoke detector placement**: Requirements vary by country/state

**The Test Fails:** A note marked `tested` in California may be non-compliant in New York. The verification status doesn't capture jurisdiction-specific validity.

**Recommendation:** Add `jurisdiction` field to procedural notes:
```yaml
verification-status: tested
jurisdiction: [US-NEC, California]
```

### Edge Case 2: Tool/Material Specificity

**Problem:** Procedures depend heavily on specific tools and materials. A procedure tested with brand X may not work with brand Y.

1. **Adhesive applications**: "Construction adhesive" is meaningless — exact product matters (Loctite PL Premium vs. generic)
2. **Drill bits**: Procedures for masonry vs. wood vs. metal require different bits
3. **Paint types**: Oil-based vs. latex vs. shellac have different application procedures

**The Test Fails:** A procedure marked `tested` assumes certain materials were used. Without this context, the verification is incomplete.

**Recommendation:** Add `materials-tested` field:
```yaml
verification-status: tested
materials-tested: ["3M DP1000 epoxy", "Jorgensen clamps"]
```

### Edge Case 3: Safety-Critical vs. Convenience Procedures

**Problem:** Some procedures are safety-critical (electrical, structural), others are convenience-only. The verification status should reflect consequence severity.

1. **Load-bearing wall modification**: HIGH STAKES - structural integrity
2. **Main breaker panel work**: HIGH STAKES - electrocution/fire risk  
3. **Gas line any work**: HIGH STAKES - explosion risk
4. **Painting a room**: LOW STAKES - cosmetic only

**The Test Fails:** The current rule treats all procedural content the same. A `community-validated` painting tutorial and a `community-validated` main electrical panel replacement have very different risk profiles.

**Recommendation:** Add `risk-level` field:
```yaml
verification-status: community-validated
risk-level: high  # structural, electrical, gas
risk-level: medium  # plumbing, HVAC
risk-level: low  # cosmetic, non-structural
```

### Edge Case 4: "Common Knowledge" Isn't Verified

**Problem:** Many DIY procedures are passed down as "common knowledge" but have never been systematically tested.

1. "You should sand between coats" — rarely tested scientifically
2. "Don't paint in humidity" — vague threshold, not tested
3. "Pre-drill hardwood to prevent splitting" — wisdom, not verification

**The Test Fails:** These are marked `community-validated` because many sources say them, but there's no actual testing behind the claims.

**Recommendation:** Distinguish between:
- `community-validated`: Multiple independent sources tested and agree
- `community-accepted`: Widely believed but untested

### Edge Case 5: Skill Level Affects Verification

**Problem:** A procedure can be "verified" for an expert but dangerous for a beginner.

1. **Drywall lifting alone** — possible for experienced DIYers, dangerous for novices
2. **Working at height** — depends entirely on experience
3. **Using power tools** — safety depends on training

**The Test Fails:** Verification status doesn't account for skill level. "Tested" may mean "tested by a professional" which doesn't help a beginner.

**Recommendation:** Add `skill-level` field:
```yaml
verification-status: tested
skill-level: beginner  # no prior experience needed
skill-level: intermediate  # some experience
skill-level: advanced  # professional experience recommended
```

### Edge Case 6: Temporal Validity

**Problem:** Building codes change, materials evolve, and "best practices" update.

1. **PEX vs. copper plumbing** — PEX wasn't standard 20 years ago
2. **LED vs. incandescent lighting** — procedures differ significantly
3. **Asbestos awareness** — procedures for older homes require special handling

**The Test Fails:** A procedure marked `tested` in 2010 may now be outdated or even unsafe (e.g., old asbestos procedures).

**Recommendation:** Add `last-verified` date:
```yaml
verification-status: tested
last-verified: 2024-03-15
```

## Summary of Missing Fields

For a comprehensive home repair/DIY knowledge base, procedural notes should include:

```yaml
---
verification-status: unverified | tested | community-validated | community-accepted
risk-level: low | medium | high
skill-level: beginner | intermediate | advanced
jurisdiction: [list of applicable codes]
materials-tested: [list of specific products used]
last-verified: YYYY-MM-DD
---
```

## The Core Insight

The verification-status rule is necessary but insufficient for safety-critical procedural domains. Home repair involves:
- Legal compliance (codes vary by jurisdiction)
- Material specificity (brand matters)
- Risk assessment (some procedures can kill you)
- Skill requirements (experience affects safety)
- Temporal validity (standards change)

A simple `tested`/`unverified` binary cannot capture this complexity. The rule needs expansion for domains where procedural errors have real-world consequences.

## Related
- [[Note Types and Templates]]
- [[Frontier Exploration - Professional Credentialing Requirements]]
- [[Stress Test - Note Lifecycle Rule Across Domains]]
- [[Handling Temporal Knowledge]]
