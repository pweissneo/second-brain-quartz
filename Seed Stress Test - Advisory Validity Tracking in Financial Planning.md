---
last-reviewed: 2026-03-20
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
tags:
  - seed-stress-test
  - financial-domain
  - advisory-validity
  - temporal-knowledge
---

# Seed Stress Test: Advisory Validity Tracking in Financial Planning

## Seed Rule Being Tested

**Rule:** Add advisory validity tracking for prescriptive advice notes — include `advisory-validity-period:` specifying when the advice was accurate and `review-trigger:` for when to reassess.

**Test:** For notes containing prescriptive advice (should/shouldn't, do/don't, recommended): (1) Is there an `advisory-validity-period:` or `valid-from:` date? (2) Is there a `review-trigger:` for when to re-assess? (3) Can readers determine if this advice is current?

---

## Domain: Financial Planning

Financial planning is an excellent stress test because:
1. Market conditions change constantly
2. Tax laws update annually
3. Investment strategies have time horizons
4. Personal financial situations evolve
5. Incorrect advice can cause significant real-world harm

---

## Scenario Testing

### Scenario 1: Asset Allocation Advice

**Note content:**
"Maintain a 60/40 stocks/bonds allocation for retirement."

**Analysis:**
- Is this prescriptive? Yes — recommends a specific action
- Is there a validity period? NO — this is flagged as problematic
- What's missing? Age range, time horizon, market conditions, risk tolerance

**Problem:** A 60/40 allocation that was sound in 2021 may be inappropriate in 2024 given interest rate changes. Without validity tracking, readers don't know when this advice applied.

**Refinement Needed:**
- Add `advisory-validity-period: 2010-2024` (reasonable range before rate environment changed)
- Add `review-trigger: "Re-evaluate when interest rate environment shifts significantly"`
- Add `applicability-conditions:` specifying age range, risk tolerance, time horizon

### Scenario 2: Tax Optimization

**Note content:**
"Contribute to your 401(k) to reduce taxable income."

**Analysis:**
- Is this prescriptive? Yes
- Is there a validity period? NO — tax laws change annually
- What's missing? Tax year, income limits, rule changes

**Problem:** 401(k) contribution limits change yearly. Contribution limits for 2024 are different from 2025. The note should specify which year's rules apply.

**Refinement Needed:**
- Add `advisory-validity-period: "Tax year 2024"`
- Add `regulatory-valid-until: "Annual limit subject to inflation adjustments"`
- Add `jurisdiction: US` (federal tax rules)

### Scenario 3: Emergency Fund Guidance

**Note content:**
"Keep 3-6 months of expenses in an emergency fund."

**Analysis:**
- Is this prescriptive? Yes — recommends a specific action
- Is there a validity period? NO
- What's missing? Context — is this for employed? Self-employed? Retiree?

**Problem:** The "right" emergency fund size depends on employment stability, income source, dependents, health. A one-size-fits-all number is misleading.

**Refinement Needed:**
- Add `applicability-conditions:` to specify when this range applies
- Add `context-variables:` documenting what factors affect the range
- This advice may actually be evergreen but needs explicit confirmation

### Scenario 4: Investment Strategy

**Note content:**
"Index funds are the best investment for most people."

**Analysis:**
- Is this prescriptive? Yes — makes a recommendation
- Is there a validity period? NO
- What's missing? Time horizon, market conditions, fee environment

**Problem:** This advice was sound when actively managed funds had high fees. In a low-fee environment with robo-advisors, the calculus may have changed. The advice is generally sound but context-dependent.

**Refinement Needed:**
- Add `advisory-validity-period: "Valid in low-fee environment (post-2015)"` 
- Add `consensus-level: mainstream` since there's broad agreement
- Add `context-variables:` explaining when this applies vs. when active management might be better

### Scenario 5: Retirement Withdrawal Rate

**Note content:**
"Withdraw 4% annually from retirement savings."

**Analysis:**
- Is this prescriptive? Yes
- Is there a validity period? The 4% rule was developed in 1994 based on historical data from 1926-1976. Market conditions since have been different.
- What's missing? Original study date, updated research, sequence of returns risk

