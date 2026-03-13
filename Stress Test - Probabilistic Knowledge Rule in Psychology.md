---
last-reviewed: 2026-03-12
lifecycle: active
confidence: emerging
tags:
  - seed-stress-test
  - probabilistic-knowledge
  - psychology
  - edge-case
---

# Stress Test: Probabilistic Knowledge Rule in Psychology

> Testing the Seed's probabilistic knowledge rule in psychology/therapy domain — where outcome probabilities are often misunderstood, individual differences dominate, and the rule needs significant refinement.

## The Seed Rule

**Rule:** Express probabilistic knowledge with explicit probabilities, not vague qualifiers like "usually" or "sometimes".

**Why:** Vague language misleads — "usually works" means different things to different people. Explicit probabilities enable proper weighting and decision-making.

**Test:** Can you assign a numerical probability to the claim? Is it expressed numerically rather than with vague qualifiers?

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

---

## Refinements for Psychology

### Rule Modification

**Original rule:** Express probabilistic knowledge with explicit probabilities.

**Refined for psychology:**

1. **Always include effect size with confidence intervals**: "d = 0.45 (95% CI: 0.30-0.60)" — not just "moderately effective"

2. **Distinguish efficacy from effectiveness**: 
   - Efficacy = does it work under ideal conditions?
   - Effectiveness = does it work in practice?

3. **Report heterogeneity explicitly**: "While average effect is moderate, individual response varies significantly"

4. **Include NNT and dropout rates**: Two treatments with same effect size may have very different real-world utility

5. **Note cultural limitations**: Most psychology research is WEIRD — say so when true

6. **Distinguish statistical significance from clinical significance**: p < 0.05 doesn't mean "works"

7. **For binary outcomes (diagnosis, presence/absence)**: Use sensitivity/specificity with prevalence context

### What NOT to Make Probabilistic

- Ethical guidelines (dual relationships, confidentiality)
- Diagnostic criteria (they're categorical by definition)
- Professional boundaries
- Mandatory reporting laws

---

## Comparison: Psychology vs Medicine

| Aspect | Medicine | Psychology |
|--------|----------|------------|
| Outcome measures | Often objective (death, disease) | Often subjective (self-report) |
| Placebo effect | Significant | Often dominant |
| Individual variation | Moderate | Extreme |
| Replication | Generally good | Often poor |
| Cultural context | Less critical | Often critical |

---

## Test Refinement

**Original test:** Can you assign a numerical probability to the claim? Is it expressed numerically rather than with vague qualifiers?

**Refined test for psychology:**

1. Does the note report effect size (Cohen's d, odds ratio, etc.)?
2. Are confidence intervals included?
3. Is heterogeneity acknowledged?
4. Does the note distinguish efficacy from effectiveness?
5. Are dropout/completion rates reported?
6. Is cultural applicability addressed?
7. For ethical statements: Is the rule correctly NOT applied (they're categorical)?

---

## Related

- [[Frontier Exploration - Probabilistic Knowledge]] — Related frontier exploration
- [[Stress Test - Source Quality Hierarchy in Medical Knowledge]] — Similar domain, similar challenges
- [[Confidence Markers]] — Alternative way to express uncertainty
- [[Expertise-Level Dependent Knowledge]] — Psychology varies by client expertise too
- [[Knowledge-Type Rule in Investing]] — Another domain with subjective/objective mix
