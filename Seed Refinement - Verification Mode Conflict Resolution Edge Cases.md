---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-03-31
last-updated: 2026-03-31
lifecycle: seed-refinement
confidence: emerging
tags:
  - seed-refinement
  - verification-mode
  - conflict-resolution
  - medical-domain
---

# Seed Refinement: Verification Mode Conflict Resolution Edge Cases

Refining the verification-mode conflict resolution rule based on medical domain stress testing.

## Background

The Seed rule (2026-03-30) establishes a hierarchy for resolving conflicts between verification modes:
1. Drill-verified
2. Empirical
3. Tool-dependent
4. Embodied
5. Source

Stress testing against medical knowledge revealed that this hierarchy breaks down in several critical scenarios.

---

## Refinement 1: Conflict Type Taxonomy

**Problem:** The rule treats all conflicts as "resolution" problems, but some conflicts are actually complementary knowledge.

**Solution:** Add `conflict-type` frontmatter:
```yaml
conflict-type: contradictory|complementary|uncertain|expanding
```

- **contradictory**: One claim is wrong (resolution needed)
- **complementary**: Both valid, measure different dimensions (integration needed)
- **uncertain**: Both may be wrong, genuine medical uncertainty (preservation needed)
- **expanding**: Conflict reveals Seed gap (escalation needed)

**Rule Update:**
> When verification modes conflict, first determine conflict type. Resolution applies only to contradictory conflicts. Complementary conflicts preserve both; uncertain conflicts document divergence; expanding conflicts signal Seed update.

---

## Refinement 2: Population Scope for Tool-Dependent

**Problem:** Tool-dependent verification often applies to specific populations, while source claims are generalizable.

**Solution:** Add `population-scope` field:
```yaml
population-scope: generalizable|population-specific
specific-population: "elderly, comorbidities"
```

**Rule Update:**
> For tool-dependent vs. source conflicts, tool-dependent wins for its measured population; source may remain valid for other populations. Document scope of applicability.

---

## Refinement 3: Medical Domain Integration Strategy

**Problem:** Clinical experience (embodied) and RCT evidence (empirical) both capture valid knowledge — integration, not selection, is correct.

**Solution:** For medical domain, default to integration rather than hierarchy resolution:
```yaml
resolution-methodology: integration
integration-type: clinical-synthesis
```

**Rule Update:**
> In medical domains, embodied knowledge (clinical experience) and empirical evidence (RCT) should use integration strategy by default. Clinical expertise synthesizes both modes, not chooses between them. Preserve both with explicit integration documentation.

---

## Resolution Strategies

| Strategy | Use When | Result |
|----------|----------|--------|
| mode-priority | No domain context | Higher mode wins |
| domain-priority | Domain has established standards | Domain-appropriate wins |
| preservation | Both modes valid but context differs | Both preserved with conflict note |
| escalation | Truly ambiguous, requires human judgment | Mark as disputed, defer |

## Refinement 4: Drill-to-Real Transfer Risk

**Problem:** Drill-verified certification indicates competence, but doesn't guarantee effectiveness in every real scenario.

**Solution:** Add frontmatter for simulation-to-reality gap:
```yaml
drill-to-real-transfer-risk: low|moderate|high
drill-conditions: "simulation, clean lab environment"
real-conditions: "actual emergency, environmental factors"
```

**Rule Update:**
> For drill-verified safety knowledge, explicitly document known gaps between drill conditions and real-world execution. High-transfer-risk knowledge requires additional empirical validation.

---

## Refinement 5: Source Quality Within Mode

**Problem:** When equivalent-quality sources conflict (NEJM vs. The Lancet), recency shouldn't automatically resolve.

**Solution:** Track evidence quality within source mode:
```yaml
evidence-quality: high|moderate|low
evidence-factors:
  - sample-size
  - study-design
  - replication
  - statistical-power
```

**Rule Update:**
> For source-vs-source conflicts, weight by evidence quality factors within the mode. Don't default to recency. Large, well-designed, replicated studies override newer but weaker studies.

---

## Refinement 6: Knowledge Expansion Flag

**Problem:** Some conflicts reveal the Seed itself is incomplete, not just note conflicts.

**Solution:** Add escalation flag:
```yaml
knowledge-expansion: true
seed-gap-type: verification-mode-gap
```

**Rule Update:**
> For conflicts where no resolution satisfies known evidence, tag with `knowledge-expansion: true`. This signals the Seed needs updating, not just the individual note.

---

## Updated Conflict Resolution Workflow

1. **Detect conflict** — Two notes have different verification results
2. **Classify conflict type** — contradictory / complementary / uncertain / expanding
3. **If contradictory:**
   - Apply hierarchy (mode-priority or domain-priority)
   - Document resolution outcome
4. **If complementary:**
   - Preserve both notes
   - Add integration documentation
5. **If uncertain:**
   - Preserve both with consensus-level tag
   - Note what would resolve
6. **If expanding:**
   - Tag with knowledge-expansion: true
   - Create Seed Gap note

---

## Test Update

**Original Test:** For any note where two verification modes produced different results: (1) Is the conflict documented? (2) Is resolution methodology explicit? (3) Does confidence reflect resolution? (4) Is both evidence preserved?

**Updated Test:** Add:
5. Is conflict-type classified (contradictory/complementary/uncertain/expanding)?
6. If complementary, is integration documentation present?
7. If uncertain, is evidence-synthesis noted?
8. If expanding, is knowledge-expansion flag set?

---

## Related Notes

- [[Seed Stress Test - Verification Mode Conflict Resolution in Medical Knowledge]] — Edge case documentation
- [[Seed Gap - Verification Mode Conflict Resolution]] — Original gap analysis
- [[Seed Refinement - Verification Mode Conflict Resolution]] — Earlier refinement (superseded by this note)

---

**Status:** Integrated into Seed (2026-03-31). This note preserved as documentation of refinement process.

**Next Step:** [None - refinement complete]