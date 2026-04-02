---
last-reviewed: 2026-03-24
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
tags:
  - seed-stress-test
  - maintenance-burden
  - cooking-domain
  - frontier-gap
schema-version: "1.0"
---

# Seed Stress Test: Maintenance Burden Rule in Cooking

**Date:** 2026-03-24  
**Domain:** Cooking  
**Rule Tested:** Evaluate maintenance burden before capturing volatile knowledge — exclude or deprioritize knowledge that is high-maintenance (frequently changing) AND low-utility (easily looked up elsewhere) AND lacks personalization (no unique context you provide).

---

## The Rule Under Test

**From Seed (2026-03-22):**

> Evaluate maintenance burden before capturing volatile knowledge — exclude or deprioritize knowledge that is high-maintenance (frequently changing) AND low-utility (easily looked up elsewhere) AND lacks personalization (no unique context you provide).
> 
> **Test:** For knowledge about version-locked software, price-sensitive topics, time-sensitive opportunities, or frequently-changing facts: (1) Does this include personalized context that can't be found elsewhere? (2) Is the volatility so high the knowledge will be stale within 30 days? (3) Could a web search provide current information faster than maintaining this note? If 2-3 are true and 1 is false, exclude or mark with short expiration-interval.
> 
> **Implementation:**
> ```yaml
> maintenance-burden: high|medium|low
> volatility-type: version-sensitive|price-sensitive|time-sensitive|stable
> external-availability: high|medium|low
> ```

---

## Stress Test: Applying to Cooking

### Category Analysis: What Falls Where?

Let's analyze different types of cooking knowledge against the rule:

| Knowledge Type | Maintenance Burden | Volatility | External Availability | Personal Context | Verdict |
|---------------|-------------------|------------|----------------------|------------------|---------|
| Recipe (generic) | Low | Stable | High | None | **Exclude** |
| Recipe (personal adaptations) | Medium | Low | Low | High | **Capture** |
| Ingredient seasonality | Medium | Seasonal | Medium | Your location | **Capture** |
| Cooking times by weight | Low | Stable | High | Your equipment | **Capture (context)** |
| Restaurant reviews | High | High | Medium | Your specific experience | **Conditional** |
| Technique原理 (the science) | Low | Very low | Medium | Your experiments | **Capture** |
| Equipment-specific tips | Medium | Low | Low | Your specific equipment | **Capture** |
| Food safety temperatures | Low | Very low | High | None (universal) | **Exclude** |
| Trendy ingredients (2026) | High | Very high | High | None | **Exclude** |
| Price data | High | Very high | High | Your location | **Exclude** |

---

## Edge Cases Identified

### Edge Case 1: Seasonal Knowledge Has Built-In Volatility

**Problem:** Many cooking knowledge types are seasonal (ingredients, timing, traditions). The rule's 30-day staleness test doesn't account for seasonal knowledge that is intentionally captured outside its active window.

**Example:** Capturing pumpkin recipes in March (off-season) — the knowledge will be "stale" for 6 months but becomes relevant again in September.

**Test Failure:** The rule would flag seasonal knowledge as high-maintenance because it can't be verified immediately, but this is a false positive.

**Proposed Refinement:** Add `volatility-type: seasonal` with `active-window:` field:
```yaml
maintenance-burden: medium
volatility-type: seasonal
active-window: September-November
verification-cycle: annual
capture-when: off-season  # Intentional capture outside active window
```

**Why this matters:** Seasonal knowledge has option value — capturing it when convenient (March) for use when relevant (October) is good vault behavior, not maintenance burden.

---

### Edge Case 2: Technique Evolution vs. Trend Cycles

**Problem:** The rule doesn't distinguish between:
- **Technique evolution:** Knowledge that genuinely improves over time (new understanding of Maillard reaction)
- **Trend cycles:** Knowledge that changes but doesn't improve (trendy ingredients, viral recipes)

Both are "volatile" but have different value trajectories.

**Test Failure:** An AI cannot distinguish "this cooking technique evolved" from "this ingredient was a 2024 trend" using the current rule.

**Proposed Refinement:** Add `volatility-trajectory:` field:
```yaml
volatility-type: trend-sensitive
volatility-trajectory: declining  # Was popular, fading
# vs.
volatility-type: technique-evolution
volatility-trajectory: improving  # Knowledge getting better
```

---

### Edge Case 3: Recipe Source Quality Varies Enormously

**Problem:** Recipe knowledge online is highly variable in quality. A recipe from a professional chef's blog may be well-tested, while a Reddit post may be untried. The "low utility" test doesn't account for source quality variation within the same knowledge type.

**Test Failure:** All recipes have "high external availability" but vastly different reliability. The rule treats them all the same.

**Proposed Refinement:** Add `source-quality-tier:` field (from evidence tier system):
```yaml
maintenance-burden: low
volatility-type: stable
external-availability: high
source-quality-tier: tested-methodology  # Professional source, multiple验证
# vs.
external-availability: high
source-quality-tier: personal-discovery  # Unverified Reddit recipe
```

**Test adjustment:** For cooking knowledge with high external availability, check source-quality-tier before excluding. High-quality professional recipes provide value even when available elsewhere.

