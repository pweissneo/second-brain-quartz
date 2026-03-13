---
last-reviewed: 2026-03-12
lifecycle: active
confidence: emerging
tags:
  - seed-stress-test
  - nursing-domain
  - linking
  - clinical-practice
---

# Stress Test: 2+ Links Rule in Nursing Knowledge Base

## Seed Rule Being Tested
**Rule:** Every note must link to at least 2 other notes OR be tagged with `foundational: true`.
**Why:** Unlinked notes are invisible in the graph — they cannot be discovered through navigation. Foundational elements are a special case that should be explicitly marked, not manually verified each time.
**Test:** Run an orphan scan. Flag any note with fewer than 2 outgoing links that lacks the `foundational: true` tag.

## Application to Nursing Knowledge Base

### The Challenge

Nursing knowledge has unique structural challenges:
- Clinical guidelines reference protocols that reference procedures
- Basic science (anatomy, physiology) underlies all clinical knowledge
- Skills build on prerequisites
- Equipment and supplies are domain-specific
- Patient populations create specialized branches

### Edge Cases Found

#### Edge Case 1: True Foundational Primitives

**Problem:** Notes like "Vital Signs," "Nursing Assessment," "Patient Safety" are referenced by everything but don't naturally link out to 2+ notes.

Analysis:
- "Vital Signs" is used in every patient encounter
- It references heart rate, blood pressure, temperature, respiration
- But as a core primitive, it's referenced BY many notes, not the other way around

**Current rule:** Tag with `foundational: true`

**Gap:** The rule doesn't specify what makes something "foundational" in a clinical domain. Is it:
- (a) Referenced by 10+ other notes?
- (b) A core skill all nurses must have?
- (c) A building block concept?

**Verdict:** The `foundational: true` tag works, but the criteria for WHEN to use it are unclear.

#### Edge Case 2: Patient Population-Specific Notes

**Problem:** Notes like "Pediatric Vital Signs" vs "Adult Vital Signs" — both link to "Vital Signs" but have different reference ranges.

Structure:
- [[Vital Signs]] → links to [[Pediatric Vital Signs]], [[Adult Vital Signs]], [[Vital Signs Measurement]]
- Each population note links to Vital Signs + maybe 1 other

Is this enough? The rule says 2+ links. These have exactly 2.

**Issue:** In clinical domains, population-specific knowledge legitimately has narrow links. A pediatric note links to:
1. General principle (vital signs)
2. Pediatric-specific reference

That's it. Forcing more links creates decorative links.

#### Edge Case 3: Procedure Notes with Embedded Steps

**Problem:** "Wound Care Procedure" — does this link to "Wound Assessment," "Dressing Types," "Infection Signs"?

Yes, but what about:
- "Wound Irrigation" — is this a separate note or part of the procedure?
- If separate, does "Wound Care Procedure" link to it?

The atomicity rule conflicts with the linking rule here. A procedure note that's kept together (per atomicity exception) might not have natural links to 2+ other notes.

#### Edge Case 4: Medication Knowledge

**Problem:** A note about "Insulin" — what does it link to?

Options:
- [[Blood Glucose Regulation]] (physiology)
- [[Insulin Administration]] (skill)
- [[Insulin Types]] (classification)
- [[Hypoglycemia]] (complication)
- [[Diabetes Management]] (condition)

That's 5 links — which is good. But what about a less common medication like "Naloxone"?

- [[Opioid Overdose]] (indication)
- [[Respiratory Depression]] (mechanism)
- That's only 2 links — meets the minimum

But what about "Acetaminophen"? Common medication:
- [[Pain Management]]
- [[Fever Reduction]]
- [[Liver Toxicity]] (adverse effect)

Also 2-3 links. Most medications can meet the 2-link requirement.

#### Edge Case 5: Evidence-Based Practice Links

**Problem:** Notes about nursing research ("Evidence-Based Practice," "Nursing Research Methods") — what do they link to?

Challenge: Research methods don't naturally link to clinical content. They're meta-knowledge.

Options:
- Link to [[Research Critique]]
- Link to [[Clinical Guidelines]]
- Link to [[Quality Improvement]]

