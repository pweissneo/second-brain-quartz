---
last-reviewed: 2026-03-15
lifecycle: active
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
tags:
  - seed-stress-test
  - medicine-domain
  - knowledge-activation
---

# Stress Test: Knowledge Activation States in Medical Knowledge

## Seed Rule Being Tested
**Rule:** Track knowledge activation state separately from lifecycle stage — distinguish whether captured knowledge is ready for practical application.
**Why:** A note can be "active" (lifecycle) but not ready to inform decisions. Without activation tracking, users may rely on incomplete knowledge. Activation states (captured → processed → verified → applied → integrated) provide a readiness dimension orthogonal to lifecycle.
**Test:** Can you categorize each note by activation state? Do decision-support queries filter by readiness?
**Implementation:** Use `activation-state:` frontmatter with values:
- `captured`: Raw input, needs processing
- `processed`: Synthesized into atomic form, needs verification
- `verified`: Confirmed accurate, ready for use
- `applied`: Used in real context, needs outcome capture
- `integrated`: Outcome captured and knowledge refined

## Application to Medical Knowledge Base

Medical knowledge has its own established frameworks for knowledge states that interact with the Seed's activation states in complex ways.

### The Medical Evidence Hierarchy

Medical knowledge already has well-defined states:

| Medical State | Description | Seed Equivalent |
|--------------|------------|-----------------|
| Case Report | Single patient observation | captured |
| Case Series | Multiple patient observations | processed |
| Cohort Study | Observational study | processed |
| Randomized Controlled Trial | Gold standard | verified |
| Systematic Review | Synthesis of all evidence | verified |
| Clinical Guideline | Expert consensus | applied |
| Standard of Care | Widely adopted practice | integrated |

### Edge Case: Phase I-II-III Drug Trials

**Problem:** Drug development knowledge passes through distinct phases:
- Phase I: Safety (small n, healthy volunteers)
- Phase II: Efficacy (patients, dose-finding)
- Phase III: Confirmation (large n, comparative)
- FDA Approval: Regulatory clearance

Each phase represents different confidence levels. A note about "Drug X shows promise in Phase I trials" is:
- `activation-state: processed` (synthesized from research)
- But `confidence: emerging` (preliminary)
- And `verification-required: human-expert` (cannot proceed without)

The Seed's activation states don't capture the nuanced progression within "verified."

### Edge Case: Off-Label Use

**Problem:** Medications approved for one condition are sometimes used for others (off-label).
- FDA-approved use = `verified`, `applied`
- Well-documented off-label = `verified` but may lack `applied` status
- Novel off-label hypothesis = `processed` or even `captured`

This creates ambiguity: Is off-label knowledge "verified" if there's case report evidence but no clinical trial?

### Edge Case: Contradictory Studies

**Problem:** Medical literature frequently has contradictory studies.
- Study A shows drug works
- Study B shows it doesn't

How do you represent this in the vault?
- Both individual studies are `verified` (accurately cited)
- But the synthesis note should be `processed` (synthesis in progress)
- The Seed doesn't have a "conflicting" or "synthesis pending" state

### Edge Case: Clinical Guidelines Evolution

**Problem:** Guidelines change as evidence accumulates.
- 2020 Guideline: Recommendation A
- 2023 Guideline: Recommendation B (supersedes A)

Options:
1. Keep both notes, mark 2020 as `deprecated` or `historical-superseded`
2. Update single note with timeline

The Seed's lifecycle (draft → active → evergreen → deprecated → archived) handles this, but the activation state doesn't clarify when a guideline transitions from `applied` to `integrated`.

### Edge Case: Patient-Specific vs General Knowledge

**Problem:** Medical knowledge applies differently to individuals vs populations.
- Population-level evidence: "Drug X lowers BP by 10mmHg on average"
- Patient-specific: "This patient has characteristics Y, so..."

The activation state `applied` is ambiguous: applied to a population? to a specific patient? The Seed lacks a way to track application context.

### Edge Case: Medical Device Knowledge

**Problem:** Devices have different regulatory pathways than drugs.
- FDA-cleared (510(k)): Substantial equivalence
- FDA-approved (PMA): Safety and effectiveness
- Laboratory-developed test (LDT): No FDA review

The verification level differs but looks the same in current Seed framework.

### Edge Case: Emerging Infectious Diseases

**Problem:** During a novel outbreak (COVID-19), knowledge states collapse:
- Day 1: "Mysterious pneumonia in Wuhan" — `captured`
- Week 2: "Caused by coronavirus" — `processed` (quick synthesis)
- Month 3: "Remdesivir shows benefit" — `verified` (emergency use)
- Month 12: Multiple vaccines — `applied` (emergency authorization)
- Year 2: Standard of care — `integrated`

The Seed's activation states work but compressed timelines reveal the "verification" step often happens retroactively rather than prospectively.

### Edge Case: Black Box Warnings

**Problem:** FDA black box warnings indicate serious risks.
- Warning added post-approval based on post-market surveillance
- The knowledge was always true but now "verified" at a higher level

Does this change activation state? Arguably it was always `verified` (accurate), but now has `safety-critical: true` as well.

### Edge Case: Telemedicine and Digital Health

**Problem:** Digital health tools (apps, wearables) have different evidence standards:
- Clinical validation studies
- Real-world evidence
- Patient-reported outcomes

Some are "verified" by clinical trial, others by real-world data. The Seed doesn't distinguish evidence *type* for digital health.

### Proposed Refinements

1. **Add `verification-level:` sub-field** for `activation-state: verified`:
   ```yaml
   verification-level: case-report | observational | rct | systematic-review | guideline
   ```

2. **Add `regulatory-status:` for medical knowledge:**
   ```yaml
   regulatory-status: fda-approved | fda-cleared | off-label | investigational
   ```

3. **Add `evidence-contradiction:` for conflicting studies:**
   ```yaml
   evidence-status: consistent | contradictory | insufficient
   contradictions:
     - study: "[Study citation]"
       finding: "[Conflicting finding]"
   ```

4. **Clarify `applied` state:** Does applied mean applied to population (guideline) or to specific patients? Add:
   ```yaml
   application-scope: population | individual | both
   ```

5. **Add temporal validity for guidelines:**
   ```yaml
   guideline-valid-from: 2020-01
   guideline-valid-until: 2023-12
   superseded-by: [[New Guideline Note]]
   ```

6. **For medical AI agents:** Filter queries by:
   - Minimum verification level (e.g., only return `verification-level: rct` or higher)
   - Regulatory status (exclude investigational for clinical decisions)
   - Recency (medical knowledge decays faster — consider 6-month review cycles)

## Summary

The Seed's knowledge activation states work well for medical knowledge but lack nuance for:
1. The medical evidence hierarchy levels within "verified"
2. Regulatory status distinction
3. Contradictory evidence handling
4. Application scope (population vs individual)
5. Temporal validity for guidelines

Medical knowledge is high-stakes — the difference between `processed` and `verified` can affect patient outcomes. The refinement should add sub-fields rather than new primary states to avoid complexity.

## Related
- [[Stress Test - Source Quality Hierarchy in Medical Knowledge]]
- [[Seed Stress Test - Confidence Markers Rule Across Domains]]
- [[Frontier Exploration - Conditional and Troubleshooting Knowledge]]
- [[Seed Improvement - Safety-Critical Knowledge Metadata]]
