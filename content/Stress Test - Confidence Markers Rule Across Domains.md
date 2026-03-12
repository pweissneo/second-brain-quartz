---
last-reviewed: 2026-03-11
lifecycle: active
confidence: emerging
tags:
- seed-stress-test
- confidence-markers
- edge-case
- multi-domain
- scientific-research
- legal-knowledge
- culinary-knowledge
---

# Stress Test: Confidence Markers Rule Across Domains

> Testing Seed rule: "Use confidence markers (high/emerging/disputed/obsolete) to signal reliability of knowledge."

This note consolidates stress tests from multiple domains (Legal, Scientific Research) to provide a comprehensive view of the Confidence Markers rule's strengths and limitations.

## The Rule

**Rule:** Use confidence markers (high/emerging/disputed/obsolete) to signal reliability of knowledge.

**Why:** Readers need to distinguish established facts from debated hypotheses without reading source chains.

**Test:** Do notes with contested claims include confidence metadata?

---

## Domain 1: Scientific Research

In scientific research, "confidence" has a very specific meaning that differs from everyday usage.

### Does the rule make sense?

**Yes, but with complications.**

In scientific literature, confidence levels are explicitly defined:
- **High**: Reproduced by multiple independent studies, meta-analyses, consensus statements
- **Emerging**: New findings, limited replication, active research area
- **Disputed**: Conflicting results, active debate, competing theories
- **Obsolete**: Superseded by newer understanding, rejected by subsequent evidence

The Seed's markers align with scientific practice. However, there's a gap: scientific confidence also depends on **evidence tier** (systematic review > RCT > observational > case report > expert opinion).

### Is the Test executable?

**Partially.**

The Test asks: "Do notes with contested claims include confidence metadata?"

This is executable, but insufficient for scientific knowledge because:
1. An AI cannot independently assess whether a claim is "high" confidence - it needs source evaluation
2. Scientific confidence changes over time as new studies emerge
3. The distinction between "emerging" and "disputed" requires domain expertise

### Scientific Edge Cases

**Edge Case 1: Conflicting Studies**
When two high-quality studies reach opposite conclusions, is the confidence "disputed" or "high" for each?

**Resolution:** The note should present both with "disputed" confidence, citing both sources. Don't pick winners.

**Edge Case 2: Preliminary Results**
Preprints (papers not yet peer-reviewed) - what's the confidence level?

**Resolution:** Use "emerging" with a note like "preprint - not peer reviewed" and include `peer-review-status: pending`.

**Edge Case 3: Consensus That Turns Out Wrong**
Historical examples: "the earth is the center of the universe" was once "high" confidence.

**Resolution:** Notes with historical confidence should include `status: superseded` with a pointer to the current understanding.

**Edge Case 4: Replication Crisis Domains**
In psychology, many "high" confidence findings have failed replication. How should notes represent this?

**Resolution:** Use `replication-status: replicated/failed-replication/pending` in addition to confidence markers.

---

## Domain 2: Legal Knowledge

Legal knowledge has inherent uncertainty levels different from scientific domains.

### Does the rule make sense?

**Yes.** Legal knowledge requires unique considerations:

- **High confidence**: Supreme Court precedent, settled statutes, unanimous circuit court holdings
- **Emerging**: Recent district court rulings not yet appealed, proposed legislation
- **Disputed**: Split circuit holdings, circuit conflicts, contested interpretations
- **Obsolete**: Overruled cases, repealed statutes, abrogated rules

### Is the Test executable?

**Partially.** An AI can:
- Identify notes with contested claims
- Check for confidence metadata
- Flag missing markers

**However**, determining whether a legal claim is "disputed" requires:
- Research into current circuit conflicts
- Understanding of legal scholarship debates
- Awareness of recent developments that may have changed the landscape

### Legal Edge Cases

**Edge Case 1: Jurisdictional Variation**
"The exclusionary rule applies" is high confidence in federal courts but may have exceptions in state courts. The note needs both confidence AND jurisdiction tags.

**Resolution:** Legal confidence notes must include `jurisdiction:` metadata.

**Edge Case 2: Temporal Shifts**
A "confidence: high" note about Roe v. Wade would now be wrong. Legal knowledge has unique temporal fragility.

**Resolution:** Legal notes with `confidence: high` should require `last-reviewed` within 6 months.

**Edge Case 3: Secondary Sources vs. Primary**
Legal treatises (secondary) may express uncertainty about primary sources. Confidence markers need to distinguish source type.

**Resolution:** Add `source-tier: constitutional/statutory/case-law/scholarly` for legal notes.

**Edge Case 4: International Law**
Treaties have different levels of enforceability. The confidence marker needs to account for whether a rule is customary international law vs. aspirational.

---

---

## Domain 3: Culinary/Knowledge

Cooking knowledge has unique confidence considerations that differ from both scientific and legal domains.

### Does the rule make sense?

**Partially.** Some cooking knowledge has clear confidence levels:
- **High**: Food safety temperatures (USDA guidelines), Maillard reaction chemistry
- **Emerging**: New cooking techniques, recent molecular gastronomy research
- **Disputed**: Conflicting expert advice on specific techniques
- **Obsolete**: Outdated food safety guidance, superseded cooking methods

