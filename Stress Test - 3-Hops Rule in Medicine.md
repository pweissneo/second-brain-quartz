---
last-reviewed: 2026-03-09
lifecycle: active
confidence: emerging
tags:
- seed-stress-test
- medicine-domain
- edge-case
---

# Stress Test: 3-Hops Navigation Rule in Medical Knowledge Base

## Seed Rule Being Tested
**Rule:** Every note must be reachable from `_root.md` in 3 hops or fewer.
**Test:** Run a breadth-first traversal from `_root.md`. Flag any note requiring more than 3 hops.

## Application to Medical Knowledge Base

### Where the Rule Works Well
- **Clinical notes**: Patient symptoms → diagnostic categories → treatment protocols
- **Practical workflows**: Admission → assessment → treatment plan
- **Common conditions**: Hypertension → Cardiovascular System → _root

### Edge Case: Natural Medical Hierarchies

**Problem:** Medical knowledge has legitimate deep hierarchies that serve important purposes:

1. **Anatomical depth**: Body → Cardiovascular System → Heart → Cardiac Chambers → Left Ventricle → Mitral Valve → Mitral Stenosis → Treatment → Balloon Valvuloplasty
   - This is 7+ hops but represents valid medical taxonomy
   
2. **Disease classification**: Internal Medicine → Cardiology → Valvular Heart Disease → Rheumatic Mitral Stenosis → Catheter-Based Intervention
   - 5+ hops reflects real clinical thinking

3. **Drug hierarchies**: Pharmacological Agents → Cardiovascular Drugs → Antihypertensives → ACE Inhibitors → Lisinopril → Dosage Guidelines
   - 6 hops needed for precise medication information

**The Test Fails:** An AI applying this rule strictly to a medical vault would either:
- Flatten legitimate medical taxonomies, losing clinical navigation value
- Create artificial hub notes that don't reflect how doctors actually think
- Flag deep paths as errors when they're actually essential clinical structure

### Edge Case: Rare Diseases

**Problem:** Orphan diseases with complex pathways:
- Genetic mutation → metabolic pathway → clinical presentation → diagnostic marker → treatment
- Often 5-6 hops with no way to shorten without losing specificity

### When Deep Paths Are Valid

The Seed's current edge case acknowledges "natural domain hierarchies (taxonomies, classification systems, geographic/regional breakdowns)" but doesn't go far enough for medicine:

1. **ICD classification** - International Disease Classification is legally mandated
2. **Anatomical ontologies** - Standardized body system hierarchies
3. **Pharmacological families** - Drug classification affects prescribing
4. **Clinical guidelines** - Step-by-step protocols that require sequence

### Recommendation

Refine the rule to explicitly address clinical knowledge:

**Rule:** Every note must be reachable from `_root.md` in 3 hops or fewer UNLESS:
(a) The path reflects a recognized medical taxonomy (ICD, anatomical, pharmacological)
(b) A hub note at an intermediate level would improve clinical decision-making
(c) The deep path serves a legitimate clinical workflow

**Test:** For notes >3 hops from root: (1) Does this reflect a standard medical taxonomy? (2) Would a hub improve clinical navigation? (3) Is the deep path serving a valid clinical purpose? If yes to any, allow the depth.

**Alternative Test:** Use clinical utility as the metric - a deep path is acceptable if it mirrors how clinicians actually navigate the information.

## Related
- [[Graph Traversal Efficiency]]
- [[Note Prioritization Strategy]]
- [[Domain-Specific Knowledge Bases]]
