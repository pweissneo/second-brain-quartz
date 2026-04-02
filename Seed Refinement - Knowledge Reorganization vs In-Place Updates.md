---
last-reviewed: 2026-04-02
last-updated: 2026-04-02
lifecycle: seed-extension
confidence: established
author-type: ai-assisted
tags: [seed-refinement, knowledge-reorganization, structural-maintenance]
schema-version: 1.0
source-gap: Seed Gap - Knowledge Reorganization vs In-Place Updates
gap-status: resolved
resolution-type: rule-integration
integrated-into: AI-Assisted Knowledge Management Seed.md
integration-date: 2026-04-02
---

# Seed Refinement - Knowledge Reorganization vs. In-Place Updates

> Integrating structural reorganization guidance into the Seed

## Source Gap

[[Seed Gap - Knowledge Reorganization vs In-Place Updates]] identified that the Seed lacks guidance for structural reorganization — distinct from content updates, note splits, or merges. The gap proposed 5 rules that have now been integrated.

## Integration Summary

The following guidance from the gap has been incorporated into the Seed:

### 1. Reorganization Triggers (integrated at line ~1420)

**Rule:** Assess reorganization need when structural symptoms appear.

**Why:** Without explicit reorganization assessment, structural debt accumulates until it becomes paralyzing. Explicit triggers make reorganization proactive rather than reactive.

**Test:** Can you identify 3+ structural symptoms that would trigger reorganization assessment? Do you track structural health over time, not just current state?

**Trigger thresholds:**
- Hop depth trend increased >1 hop over 6 months
- Hub utilization dropped >30%
- Link coherence score declined significantly
- Category no longer reflects current interests

### 2. Reorganization Scope Assessment (integrated at line ~1420)

**Rule:** Use reorganization scope to determine approach.

**Why:** Not all reorganization is equal. Matching approach to scope prevents over-reaction to local problems and under-reaction to systemic issues.

**Test:** For reorganization need, can you categorize scope as: local (single hub/cluster), regional (multiple related hubs), or global (entire structure)? Does your approach match the scope?

**Approach mapping:**
- **Local scope** (1-3 hubs): Gradual migration, one hub at a time
- **Regional scope** (3-10 hubs): Plan migration sequence, execute in phases
- **Global scope** (entire vault): Consider rebuild instead; full reorganization is rarely worth the cost

### 3. Reorganization Cost Calculation (integrated at line ~1420)

**Rule:** Calculate reorganization cost before committing.

**Why:** Reorganization has a cost in broken links, time, and rollback risk. Without explicit cost calculation, AI agents either avoid necessary reorganization or perform unnecessary reorganization.

**Test:** Before reorganizing, can you estimate: (1) notes affected, (2) links to rewire, (3) time required, (4) rollback complexity? Is cost < benefit threshold before proceeding?

**Cost-benefit calculation:**
- Cost = notes_affected × avg_links_per_note × time_to_rewire
- Benefit = expected_improvement_in_navigability × expected_usage_frequency
- Proceed if benefit > cost × safety_factor (1.5)

### 4. Gradual vs. Radical Preference (integrated at line ~1420)

**Rule:** Prefer gradual reorganization for local scope.

**Why:** Radical reorganization creates large commits, risks broken links, and makes rollback difficult. Gradual reorganization allows learning, reduces risk, and maintains vault continuity.

**Test:** For local-scope reorganization, does your approach evolve structure over time rather than in one pass? Do you maintain backward compatibility during migration?

**Implementation:**
- Create new structure alongside old
- Add dual-link period (links to both old and new locations)
- Monitor usage to verify new structure works
- Remove old structure only after validation period (30+ days)

### 5. Structural Decision Tracking (integrated at line ~1420)

**Rule:** Track structural decisions as explicit knowledge.

**Why:** Reorganization decisions are structural trade-offs. Without explicit capture, the vault cannot learn from structural choices or review them later.

**Test:** Can you identify 3+ reorganization decisions made in your vault? Are they documented with rationale, scope, and outcomes?

**Implementation:** Use frontmatter for structural decisions:
```yaml
structural-decision: true
reorganization-type: local|regional|global
scope: affected_hubs_or_notes
decision-rationale: why_this_approach
decision-date: 2026-04-02
rollback-plan: how_to_reverse_if_needed
outcome-tracked: true|false
```

## Integration Location

These rules have been integrated into the Seed at the "Vault Maintenance" section (around line 1420), alongside the existing exclusion criteria rule. The integration connects reorganization guidance with:
- Construction Phase Model (reorganization needs differ by phase)
- Graph Maintenance (structural health checks)
- Note Lifecycle Management (maintenance operations)

## Verification

This refinement resolves the identified gap. The Seed now provides:
1. Explicit reorganization triggers (structural symptoms to track)
2. Scope-based approach selection (local/regional/global)
3. Cost-benefit calculation before committing
4. Preference for gradual over radical reorganization
5. Structural decision documentation

All 5 test criteria from the original gap are now satisfied by the integrated rules.

## Related

- [[AI-Assisted Knowledge Management Seed]]
- [[Seed Gap - Knowledge Reorganization vs In-Place Updates]]
- [[Graph Maintenance]]
- [[Note Lifecycle Management]]
- [[Construction Phase Model]]