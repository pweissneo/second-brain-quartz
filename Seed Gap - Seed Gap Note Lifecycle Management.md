---
last-reviewed: 2026-03-29
last-updated: 2026-03-29
lifecycle: seed-gap
confidence: high
author-type: ai-assisted
gap-status: integrated
gap-priority: medium
gap-type: seed-missing
discovered: 2026-03-26
resolved: 2026-03-29
resolved-by: [[AI-Assisted Knowledge Management Seed]]
gap-source: REDUNDANCY_SCAN
tags:
  - seed-gap
  - redundancy
  - seed-gap-lifecycle
---

# Seed Gap - Seed Gap Note Lifecycle Management

## The Gap

The vault contains 23 Seed Gap notes, but they have inconsistent lifecycle management:
- Some marked "identified" with no clear resolution path
- Some marked "resolved" but the resolution is incomplete
- No clear process for resolving vs. archiving vs. merging into Seed

## Observed Issues

1. **Unresolved identified gaps** — Several Seed Gap notes remain in "identified" status:
   - Seed Gap - Multi-Modal Knowledge Organization (2026-03-26)
   - Seed Gap - Reasoning Trace Documentation (no date)
   - Seed Gap - Subjective Personal Knowledge Handling (no date)
   - Seed Gap - Code-Switching and Translanguaging (no date)
   - Seed Gap - Craft and Medical Knowledge Base Rules (no date)
   - Seed Gap - Distributed Understanding Threshold (shows "deprecated" in frontmatter but content says "RESOLVED")

2. **Lifecycle confusion** — The gap between "identified" and "resolved" is unclear. What threshold determines when a gap is ready for Seed incorporation?

3. **Resolution quality varies** — Some "resolved" gaps have detailed proposed rules, others just note "merged into Seed" without specifics.

## Proposed Rule

**Rule:** Track Seed Gap lifecycle explicitly — gaps move through: identified → analyzed → proposed → integrated (or deprecated).

**Why:** Without explicit lifecycle, gaps accumulate in "identified" status indefinitely. Some are genuinely waiting for Seed rule development; others should be deprecated when the gap is no longer relevant.

**Test:** For all Seed Gap notes: (1) Is gap-status current? (2) Is there a clear resolution path (proposed rule or deprecation)? (3) Has the gap been reviewed in the last 60 days?

**Implementation:**
```yaml
gap-status: identified|analyzed|proposed|integrated|deprecated
gap-phase: discovery|analysis|implementation|verification
gap-review-date: 2026-03-26  # when last reviewed
resolution-deadline: 2026-05-26  # optional target date
```

**Lifecycle stages:**
- **identified**: Gap documented, needs analysis
- **analyzed**: Root cause understood, solution approach defined
- **proposed**: Rule written in Rule/Why/Test format, ready for Seed integration
- **integrated**: Rule merged into Seed, gap note archived
- **deprecated**: Gap no longer relevant (domain changed, resolved differently, etc.)

**Review cadence:** Seed Gap notes should be reviewed monthly. If a gap remains "identified" for >60 days without progress, either: (1) move to "analyzed" with proposed approach, or (2) deprecate if no longer relevant.

## Test for Gap Closure

Can you:
1. Categorize all Seed Gap notes by current lifecycle stage?
2. Identify gaps that have been "identified" for >60 days without progress?
3. State a clear resolution path for each "identified" gap?

If yes, the gap is closed. Implementation = add lifecycle fields to all Seed Gap notes and review monthly.

## Related

- [[Seed Gap Analysis Methodology]]
- [[AI-Assisted Knowledge Management Seed]] — Gap-to-Seed pathway
- [[Self-Improvement Cycle]]

---

**Note discovered during:** REDUNDANCY_SCAN heartbeat (2026-03-26)