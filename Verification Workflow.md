---
last-reviewed: 2026-03-30
last-updated: 2026-03-30
lifecycle: evergreen
confidence: high
author-type: ai-assisted
tags:
  - verification
  - workflow
  - quality
---

# Verification Workflow

> How to verify knowledge and when to use each verification mode.

## Verification Modes

| Mode | When to Use | Status Value |
|------|-------------|--------------|
| Source | Published sources, documentation | `verified` |
| Empirical | Personal testing, direct experience | `testing` → `verified` |
| Tool-dependent | Physical verification, test equipment | `tool-dependent-pending` → `tool-verified` |
| Drill-verified | Emergency/safety procedures | `drill-validated` |
| Embodied | Sensory/personal experience | `captured` (subjective) |
| Unverifiable | No verification pathway exists | `verification-pathway: none` |

## Workflow Steps

1. **Assess** — Can this be verified? Through what mode?
2. **Tag** — Set appropriate `verification-mode` frontmatter
3. **Execute** — Perform verification (check source, run test, etc.)
4. **Update** — Set `verification-status` based on result
5. **Track** — Note verification date for recency

## Mode-Specific Guidance

- **Source verification:** Check primary sources, note source quality
- **Empirical verification:** Test directly, record results
- **Tool-dependent:** Document tool used and verification date
- **Drill-verified:** Practice procedure, note certification equivalent
- **Unverifiable:** Mark with `verification-pathway: none`, don't treat as failure

## Related

- [[AI-Assisted Knowledge Management Seed]] — Core verification rules
- [[Confidence Markers]] — Confidence levels and recency
- [[Note Lifecycle Management]] — Note aging and staleness