---

### Edge Case 4: Personal Taste Calibration is High-Burden but High-Value

**Problem:** Personal taste preferences ("I prefer X over Y", "my family doesn't like spicy") require ongoing calibration but are deeply personal and cannot be found elsewhere.

**Test Failure:** The rule would flag personal taste as "high maintenance" (preferences change) but fails to recognize it's the highest-value personal knowledge in cooking.

**Proposed Refinement:** Add exception for `knowledge-type: taste-calibration`:
```yaml
# Personal taste knowledge is ALWAYS worth maintaining despite maintenance burden
knowledge-type: taste-calibration
maintenance-burden: high
# This is the personal knowledge that provides unique value
```

---

### Edge Case 5: Equipment-Specific Knowledge Has Low Apparent but High Actual Utility

**Problem:** "How to use my Instant Pot" has high external availability (thousands of Instant Pot recipes online) but low actual utility for the user because generic advice doesn't account for:
- Your specific model
- Your altitude
- Your typical batch sizes
- Your recipe preferences

**Test Failure:** The rule would exclude equipment-specific knowledge as "easily looked up," but it's actually high-value for the specific user.

**Proposed Refinement:** Reweight by `personalization-depth:`:
```yaml
maintenance-burden: medium
external-availability: high
personalization-depth: high  # Multiple context factors from YOUR setup
# If personalization-depth is high, capture even with high external availability
```

---

### Edge Case 6: Troubleshooting Knowledge Has Different Volatility

**Problem:** "Why did my sauce break?" is a common troubleshooting question. The answer (techniques to fix a broken sauce) is stable, but the specific failure modes vary.

The rule treats all cooking knowledge the same, but troubleshooting knowledge has:
- **Stable solutions** (how to fix)
- **Variable problems** (what went wrong)

**Test Failure:** A troubleshooting note about fixing broken emulsions has low maintenance (the fix doesn't change) but the problem descriptions do.

**Proposed Refinement:** Separate problem-frequency from solution-stability:
```yaml
maintenance-burden: low
volatility-type: solution-stable  # The fix doesn't change
problem-variability: high  # But failure modes vary
capture-focus: solutions  # Capture fixes, not problem descriptions
```

---

### Edge Case 7: Cultural/Regional Knowledge Has Implicit Volatility

**Problem:** "How to make authentic pho" or "traditional kimchi" involves knowledge that may be:
- Evolving (regional variations within Vietnam/Korea)
- contested (what's "authentic"?)
- time-sensitive (ingredients available seasonally/regionally)

**Test Failure:** Cultural knowledge doesn't fit the "version-sensitive" or "price-sensitive" volatility types.

**Proposed Refinement:** Add cultural volatility type:
```yaml
volatility-type: cultural-evolution
volatility-source: regional-variation|contested-authenticity|ingredient-availability
```

---

## Revised Test for Cooking Domain

For cooking notes, the test should be:

1. **Is this general recipe knowledge?** → If yes, check source quality tier. High-quality professional recipes may be worth capturing despite external availability.
2. **Is this seasonal?** → If seasonal, add active-window and allow capture outside active period.
3. **Is this equipment-specific?** → If yes, capture even with high external availability (personalization depth is high).
4. **Is this taste calibration?** → Always capture regardless of maintenance burden (high personal value).
5. **Is this troubleshooting?** → Capture solutions (stable), not problem descriptions (variable).
6. **Is this cultural/regional?** → Add cultural-evolution volatility type.
7. **Is this a trend?** → Distinguish from technique evolution using volatility-trajectory.

---

## Is the Rule's Test Executable by an AI?

**Partially.** The basic test is executable:

1. Does this include personalized context? → Check for equipment-specific, location-specific, taste-specific content
2. Is volatility high? → Check for trend indicators, seasonal patterns, version-dependent knowledge
3. Is external availability high? → Check if easily searchable

**But AI judgment is needed for:**
- Distinguishing trends from technique evolution
- Assessing source quality tier for recipes
- Determining personalization depth for equipment knowledge
- Handling seasonal knowledge that should be captured off-season

**Recommendation:** Add contextual guidance for cooking domain to the Seed rule itself.

---

## Summary of Proposed Refinements

1. **Add `volatility-type: seasonal`** with `active-window:` and `verification-cycle:` fields
2. **Add `volatility-trajectory:`** to distinguish improving vs. declining knowledge
3. **Integrate evidence-tier** for source quality assessment before excluding based on external availability
4. **Add exception for taste-calibration** knowledge type (always worth capturing)
5. **Add `personalization-depth:`** to reweight equipment-specific knowledge
6. **Separate problem-variability from solution-stability** in troubleshooting knowledge
7. **Add `volatility-type: cultural-evolution`** for regional/traditional knowledge

---

## Related Seed Notes

- [[Seed Stress Test - Cooking Knowledge Base]] — General cooking domain stress test
- [[Frontier Exploration - Knowledge Maintenance Burden]] — General maintenance burden exploration
- [[Seed Gap - Sensory Anchor Standardization]] — Related to cooking sensory knowledge- [[_root]]
