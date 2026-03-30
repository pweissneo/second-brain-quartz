---
last-reviewed: 2026-03-29
lifecycle: seed-refinement
confidence: emerging
author-type: ai-assisted
tags:
  - seed-refinement
  - source-type
  - medical-domain
  - intuition
  - authority
related-seed_rules: knowledge-source-type-tracking
---

# Seed Refinement: Knowledge Source Type Edge Cases - Medical Domain

## Current Seed Rule

**Rule:** Track knowledge source type to enable source-appropriate verification and weighting.
**Why:** Source type directly affects how much trust to place in knowledge and what verification methods are appropriate.
**Test:** Can you identify the source type? Is the source type appropriate for the domain? Does verification method match the source type?

## Stress Test Finding

Testing against the medical domain revealed the rule is incomplete for domains where:

1. Source type has life-or-stakes implications
2. Authority sources from different bodies may conflict
3. Intuition operates differently (trained pattern recognition vs. gut feeling)
4. Personal experimentation carries specific risks/biases

## Edge Cases Identified

### Edge Case 1: Intuition Source Distinction

The rule uses `intuition-type: pattern-recognition|expert-tacit|gut-feeling` but medical intuition is fundamentally different:

- **Clinician pattern recognition** — thousands of cases, trained observation
- **Clinician tacit knowledge** — unconscious expertise that's hard to articulate
- **Patient self-reported intuition** — fundamentally different from clinician intuition
- **Gut feeling** — should have low credibility in medical contexts

**Recommendation:** Add `intuition-source:` field:
```yaml
intuition-source: clinician|patient|researcher|layperson
intuition-type: pattern-recognition|expert-tacit|gut-feeling
```

For medical vaults, `intuition-source: clinician` and `intuition-type: expert-tacit` should be the default for physician knowledge.

### Edge Case 2: Authority Source Refinement

When different authority bodies issue conflicting guidelines (WHO vs AHA), both are "authority" sources but have different contexts:

- Authority jurisdiction (international, national, regional)
- Authority recency (guidelines update frequently)
- Authority applicability (general vs. population-specific)

**Recommendation:** Extend authority-type:
```yaml
authority-type: expert|publication|institution
authority-jurisdiction: international|national|regional
authority-strength: strong|moderate|conditional
```

### Edge Case 3: Personal Medical Experimentation

Self-tracking data (blood glucose, sleep patterns) is "experiment" but N=1 with specific biases:

- Sample size documentation
- Duration of observation
- Control conditions

**Recommendation:** Add experiment context:
```yaml
experiment-context: controlled|field|observational
n: 1
duration-days: 90
self-reported: true
```

### Edge Case 4: Mixed Source Knowledge

Medical knowledge often combines multiple sources: "Based on clinical experience (intuition) AND supported by a 2023 meta-analysis (analysis)."

**Recommendation:** Allow multiple source types per note:
```yaml
source-type:
  - type: intuition
    subtype: expert-tacit
    source: clinical-experience
  - type: analysis
    subtype: meta-analysis
    source: "2023 JAMA review"
```

## Seed Update Proposal

**Rule (REFINED):** Track knowledge source type with domain-specific refinement — use `intuition-source:` to distinguish between clinician, patient, researcher, and layperson intuition; use `authority-jurisdiction:` and `authority-strength:` for authority sources; use `experiment-context:` and `n:` for personal experiments. For domains with life-or-stakes implications, allow multiple source types per note.

**Why:** Source type credibility varies by domain. Medical intuition (trained pattern recognition) differs from general intuition (gut feeling). Authority sources from different jurisdictions may conflict. Personal medical experiments have specific biases. The original rule doesn't capture these distinctions.

**Test (REFINED):** For each note:
1. Can you identify the source type(s)?
2. For intuition: Is `intuition-source:` specified (clinician|patient|researcher|layperson)?
3. For authority: Is `authority-jurisdiction:` and `authority-strength:` specified?
4. For experiment: Is `n:` and `experiment-context:` specified?
5. For high-stakes domains: Are multiple source types documented when applicable?

**Implementation:** Add fields to frontmatter for domain-specific refinement. These fields are optional in generic vaults but recommended in high-stakes domains (medical, legal, financial, safety-critical).

## See Also

- [[Seed Stress Test - Knowledge Source Type Rule in Medical Domain]]
- [[Seed Stress Test - Source Reliability vs Verification in Medical Domain]]
- [[Confidence Markers]]
- [[Frontier Exploration - Knowledge Provenance Chains]]
