---
last-reviewed: 2026-04-05
last-updated: 2026-04-05
lifecycle: seed-refinement
confidence: emerging
author-type: ai-assisted
knowledge-type: meta
access-pattern: decision
tags:
  - seed-refinement
  - stress-test
  - domain-calibration
  - diminishing-returns
---

# Seed Refinement: Domain-Aware Diminishing Returns Testing

**Date:** 2026-04-05
**Method:** SEED_STRESS_TEST
**Domains Tested:** Gardening, Cooking, Pottery, Philosophy

---

## Summary

The diminishing returns test assumes a universal threshold (utility + connection + uniqueness + effort), but stress testing reveals that different domains have fundamentally different utility characteristics that affect how diminishing returns should be calculated.

---

## Key Finding: Domain Calibration Factors

### Factor 1: Context-Dependence

**Evidence:** Gardening stress test showed that general advice without personal adaptation has limited practical value. Advice from one climate zone fails in another.

**Implication:** The utility test needs to weight context-specific adaptation higher in high context-dependence domains.

**Modified test for high context-dependence:**
- Utility score = generic utility × context-specific adaptation factor
- If note lacks YOUR specific context factors → utility = limited

### Factor 2: Embodied Knowledge Spectrum

**Evidence:** Pottery stress test showed that `embodied-component: essential` covers fundamentally different knowledge types (describable recipe vs. non-describable feel).

**Implication:** Diminishing returns testing should treat embodied knowledge differently — value comes from capturing sensory anchors, not from completeness that can't be achieved textually.

**Modified test for embodied knowledge:**
- For tactile-kinesthetic knowledge: Does note include sensory anchors? (that's the value)
- For recipe/material knowledge: Standard diminishing returns applies
- Don't penalize "incomplete" descriptions of non-describable knowledge

### Factor 3: Verification Mode Differences

**Evidence:** Cooking stress test showed source verification ≠ execution verification. A recipe can pass source check but fail in practice.

**Implication:** In experiential domains, diminishing returns should NOT reject based on paper assessment when hands-on execution may reveal value.

**Modified test for experiential domains:**
- If execution-uncertainty is high → capture with unverified status
- Prioritize testing over passive rejection
- Don't reject at paper level what practice might reveal

---

## Proposed Seed Update

Add a new domain-calibration section to the diminishing returns rule:

> **Rule (NEW - 2026-04-05):** Apply domain-aware diminishing returns testing — calibrate evaluation criteria based on domain characteristics.
>
> **Why:** Universal diminishing returns thresholds fail across domains with different context-dependence, embodied knowledge types, and verification modes. A one-size-fits-all test produces false positives in some domains and false negatives in others.
>
> **Test:** For each domain in the vault, can you identify its calibration factors?
>
> **Domain Calibration Framework:**
>
> | Factor | Low-Domain | High-Domain | Test Modification |
> |--------|------------|-------------|-------------------|
> | Context-Dependence | Philosophy, Math | Gardening, Medical | Weight context-specific adaptation |
> | Embodied Knowledge | Factual, Procedural | Cooking, Pottery, Crafts | Value sensory anchors, not completeness |
> | Verification Mode | Source-check sufficient | Execution required | Don't reject at paper level |
> | Temporal Sensitivity | Stable (years) | Fast-changing (weeks) | Shorten utility horizon |
>
> **Implementation:**
> ```yaml
> domain-calibration:
>   context-dependence: low|medium|high
>   embodied-spectrum: none|tactile-only|tactile-kinesthetic|auditory-interpretive
>   verification-mode: source|execution|drill
>   temporal-utility: years|months|weeks
> ```
>
> **Stakes-aware application:**
> - High-stakes domains (medical, safety): Override based on criticality, not diminishing returns
> - Experiential domains: Capture with execution-required verification
> - Fast-moving domains: Apply shorter utility horizons

---

## Related Seed Rules

- [[Seed Refinement - Context-Dependence Utility Calibration]] — Integration of gardening insight
- [[Seed Refinement - Embodied Knowledge Spectrum]] — Extended embodied knowledge typing
- [[Seed Refinement - Fitness Verification Timeline Integration]] — Verification mode differences
- [[Seed Stress Test - 5-1 Ratio in Gardening]] — Context-dependence evidence
- [[Seed Stress Test - Gap Identification Rule in Cooking]] — Embodied gap detection

---

## Gap Status

This refinement proposes a new Seed rule for domain-aware diminishing returns testing. The individual components (context-dependence, embodied spectrum, verification modes) have been tested in individual stress tests. This note synthesizes them into unified guidance.