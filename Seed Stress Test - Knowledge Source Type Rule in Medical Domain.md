---
last-reviewed: 2026-03-22
last-updated: 2026-03-22
confidence: high
author-type: ai-assisted
lifecycle: evergreen
test-type: stress-test
test-date: 2026-03-22
seed-rule: "Rule (NEW - 2026-03-22): Track knowledge source type to enable source-appropriate verification and weighting"
test-domain: medical
---

# Seed Stress Test: Knowledge Source Type Rule in Medical Domain

## Does the Rule Make Sense for This Domain?

**Yes, strongly.** Medical knowledge has distinct source types that require different verification approaches:

- **Intuition**: Clinical pattern recognition from years of patient care (different from "gut feeling")
- **Analysis**: Evidence synthesis from clinical trials, epidemiological studies
- **Authority**: Clinical guidelines from professional bodies (AMA, AHA, WHO)
- **Experiment**: Personal n=1 experiments, self-tracking data, anecdotal trials

The rule is highly relevant because medical knowledge has life-or-stakes implications and source type directly affects how much trust to place in it.

## Is the Test Executable?

**Partially.** The Test asks:
1. Can you identify the source type?
2. Is the source type appropriate for the domain?
3. Does verification method match the source type?

**Challenge**: Medical knowledge often combines multiple sources. A note might say "Based on clinical experience (intuition) AND supported by a 2023 meta-analysis (analysis)." The rule doesn't address multi-source knowledge.

**Challenge**: "Expert intuition" in medicine is different from general intuition - it's pattern recognition from thousands of cases, not a vague "gut feeling." The rule's intuition types (`pattern-recognition|expert-tacit|gut-feeling`) need medical-specific guidance:
- `expert-tacit` should default for physician clinical knowledge
- `pattern-recognition` applies to specific clinical patterns
- `gut-feeling` should have low credibility in medical contexts

## Edge Cases Found

### Edge Case 1: Intuition from Patient Narrative vs. Physician Intuition

A patient documenting their own symptom patterns is "intuition" but fundamentally different from physician clinical intuition. The rule should distinguish:
- `intuition-type: patient-experience` (self-reported patterns)
- `intuition-type: clinician-pattern-recognition` (trained observation)
- `intuition-type: clinician-tacit` (unconscious expertise)

**Recommendation**: Add `intuition-source:` field with values `patient|clinician|researcher|layperson`

### Edge Case 2: Authority Conflicts (Different Guidelines)

When WHO guidelines disagree with AHA guidelines, both are "authority" sources but have different contexts. The rule should track:
- Authority jurisdiction (international, national, regional)
- Authority recency (guidelines update frequently)
- Authority applicability (general vs. population-specific)

**Recommendation**: Add to authority-type:
```yaml
authority-type: expert|publication|institution
authority-jurisdiction: international|national|regional
authority-strength: strong|moderate|conditional
```

### Edge Case 3: Personal Medical Experiments

Self-tracking data (blood glucose, sleep patterns, symptom logs) is "experiment" but N=1 and potentially biased. The rule needs:
- Sample size documentation
- Duration of observation
- Control conditions (self vs. uncontrolled)

**Recommendation**: Add experiment context:
```yaml
experiment-context: controlled|field|observational
n: 1  # number of subjects
duration-days: 90
self-reported: true
```

### Edge Case 4: Mixed Source Knowledge

Most clinical knowledge combines sources. A note might be "Clinical observation (intuition) confirmed by case studies (authority) and my own tracking data (experiment)."

**Recommendation**: Allow multiple source types with primary/secondary weighting:
```yaml
knowledge-source-type: experiment
knowledge-source-type-secondary: authority
source-weighting: primary|secondary
```

### Edge Case 5: Verification Mismatch

In medical domain, verification method MUST match source type:
- Intuition → requires outcome tracking (did the clinical prediction prove accurate?)
- Analysis → requires methodological review (study quality, sample size, bias)
- Authority → requires currency check (guidelines update frequently)
- Experiment → requires replication (can others reproduce?)

**Recommendation**: Add `verification-method-matches-source:` boolean field and flag mismatches.

## Test Refinements

The Test should include medical-specific criteria:

1. **For intuition notes**: Can you trace the pattern recognition to specific cases? Is the clinician's experience level documented?

2. **For analysis notes**: Is the study quality assessed (RCT vs. observational)? Is the population applicable to the user's context?

3. **For authority notes**: Are guidelines current (checked within 2 years)? Do they apply to the user's demographic?

4. **For experiment notes**: Is sample size sufficient for generalization? Are confounders acknowledged?

## See Also

- [[Seed Stress Test - Source Reliability vs Verification in Medical Domain]]
- [[Frontier Exploration - Intuition vs Analysis Knowledge]]
- [[Seed Stress Test - Embodied Knowledge Rule]] (for tactile/clinical examination knowledge)
