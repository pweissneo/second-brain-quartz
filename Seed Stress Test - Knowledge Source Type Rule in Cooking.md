---
last-reviewed: 2026-03-24
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
tags:
  - seed-stress-test
  - knowledge-source-type
  - cooking-domain
schema-version: "1.0"
---

# Seed Stress Test: Knowledge Source Type Rule in Cooking

> Testing the "Knowledge Source Type" rule in cooking domain.
> Related: [[AI-Assisted Knowledge Management Seed]], [[Seed Stress Test - Knowledge Source Type Rule in Medical Domain]]

**Date:** 2026-03-24  
**Domain:** Cooking  
**Rule Tested:** Track knowledge source type to enable source-appropriate verification and weighting.

---

## The Rule Under Test

**From Seed (2026-03-22):** Track knowledge source type to enable source-appropriate verification and weighting — distinguish knowledge derived from intuition (pattern recognition, expert tacit), analysis (statistical, deductive), authority (trusted sources), and direct experiment.

**Implementation:**
```yaml
knowledge-source-type: intuition|analysis|authority|experiment
intuition-type: pattern-recognition|expert-tacit|gut-feeling  # for intuition
analysis-type: statistical|deductive|comparative  # for analysis
authority-type: expert|publication|institution  # for authority
experiment-context: controlled|field|observational  # for experiment
```

**Source-appropriate verification:**
- **Intuition**: Verify through real-world outcomes, not source citation
- **Analysis**: Verify through methodology review, reproducibility, sensitivity testing
- **Authority**: Verify through source credibility assessment and citation cross-check
- **Experiment**: Verify through replication and effect size confirmation

**Test:** For key knowledge notes used in decisions: (1) Can you identify the source type? (2) Is the source type appropriate for the domain? (3) Does verification method match the source type?

---

## Stress Test: Applying to Cooking

### Category Analysis in Cooking

| Source Type | Cooking Examples | Verification Challenge |
|-------------|------------------|------------------------|
| **Authority** | Cookbooks, chef tutorials, culinary school教材 | Many "authorities" are tradition-based, not evidence-based |
| **Experiment** | Recipe development, technique testing | Home cooks rarely do controlled experiments |
| **Intuition** | Chef's "feel" for timing, seasoning | Tacit knowledge hard to verify |
| **Analysis** | Scientific cooking (molecular gastronomy) | Applies mainly to modernist cuisine |

---

## Edge Cases Identified

### Edge Case 1: Traditional Authority vs. Evidence Authority

**Problem:** Much of cooking "authority" is traditional — generational wisdom, classical techniques passed down through generations. This is fundamentally different from scientific authority (peer-reviewed research).

**Example:** "Never wash mushrooms" — presented as authoritative, but actually tradition (prevents water absorption) vs. scientific fact.

**Test Failure:** The rule assumes authority means credible institutional source. In cooking, "authority" often means "traditional/established practice" without scientific validation.

**Proposed Refinement:** Add `authority-subtype:` to distinguish:
```yaml
knowledge-source-type: authority
authority-type: expert  # Professional chef, recognized authority
authority-subtype: traditional|evidence-based|scientific
# Traditional = handed down, unverified by modern standards
# Evidence-based = verified through testing
# Scientific = peer-reviewed or experimentally validated
```

---

### Edge Case 2: Uncontrolled Personal Experiment

**Problem:** Home cooks frequently develop recipes through personal experimentation, but this is NOT "controlled" or even "field" experimentation — it's ad-hoc trial-and-error with N=1.

**Example:** "I added more garlic and it tasted better" — this is logged as "experiment" but verification context is "observational" at best.

**Test Failure:** The experiment-context values (controlled, field, observational) assume some rigor. Cooking at home is often "uncontrolled ad-hoc" — no documentation, single trial, no comparison.

**Proposed Refinement:** Add `experiment-context: uncontrolled` for home cooking experiments:
```yaml
knowledge-source-type: experiment
experiment-context: uncontrolled  # NEW - ad-hoc home cooking
experiment-notes: "Single trial, no comparison, subjective assessment"
```

---

### Edge Case 3: Sensory Intuition (Palate Authority)

**Problem:** Professional tasters, sommeliers, food critics have expertise based on extensive sensory experience — this is pattern recognition but also something like "sensory authority" that doesn't fit existing categories.

**Example:** "A chef can tell if a sauce is properly seasoned by the look of it" — is this intuition (expert tacit) or a different category?

**Test Failure:** The intuition types (pattern-recognition, expert-tacit, gut-feeling) don't capture "trained sensory expertise" which is a distinct type.

