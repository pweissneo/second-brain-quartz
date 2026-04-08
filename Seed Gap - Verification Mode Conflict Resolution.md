---
last-reviewed: 2026-04-01
last-updated: 2026-04-01
lifecycle: seed-gap
confidence: high
author-type: ai-assisted
verification-status: verified
gap-status: integrated
gap-type: seed-missing
gap-source: manual
gap-severity: useful
gap-phase: verification
discovered: 2026-03-30
resolved: 2026-04-01
resolved-by: Seed Rule (integrated 2026-03-31)
gap-review-date: 2026-04-30
resolution-deadline: 2026-04-30
tags:
  - seed-gap
  - verification
  - conflict-resolution
  - verification-modes
  - archived
---

> ✅ **This Seed Gap has been RESOLVED and integrated into the Seed.**
> The proposed rule has been incorporated into [[AI-Assisted Knowledge Management Seed.md]] as of 2026-03-31.
> This note is preserved for historical reference and documentation purposes.

# Seed Gap - Verification Mode Conflict Resolution

## Gap Identified: 2026-03-30
## Gap Analyzed: 2026-03-30

### What Is Missing

The Seed has extensive rules for different verification modes (source, empirical, tool-dependent, drill-verified, embodied). However, **it lacks guidance for when different verification modes produce conflicting results**.

### The Problem

A piece of knowledge can be verified by multiple pathways, and they can disagree:

1. **Source verified + empirically failed**: A recipe from a trusted cookbook (source quality: high) is empirically tested and produces poor results. What's the resolution?

2. **Tool-dependent verified + source verified conflicts**: Chemical analysis says one thing, historical sources say another.

3. **Drill-verified contradicts expert consensus**: Emergency procedure that works in drills fails in one real case - how to weight?

4. **Embodied contradicts empirical**: "This feels right" (experiential verification) vs controlled study results.

5. **Cross-source conflicts at different evidence tiers**: A systematic review says X, but a recent RCT says Y. Which wins?

### Why This Matters

Without conflict resolution rules:
- Verification becomes ambiguous when modes disagree
- The most recent verification may override regardless of quality
- Different verification modes may produce consistent confidence that masks actual uncertainty
- AI agents may silently default to one mode (usually source) when others conflict

### Gap Analysis

**Root cause:** The Seed has separate rules for each verification mode but no meta-rule governing mode interactions. Each mode operates in isolation, so when modes produce different results, there's no resolution framework.

**Related Seed rules:** The Seed already has a rule for resolving Seed rule conflicts using priority hierarchy (safety > accuracy > domain-adaptation...). The verification mode conflict gap is analogous but needs its own hierarchy for verification contexts.

**The pattern:** Different verification modes test different aspects of truth quality:
- **Drill-verified** — Real-world stress test under controlled conditions (highest reliability for action knowledge)
- **Empirical** — Direct execution produces consistent results (highest reliability for experiential knowledge)
- **Tool-dependent** — Measurement equipment confirms claims (highest reliability for physical/chemical claims)
- **Embodied** — Personal sensory experience (high reliability for subjective quality, low for generalizability)
- **Source** — Authority vouches for accuracy (depends entirely on source quality)

### Proposed Rule (Refined)

**Rule (NEW - 2026-03-30):** When verification modes produce conflicting results, apply a **verification-mode conflict resolution protocol** that distinguishes test type, weights by domainappropriateness, and preserves both results with explicit conflict documentation.

**Why:** Different verification modes test different aspects of truth quality. A drill-verified procedure has survived practical testing under stress conditions; a source-verified claim has not. Without explicit hierarchy and domain-weighting, conflicting verifications create false confidence and AI agents default to source (the most accessible mode) regardless of reliability.

**Test:** For any note where two verification modes produced different results: (1) Is the conflict documented with `verification-conflict: {mode1} vs {mode2}`? (2) Is the resolution methodology explicit (domain-priority or mode-priority)? (3) Does confidence reflect the resolution (disputed if unresolved, weighted if resolved)? (4) Is both verification evidence preserved (not deleted to force single source)?

**Implementation:**

