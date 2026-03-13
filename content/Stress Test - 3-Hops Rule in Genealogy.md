---
last-reviewed: 2026-03-11
lifecycle: draft
confidence: emerging
author-type: ai-assisted
tags:
  - seed-stress-test
  - 3-hops-rule
  - edge-case
  - domain-specific
---

# Stress Test: 3-Hops Rule in Deep-Domain Hierarchies

## Seed Rule Being Tested
**Rule:** Every note must be reachable from `_root.md` in 3 hops or fewer.
**Test:** Run a breadth-first traversal from `_root.md`. Flag any note requiring more than 3 hops.
**Edge case (from Seed):** Natural domain hierarchies (taxonomies, classification systems, geographic/regional breakdowns) may legitimately exceed 3 hops.

## Where the Rule Works Well

Most knowledge bases work fine within 3 hops:
- **_root.md** → Hub → Topic → Specific concept

This works for general-purpose vaults with good hub structure.

## Edge Case: Deep-Domain Hierarchies

The Seed already acknowledges natural hierarchies may exceed 3 hops. This stress test explores domains where deep structure is inherent to the domain itself, not poor vault design.

### Medical Knowledge

**Problem:** Medical knowledge has legitimate deep hierarchies:

1. **Anatomical depth**: Body → Cardiovascular System → Heart → Cardiac Chambers → Left Ventricle → Mitral Valve → Mitral Stenosis → Treatment → Balloon Valvuloplasty (7+ hops)

2. **Disease classification**: Internal Medicine → Cardiology → Valvular Heart Disease → Rheumatic Mitral Stenosis → Catheter-Based Intervention (5+ hops)

3. **Drug hierarchies**: Pharmacological Agents → Cardiovascular Drugs → Antihypertensives → ACE Inhibitors → Lisinopril → Dosage Guidelines (6 hops)

4. **Rare diseases**: Often 5-6 hops with no way to shorten without losing specificity

**Clinical taxonomies** (ICD, anatomical ontologies, pharmacological families) are legally mandated or clinically essential — flattening them would damage clinical utility.

### Genealogy

**Problem:** Family trees are inherently deep:

1. **Lineage depth**: Family → Grandparents → Great-Grandparents → ... → 8x Great Grandfather (7+ hops)
   - Can't skip generations in family trees

2. **Temporal depth**: Historical periods layer on each other
   - "Medieval Ancestors" → "Victorian Era Family" → "Pre-Colonial Origins"

3. **Document provenance**: Copies of copies are legitimate
   - Original Will (1850) → Transcription (1900) → Translation (1950) → Digital Archive (2020)

### Other Deep-Domain Examples

- **Legal**: Case law hierarchies ( precedent → appellate → supreme court)
- **Biological taxonomy**: Kingdom → Phylum → Class → Order → Family → Genus → Species
- **Historical timelines**: Era → Period → Century → Decade → Year → Event

## The Real Issue

The Seed already acknowledges:
> "Natural domain hierarchies (taxonomies, classification systems, geographic/regional breakdowns) may legitimately exceed 3 hops."

Deep-domain vaults require explicit handling because:
1. The hierarchy IS the knowledge (not artificial structure)
2. Flattening loses domain-specific utility
3. Hub notes don't replace the deep paths — they coexist

## Recommendation

**Extend the edge case in Seed:**

> "Natural domain hierarchies (taxonomies, classification systems, geographic/regional breakdowns, **anatomical/medical taxonomies, genealogical lineage, historical periods, document provenance chains, legal case hierarchies, biological classification**) may legitimately exceed 3 hops."

**Domain-specific test:**

For deep-domain vaults:
1. Is this deep path reflecting a standard domain taxonomy?
2. Would flattening lose clinically/structurally essential information?
3. Are there hub notes at appropriate levels for general navigation?

If yes to any → Allow depth, but ensure general topics remain ≤3 hops.

## Test for AI Agents

Given a note >3 hops from root:
1. Does this reflect a recognized domain taxonomy? → May be valid
2. Would a hub improve navigation for general topics? → Add hub
3. Is this specific instance knowledge (not structural)? → May exceed 3 hops
4. Is this a general topic that should be reachable in ≤3? → Restructure

## Related

- [[Graph Traversal Efficiency]]
- [[Hub Node Creation]]
- [[Domain-Specific Knowledge Bases]]
- [[AI-Assisted Knowledge Management Seed]]
