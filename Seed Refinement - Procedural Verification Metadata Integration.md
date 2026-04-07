---
last-reviewed: 2026-04-05
lifecycle: proposed
confidence: high
author-type: ai-assisted
tags:
- seed-refinement
- verification
- procedural-content
- metadata
related-seed-gap:
- "Seed Gap - Procedural Verification Metadata Integration.md"
---

# Seed Refinement: Procedural Verification Metadata Integration

## Rule Being Refined

Seed rule for **verification-status** tracking in procedural content — specifically around metadata fields for safety-critical procedural knowledge.

## Gap Addressed

The Seed Gap "Procedural Verification Metadata Integration" identified four missing metadata fields for procedural verification:

1. **`materials-tested`** — Not in Seed at all
2. **`risk-level`** — Not explicitly in Seed for procedural content  
3. **`skill-level`** — Not in Seed as general user capability field
4. **`community-accepted`** — Not distinguished from `community-validated`

## Proposed Refinement

### Add `materials-tested` field

**Rule:** For procedural notes verified through execution, document the specific materials/products used during verification.

**Why:** A procedure verified with one brand of materials may fail with another. Documentation enables reproducibility and helps users assess applicability to their specific materials.

**Test:** For procedural notes with `verification-status: tested` or `verification-status: verified`: (1) Does `materials-tested` list the specific products used? (2) Could someone reproduce exactly what was verified?

**Implementation:**
```yaml
materials-tested:
  - "Brand X epoxy"
  - "Jorgensen clamps"
```

### Add `risk-level` field for procedural content

**Rule:** For procedural notes, tag with risk-level to distinguish safety-critical from convenience-only procedures.

**Why:** The same verification status (e.g., "community-validated") has very different implications for electrical work vs. painting. Risk-level enables appropriate scrutiny and user caution.

**Test:** For procedural notes: (1) Is `risk-level: high|medium|low` present? (2) Does high-risk content have higher verification standards? (3) Do users know the risk level before attempting?

**Implementation:**
```yaml
risk-level: high  # potential for injury, property damage
risk-level: medium  # could cause minor issues, waste materials
risk-level: low  # inconvenience only, no safety implications
```

**Distinction from existing fields:**
- `risk-level` is about PROCEDURE risk (what happens if done wrong)
- `criticality` is about KNOWLEDGE importance (impact if missing)
- `safety-critical` is a boolean for the most extreme cases

### Add `skill-level` for user capability

**Rule:** For procedural notes, document the assumed user skill level.

**Why:** A procedure verified by experts may be dangerous for beginners. Skill-level helps users assess whether they're qualified to attempt the procedure.

**Test:** For procedural notes: (1) Is `skill-level: beginner|intermediate|advanced` present? (2) Does the note include guidance for different skill levels? (3) Are high-skill procedures clearly marked?

**Implementation:**
```yaml
skill-level: beginner  # no prior experience needed
skill-level: intermediate  # basic familiarity assumed
skill-level: advanced  # specialized expertise required
```

**Edge case:** Some procedures have components at different skill levels. Use `skill-level-components:` for multi-level procedures:
```yaml
skill-level-components:
  - component: "preparation"
    level: beginner
  - component: "execution"
    level: advanced
```

### Distinguish `community-accepted` from `community-validated`

**Rule:** Distinguish between "widely believed but untested" vs. "actually tested by community members."

**Why:** Many DIY "best practices" are passed down through generations without systematic testing. Marking them as "validated" creates false confidence. Separate taxonomy enables appropriate trust levels.

**Test:** For notes with verification-source: community: (1) Is there `community-validated: true` (actually tested) vs. `community-accepted: true` (widely believed)? (2) Does confidence appropriately reflect the difference? (3) Are sources documented for community-validated claims?

**Implementation:**
```yaml
# Option 1: Extend verification-status enum
verification-status: unverified|tested|community-validated|community-accepted|expert-verified

# Option 2: Add separate boolean fields
community-validated: true  # actually tested by community members
community-accepted: true  # widely believed, not systematically tested

# Confidence calibration:
# community-validated: same as tested (higher confidence)
# community-accepted: lower confidence, needs verification
```

**Evidence distinction:**
- `community-validated`: "I tried this and it worked" — multiple accounts
- `community-accepted`: "Everyone says this is how it's done" — traditional wisdom

## Integration with Existing Seed Rules

This refinement extends:
- **Verification-status rule** — adds more granular values
- **Verification priority hierarchy** — risk-level enables better prioritization
- **Safety-critical knowledge thresholds** — risk-level complements safety-critical boolean

## Test

After adding these fields:
1. Can you identify high-risk procedures with incomplete verification?
2. Can users determine if they have the required skill level?
3. Can you distinguish tested procedures from traditional wisdom?
4. Can you reproduce verification conditions (materials used)?

## Related Notes

- [[Seed Gap - Procedural Verification Metadata Integration]]
- [[Seed Stress Test - Verification Status Rule in Home Repair]]
- [[Frontier Exploration - Safety-Critical Knowledge Thresholds]]