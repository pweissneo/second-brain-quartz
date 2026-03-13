---
last-reviewed: 2026-03-12
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

## Domain: Psychology & Therapy

### Does the Rule Make Sense?

**Partially, with major caveats.** Psychology faces unique challenges:

1. **Individual differences are the norm** — unlike medicine where population averages often apply, psychology interventions effect size varies dramatically by individual
2. **Therapy is a collaborative process** — outcome depends on therapist-client relationship, not just the technique
3. **Self-report bias** — much of psychology relies on subjective reporting
4. **Placebo effects are real** — in psychology, believing in treatment often creates real change
5. **Replication crisis** — many psychology findings haven't replicated

### Edge Cases in Psychology

#### Edge Case 1: Therapeutic Alliance

A note states: "CBT is effective for depression"

This is misleading because:
- Effect size varies enormously based on therapeutic alliance
- "Effective" could mean 50% improvement or 10%
- The note doesn't distinguish between "in research settings" vs "in practice"

**Recommendation:** Notes should specify:
- Effect size (Cohen's d)
- Context (research vs real-world)
- Therapeutic alliance as a moderator

#### Edge Case 2: Number Needed to Treat (NNT) in Therapy

A note states: "Therapy is effective for anxiety"

NNT for therapy is often ~5-7 (relatively good), but:
- "Effective" doesn't mean "cured"
- Dropout rates matter — NNH (harm) often approaches NNT
- Maintenance of gains varies

**Recommendation:** Therapy notes should include:
- NNT with confidence intervals
- Dropout rates
- Long-term follow-up data

#### Edge Case 3: Heterogeneity of Treatment Effects

A note states: "Mindfulness meditation reduces stress by 30%"

But:
- Some people benefit enormously, others not at all
- The 30% is an average — individual effects range from -10% to +80%
- Baseline matters — highly stressed people benefit more

**Recommendation:** Always note heterogeneity. "Average reduction: 30% (95% CI: 20-40%), but individual effects range widely."

#### Edge Case 4: Prevention vs Treatment

A note states: "This intervention works for preventing substance abuse"

Prevention research uses different metrics than treatment:
- Relative risk reduction vs absolute risk reduction
- Number needed to treat vs Number needed to screen
- Cost-effectiveness often matters more than efficacy

**Recommendation:** Distinguish prevention (population-level) from treatment (individual-level) notes.

#### Edge Case 5: Cultural Context

A note states: "This therapy is effective"

But:
- Most psychology research is WEIRD (Western, Educated, Industrialized, Rich, Democratic)
- Cross-cultural validity is often assumed but rarely tested
- Therapeutic approaches developed in one culture may not transfer

**Recommendation:** Notes should specify cultural applicability or note "cross-cultural data limited."

#### Edge Case 6: Dual Relationships in Therapy

This is NOT probabilistic — it's ethical, binary guidance.

**Recommendation:** Don't apply probabilistic rule to ethical guidelines. Some things are categorical.

#### Edge Case 7: Diagnostic Reliability

A note states: "This diagnostic tool has 85% accuracy"

But:
- Sensitivity and specificity matter more than accuracy
- Prevalence affects predictive values dramatically
- Inter-rater reliability varies

**Recommendation:** Report sensitivity/specificity, not just accuracy. Note the population where it was validated.

### Refinements for Psychology

1. **Always include effect size with confidence intervals**: "d = 0.45 (95% CI: 0.30-0.60)" — not just "moderately effective"

2. **Distinguish efficacy from effectiveness**: 
   - Efficacy = does it work under ideal conditions?
   - Effectiveness = does it work in practice?

3. **Report heterogeneity explicitly**: "While average effect is moderate, individual response varies significantly"

4. **Include NNT and dropout rates**: Two treatments with same effect size may have very different real-world utility

5. **Note cultural limitations**: Most psychology research is WEIRD — say so when true

6. **Distinguish statistical significance from clinical significance**: p < 0.05 doesn't mean "works"

7. **For binary outcomes (diagnosis, presence/absence)**: Use sensitivity/specificity with prevalence context

### What NOT to Make Probabilistic in Psychology

- Ethical guidelines (dual relationships, confidentiality)
- Diagnostic criteria (they're categorical by definition)
- Professional boundaries
- Mandatory reporting laws

### Comparison: Psychology vs Medicine

| Aspect | Medicine | Psychology |
|--------|----------|------------|
| Outcome measures | Often objective (death, disease) | Often subjective (self-report) |
| Placebo effect | Significant | Often dominant |
| Individual variation | Moderate | Extreme |
| Replication | Generally good | Often poor |
| Cultural context | Less critical | Often critical |

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
- [[Stress Test - Source Quality Hierarchy in Medical Knowledge]] — Similar domain stress test
