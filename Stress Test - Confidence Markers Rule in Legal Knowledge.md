---
last-reviewed: 2026-03-09
lifecycle: emerging
confidence: emerging
tags:
- seed-stress-test
- confidence-markers
- legal-domain
- edge-case
---

# Stress Test: Confidence Markers Rule in Legal Knowledge

## The Rule

**Rule:** Use confidence markers (high/emerging/disputed/obsolete) to signal reliability of knowledge.

**Why:** Readers need to distinguish established facts from debated hypotheses without reading source chains.

**Test:** Do notes with contested claims include confidence metadata?

## Domain: Legal Knowledge

### Does the rule make sense?

**Yes.** Legal knowledge has inherent uncertainty levels:

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

The AI can apply the test mechanically but may need human verification for nuanced legal determinations.

### Edge Cases

1. **Jurisdictional variation**: "The exclusionary rule applies" is high confidence in federal courts but may have exceptions in state courts. The note needs both confidence AND jurisdiction tags.

2. **Temporal shifts**: A "confidence: high" note about Roe v. Wade would now be wrong. Legal knowledge has unique temporal fragility.

3. **Secondary sources vs. primary**: Legal treatises (secondary) may express uncertainty about primary sources. Confidence markers need to distinguish source type.

4. **International law**: Treaties have different levels of enforceability. The confidence marker needs to account for whether a rule is customary international law vs. aspirational.

### Refinements Needed

1. **Add temporal requirement to confidence**: Legal notes with `confidence: high` should require `last-reviewed` within 6 months, because legal landscapes shift quickly.

2. **Distinguish legal source tiers**:
   - Constitutional provision (highest authority)
   - Supreme Court precedent
   - Circuit court (binding only in circuit)
   - District court (persuasive)
   - Administrative regulation
   - Scholarly commentary (lowest)

3. **Require jurisdiction scope**: Legal confidence markers without jurisdiction are misleading. "confidence: high" on US law means nothing to a UK practitioner.

### Test Refinement

Original test: "Do notes with contested claims include confidence metadata?"

Refined test for legal domain:
1. Identify notes with legal claims
2. Check for `confidence` metadata
3. Verify `jurisdiction` metadata exists (required for legal)
4. Verify `last-reviewed` is within 6 months for `confidence: high` notes
5. Check for source tier (constitutional/statutory/case-law/scholarly)

### Conclusion

The Confidence Markers rule is valuable but needs domain-specific refinement for legal knowledge. The original test is executable but incomplete for legal accuracy. Adding temporal and jurisdictional requirements makes it robust.

## Related
- [[Confidence Markers]] — The rule being stress tested
- [[Handling Temporal Knowledge]] — Temporal aspects affecting confidence
- [[Domain-Specific Knowledge Bases]] — Domain-specific adaptations
- [[Source Validation Over Time]] — Keeping sources accurate over time
