---
last-reviewed: 2026-03-12
lifecycle: emerging
confidence: emerging
knowledge-type: analysis
tags:
  - seed-stress-test
  - clinical-domain
  - edge-case
  - experiential-knowledge
---

# Seed Stress Test: Experiential Knowledge in Clinical Practice

Testing the experiential component rule in medical/clinical domains reveals where the rule works well and where it needs refinement.

> "In domains like clinical skills, martial arts, and creative arts, the useful knowledge extends beyond what can be documented." — Seed Rule

---

## 1. The Rule Under Test

**Rule:** For domains where experiential knowledge is essential, include `experiential-component` frontmatter indicating what aspects require direct experience to fully understand.

**Test:** Pick 5 notes in an experiential domain (music, clinical practice, crafts, creative arts). Can you identify which require experience to fully apply? Do they have explicit `experiential-component` markers?

---

## 2. Clinical Domain Analysis

Clinical practice has multiple knowledge types:

| Knowledge Type | Example | Documentable? |
|---------------|---------|----------------|
| Factual | "MI presents with chest pain" | Fully |
| Procedural | "How to perform CPR" | Fully |
| Tacit/Experiential | "Feeling for subtle organ enlargement" | Partial |
| Judgment | "When to escalate to surgery" | Partial |
| Interpersonal | "Delivering bad news to families" | Partial |

---

## 3. Edge Cases Discovered

### Edge Case 1: The "Partial" Boundary Is Unclear

**Problem:** What distinguishes `experiential-component: partial` from `experiential-component: none`?

A note saying "auscultation involves listening to heart sounds" has:
- Documentable: The anatomy, the locations to listen, the sequence
- Experiential: What normal vs. abnormal sounds feel like

**Current rule doesn't clarify:** At what point does "partial" become "essential"?

**Proposed refinement:**
> `experiential-component: partial` — Core knowledge is documentable, but "calibration" requires experience (knowing WHAT to listen for vs. being able to HEAR it)
> 
> `experiential-component: essential` — Cannot teach through text at all; requires apprenticeship

### Edge Case 2: Different Skills Within One Note

**Problem:** A single clinical note like "Abdominal Examination" contains:
- Percussion technique — partially experiential (harder to learn)
- Palpation — highly experiential (requires feel)
- Patient communication — partially experiential

**Current rule:** Single `experiential-component` value per note

**Issue:** One note may have multiple experiential levels for different aspects.

**Proposed refinement:**
> For multi-aspect notes, use array syntax: `experiential-component: [technique: partial, palpation: essential, communication: partial]`

### Edge Case 3: Expertise Level Interaction

**Problem:** "How to take a blood pressure" has:
- For medical students: experiential component is HIGH (they need to practice)
- For patients: documentable (they just need to know numbers)

**Current rule:** Doesn't account for audience-dependent experiential needs.

**Proposed refinement:**
> When `experience-level` AND `experiential-component` both exist, the note serves different purposes. Consider splitting: 
> - "Blood Pressure Measurement (Clinical)" — `experiential-component: partial`
> - "How to Check Your Blood Pressure at Home" — `experiential-component: none`

### Edge Case 4: Cross-Cultural Experiential Knowledge

**Problem:** Clinical signs that work in one population may not transfer:
- "Jaundice detection" — harder in darker skin tones
- "Clubbing" — varies by ethnicity

**Current rule:** Doesn't account for knowledge that is experiential AND population-dependent.

**Proposed refinement:**
> Add `experiential-note:` field for context-specific guidance: "Detection of cyanosis in dark-skinned patients requires specialized training"

---

## 4. Test Executability Analysis

**Current Test:** "Pick 5 notes in an experiential domain... Can you identify which require experience?"

**Problems:**
1. Requires human judgment to "identify"
2. Doesn't specify WHAT about the note requires experience
3. No automated way to verify compliance

**Proposed Improved Test:**
> 1. Search vault for notes in experiential domains (tags: clinical, medical, health)
> 2. Check for `experiential-component` frontmatter field
> 3. Verify field value matches the note's content type:
>    - Pure facts → `none`
>    - Techniques with learnable core → `partial`  
>    - Skills requiring apprenticeship → `essential`
> 4. Flag notes where frontmatter is missing in experiential domains

---

## 5. What the Rule Gets Right

1. **Three-level gradation** — `none/partial/essential` is a useful spectrum
2. **Domain-agnostic** — applies to music, clinical, crafts equally
3. **Guidance differentiation** — "try this" vs. "follow this" is actionable

---

## 6. Summary of Proposed Refinements

1. **Clarify boundary between partial and essential** with concrete examples
2. **Support multi-aspect notes** with array syntax for different skill types
3. **Account for audience/expertise level** interaction with experiential component
4. **Add population/cultural context** for knowledge that varies by user characteristics
5. **Make test fully automated** by specifying frontmatter field check

---

## Related Notes

- [[Seed Stress Test - Source Quality Hierarchy in Medical Knowledge]] — Source quality in medicine
- [[Frontier Exploration - Tacit Knowledge Capture]] — Capturing hard-to-document knowledge
- [[Confidence Markers]] — Signal reliability
- [[Expertise-Level Dependent Knowledge]] — Who is this knowledge for?
