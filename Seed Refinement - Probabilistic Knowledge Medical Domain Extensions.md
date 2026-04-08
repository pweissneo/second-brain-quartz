---
last-reviewed: 2026-04-08

last-updated: 2026-04-02
lifecycle: seed-refinement
confidence: high
author-type: ai-assisted
tags:
  - seed-refinement
  - probabilistic-knowledge
  - medical
  - confidence-intervals
  - domain-extension
verification-status: proposed
schema-version: "1.0"
---

# Seed Refinement: Probabilistic Knowledge - Medical Domain Extensions

> Edge cases and refinements for the probabilistic knowledge rule when applied to medical and health knowledge bases.

## The Seed Rule (Reference)

**Rule:** Express probabilistic knowledge with explicit probabilities, not vague qualifiers like "usually" or "sometimes".

**Why:** Vague language misleads — "usually works" means different things to different people. Explicit probabilities enable proper weighting and decision-making.

**Test:** Can you assign a numerical probability to the claim? Is it expressed numerically rather than with vague qualifiers?

## Gap: Medical Domain Not Covered

The current Seed rule does not address domain-specific nuances in medical knowledge bases. The stress test at [[Seed Stress Test - Probabilistic Knowledge Rule Across Domains]] identified significant edge cases that the Seed should cover.

## Refinements for Medical Knowledge

### 1. Distinguish Binary from Probabilistic

**Rule:** Do not express safety-critical medical guidance as probabilistic — use binary (pass/fail) language.

**Why:** Food safety rules ("cook chicken to 165°F") and critical contraindications are not probabilistic. Representing them as probabilities implies uncertainty that doesn't exist and could lead to dangerous decisions.

**Test:** For medical notes: (1) Is this safety-critical guidance (food safety, contraindications, emergency protocols)? (2) If yes, is it expressed as binary pass/fail rather than probability? (3) Does safety-critical guidance avoid vague qualifiers like "usually" or "typically"?

**Example:**
- ❌ "Chicken is usually safe at 160°F" — dangerous
- ✅ "Cook chicken to 165°F (minimum)" — correct binary

### 2. Specify Relative vs Absolute Risk

**Rule:** When expressing risk reduction, specify whether it is relative risk reduction (RRR) or absolute risk reduction (ARR).

**Why:** A claim that "treatment reduces risk by 25%" could mean 25% RRR (significant) or 25% ARR (often small). Without specification, readers cannot properly weight the information.

**Test:** For risk reduction claims: (1) Is there explicit "relative risk reduction" or "absolute risk reduction" labeling? (2) If not, can you calculate ARR from the given data (baseline risk × RRR)?

**Example:**
- ❌ "Statins reduce cardiovascular events by 25%" — ambiguous
- ✅ "Statins reduce cardiovascular events by 25% relative risk reduction (1.5% absolute risk reduction from 6% to 4.5%)" — complete

### 3. Include Confidence Intervals

**Rule:** For medical statistics based on sample sizes <1000, include 95% confidence intervals.

**Why:** Point estimates without intervals give false precision. A "70% success rate" with CI 55-82% is very different from one with CI 68-72%.

**Test:** For medical intervention claims: (1) Is sample size provided or determinable? (2) If <1000, is a 95% CI included? (3) Are CIs used for clinical decision-making rather than just point estimates?

**Edge case:** For very large studies (>10,000 subjects), CIs may be omitted if the CI is narrow (<5% width).

### 4. Include Number Needed to Treat (NNT)

**Rule:** For treatment efficacy claims, include NNT (Number Needed to Treat) or equivalent metric.

**Why:** "Effective" is vague. NNT = 20 means for every 20 patients treated, 1 additional patient benefits compared to control. This is more interpretable than abstract percentages.

**Test:** For treatment efficacy notes: (1) Is NNT provided? (2) If not, can it be calculated (100/ARR)? (3) Is NNT accompanied by time horizon (NNT at 1 year, 5 years, etc.)?

**Example:**
- ❌ "This treatment is effective" — meaningless
- ✅ "NNT = 15 at 5 years (one additional patient benefits per 15 treated)" — actionable

### 5. Use Ranges When Uncertainty Is Inherent

**Rule:** For medical claims where uncertainty is inherent, express as ranges rather than point estimates.

**Why:** Many medical outcomes have natural variation. Expressing as single numbers implies false precision.

**Test:** For probabilistic medical claims: (1) Is uncertainty expressed as "60-80%" or confidence interval? (2) Is the range based on actual data (CI) or acknowledged approximation? (3) Is the range width appropriate to the evidence strength?

## Test Criteria for Medical Knowledge

- [ ] Safety-critical guidance uses binary language (not probabilistic)
- [ ] Risk reduction claims specify relative vs absolute
- [ ] Statistics from sample sizes <1000 include 95% CI
- [ ] Treatment efficacy includes NNT or equivalent
- [ ] Uncertain values use ranges rather than point estimates

## What NOT to Make Probabilistic in Medical Context

- Diagnostic criteria (categorical by definition)
- Safety thresholds (binary pass/fail)
- Ethical guidelines (not probabilistic)
- Contraindications (categorical)

## Related

- [[Seed Stress Test - Probabilistic Knowledge Rule Across Domains]] — Full stress test
- [[Seed Stress Test - Source Quality Hierarchy in Medical Knowledge]] — Related medical domain testing
- [[Confidence Markers]] — For expressing uncertainty without numbers
- [[Frontier Exploration - Probabilistic Knowledge]] — Related frontier exploration