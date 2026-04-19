---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-04-01
last-updated: 2026-04-01
lifecycle: seed-refinement
confidence: emerging
verification-modality: analytical
tags:
  - seed-refinement
  - veterinary-medicine
  - species-variation
  - domain-specific
---

# Seed Refinement - Species-Variation and Patient-Reported Knowledge Handling

## Summary

Stress-testing the Seed against veterinary medicine reveals two critical gaps:
1. **Species-variation handling** — The Seed lacks explicit rules for domains where the same concept applies differently across species/types, making cross-species transfer dangerous
2. **Owner-compliance factor** — The Seed doesn't account for knowledge where treatment success depends on a third party's capability (pet owners, caregivers), unique to domains where patients cannot self-report

## Gap 1: Species-Variation Handling

### The Problem

In veterinary medicine (and similarly in agriculture, beekeeping, livestock management), knowledge that applies to one species may be:
- **Toxic** to another species (acetaminophen: safe for dogs, fatal for cats)
- **Ineffective** in another species (antibiotics that work in livestock don't work the same in poultry)
- **Impossible** for another species (procedures for horses can't be done on birds)

The Seed has `applicability:` and `scope:` fields, but doesn't address **species-variation as a safety-critical dimension**.

### Why This Matters

Without explicit species-variation rules:
1. Knowledge from one species can be dangerously extrapolated to another
2. Safety-critical contraindications are not systematically captured
3. The "universal" vs "specific" distinction doesn't capture the danger of inappropriate transfer

### Proposed Seed Rule Addition

> **Rule:** In domains where knowledge validity depends on species, organism type, or biological classification, explicitly track cross-type transferability and document contraindications.
>
> **Why:** In veterinary medicine, agricultural, and biological domains, the same principle can be safe in one species but harmful in another. Without explicit transferability tracking, the vault cannot distinguish universal principles from species-specific knowledge.
>
> **Test:** (1) Can you identify notes that assume cross-species applicability? (2) Do notes document species-scope? (3) Are toxic/prohibited transfers explicitly marked? (4) Can you filter notes by species-validity?

**Implementation:**
```yaml
species-variation: critical  # critical|moderate|none
species-scope: [canine, feline, equine]
species-caveat: "TOXIC to: [list species]"
cross-species-transferability: none|low|medium|high|universal
transfer-warning: "Even similar species require verification"
```

### Domains This Applies To

- Veterinary medicine (dogs, cats, horses, exotic, livestock)
- Agriculture (crop-specific, livestock-specific)
- Beekeeping (different bee varieties)
- Microbiology (organism-specific treatments)
- Botany (plant-specific diseases)

## Gap 2: Owner/Caregiver Compliance Factor

### The Problem

In veterinary medicine (and pediatrics, geriatrics, disability care), treatment success depends on a **third party** (pet owner, parent, caregiver) who must execute the treatment outside clinical supervision.

The Seed's verification assumes the knowledge holder controls execution. But in these domains:
- **Knowledge may be correct** (the treatment protocol is right)
- **Execution may fail** (owner doesn't administer correctly)
- **Outcome depends on compliance**, not just knowledge quality

The Seed doesn't track **knowledge that requires third-party execution to succeed**.

### Why This Matters

Without owner-compliance tracking:
1. Knowledge appears verified but fails due to execution gaps
2. No distinction between "protocol correct" and "protocol will work in practice"
3. Compliance-difficulty factors are invisible in knowledge quality assessment

### Proposed Seed Rule Addition

> **Rule:** In domains where treatment success depends on third-party execution (caregivers, owners, family), tag knowledge with compliance-difficulty and document what external factors determine success.
>
> **Why:** In veterinary medicine and pediatric care, the patient cannot self-report or self-treat. Knowledge correctness is necessary but not sufficient — success depends on whether the owner/caregiver can and will execute the protocol. Without compliance tracking, the vault cannot assess practical effectiveness.
>
> **Test:** (1) Can you identify notes where execution depends on a third party? (2) Do notes document compliance-difficulty? (3) Is there fallback guidance for low-compliance scenarios? (4) Does verification include compliance factors?

**Implementation:**
```yaml
compliance-factor: critical  # critical|moderate|low|none
third-party-execution-required: true
compliance-difficulty: high|medium|low
compliance-consequences_if_failed: "treatment ineffective|condition worsens|death"
compliance-alternatives: "What to do if compliance is unlikely"
owner-education-required: ["List of things owner must understand/do"]
```

### Domains This Applies To

- Veterinary medicine (pet owner compliance)
- Pediatrics (parent/guardian compliance)
- Geriatric care (caregiver compliance)
- Disability care (support staff compliance)
- Chronic disease management (patient self-management)

## Combined Application: Veterinary Knowledge Quality Assessment

When both factors combine (species-variation + compliance), knowledge quality assessment requires:

```yaml
species-variation: critical
compliance_factor: critical
species-scope: [canine]
owner-compliance-difficulty: high
compliance-consequences_if_failed: death
verification-must-include: [species-validity, compliance-feasibility]
```

## Related Notes

- [[Seed Stress Test - Veterinary Medicine Knowledge Base]] — original stress test
- [[Seed Stress Test - Medical Knowledge Base]] — human medicine stress test
- [[Frontier Exploration - Medical and Health Knowledge Bases]] — health domain exploration

## Gap Closure Criteria

- [ ] Seed includes species-variation as safety-critical dimension
- [ ] Seed includes cross-species transferability tracking
- [ ] Seed includes owner/caregiver compliance factor
- [ ] Verification assessment includes compliance feasibility
- [ ] Documentation includes guidance for low-compliance scenarios