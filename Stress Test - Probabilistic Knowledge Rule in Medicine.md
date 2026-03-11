---
last-reviewed: 2026-03-10
lifecycle: emerging
confidence: emerging
tags:
  - seed-stress-test
  - medical-domain
  - probabilistic-knowledge
  - edge-case
---

# Stress Test: Probabilistic Knowledge Rule in Medicine

## Seed Rule Being Tested
**Rule:** Express probabilistic knowledge with explicit probabilities, not vague qualifiers like "usually" or "sometimes".
**Test:** Can you assign a numerical probability to the claim? Is it expressed numerically rather than with vague qualifiers?

**Rule:** Distribute point estimates into ranges when uncertainty is high and the domain warrants precision.
**Test:** For numerical claims in high-uncertainty domains, is uncertainty expressed as a range (e.g., "60-80%") or confidence interval rather than a point estimate?

## Application to Medical Knowledge Base

### Where the Rule Works Well

#### Diagnostic Test Performance
- **Sensitivity:** "This test has 95% sensitivity for detecting Condition X"
- **Specificity:** "Specificity is 88% — 12% false positive rate"
- **Positive Predictive Value:** "PPV varies by prevalence: 70% at 10% prevalence, 90% at 50% prevalence"

These are naturally numerical and fit the rule perfectly.

#### Treatment Effect Sizes
- "Aspirin reduces cardiovascular events by 25% (relative risk reduction)"
- "Number needed to treat (NNT) = 15 for this intervention"

#### Risk Factors
- "Smoking increases lung cancer risk by 15-25x (relative risk)"
- "Family history doubles Type 2 diabetes risk"

### Edge Case 1: Individual vs Population Probability

**Problem:** A note states: "Statins reduce cardiovascular events by 25%"

This is misleading because:
- Relative risk reduction = 25%
- Absolute risk reduction might be only 1-2% (from 4% to 2-3%)
- For an individual patient, "will this help ME?" cannot be answered with a single number

**Analysis:** The Seed rule asks for explicit probabilities, but in medicine, the same probability statement can mean different things depending on context (population vs individual, relative vs absolute).

**Recommendation:** Medical notes should specify:
- Relative vs absolute risk
- Population the statistic applies to
- Whether it's individualizable or population-level only

### Edge Case 2: Confidence Intervals vs Point Estimates

**Problem:** A note states: "This treatment has 70% success rate"

But the 95% CI is 55-82%. The point estimate implies false precision.

**Analysis:** In medicine, almost all statistics have uncertainty. The Seed's second rule (use ranges when uncertainty is high) should be emphasized more strongly for medical knowledge.

**Recommendation:** Medical notes should include confidence intervals when:
- Sample size is small (<100 subjects)
- Point estimate is far from 0% or 100%
- The note is for clinical decision-making

### Edge Case 3: Conditional Probabilities

**Problem:** "The test has 95% sensitivity" — but this doesn't mean 95% of positive tests have the disease.

Clinicians need PPV (positive predictive value), which depends on prevalence:
- At 1% prevalence: PPV ≈ 16% — most positive tests are false positives
- At 10% prevalence: PPV ≈ 51%
- At 50% prevalence: PPV ≈ 95%

**Analysis:** Sensitivity/specificity are test properties; PPV/NPV are what patients need. The Seed rule doesn't address this distinction.

**Recommendation:** Medical knowledge bases should:
- Always link sensitivity/specificity to PPV/NPV
- Include prevalence assumptions
- Flag when PPV is likely to be misleading

### Edge Case 4: NNT (Number Needed to Treat)

**Problem:** "This treatment is effective" vs "NNT = 20"

"Effective" is vague. NNT = 20 means:
- For every 20 patients treated, 1 additional patient benefits
- 19 patients receive no additional benefit (but may have side effects)

**Analysis:** NNT is a probabilistic metric that captures both benefit and tradeoff. It fits the Seed rule well but requires domain-specific explanation.