However, much of cooking knowledge doesn't fit neatly into these categories.

### Culinary Edge Cases

**Edge Case 1: Traditional Wisdom**
Many cooking techniques are "traditional" without scientific validation:
> "Always salt pasta water until it tastes like the sea"
> "Let meat rest for half the cooking time"

Are these "high" confidence (proven over generations) or "emerging" (folk wisdom without rigorous testing)?

**Resolution:** Introduce a "traditional" confidence level or use `source-type: traditional` in addition to confidence markers.

**Edge Case 2: Taste Preferences**
Claims about taste are inherently subjective:
> "Dark chocolate pairs well with Cabernet Sauvignon"
> "Thai food is best with jasmine rice"

These aren't "disputed" — they're subjective. The rule assumes knowledge can be objectively rated.

**Resolution:** Add `claim-type: subjective` for taste/preference claims alongside confidence markers.

**Edge Case 3: Recipe Success Rates**
Is a recipe "high confidence" if it works 90% of the time? What about 70%?
> "This cake recipe never fails me"
> "This bread is foolproof"

**Resolution:** These are confidence claims about reproducibility, not factual accuracy. Use `verification-status: personal-validation` or `reproducibility: high/medium/low`.

**Edge Case 4: Cultural Authenticity Claims**
"Authentic" is a confidence claim about tradition:
> "This is the authentic way to make sushi"
> "Traditional Neapolitan pizza must have..."

**Resolution:** Use `confidence: traditional` with `cultural-context:` metadata noting the region of origin.

**Edge Case 5: Dietary/Nutritional Claims**
Nutrition advice changes frequently:
> "Eggs are good for you" vs "Eggs are bad for you"
> "Butter is better than margarine"

**Resolution:** These flip between "high" and "disputed" as science evolves. Require `last-reviewed` within 6 months for nutritional claims.

**Edge Case 6: Technique Variations**
Different experts give conflicting advice:
> Gordon Ramsay: "Rest meat for half the cooking time"
> America's Test Kitchen: "Rest meat for 10-20 minutes regardless of size"

**Resolution:** Present both as alternatives with `confidence: expert-opinion` and `expert-source:` for each.

---

## Unified Refinements

### Refinement 1: Add temporal requirement to confidence

Notes with `confidence: high` should require `last-reviewed` within a domain-appropriate timeframe:
- Legal: 6 months
- Scientific: 12 months (or based on publication date)
- General: 12 months

### Refinement 2: Domain-specific evidence tiers

| Domain | Evidence Tier Examples |
|--------|------------------------|
| Scientific | systematic-review > rct > observational > case-study > expert-opinion |
| Legal | constitutional > supreme-court > circuit > district > scholarly |
| General | verified > sourced > anecdotal |

### Refinement 3: Require scope/jurisdiction tags

For domain-sensitive knowledge, confidence without scope is misleading:
- Legal: require `jurisdiction: [US, EU, UK, etc.]`
- Scientific: require `context: [lab-reproduced, field-study, etc.]`
- Geographic: require `region:` or `climate-zone:`

### Refined Test for Domain-Specific Knowledge

1. Identify notes with contested/factual claims
2. Check for `confidence` metadata
3. Verify domain-appropriate scope metadata exists (jurisdiction, region, etc.)
4. Verify `last-reviewed` is within appropriate timeframe for `confidence: high`
5. Check for evidence-tier or source-tier metadata

## Proposed Seed Rule Refinement

**For scientific domains, add to the Confidence Markers rule:**

> **Rule:** For scientific knowledge, include evidence-tier metadata in addition to confidence markers.
> **Why:** Scientific confidence is hierarchical - a systematic review carries more weight than a single study.
> **Test:** For scientific claims: (1) Is there confidence metadata? (2) Is there evidence-tier metadata? (3) Does the confidence level match the evidence tier?

**For legal domains, add:**

> **Rule:** Legal confidence markers require jurisdiction scope and recent review dates.
> **Why:** Legal standards vary by jurisdiction and change over time.
> **Test:** For legal claims: (1) Is there confidence metadata? (2) Is there jurisdiction metadata? (3) Is last-reviewed within 6 months?

**For culinary/cooking domains, add:**

> **Rule:** For culinary knowledge, use claim-type markers (objective/subjective/preference-dependent) in addition to confidence markers.
> **Why:** Much cooking knowledge is subjective (taste preferences) or traditional (unscientific but proven over generations). Subjectivity markers help readers understand the nature of the claim.
> **Test:** For culinary claims: (1) Is there confidence metadata? (2) Is there claim-type metadata? (3) For traditional claims, is source-type documented?

## Related
- [[Confidence Markers]] — The rule being stress tested
- [[Handling Temporal Knowledge]] — Temporal aspects affecting confidence
- [[Domain-Specific Knowledge Bases]] — Domain-specific adaptations
- [[Source Validation Over Time]] — Keeping sources accurate over time
- [[Stress Test - Source Quality Hierarchy in Medical Knowledge]] — Related domain testing
- [[Stress Test - Atomicity Rule Across Domains]] — Related stress test across multiple domains
