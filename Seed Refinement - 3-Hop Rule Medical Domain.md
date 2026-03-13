---
last-reviewed: 2026-03-13
lifecycle: active
confidence: emerging
author-type: ai
tags:
  - seed-refinement
  - navigation
  - medical-domain
---

# Seed Refinement: 3-Hop Rule Stress Test (Medical Domain)

## Original Rule

**Rule:** Every note must be reachable from `_root.md` in 3 hops or fewer.
**Why:** Deep chains indicate structural problems — important content becomes buried and undiscoverable.
**Test:** Run a breadth-first traversal from `_root.md`. Flag any note requiring more than 3 hops.

## Stress Test Results

### Domain: Medical Knowledge Base

**Path analysis for realistic medical note:**
```
_root.md 
  → Medical Knowledge 
    → Internal Medicine 
      → Cardiology 
        → Heart Failure 
          → Pharmacological Treatment 
            → Beta Blockers 
              → Metoprolol
```
= **7 hops** for a specific medication note

**Specialties multiply complexity:**
- Internal Medicine → Cardiology, Neurology, Oncology, Pulmonology...
- Each specialty → Multiple organ systems
- Each system → Multiple conditions
- Each condition → Multiple treatment categories
- Each category → Specific treatments/drugs

### Problems Identified

1. **Natural taxonomies exceed limit:** Medical knowledge has genuine hierarchies (anatomy, specialty, condition, treatment) that can't be flattened without losing clinical meaning

2. **Test ambiguity:** "Flag any note" suggests error, but the edge case says some violations are legitimate — the test should distinguish taxonomy-driven from structural-problem deep paths

3. **Hub inflation risk:** To compress 7-hop paths to 3, you'd need artificial hubs like "Cardiology Treatments" that don't reflect clinical reasoning

4. **Clinical utility vs. graph purity:** A cardiologist navigating to a specific drug needs 5-6 clicks either way — the limit doesn't improve actual usability

### Proposed Refinement

**Revised Rule:** Every note should be reachable from `_root.md` in 3 hops or fewer **unless** the path reflects a genuine domain taxonomy (medical, biological, legal, geographic).

**Revised Test:** 
1. Run BFS traversal from `_root.md`
2. For notes >3 hops: check if path reflects a recognized domain taxonomy
3. Flag only non-taxonomic deep paths as structural problems
4. For taxonomic deep paths: verify intermediate hub notes exist at major category boundaries

**Additional Edge Cases to Add:**
- **Medical/Clinical:** Anatomy → System → Specialty → Condition → Treatment → Specific intervention (5+ hops is normal)
- **Pharmacological:** Drug Class → Subclass → Specific Drug → Dosage Form → Specific Product (hierarchical by design)
- **Evidence-based medicine:** Systematic Review → RCT → Case Study → Expert Opinion (evidence hierarchy is itself a taxonomy)
- **Diagnostic reasoning:** Chief Complaint → Differential → Workup → Diagnosis → Staging (clinical workflow is sequential, not hierarchical)

### Why This Matters

The 3-hop rule is excellent for disorganized vaults, but domains with established taxonomies (medicine, law, biology, chemistry) have **legitimate** deep structures that represent real knowledge organization, not vault problems.

A medical knowledge base with 7-hop paths to specific drugs is NOT broken — it's accurately representing medical knowledge structure. Forcing flatter paths would make the vault harder to use, not easier.

## Related
- [[AI-Assisted Knowledge Management Seed]] — Original Seed
- [[Seed Stress Test - Cooking Knowledge Base]] — Testing in cooking domain
- [[Graph Traversal Efficiency]] — Maximum 3 hops navigation
- [[Domain-Specific Knowledge Bases]] — Adapting Seed rules for fields
- [[Hub Node Creation]] — Creating navigation shortcuts
- [[Knowledge Graph Structure]]
