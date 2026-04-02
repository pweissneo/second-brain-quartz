---
last-reviewed: 2026-04-01
last-updated: 2026-04-01
lifecycle: seed-refinement
confidence: high
author-type: ai-assisted
tags:
  - seed-refinement
  - knowledge-source-type
  - domain-adaptation
  - cross-domain
schema-version: "1.0"
related-seed-rules:
  - knowledge-source-type
  - evidence-tier
x-merged-from:
  - Seed Refinement - Knowledge Source Type Domain Adaptation.md
  - Seed Refinement - Knowledge Source Type Medical Domain Extensions.md
x-merge-date: 2026-04-01
x-merge-reason: REDUNDANCY_SCAN - duplicate coverage of same Seed rule for different domains
---

# Seed Refinement: Knowledge Source Type — Cross-Domain Extensions

> Proposed refinements to the "knowledge source type" rule based on stress testing across multiple domains (cooking, medical).
> Date: 2026-04-01
> Status: Merged from domain-specific refinements into unified cross-domain guidance.

---

## Summary

Stress testing the knowledge source type rule across multiple domains (cooking, medical) revealed that the base categories (intuition, analysis, authority, experiment) don't adequately handle domain-specific knowledge patterns. This note consolidates refinements from multiple domain stress tests into unified cross-domain guidance.

---

## The Seed Rule Under Refinement

**Rule:** Track knowledge source type to enable source-appropriate verification and weighting — distinguish knowledge derived from intuition (pattern recognition, expert tacit), analysis (statistical, deductive), authority (trusted sources), and direct experiment.

**Test:** For key knowledge notes used in decisions: (1) Can you identify the source type? (2) Is the source type appropriate for the domain? (3) Does verification method match the source type?

---

## Cross-Domain Refinements

### Refinement 1: Intuition Source Distinction

**Problem:** Intuition operates differently across domains. The rule uses `intuition-type: pattern-recognition|expert-tacit|gut-feeling` but:
- In medical: clinician pattern recognition (thousands of cases) differs from patient intuition
- In cooking: professional tasters/sommeliers have trained sensory expertise distinct from "gut feeling"
- General intuition (gut feeling) should have low credibility in high-stakes domains

**Proposed refinement:** Add `intuition-source:` field:
```yaml
intuition-source: clinician|patient|researcher|layperson|sensory-trained
intuition-type: pattern-recognition|expert-tacit|gut-feeling
```

**Domain-specific defaults:**
- Medical vaults: `intuition-source: clinician`, `intuition-type: expert-tacit`
- Culinary vaults: `intuition-source: sensory-trained`, `intuition-type: expert-tacit`
- General: `intuition-source: layperson`, `intuition-type: pattern-recognition|gut-feeling`

---

### Refinement 2: Authority Source Refinement

**Problem:** "Authority" means different things across domains:
- Cooking: traditional (generational wisdom, classical techniques) vs. evidence-based (modern testing)
- Medical: different authority bodies may conflict (WHO vs AHA), with different jurisdictions
- General: institutional authority vs. recognized expert vs. publication

**Proposed refinement:** Extend authority tracking:
```yaml
authority-type: expert|publication|institution|traditional
authority-subtype: traditional|evidence-based|scientific  # for cooking
authority-jurisdiction: international|national|regional  # for medical/legal
authority-strength: strong|moderate|conditional
authority-provenance: personal-collection|adapted|from-source  # for culinary
```

---

### Refinement 3: Experiment Context Realism

**Problem:** Different domains have different experiment rigor:
- Academic: controlled/field/observational research
- Home cooking: ad-hoc trial-and-error (single trial, no comparison, subjective)
- Personal medical: N=1 with specific biases (duration, sample size, control conditions)
- DIY/home repair: "what worked for me" experiments

**Proposed refinement:** Use `experiment-context` with flexible values:
```yaml
experiment-context: controlled|field|observational|uncontrolled|n-of-1
# uncontrolled = single trial, no comparison, subjective assessment
# n-of-1 = personal tracking data with specific biases

# For n-of-1 experiments:
n: 1
duration-days: 90
self-reported: true  # for personal tracking
```

---

### Refinement 4: Traditional Knowledge Category

**Problem:** "Grandmother knowledge" — oral tradition passed through generations without written source. Neither authority (no publication) nor intuition (not individual pattern recognition).

**Proposed refinement:** Add new source type for traditional knowledge:
```yaml
knowledge-source-type: traditional
traditional-source: family|cultural|regional
provenance: oral-history
```

**Applies to:** Traditional cooking recipes, gardening wisdom, craft techniques passed through generations, home remedies.

---

### Refinement 5: Preference vs. Knowledge Distinction

**Problem:** Some domains (especially creative/cooking) contain significant "knowledge" that's actually personal preference ("I prefer lemon over lime") or preference-calibration ("X is too salty for most people").

