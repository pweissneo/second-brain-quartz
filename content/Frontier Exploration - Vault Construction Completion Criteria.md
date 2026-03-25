---
last-reviewed: 2026-03-21
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
tags:
  - seed-extension
  - vault-lifecycle
  - construction-phase
---

# Frontier Exploration: Vault Construction Completion Criteria

The Seed defines construction phases (skeleton → flesh → muscle → maturity) but lacks explicit criteria for determining when construction is complete and maintenance mode should begin.

## The Problem

A vault in "muscle" phase (100-200 notes) may have good structure but still be accumulating foundational content. Meanwhile, a vault at 250 notes may have mature structure but still be adding foundational content. The transition from construction to maintenance is unclear.

## Why It Matters

Without explicit completion criteria, vaults either:
1. Stay in construction mode indefinitely, never tightening quality standards
2. Switch to maintenance too early, leaving structural gaps unfixed

## Proposed Completion Criteria

A vault should transition from construction to maintenance when ALL of these are true:

1. **Orphan rate <10%** - Almost all notes are reachable from root
2. **Core domains have hub notes** - Every major topic area has a navigation hub
3. **Verification ratio >50%** - More than half of notes are verified
4. **Schema is stable** - Frontmatter fields haven't changed in 60+ days
5. **Key Seed rules consistently pass** - No major compliance violations

## Transition Detection

```python
def should_transition_to_maintenance(vault):
    return (
        vault.orphan_rate() < 0.10 and
        vault.hub_coverage() >= 0.8 and
        vault.verification_ratio() > 0.5 and
        vault.schema_stable_days() > 60 and
        vault.compliance_score() > 0.85
    )
```

## Pre-Transition Checklist

Before declaring construction complete:
- [ ] Run full orphan scan - resolve remaining orphans
- [ ] Verify all hubs have ≥3 links to content
- [ ] Confirm no Seed rules have >20% violation rate
- [ ] Document remaining known gaps in [[Vault Construction Summary]]
- [ ] Update `_root.md` to reflect completed construction

## Post-Transition Behavior

After transitioning to maintenance:
- Apply full Seed rules (no relaxed thresholds)
- Shift emphasis from expansion to verification and depth
- Increase scrutiny on new note quality
- AnnualSeed review becomes mandatory

## Related
- [[Construction Phase]]
- [[Seed Stress Test - Construction Phase]]
- [[Quality Maintenance]]