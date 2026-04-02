---
last-reviewed: 2026-03-31
last-updated: 2026-03-31
confidence: emerging
author-type: ai-assisted
lifecycle: seed-refinement
level: seed-refinement
verification-status: unverified
tags:
  - seed-refinement
  - creative-domains
  - evaluative-knowledge
  - craft-criticism
  - aesthetic-judgment
---

# Seed Refinement - Evaluative Knowledge in Creative Domains

> Refinement: Add explicit rule for distinguishing craft criticism from aesthetic judgment in creative domain knowledge bases.

## Gap Source

- [[Seed Gap - Evaluative Knowledge Organization in Creative Domains]] — gap identified and analyzed
- [[Distinguishing Craft Criticism from Aesthetic Judgment]] — frontier exploration with foundational concepts

## Proposed Rule Addition

**Rule:** For creative domain knowledge bases, explicitly distinguish craft criticism from aesthetic judgment — tag evaluative claims with appropriate metadata, separate verifiable craft claims from subjective aesthetic content, and acknowledge when evaluation criteria are style-bound or era-dependent.

**Why:** Creative domain knowledge bases contain evaluative claims with fundamentally different truth values. Treating aesthetic judgments as verifiable claims leads to false confidence; conflating craft evaluation (technical execution) with aesthetic judgment (subjective preference) confuses users and undermines appropriate confidence assignment. The Seed covers subjective knowledge types and unverifiable knowledge but lacks explicit guidance for this core distinction in creative domains.

**Test:** For notes in creative domains containing evaluative claims:
1. Can you identify which claims are craft (verifiable technical execution) vs. aesthetic (subjective judgment)?
2. Are craft claims supported by measurable or observable criteria?
3. Are aesthetic claims tagged as subjective with appropriate consensus level markers?
4. Does the note acknowledge when evaluation criteria are style-dependent or era-specific?

## Implementation

Add to Seed section on "Knowledge Types" or create new subsection:

```yaml
# For evaluative claims in creative domains
evaluative-type: craft-criticism|aesthetic-judgment|hybrid

# For craft criticism (technical evaluation)
craft-criteria: "list of measurable/observable criteria"
craft-verification: verifiable  # can be checked against standards

# For aesthetic judgment (subjective evaluation)
aesthetic-basis: personal|professional-community|cultural|era-specific
subjective-consensus-level: universal|common|divergent|none
transferability: high|limited|none  # craft skills transfer; aesthetic preferences don't

# For transferability assessment
style-dependency: minimal|moderate|high
evaluation-criteria-documented: true|false
```

## Edge Cases

1. **Hybrid claims:** "Technically proficient AND beautiful" should be split or clearly separated into craft + aesthetic sections

2. **Domain-specific criteria:** What counts as "good craft" varies by domain — document evaluation criteria per domain:
   - Photography: composition, exposure, focus, color accuracy
   - Writing: prose rhythm, clarity, characterization, dialogue
   - Music: technical execution, harmonic resolution, emotional impact
   - Cooking: technique execution, flavor balance, texture

3. **Cultural/era dependency:** Aesthetic norms change — note when evaluation criteria are era-dependent or culture-specific

4. **Skill vs. taste distinction:** Technical skill (transferable) differs from taste (personal) — the Seed's 5:1 ratio applies differently

## Distinction from Existing Seed Coverage

| Concept | Covered? | Coverage Method |
|---------|----------|-----------------|
| Unverifiable knowledge | Yes | unverifiable-type field |
| Subjective knowledge | Partial | edge cases in diminishing returns |
| Confidence markers | Yes | confidence field |
| Evidence tier | Yes | evidence-tier field |
| Craft vs. aesthetic distinction | **No** | This refinement adds it |

## Stress Test Scenarios

### Test 1: Photography Note
A note evaluates a photograph: "The composition follows rule of thirds (craft), and the moody lighting creates emotional depth (aesthetic)."

- Craft claim: verifiable (rule of thirds is a measurable standard)
- Aesthetic claim: subjective (emotional depth is personal interpretation)
- **Expected:** Note should have separate sections or tags for each type

### Test 2: Writing Critique  
A note says: "The prose has strong sentence variety (craft), but the protagonist lacks development (aesthetic/character)."

- Craft claim: verifiable (sentence variety can be measured)
- Aesthetic claim: subjective (character development is interpretive)
- **Expected:** Clear separation with different confidence markers

### Test 3: Music Production
A note evaluates a mix: "The compression settings are transparent (craft), but the low end feels muddy (aesthetic)."

- Craft claim: somewhat verifiable (transparency is measurable via metering)
- Aesthetic claim: subjective (muddy is personal perception)
- **Expected:** Acknowledgment that craft aspects have more transferability

## Integration Point

This rule should be added to the Seed section on "Knowledge Quality and Verification" — specifically as a domain-specific extension for creative fields. It complements:
- Existing edge case on subjective domains (line ~800)
- Evidence tier classification (tier 6 = personal discovery includes aesthetic)
- Confidence markers for subjective content

## Related Notes

- [[Distinguishing Craft Criticism from Aesthetic Judgment]] — Foundation concept
- [[Seed Gap - Evaluative Knowledge Organization in Creative Domains]] — Gap analysis
- [[Frontier Exploration - Personal Taste Calibration Knowledge]] — Related exploration
- [[Seed Stress Test - Link Explainability Rule in Creative Writing]] — Stress test in creative domain
