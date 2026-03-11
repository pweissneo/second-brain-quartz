---
last-reviewed: 2026-03-10
lifecycle: active
confidence: emerging
tags:
  - seed-stress-test
  - probabilistic-knowledge
  - multi-domain
  - edge-case
---

# Stress Test: Probabilistic Knowledge Rule Across Domains

> Testing the Seed's probabilistic knowledge rule across multiple domains to identify edge cases and refinements.

## The Seed Rule

**Rule:** Express probabilistic knowledge with explicit probabilities, not vague qualifiers like "usually" or "sometimes".

**Why:** Vague language misleads — "usually works" means different things to different people. Explicit probabilities enable proper weighting and decision-making.

**Test:** Can you assign a numerical probability to the claim? Is it expressed numerically rather than with vague qualifiers?

---

## Domain: Cooking

### Does the rule make sense?

**Partially.** Cooking does involve probabilistic knowledge:
- "If you overcook steak, it will be tough" — but how overcooked? By how much?
- "Add salt to taste" — what does that mean numerically?
- "The sauce will thicken as it cools" — at what rate?

However, cooking is also an art, and precise probabilities may not always be helpful.

### Edge Cases in Cooking

1. **Recipe scaling**: "Add 1 tsp salt per pound of meat" is precise but doesn't account for variations in meat saltiness. The rule would require "1 tsp ± 0.5 tsp" which is awkward.

2. **Doneness temperatures**: "Cook to 145°F for medium-rare beef" IS precise. But "sear for 2-3 minutes per side" is imprecise because stove heat varies.

3. **Food safety vs. quality**: Food safety rules (like "cook chicken to 165°F") are NOT probabilistic — they're binary. This rule shouldn't apply to safety-critical guidance.

4. **Ingredient substitutions**: "You can usually substitute yogurt for cream" — what does "usually" mean?

5. **"Add to taste"**: This IS the right answer for some cooking knowledge; numerical would be wrong.

### Refinements for Cooking

1. **Distinguish safety from quality**: The probabilistic rule should NOT apply to food safety guidance. Those are binary.

2. **Distinguish precision-possible from art-based**: Apply the rule only where possible.

3. **Use ranges instead of point estimates**: "200-220°C" is often more honest than a single temperature.

4. **Add confidence for technique advice**: Use "confidence: high/medium/low" instead of vague qualifiers.

---

## Domain: Medical Knowledge

### Where the Rule Works Well

#### Diagnostic Test Performance
- **Sensitivity:** "This test has 95% sensitivity for detecting Condition X"
- **Specificity:** "Specificity is 88% — 12% false positive rate"

#### Treatment Effect Sizes
- "Aspirin reduces cardiovascular events by 25% (relative risk reduction)"
- "Number needed to treat (NNT) = 15 for this intervention"

### Edge Cases in Medicine

#### Edge Case 1: Individual vs Population Probability

A note states: "Statins reduce cardiovascular events by 25%"

This is misleading because:
- Relative risk reduction = 25%
- Absolute risk reduction might be only 1-2%
- For an individual patient, "will this help ME?" cannot be answered with a single number

**Recommendation:** Medical notes should specify relative vs absolute risk.

#### Edge Case 2: Confidence Intervals vs Point Estimates

A note states: "This treatment has 70% success rate" but the 95% CI is 55-82%.

**Recommendation:** Medical notes should include confidence intervals when sample size is small or for clinical decision-making.

#### Edge Case 3: Conditional Probabilities

"Sensitivity: 95%" doesn't mean 95% of positive tests have the disease. PPV varies by prevalence:
- At 1% prevalence: PPV ≈ 16%
- At 50% prevalence: PPV ≈ 95%

**Recommendation:** Always link sensitivity/specificity to PPV/NPV.

#### Edge Case 4: NNT (Number Needed to Treat)

"Effective" is vague. NNT = 20 means for every 20 patients treated, 1 additional patient benefits.

**Recommendation:** Notes on treatment efficacy should include NNT or equivalent.

### Refinements for Medicine

1. **Context-Specific Probability Types**: Specify whether probabilities are relative/absolute risk, population-level/individual-level

2. **Confidence Interval Requirement**: Medical statistics should include 95% confidence intervals unless sample size >1000

3. **Guideline Qualifier Mapping**:

| Qualifier | Approximate Probability | Confidence |
|-----------|------------------------|------------|
| "strongly recommended" | 80-95% | high |
| "recommended" | 60-80% | moderate |
| "may be considered" | 30-50% | low/emerging |
| "insufficient evidence" | unknown | disputed |

---

## Cross-Domain Insights

### When the Rule Works Well
- Diagnostic test performance (medicine)
- Treatment effect sizes (medicine)
- Precise measurements (cooking temperatures, ratios)

### When the Rule Needs Refinement
- Safety-critical guidance (cooking chicken to 165°F) — binary, not probabilistic
- Art-based knowledge (cooking "to taste") — subjective, not numeric
- Individual vs population predictions (medicine) — requires context
- Building-block terminology — creates circular dependencies

### Universal Refinements

1. **Distinguish binary from probabilistic**: Safety rules are binary; quality rules may be probabilistic

2. **Use confidence markers when probabilities can't be determined**: "confidence: emerging" instead of false precision

3. **Distinguish relative from absolute**: Always specify which type of probability

4. **Use ranges when uncertainty is inherent**: "60-80%" rather than "70%"

---

## Test Refinement

Original test: "Can you assign a numerical probability to the claim? Is it expressed numerically rather than with vague qualifiers?"

Refined test for any domain:
1. Identify notes with probabilistic claims
2. Check for vague qualifiers (usually, sometimes, often, rarely)
3. Determine: (a) Can this be made precise? (b) Is it binary/safety-related? (c) Is it subjective/art-based?
4. If precise-able: suggest numerical range or confidence marker
5. If safety-related: mark as binary (no probability needed)
6. If subjective: suggest "confidence: medium" instead of vague qualifier

---

## Related

- [[Frontier Exploration - Probabilistic Knowledge]] — Related frontier exploration
- [[Confidence Markers]] — Alternative way to express uncertainty
- [[Domain-Specific Knowledge Bases]] — Domain-specific adaptations