**Proposed refinement:** Add `knowledge-category` field:
```yaml
knowledge-category: preference|fact|technique|preference-calibration
# preference = "I like X" (not verifiable)
# fact = "X is Y" (verifiable)
# technique = "how to do X" (procedural)
# preference-calibration = "X is too salty for most people" (aggregated preference)
```

---

### Refinement 6: Mixed Source Knowledge

**Problem:** Knowledge often combines multiple sources: "Based on clinical experience (intuition) AND supported by a 2023 meta-analysis (analysis)." Simple single-source tracking fails here.

**Proposed refinement:** Allow multiple source types per note:
```yaml
source-types:
  - type: intuition
    subtype: expert-tacit
    source: clinical-experience
  - type: analysis
    subtype: meta-analysis
    source: "2023 JAMA review"
```

**Required for:** High-stakes domains (medical, legal, financial) where knowledge derives from multiple sources.

---

## Domain-Specific Application Guide

### High-Stakes Domains (Medical, Legal, Financial, Safety-Critical)

**Required fields:**
- `intuition-source:` (distinguish clinician/patient/researcher/layperson)
- `authority-jurisdiction:` and `authority-strength:`
- Allow multiple source types per note

**Verification:** Source verification is necessary but insufficient — may need empirical, drill, or tool-dependent verification.

### Experiential Domains (Cooking, Gardening, Crafts, Home Repair)

**Recommended fields:**
- `authority-subtype:` (traditional|evidence-based|scientific)
- `experiment-context: uncontrolled` for home experiments
- `knowledge-category:` to distinguish fact from preference
- `traditional-source:` for generational knowledge

**Key insight:** These domains have weak evidence bases and rely on traditional/experiential authority, not scientific authority.

### Creative Domains (Writing, Design, Art)

**Recommended fields:**
- `knowledge-category:` (preference vs. technique vs. fact)
- `experiment-context:` for iterative testing
- Track empirical validation separately from source verification

---

## Revised Test for the Seed

The test should be expanded to:

1. Can you identify the source type(s)?
2. Is the appropriate sub-type included?
3. Does verification method match source type?
4. For "experiment" notes, is experiment context realistic (not overclaiming rigor)?
5. For "intuition" notes, is intuition-source specified?
6. For high-stakes domains: Are multiple source types documented when applicable?
7. Is this really "knowledge" or preference?

---

## Cross-Domain Applicability

These refinements apply across domains with different emphasis:

| Refinement | Cooking | Medical | Creative | Crafts |
|------------|---------|---------|----------|--------|
| Intuition Source | sensory-trained | clinician | layperson | expert-tacit |
| Authority Type | traditional, evidence-based | institution, publication | expert | traditional |
| Experiment Context | uncontrolled | n-of-1 | uncontrolled | uncontrolled |
| Traditional Knowledge | family recipes | N/A | oral traditions | guild knowledge |
| Knowledge Category | preference-calibration | fact | preference | technique |
| Multiple Sources | optional | required | optional | optional |

---

## Seed Update Recommendation

**Rule (REFINED):** Track knowledge source type with domain-specific refinement — use `intuition-source:` to distinguish between clinician, patient, researcher, layperson, and sensory-trained intuition; use `authority-type:`, `authority-subtype:`, `authority-jurisdiction:`, and `authority-strength:` for authority sources; use `experiment-context:` and `n:` for experiments. For domains with weak evidence bases, use `knowledge-source-type: traditional` with `traditional-source:` and `provenance:`. For high-stakes domains, allow multiple source types per note.

**Why:** Source type credibility varies by domain. Medical intuition (trained pattern recognition) differs from culinary intuition (trained palate) and general intuition (gut feeling). Authority sources from different domains have different meanings. Experiential domains have different experiment rigor than academic domains. Traditional knowledge doesn't fit the binary authority/intuition split.

**Test (REFINED):** For each note:
1. Can you identify the source type(s)?
2. For intuition: Is `intuition-source:` specified appropriately?
3. For authority: Are appropriate refinements included (subtype, jurisdiction, strength)?
4. For experiment: Is `experiment-context:` realistic for the domain?
5. For traditional knowledge: Is `traditional-source:` and `provenance:` specified?
6. For creative/preference-heavy domains: Is `knowledge-category:` used?
7. For high-stakes domains: Are multiple source types documented when applicable?

---

## Related Notes

- [[Seed Stress Test - Knowledge Source Type Rule in Cooking]]
- [[Seed Stress Test - Knowledge Source Type Rule in Medical Domain]]
- [[Seed Stress Test - Source Reliability vs Verification in Medical Domain]]
- [[AI-Assisted Knowledge Management Seed]]
- [[Frontier Exploration - Domain-Specific Knowledge Bases]]
- [[Frontier Exploration - Knowledge Provenance Chains]]
- [[Confidence Markers]]