That's 3 links — works. But is it meaningful? Or decorative?

#### Edge Case 6: Legacy/Deprecated Practices

**Problem:** "Traditional Wound Care" (older methods) — what does this link to?

- Links to [[Wound Care]] (general)
- May link to [[Modern Wound Care]] (comparison)

Only 2 links. But one is essentially "don't use this" — is that a meaningful link?

**Verdict:** Legacy practices should link to what replaced them AND what they were used for. Not just the replacement.

### What Works ✓

1. **Condition-Based Grouping:**
   - [[Diabetes Mellitus]] → links to [[Blood Glucose Monitoring]], [[Insulin Administration]], [[Diabetic Ketoacidosis]], [[Diabetes Education]]
   
2. **Skill Prerequisites:**
   - [[IV Insertion]] → links to [[Venipuncture Site Selection]], [[IV Equipment]], [[IV Complications]]

3. **Population-Based Hubs:**
   - [[Pediatric Nursing]] → links to [[Growth and Development]], [[Pediatric Medications]], [[Parent Education]]

4. **Clinical Reasoning Chains:**
   - [[Chest Pain Assessment]] → links to [[Differential Diagnosis]], [[ECG Interpretation]], [[Emergency Response]]

### What Breaks ✗

1. **Forced Decorative Links:**
   - Adding [[Nursing Ethics]] link to a medication note just to meet the 2-link minimum
   - "Insulin" linking to "Ethical Considerations in Patient Care" — meaningless

2. **Single-Concept Notes:**
   - "Sepsis Screening Tool" → only links to [[Sepsis]] and [[Clinical Assessment]]
   - This is borderline — the tool is a specific instrument, not a broad concept

3. **Equipment Without Procedures:**
   - "Foley Catheter" note → only links to "Catheterization Procedure"
   - Missing: [[Catheter Care]], [[Complications]], [[Indwelling vs Intermittent]]

### Refined Test for Nursing Domain

```
For each clinical note:
1. Does it link to a GENERAL principle? (e.g., vital signs, assessment)
2. Does it link to a SPECIFIC application? (e.g., pediatric, adult, emergency)
3. Does it link to potential COMPLICATIONS or CONTRAINDICATIONS?
4. Is each link EXPLAINABLE in clinical terms?

Exceptions (use foundational: true):
- Core assessment skills (vital signs, physical assessment)
- Fundamental concepts (infection control, patient safety)
- Basic science that underlies all clinical knowledge
```

### The Dilemma: Clinical Relevance vs. Graph Density

The 2-link rule assumes notes can naturally connect to 2+ related concepts. But clinical knowledge has:
- **Broad concepts** (assessment, intervention, evaluation) — easily link
- **Specific instruments** (specific scales, tools, equipment) — limited natural links
- **Population-specific** (pediatric, geriatric, maternal) — limited to their population

Forcing 2+ links on specific instruments creates decorative links that hurt clinical utility.

### Recommendation

The Seed rule should clarify:
1. **Clinical instruments/tools** may have 1-2 links if they're specific to one procedure
2. **Population notes** may have narrow focus but should link to general principle + population-specific consideration
3. **Legacy practices** should link to: (a) what they were used for, (b) what replaced them, (c) why it was replaced
4. **Research methods** notes are meta-knowledge — link to other meta-notes, not clinical content

### Suggested Test Refinement

```
For clinical knowledge bases:
- Standard notes: 2+ links required
- Clinical instruments (scales, tools, equipment): 1+ link OK if specific
- Foundational skills: tag with foundational: true
- Population-specific: link to general + population
- Legacy/deprecated: link forward to replacement + backward to original use
```

### Related
- [[Linking Principle]]
- [[Seed Stress Test - Cooking Knowledge Base]] — Similar linking challenges in recipe domain
- [[Stress Test - Hub Note Rule in Woodworking]] — Hub structure challenges
- [[Domain-Specific Knowledge Bases]]
- [[Frontier Exploration - Expertise-Level Dependent Knowledge]]
- [[Prerequisite Knowledge Tracking]]
