---
last-reviewed: 2026-03-30
lifecycle: draft
confidence: emerging
author-type: ai-assisted
tags:
  - seed-gap
  - verification-ratio
  - creative-writing-domain
  - edge-case
---

# Seed Gap: Verification Ratio Test Fails in Creative Writing Domain

> The Seed's verification-ratio test (≥50% of captures verified within 30 days) doesn't work for creative writing knowledge where feedback cycles exceed 30 days and verification is inherently subjective.

## The Problem

The Seed states:
- **Rule:** "Track vault growth velocity and maintain verification ratio — a healthy vault verifies at least 50% of new captures within 30 days."
- **Test:** Calculate: (notes verified in last 30 days) / (notes added in last 30 days). Is the ratio ≥0.5?

Testing this rule against a creative writing knowledge base reveals fundamental problems:

### 1. Feedback Cycle Duration
Creative writing feedback loops inherently exceed 30 days:
- Beta reader feedback: 2-8 weeks
- Workshop critique: scheduled sessions (often monthly)
- Publication acceptance: weeks to months
- Writing practice validation: iterative, spans weeks

A note captured on "dialogue techniques" cannot be verified within 30 days — it requires actually writing and receiving feedback.

### 2. Subjective Verification
"Verified" is ambiguous in creative writing:
- In empirical domains: "did the experiment work?"
- In procedural domains: "did the recipe turn out?"
- In creative writing: "is this writing advice good?" — subjective, contested

There's no clear pass/fail criterion. A dialogue technique "works" if it creates engaging character moments — but that's judgment-dependent.

### 3. Different Verification Modes
Creative writing knowledge uses different verification pathways:
- **Source verification** — Does this match what published craft books say? (limited, as craft advice is often opinion)
- **Empirical verification** — Did using this technique improve my writing? (requires time and practice)
- **Social validation** — Did beta readers/feedback providers respond positively? (slow, subjective)
- **Publication validation** — Did this piece get accepted using these techniques? (very slow, outcome-dependent)

### 4. Knowledge Type Differences
Different creative writing knowledge has different verification pathways:
| Knowledge Type | Verification Mode | Typical Timeframe |
|----------------|-------------------|-------------------|
| Craft principles | Source + empirical | Weeks to months |
| Character development | Workshop feedback | 2-8 weeks |
| Plot structures | Reading + writing | Ongoing |
| Genre conventions | Reading | Weeks |
| Dialogue techniques | Writing practice | Weeks |
| Style guidance | Beta reader feedback | 4-12 weeks |

## Current Seed Behavior

The current verification-ratio test would:
1. Mark creative writing vaults as "unhealthy" (ratio <0.5)
2. Trigger "pause exploration and prioritize verification" — but verification is inherently slow
3. Create false negative — the vault may be high-quality but just slow to verify

## Proposed Solution

**Rule:** For knowledge bases where verification cycles exceed 30 days OR verification is inherently subjective, apply domain-aware verification ratios.

**Why:** The 30-day verification window assumes: (1) verification is possible within 30 days, (2) verification has objective pass/fail criteria. Creative writing violates both assumptions. Applying standard ratios creates false negatives.

**Test:** For creative writing knowledge base:
1. Identify if verification cycles exceed 30 days (yes, by nature of feedback loops)
2. Identify if verification is subjective (yes, craft advice is opinion-based)
3. If yes to either, apply modified ratio: (notes verified or in-progress) / (notes added in last 90 days) ≥0.5
4. Track `verification-mode: craft-practice|workshop|beta-reader|publication` instead of simple verified/unverified

**Implementation:**
```yaml
# For creative writing notes:
verification-mode: craft-practice  # writing practice validates technique
verification-mode: workshop  # critique group validates
verification-mode: beta-reader  # feedback validates
verification-mode: publication  # acceptance validates
verification-cycle: long-horizon  # >30 days expected
verification-deadline: 2026-06-01  # when verification expected

# Modified ratio:
verification-ratio-modified: (notes verified OR notes with verification-in-progress) / notes added in 90 days
verification-ratio-threshold: 0.5
```

**Alternative verification status values for creative writing:**
```yaml
verification-status: practice-validated  # used in writing, received positive feedback
verification-status: workshop-validated  # critique group approved
verification-status: beta-validated  # beta readers approved
verification-status: published-validated  # published with these techniques
verification-status: rejected-validated  # learned from rejection (valuable!)
```

## Edge Cases

1. **Mixed domains:** A vault covering creative writing AND business writing — apply creative writing rules only to creative portion
2. **Hybrid verification:** Some notes can use standard verification (grammar rules are objective), others need modified (craft advice is subjective) — track separately
3. **Verification debt vs. verification mismatch:** The rule assumes debt = too many unverified. In creative writing, it's not debt — it's inherent cycle time

## See Also

- [[Seed Stress Test - Creative Writing Knowledge Base]] (testing Seed in this domain)
- [[Frontier Exploration - Creative Writing Knowledge Base Gaps]] (documenting gaps in this domain)
- [[Verification Workflow]] (existing verification guidance)
- [[Seed Gap - Verification Mode Conflict Resolution]] (related conflict handling)