**Problem:** The 4% rule has been challenged by recent research. Some say 3% is safer; others say 4.5% works in some cases. This is contested advice that needs explicit validity tracking.

**Refinement Needed:**
- Add `advisory-validity-period: "Based on 1994 Trinity Study, updated 2018-2024"`
- Add `consensus-level: debated` — there's active disagreement
- Add `review-trigger: "When new withdrawal rate research is published"`

---

## Edge Cases Discovered

### Edge Case 1: Age-Based Advice

Financial advice often depends on age (e.g., "shift to bonds as you approach retirement"). The advisory validity rule should require explicit age ranges.

**Refinement:** Add `applicability-age-range:` frontmatter field

### Edge Case 2: Life Event Triggers

Some advice applies only until a life event (marriage, children, retirement). Need explicit triggers.

**Refinement:** Add `life-event-trigger:` frontmatter field

### Edge Case 3: Regulatory Changes

Tax advice becomes invalid when laws change. Need explicit jurisdiction and regulatory scope.

**Refinement:** This is already covered by existing Seed rules on regulatory dating, but should be emphasized for financial advice

### Edge Case 4: Market Regime

Some strategies work in bull markets, others in bear markets. Advice may be regime-dependent.

**Refinement:** Add `market-regime:` field (bull|bear|neutral|any)

### Edge Case 5: Personal Circumstance Dependency

"Maximize your 401(k) match" — this assumes you have a 401(k) with employer match. Not everyone does.

**Refinement:** Add `prerequisite-conditions:` field listing what must be true for advice to apply

---

## Rule Refinements Needed

### 1. Add Financial-Specific Fields

The Seed should include financial advisory fields:
```yaml
advisory-validity-period: YYYY-MM to YYYY-MM  # or YYYY-MM to present
advisory-validity-period: evergreen  # for universally applicable advice
regulatory-valid-until: YYYY  # for tax/legal rules
jurisdiction: US|UK|EU|global
applicability-age-range: 25-65
applicability-income-level: any|moderate|high
market-regime: bull|bear|neutral|any
life-event-trigger: none|marriage|retirement|inheritance
prerequisite-conditions: ["employer-sponsored retirement plan"]
```

### 2. Distinguish Advice Types

Financial advice falls into different categories with different validity needs:
- **Mathematical principles** (compound interest) — evergreen
- **Regulatory rules** (contribution limits) — annual review
- **Strategic allocation** — condition-dependent
- **Tactical recommendations** — market-regime dependent

### 3. Add Harm Potential Tracking

Financial advice that causes harm if wrong should have explicit harm tracking:
```yaml
harm-potential: low|medium|high|critical
harm-type: financial-loss|opportunity-cost|legal-penalty|tax-inefficiency
```

### 4. Disclaimer Requirements

Financial advice should always have explicit disclaimers:
```yaml
disclaimer-required: true
disclaimer-type: financial
disclaimer-text: "This is general information, not personalized financial advice."
advisory-type: recommendation|analysis|information
```

---

## Test for AI Agents

Given a note with financial advice:
1. Does it contain prescriptive language (should, recommend, avoid)?
2. If yes: Is there `advisory-validity-period:` or `valid-from:`?
3. Is there `review-trigger:` or `regulatory-valid-until:`?
4. Does it include `applicability-conditions:` or `prerequisite-conditions:`?
5. Does it have appropriate disclaimer?

If no to 2-3, flag as needing advisory validity tracking.

---

## Summary

| Current Seed Rule | Gap in Financial Domain | Solution |
|-------------------|------------------------|----------|
| advisory-validity-period | Doesn't specify financial context fields | Add jurisdiction, market-regime, age-range |
| review-trigger | Doesn't account for regulatory calendar | Add regulatory-valid-until for tax rules |
| applicability | Generic applicability too vague for finance | Add income-level, life-event-trigger |
| disclaimer | Doesn't track harm potential | Add harm-potential field |

---

## Related Notes

- [[AI-Assisted Knowledge Management Seed]]
- [[Seed Stress Test - Expertise Level Inversion in Investing]]
- [[Frontier Exploration - Decision Threshold Knowledge]]
- [[Domain-Specific Knowledge Bases]]
- [[Seed Gap - Recurring and Periodic Knowledge]] — consolidated temporal knowledge guidance