**Proposed Refinement:** Add `intuition-type: sensory-trained`:
```yaml
knowledge-source-type: intuition
intuition-type: sensory-trained  # NEW - trained palate/sensory expertise
# Distinguishes: "trained expert" from "general gut feeling"
```

---

### Edge Case 4: Recipe Provenance as Authority

**Problem:** Recipes are often attributed to chefs or cuisines as "authority" — but the actual source is often unclear. Is "Julia Child's Beef Bourguignon" authoritative because of Julia Child (person) or the recipe's origin (French tradition)?

**Test Failure:** The authority-type values (expert, publication, institution) don't capture "provenance" — where a recipe ultimately comes from.

**Proposed Refinement:** Add `authority-provenance:`:
```yaml
knowledge-source-type: authority
authority-type: publication
authority-provenance: personal-collection|adapted|from-source
# personal-collection = your family recipes
# adapted = modified from another source
# from-source = directly from originator
```

---

### Edge Case 5: "Grandmother Knowledge" — Oral Tradition

**Problem:** Much cooking knowledge exists only in oral tradition — passed down through generations without any written source. This is neither "authority" (no publication) nor "intuition" (not individual pattern recognition) — it's collective traditional knowledge.

**Example:** "My grandmother always added a pinch of baking soda to tomato sauce" — source is "oral tradition" which doesn't fit.

**Test Failure:** No category for collective/traditional knowledge that's not attributable to a specific source.

**Proposed Refinement:** Add `knowledge-source-type: traditional`:
```yaml
knowledge-source-type: traditional  # NEW - oral/generational knowledge
traditional-source: family|cultural|regional
provenance: oral-history  # passed down without documentation
```

---

### Edge Case 6: Preference vs. Knowledge

**Problem:** Cooking contains a lot of "knowledge" that's actually personal preference — "I prefer lemon over lime" or "I don't like cilantro." This isn't really "knowledge" in the verifiable sense, but it IS part of a cooking knowledge base.

**Test Failure:** The rule assumes all captured content is "knowledge." In cooking, a significant portion is preference that doesn't have a "source type" in the traditional sense.

**Proposed Refinement:** Add knowledge category distinction:
```yaml
knowledge-category: preference|fact|technique|preference-calibration
# preference = "I like X"
# fact = "X is Y" (verifiable)
# technique = "how to do X"
# preference-calibration = "X is too salty for most people"
```

---

## Revised Test for Cooking Domain

For cooking notes, the test should be:

1. **Can you identify the source type?** (intuition/analysis/authority/experiment/traditional)
2. **Is the appropriate sub-type included?** (authority-subtype, intuition-type, etc.)
3. **Does verification method match source type?** (don't verify traditional by checking sources)
4. **Is this really "knowledge" or preference?** (tag preferences separately)
5. **Can you explain WHY this source type is appropriate?** (for audit)

---

## Is the Rule's Test Executable by an AI?

**Partially.** The basic test (identify source type, verify method matches) is executable. However:

- **Sub-type judgment** requires domain understanding (traditional vs. evidence-based authority)
- **Preference vs. knowledge** requires understanding user's intent
- **Uncontrolled experiments** are hard to distinguish from simple "tried it once"

**Recommendation:** The test should include:
> (4) Does the note include appropriate sub-type tags?  
> (5) For "experiment" notes, is the experiment context realistic (not overclaiming rigor)?

---

## Summary of Proposed Refinements

1. **Add `authority-subtype:`** — traditional vs. evidence-based vs. scientific
2. **Add `experiment-context: uncontrolled`** — for ad-hoc home cooking
3. **Add `intuition-type: sensory-trained`** — for trained palate expertise
4. **Add `authority-provenance:`** — personal-collection vs. adapted vs. from-source
5. **Add `knowledge-source-type: traditional`** — for oral/generational knowledge
6. **Add `knowledge-category:`** — preference vs. fact vs. technique

---

## Comparison with Medical Domain Stress Test

The Medical Domain stress test focused on:
- Source quality vs. verification (peer-reviewed vs. clinical experience)
- Confidence tied to evidence tier

The Cooking stress test focuses on:
- Traditional authority vs. evidence-based authority
- Uncontrolled personal experimentation
- Sensory expertise as distinct from general intuition

**Key difference:** Medical knowledge has strong evidence hierarchies; cooking knowledge is mostly traditional/experiential with weak evidence base. The rule needs adaptation for domains where "authority" is often traditional, not scientific.