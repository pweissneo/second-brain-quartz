---
last-reviewed: 2026-03-31
last-updated: 2026-03-31
lifecycle: seed-stress-test
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
tags:
  - seed-stress-test
  - verification-mode
  - medical-domain
  - edge-case
---

# Seed Stress Test: Verification Mode Conflict Resolution in Medical Knowledge

Testing the verification-mode conflict resolution rule against medical knowledge reveals critical edge cases where the proposed hierarchy breaks down.

## Rule Under Test

**Rule (NEW - 2026-03-30):** When verification modes produce conflicting results, apply a verification-mode conflict resolution protocol that distinguishes test type, weights by domain-appropriateness, and preserves both results with explicit conflict documentation.

**Conflict Resolution Hierarchy (Mode-Priority):**
1. **Drill-verified** — Highest reliability for action/safety knowledge
2. **Empirical** — Direct execution produces consistent results
3. **Tool-dependent** — Physical/chemical measurement
4. **Embodied** — Personal sensory experience
5. **Source** — Authority vouching

---

## Edge Case 1: Clinical Experience vs. RCT Evidence

**Scenario:** A physician's clinical experience (embodied verification: "I've seen this treatment work") contradicts randomized controlled trial results (empirical verification: RCT shows treatment ineffective).

**Seed Hierarchy Says:** Empirical (mode-priority #2) > Embodied (mode-priority #4). RCT evidence should win.

**Medical Reality:** Clinical experience captures:
- Patient populations excluded from trials (elderly, comorbidities)
- Real-world effectiveness vs. efficacy
- Edge cases that trials miss
- Time horizons trials don't cover

**Problem:** Following the Seed's mode-priority hierarchy would discard valuable clinical knowledge. The physician's embodied knowledge may represent reality for their specific patient population.

**Edge Case Test Fails:** The rule's test asks if resolution methodology is explicit (domain-priority or mode-priority). But in medicine, "domain-priority" isn't well-defined for embodied vs. empirical conflicts. The rule doesn't account for the principle that clinical judgment integrates both evidence types.

**Suggested Refinement:**
> In medical domains, embodied knowledge (clinical experience) should be preserved alongside empirical evidence, with domain-priority defaulting to "integration" rather than "empirical wins." Clinical expertise synthesizes both modes, not choose between them.

---

## Edge Case 2: Tool-Dependent (Lab Results) vs. Source (Textbook)

**Scenario:** A medical textbook states a drug's half-life is 4 hours (source-verified by textbook author), but lab blood tests show actual half-life of 2.5 hours for a specific patient population (tool-dependent verification).

**Seed Hierarchy Says:** Tool-dependent (#3) > Source (#5). Lab results should win.

**Medical Reality:** This is correct. Lab results are objective measurement. However:

**Complication:** Lab results may be:
- From specific population (not generalizable)
- Measuring different metric (blood plasma vs. effective half-life)
- Affected by patient factors (genetics, other medications)

**Edge Case Test Fails:** The rule's test asks if confidence reflects the resolution (weighted if resolved). But when tool-dependent verification applies to a specific population while source represents general claim, resolution isn't simple "tool wins" — it's "tool wins for this context, source may still apply elsewhere."

**Suggested Refinement:**
> For tool-dependent vs. source conflicts in medicine, distinguish population-specific vs. generalizable claims. Tool-dependent wins for measured population; source may remain valid for other populations. Document scope of applicability.

---

## Edge Case 3: Drill-Verified vs. Real-World Emergency

**Scenario:** CPR guidelines learned through simulation (drill-verified: passed ACLS certification) are applied to actual cardiac arrest and fail to resuscitate.

**Seed Hierarchy Says:** Drill-verified (#1) is highest reliability.

**Medical Reality:** Drill verification tests:
- Correct technique execution
- Standardized scenarios
- Clean conditions

Real emergencies involve:
- Patient comorbidity
- Environmental factors
- Time delays
- Equipment limitations

**Edge Case Test Fails:** The rule doesn't account for the gap between simulation and reality. Drill-verified certification indicates competence, but doesn't guarantee effectiveness in every real scenario. The test asks "is confidence tied to tool-verification status" but doesn't address simulation-to-reality transfer.

**Suggested Refinement:**
> In medical safety domains, drill-verified status should require explicit "simulation-to-reality transfer gap" documentation. Include `drill-to-real-transfer-risk:` field indicating known differences between drill conditions and real-world execution.

---

## Edge Case 4: Conflicting Expert Consensus (Source Quality)

**Scenario:** Two authoritative medical sources (both high source-quality) disagree: Source A (New England Journal of Medicine) recommends Drug X; Source B (The Lancet) recommends Drug Y for the same condition.

**Seed Hierarchy:** Both are Source mode, same priority level.

**Medical Reality:** This represents genuine medical uncertainty, not verification failure. The disagreement reflects:
- Different study populations
- Different outcome measures
- Different risk tolerances
- Evolving evidence

**Edge Case Test Fails:** The rule's resolution hierarchy says source quality within mode should weight (high-quality vs. low-quality). But both are high-quality. The rule doesn't address what to do when top-tier sources conflict.

**Suggested Refinement:**
> For source-vs-source conflicts where both sources have equivalent quality, use "preservation" strategy: keep both with `consensus-level:` tagged (unanimous|majority|divergent) and `evidence-synthesis:` noting what would resolve the uncertainty (e.g., "waiting for head-to-head trial"). Don't default to recency.

---

## Edge Case 5: Patient-Reported Outcome (Embodied) vs. Clinical Measure

**Scenario:** Clinical measures show disease remission (tool-dependent verification: imaging and blood markers), but patient reports severe symptoms (embodied verification: quality of life reporting).

**Seed Hierarchy:** Tool-dependent (#3) > Embodied (#4). Clinical measures should win.

**Medical Reality:** Patient-reported outcomes (PROs) are increasingly recognized as critical in medicine. The patient's embodied experience is the ultimate truth about their quality of life — clinical measures are proxies.

**The Conflict:** This isn't a verification conflict to "resolve" — it's complementary knowledge. Tool shows objective disease state; embodied shows subjective experience.

**Edge Case Test Fails:** The rule asks for resolution outcome (one wins or preserved). But in this case, both are valid and represent different dimensions. Preservation is correct, but the rule frames this as "conflict resolution" rather than "complementary integration."

**Suggested Refinement:**
> In medicine, tool-dependent vs. embodied conflicts often represent complementary dimensions, not conflicting claims. Distinguish: conflicts (one is wrong) vs. complements (both are true but measure different things). Use `conflict-type: contradictory|complementary` frontmatter.

---

## Edge Case 6: Temporal Recency Within Mode

**Scenario:** An older RCT (empirical, 2015) shows Drug A is effective. A newer RCT (empirical, 2023) shows Drug A is no better than placebo.

**Seed Hierarchy:** Both empirical, recency should resolve.

**Medical Reality:** Newer isn't automatically better in medicine:
- Larger sample size in older study
- Different patient populations
- Drug resistance developed
- Earlier study had methodological flaws

**Edge Case Test Fails:** The rule says "recent empirical results may override older empirical results within the empirical mode" but doesn't account for within-mode quality weighting.

**Suggested Refinement:**
> In medical empirical conflicts, don't default to recency. Weight by: sample size, study design (RCT > cohort > case series), replication, and statistical power. Track `evidence-quality:` alongside verification-date.

---

## Edge Case 7: Multi-Modal Verification in Precision Medicine

**Scenario:** Genomic testing (tool-dependent) shows a specific mutation. Clinical presentation (embodied) doesn't match typical phenotype for that mutation. Source literature (textbook) says they should match.

**Seed Hierarchy:** Tool-dependent (#3) > Embodied (#4) > Source (#5).

**Medical Reality:** This represents cutting-edge precision medicine edge cases:
- Known phenotypic variation
- Novel mutations
- Incomplete knowledge

No single mode "wins" — this is new knowledge that expands the source literature.

**Edge Case Test Fails:** The resolution strategies (mode-priority, domain-priority, preservation, escalation) don't account for "knowledge expansion" — cases where the conflict reveals the Seed itself is incomplete.

**Suggested Refinement:**
> For conflicts where no resolution satisfies known evidence, escalate with `knowledge-expansion: true`. This signals the Seed needs updating to handle this edge case, not just the individual note.

---

## Summary: Rule Weaknesses in Medical Domain

| Edge Case | Seed Hierarchy Fails Because... |
|----------|-------------------------------|
| Clinical experience vs. RCT | Both capture valid knowledge; integration, not selection, is correct |
| Lab vs. textbook | Population-specific vs. generalizable requires scope tagging |
| Drill vs. real emergency | Simulation doesn't guarantee real-world transfer |
| Expert consensus conflict | Equivalent quality sources need preservation with synthesis |
| Clinical measure vs. PRO | Complementary dimensions, not contradictory |
| Temporal recency | Newer ≠ better in medical evidence |
| Precision medicine | Conflicts can reveal Seed gaps, not just note conflicts |

---

## Critical Finding

The verification-mode conflict resolution rule assumes conflicts are resolvable through hierarchy. In medicine, many conflicts represent:
1. Different populations (can't generalize)
2. Different dimensions (complementary, not contradictory)
3. Genuine uncertainty (both may be wrong)
4. Knowledge expansion (Seed needs updating)

The rule needs to distinguish "resolution" (determine which is correct) from "integration" (preserve both as valid in different contexts).

---

## Recommendations for Seed Refinement

1. Add `conflict-type: contradictory|complementary|uncertain|expanding` frontmatter to distinguish conflict nature
2. For medical domain specifically: clinical experience (embodied) and empirical evidence should use integration strategy, not hierarchy resolution
3. Add `population-scope:` field for tool-dependent verifications to indicate generalizability
4. For drill-verified in medical: add `drill-to-real-transfer-risk:` with known gaps
5. Add `knowledge-expansion: true` for conflicts that reveal Seed limitations

---

## Related Notes

- [[Seed Gap - Verification Mode Conflict Resolution]] — Original gap analysis
- [[Seed Stress Test - Source Quality Hierarchy in Medical Knowledge]] — Medical evidence tiers
- [[Seed Stress Test - Tool-Dependent Verification in Medical Knowledge]] — Medical equipment verification
- [[Seed Stress Test - Knowledge Activation States in Medical Knowledge]] — Medical knowledge states

---

**Test Result:** The verification-mode conflict resolution rule FAILS multiple edge cases in medical domain. Rule needs refinement before it can be considered fully domain-agnostic.

**Status:** Edge cases documented, refinement recommendations proposed