```yaml
verification-conflict:
  mode1: tool-dependent
  mode1-result: fail
  mode1-date: 2026-03-28
  mode2: source
  mode2-result: pass
  mode2-date: 2026-03-25
  resolution-methodology: domain-priority  # or mode-priority
  resolution-outcome: tool-dependent-wins
  resolution-rationale: "Chemical analysis overrides historical record"
  confidence: disputed
  conflict-status: resolved|acknowledged|escalated
```

**Conflict Resolution Hierarchy:**

*Mode-priority (default when no domain context):*
1. **Drill-verified** — Highest reliability for action/safety knowledge (survived real-world stress test)
2. **Empirical** — Direct execution produces consistent results
3. **Tool-dependent** — Physical/chemical measurement (objective, repeatable)
4. **Embodied** — Personal sensory experience
5. **Source** — Authority vouching (depends on source quality)

*Domain-priority (override mode-priority for specific domains):*
- Safety/emergency → drill-verified wins always
- Experiential quality (taste, feel) → embodied wins over source
- Physical/chemical claims → tool-dependent wins over empirical
- Historical facts → source (no other mode applicable) wins
- UX/effectiveness → empirical wins over source

**Resolution strategies:**
- **Mode-priority**: Higher mode in hierarchy wins (use when no domain context)
- **Domain-priority**: Domain-appropriate mode wins (use when domain has established verification standards)
- **Preservation**: Keep both results with conflict documentation (use when both modes are valid but context differs)
- **Escalation**: Mark as disputed and defer to human judgment (use when resolution is truly ambiguous)

### Edge Cases

- **Emergency consensus override**: In time-critical situations, the verification mode appropriate for the domain (drill for safety) should win, not always the highest-priority mode. This is domain-priority in action.

- **Novel evidence tier**: A high-quality new study (RCT) may override systematic review consensus — this is empirical vs source conflict resolved by evidence quality within mode. Update verification evidence date and resolution accordingly.

- **Embodied knowledge conflict**: Experiential knowledge that contradicts empirical findings should be preserved (not deleted) with explicit conflict notation — embodied knowledge may capture edge cases that controlled studies miss. Use preservation strategy, not deletion.

- **Source quality within mode**: "Source verified" conflicts between high-quality source (peer-reviewed) and low-quality source (blog) should weight by quality within the mode, not just mode-level priority. Use `source-quality: high|medium|low` to refine source-priority resolutions.

- **Temporal recency within mode**: Recent empirical results may override older empirical results within the empirical mode. Track `verification-date` per mode to identify which result is current.

- **Cross-tier conflicts**: When a lower-tier verification mode (source) produces stronger evidence than a higher-tier mode (e.g., flawed drill test), domain-priority override applies. Strong evidence within any mode can override weak evidence in a higher mode.

### Implementation Notes

**When to use mode-priority vs domain-priority:**
- Default to mode-priority when no domain-specific verification standards exist
- Switch to domain-priority when domain has established verification hierarchies (medical: RCT > systematic review > case series; safety: drill > simulation > theoretical)
- Document which methodology was used in `resolution-methodology`

**Conflict documentation requirements:**
- Both verification modes must be tagged in frontmatter
- Both results must be preserved (do not delete lower-priority result)
- Resolution must include rationale (why this mode wins)
- Confidence must reflect resolution (not original mode results)
- Link to related notes that may have additional context

**Conflict escalation criteria:**
- Conflicting results persist after 2+ verification attempts
- Both modes have equivalent evidence quality within their tier
- Domain lacks clear verification hierarchy
- Resolution would change critical knowledge (safety, medical, legal)
- Mark as `conflict-status: escalated` and include `escalation-reason:`

### Related Notes

- [[Verification Workflow]] - existing verification process with mode descriptions
- [[Frontier Exploration - Knowledge Consensus Level Tracking]] - consensus as a dimension
- [[Seed Stress Test - Source Quality Hierarchy in Medical Knowledge]] - evidence tier conflicts in medical domain
- [[Note Lifecycle Management]] - lifecycle for conflicting knowledge
- [[AI-Assisted Knowledge Management Seed]] - core verification rules and Seed rule conflict resolution (analogous pattern)

---

**Gap status:** analyzed (proposed rule refined and ready for Seed integration)
**Next step:** Integrate proposed rule into Seed.md if approved