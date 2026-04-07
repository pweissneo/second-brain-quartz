---
last-reviewed: 2026-04-05
lifecycle: resolved
confidence: medium
author-type: ai-assisted
tags:
- seed-gap
- verification
- procedural-content
- integration-complete
gap-status: resolved
resolution-date: 2026-04-05
resolved-by: Seed rule added (lines 612-655+)
related-seed-stress-test:
- "Seed Stress Test - Verification Status Rule in Home Repair.md"
related-seed-rules:
- "Verification Mode - Procedural Content Metadata"
---

# Seed Gap: Procedural Verification Metadata Integration

> **Status: RESOLVED** — Rule integrated into Seed (2026-04-05)

## Gap Identified

The Seed includes `verification-status` for procedural content, but the **home repair stress test** identified critical metadata fields that remain missing or incomplete:

### Missing Fields

1. **`materials-tested`** — Not in Seed at all
   - **Purpose:** Document exact products/materials used during verification
   - **Why:** A procedure verified with Brand X epoxy may fail with Brand Y
   - **Example:** `materials-tested: ["3M DP1000 epoxy", "Jorgensen clamps"]`

2. **`risk-level`** — Not explicitly in Seed for procedural content
   - **Purpose:** Distinguish safety-critical procedures from convenience-only
   - **Why:** `community-validated` electrical panel work and `community-validated` painting have very different risk profiles
   - **Values:** `risk-level: high|medium|low`
   - **Current:** Only covered via `criticality: high` and `safety-critical: true`, not as a general procedural metadata field

3. **`skill-level`** (general) — Not in Seed as general user capability field
   - **Purpose:** Document what user experience level the procedure assumes
   - **Why:** A procedure verified for experts may be dangerous for beginners
   - **Current:** Only `equipment-skill-level` exists (about tool requirements), not user skill requirement
   - **Values:** `skill-level: beginner|intermediate|advanced`

4. **`community-accepted`** — Not distinguished from `community-validated`
   - **Purpose:** Distinguish widely-believed-but-untested from actually-tested
   - **Why:** Many DIY "best practices" are passed down but never systematically tested
   - **Current:** Both marked as `community-validated`, creating false confidence

## Evidence

- The stress test (2026-03-27) explicitly recommends all four fields
- Current Seed has partial coverage: `criticality`, `safety-critical`, `jurisdiction`, `last-verified`
- Missing: general `skill-level`, `materials-tested`, `risk-level`, `community-accepted` distinction

## Impact

For safety-critical procedural domains (home repair, automotive, electrical, medical), incomplete verification metadata:
- Creates false confidence in untested procedures
- Doesn't distinguish risk levels for users
- Doesn't help users assess whether they have the right skills
- Doesn't document what materials were actually used

## Recommended Integration

Add to Seed's procedural content guidance:

```yaml
# Extended verification metadata for procedural content
verification-status: unverified|tested|community-validated|community-accepted
risk-level: low|medium|high  # procedural risk assessment
skill-level: beginner|intermediate|advanced  # user capability requirement
materials-tested: [specific products used]
```

Or extend existing `verification-status` enum to include `community-accepted` as distinct from `community-validated`.

## Related Notes

- [[Seed Stress Test - Verification Status Rule in Home Repair.md]]
- [[Seed Refinement - Safety-Critical Knowledge Metadata]]
- [[Frontier Exploration - Safety-Critical Knowledge Thresholds]]