**Recommendation:** Notes on treatment efficacy should include:
- NNT or equivalent absolute risk reduction
- NNH (number needed to harm) for side effects
- Time horizon (NNT over 5 years vs 10 years)

### Edge Case 5: Genetic/Personalized Medicine Probabilities

**Problem:** "This genetic variant increases disease risk by 50%"

But:
- Relative risk increase depends on baseline risk
- Penetrance (probability of manifesting if you have the variant) may be 10-80%
- Risk varies by age, sex, environmental factors

**Analysis:** Genetic probabilities are inherently uncertain and context-dependent. Expressing them as single numbers is misleading.

**Recommendation:** Genetic risk notes should:
- Use ranges (e.g., "2-4x baseline risk")
- Include penetrance estimates with confidence intervals
- Note population-specific risk variations

### Edge Case 6: Vague Qualifiers in Guidelines

**Problem:** Medical notes often contain: "may be considered," "reasonable," "possible," "unlikely"

These map to implicit probabilities:
- "may be considered" ≈ 30-50%
- "reasonable" ≈ 40-60%
- "possible" ≈ 10-30%
- "unlikely" ≈ <10%

**Analysis:** The Seed rule wants explicit probabilities. These qualifiers are ubiquitous in medical literature (particularly guidelines) because they reflect genuine uncertainty.

**Recommendation:** When converting medical literature to notes:
1. Identify vague qualifiers
2. Assign explicit probability ranges when possible
3. Use confidence markers (emerging/disputed) when probabilities cannot be estimated

### Edge Case 7: Prognosis and Survival Statistics

**Problem:** "5-year survival rate is 60%"

This is often misinterpreted as:
- "I have 60% chance of living 5 more years" (incorrect — it's conditional on surviving to 5 years)
- "60% of patients survive" (depends on stage, treatment, etc.)

**Analysis:** Survival statistics are conditional probabilities that require careful explanation.

**Recommendation:** Survival notes should:
- Specify what the statistic applies to (stage, treatment, age group)
- Distinguish overall survival from disease-specific survival
- Note conditional nature (survived X years, what's the probability of surviving Y more?)

## Summary of Medical Domain Refinements

| Seed Concept | Medical Application | Additional Requirement |
|--------------|---------------------|------------------------|
| Explicit probabilities | Always use % | Distinguish relative vs absolute |
| Use ranges when uncertain | Always include CI | Flag small sample sizes |
| Confidence markers | Use extensively | Map guideline qualifiers to confidence levels |
| Vague qualifiers | Convert to ranges | Document mapping rationale |

## Proposed Refinements to Seed Rules

### Refinement 1: Context-Specific Probability Types

**Rule:** For medical knowledge, specify whether probabilities are:
- Relative risk / absolute risk / NNT
- Population-level / individual-level
- Conditional / unconditional

**Test:** Can a reader calculate the absolute benefit/harm for a specific patient?

### Refinement 2: Confidence Interval Requirement

**Rule:** Medical statistics should include 95% confidence intervals unless:
- Sample size >1000
- Effect size is extreme (<1% or >99%)
- Note is explicitly marked as illustrative

**Test:** Is the confidence interval provided or is the note flagged as needing verification?

### Refinement 3: Guideline Qualifier Mapping

**Rule:** Map evidence level qualifiers to explicit probabilities:

| Qualifier | Approximate Probability | Confidence |
|-----------|------------------------|------------|
| "strongly recommended" | 80-95% | high |
| "recommended" | 60-80% | moderate |
| "may be considered" | 30-50% | low/emerging |
| "insufficient evidence" | unknown | disputed |

**Test:** Does each recommendation have an explicit probability or confidence marker?

## Related
- [[Confidence Markers]]
- [[Confidence Markers]]
- [[Stress Test - Probabilistic Knowledge Rule in Cooking]]
- [[Stress Test - Confidence Markers Rule in Legal Knowledge]]
- [[Frontier Exploration - Probabilistic Knowledge]]
