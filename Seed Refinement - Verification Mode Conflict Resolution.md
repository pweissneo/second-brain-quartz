---
last-reviewed: 2026-03-31
last-updated: 2026-03-31
confidence: emerging
author-type: ai-assisted
lifecycle: seed-refinement
level: seed-refinement
verification-status: unverified
tags:
  - seed-refinement
  - verification-modes
  - conflict-resolution
  - knowledge-quality
---

# Seed Refinement - Verification Mode Conflict Resolution

> Refinement: Add explicit rule for resolving conflicts when different verification modes produce different results.

## Gap Source

- [[Seed Gap - Verification Mode Conflict Resolution]] — gap identified, analyzed, and proposed
- Related: [[Verification Workflow]], [[Frontier Exploration - Knowledge Consensus Level Tracking]]

## Problem Summary

The Seed has separate rules for different verification modes (source, empirical, tool-dependent, drill-verified, embodied) but lacks guidance for when these modes produce **conflicting results**:

1. Source verified + empirically failed: Trusted recipe tested and failed
2. Tool-dependent conflicts with source: Chemical analysis contradicts historical sources  
3. Drill-verified contradicts expert consensus: Procedure works in drills, fails in real case
4. Embodied contradicts empirical: "Feels right" vs. controlled study results

## Proposed Rule Addition

**Rule (NEW - 2026-03-31):** When verification modes produce conflicting results, apply a **verification-mode conflict resolution protocol** — document the conflict, specify resolution methodology, preserve both results, and assign confidence based on resolution outcome.

**Why:** Different verification modes test different aspects of truth quality. A drill-verified procedure has survived practical testing under stress; a source-verified claim has not. Without explicit hierarchy and domain-weighting, conflicting verifications create false confidence. AI agents default to source (most accessible) regardless of reliability.

**Test:** For any note where two verification modes produced different results:
1. Is conflict documented with `verification-conflict:` field showing both modes and their results?
2. Is resolution methodology explicit (mode-priority or domain-priority)?
3. Does confidence reflect the resolution (disputed if unresolved, weighted if resolved)?
4. Are both verification results preserved (not deleted to force single source)?

## Implementation

Add to Seed section on "Knowledge Quality and Verification":

```yaml
# For conflicting verification modes
verification-conflict:
  mode1: [source|empirical|tool-dependent|drill-verified|embodied]
  mode1-result: pass|fail
  mode1-date: YYYY-MM-DD
  mode2: [source|empirical|tool-dependent|drill-verified|embodied]  
  mode2-result: pass|fail
  mode2-date: YYYY-MM-DD
  resolution-methodology: mode-priority|domain-priority|preservation|escalation
  resolution-outcome: which-mode-wins
  resolution-rationale: "Why this resolution applies"
  confidence: disputed|resolved-weighted
  conflict-status: resolved|acknowledged|escalated
```

## Conflict Resolution Hierarchy

### Mode-Priority (default when no domain context)
1. **Drill-verified** — Highest for action/safety (survived real-world stress test)
2. **Empirical** — Direct execution produces consistent results
3. **Tool-dependent** — Physical/chemical measurement (objective, repeatable)
4. **Embodied** — Personal sensory experience
5. **Source** — Authority vouching (depends on source quality)

### Domain-Priority (override for specific domains)
- Safety/emergency → drill-verified always wins
- Experiential quality (taste, feel) → embodied wins over source
- Physical/chemical claims → tool-dependent wins over empirical
- Historical facts → source (no other mode applicable) wins
- UX/effectiveness → empirical wins over source

## Resolution Strategies

| Strategy | Use When | Result |
|----------|----------|--------|
| mode-priority | No domain context | Higher mode wins |
| domain-priority | Domain has established standards | Domain-appropriate wins |
| preservation | Both modes valid but context differs | Both preserved with conflict note |
| escalation | Truly ambiguous, requires human judgment | Mark as disputed, defer |

## Edge Cases

1. **Emergency consensus override**: Domain-priority applies — verification mode appropriate for domain wins (drill for safety)

2. **Novel evidence tier**: High-quality new empirical (RCT) may override systematic review (source) — resolve by evidence quality within mode

3. **Embodied knowledge conflict**: Preserve both results — embodied may capture edge cases studies miss. Use preservation, not deletion

4. **Source quality within mode**: High-quality source (peer-reviewed) vs low-quality (blog) — weight by quality within source mode

5. **Temporal recency**: Recent empirical may override older empirical — track `verification-date` per mode

6. **Cross-tier conflicts**: Lower mode with strong evidence (flawless drill test) may override higher mode with weak evidence (flawed empirical) — domain-priority override applies

## Distinction from Existing Seed Coverage

| Concept | Covered? | Coverage Method |
|---------|----------|-----------------|
| Verification modes | Yes | Individual rules per mode |
| Seed rule conflicts | Yes | Priority hierarchy (safety > accuracy > domain) |
| Contradictory sources | Yes | External source conflicts |
| **Verification mode conflicts** | **No** | This refinement adds it |

## Stress Test Scenarios

### Test 1: Recipe Failure
A recipe from a trusted cookbook (source: high) is cooked and produces poor results (empirical: fail).
- Expected: conflict documented, empirical wins (domain-priority: cooking where execution matters)

### Test 2: Safety Procedure Anomaly
Emergency procedure verified in drills (drill-verified) but failed in one real incident (empirical: partial fail).
- Expected: conflict documented, drill-verified wins (domain-priority: safety > drill > empirical)

### Test 3: Chemical vs Historical
Chemical analysis shows ingredient A doesn't exist in period (tool-dependent: fail) but historical source mentions it (source: pass).
- Expected: conflict documented, tool-dependent wins for factual claims about chemical composition

## Related Notes

- [[Seed Gap - Verification Mode Conflict Resolution]] — Original gap analysis
- [[Verification Workflow]] — Existing verification process
- [[Frontier Exploration - Knowledge Consensus Level Tracking]] — Consensus as dimension
- [[Seed Refinement - Enhanced Note Lifecycle Model]] — Lifecycle for conflicting knowledge