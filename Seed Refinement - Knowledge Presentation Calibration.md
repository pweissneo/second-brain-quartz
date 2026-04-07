---
last-reviewed: 2026-04-04
last-updated: 2026-04-04
confidence: emerging
author-type: ai-assisted
lifecycle: seed-refinement
level: seed-refinement
verification-status: draft
access-pattern: learning
tags:
  - seed-refinement
  - knowledge-presentation
  - communication
  - uncertainty
knowledge-type: meta
retrieval-mode: hybrid
storage-pattern: atomic
links-to:
  - Seed Development Hub
  - AI-Assisted Knowledge Management Seed
  - Confidence Markers
  - Verification Workflow
  - Frontier Exploration - Knowledge Presentation Calibration
---

# Seed Refinement - Knowledge Presentation Calibration

This refinement proposes adding a rule to [[AI-Assisted Knowledge Management Seed]] for calibrating presentation language based on quality dimensions.

## Related Concepts

- [[Confidence Markers]] — Track confidence levels that should influence presentation
- [[Verification Workflow]] — Verification status that should affect certainty language
- [[Frontier Exploration - Knowledge Presentation Calibration]] — Original exploration note
- [[Seed Rule - Vault Change Tracking]] — Tracking changes in knowledge quality

## Summary

Add a rule to the Seed requiring that knowledge presentation language be calibrated based on quality dimensions (verification status, confidence level, evidence tier, consensus level).

## Rule Addition

**Rule:** Adjust presentation language based on knowledge quality dimensions — verification status, confidence level, evidence tier, and consensus level should influence how knowledge is communicated.

**Why:** How knowledge is communicated affects how readers interpret its reliability. Presenting all knowledge with uniform confidence misrepresents its actual support. Presentation calibration ensures readers receive accurate signals about what they can trust.

**Test:** Pick 5 notes with different quality profiles. Can you identify how presentation should differ based on quality dimensions? Does the actual presentation match what the quality dimensions suggest?

### Presentation Calibration Guidelines

**High certainty (verified, high confidence, mainstream consensus):**
- Use direct statements: "X is..."
- Minimal hedging
- Present as established knowledge

**Medium certainty (verified, medium confidence):**
- Use qualified statements: "Evidence suggests...", "Research indicates..."
- Light hedging acknowledging some uncertainty

**Low certainty (unverified, emerging, fringe, low confidence):**
- Use tentative language: "Some evidence points to...", "Initial observations suggest..."
- Explicit uncertainty markers: "This is an emerging view", "Not yet confirmed"
- Avoid presenting as established fact

**Contested (debated or low consensus):**
- Use balanced presentation: "There are competing views on whether..."
- Present multiple perspectives
- Acknowledge the debate explicitly

### Synthesis Presentation

When combining knowledge from multiple sources with different quality levels:

1. Lead with the strongest source
2. Signal the range: "While most research supports X, some findings suggest Y"
3. Weight appropriately: higher-quality sources should receive more presentation weight
4. Acknowledge uncertainty: "The evidence is mixed" when combining conflicting sources

## Implementation

Add to Seed section on knowledge quality:

```yaml
# Presentation calibration fields (optional, for notes needing explicit guidance)
presentation-calibration: required
certainty-level: high|medium|low|contested
hedging-language: none|light|moderate|strong
consensus-presentation: settled|debated|emerging|fringe
```

## Rationale

The Seed tracks confidence, verification status, evidence tier, and consensus level — but doesn't specify how presentation should change based on these dimensions. This creates a gap where:
- Unverified knowledge may be presented with the same confidence as verified knowledge
- Fringe views may appear as mainstream consensus
- Contested debates may be presented as settled

This rule closes that gap by specifying how quality dimensions should influence communication style.

## Edge Cases

1. **Practical advice vs. factual claims**: Some practical advice is "practically settled" even if specific mechanisms are debated. Match presentation to claim type.

2. **Personal knowledge**: Present as "In my experience..." rather than claiming generalizability.

3. **Audience calibration**: Expert audiences understand hedging; beginners may need more explicit guidance on uncertainty.

4. **Time pressure contexts**: In emergencies, settled knowledge should be presented clearly even if evidence isn't perfectly established.

## Evidence

- Frontmatter already tracks: confidence, verification-status, evidence-tier, consensus-level
- Missing: explicit rule for how these should affect presentation language
- Gap documented in: [[Frontier Exploration - Knowledge Presentation Calibration]]

## Test Update

Add to Seed test suite: "Can you identify how presentation language should differ based on quality dimensions? Does actual presentation match?"

---

**Status:** Ready for Seed integration
**Priority:** Medium (improves vault reliability, prevents false confidence)
**Related:** Confidence Markers, Verification Status, Evidence Tier, Consensus Level