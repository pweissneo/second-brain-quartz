---
last-updated: 2026-04-04
lifecycle: seed-extension
confidence: high
author-type: ai-assisted
knowledge-type: meta
tags:
  - seed-refinement
  - career-development
  - domain-specific
  - personal-knowledge
source-gap: Seed Gap - Career Development Knowledge Organization.md
gap-status: integrated
integrated-by: [[Seed Refinement - Career Development Knowledge]]
---

# Seed Refinement - Career Development Knowledge

> Integration from Seed Gap - Career Development Knowledge Organization (partial resolution → integrated)

## Background

This Seed Refinement integrates remaining insights from the career development knowledge gap that weren't fully covered by existing Seed rules.

**Original gap analysis (2026-04-01):**
- Personal vs. General tension: Covered by Seed rule at line ~744 (personal-vs-published conflicts)
- Time sensitivity: Covered by temporal validity bounds rule
- Network knowledge: NOT explicitly addressed
- Decision frameworks: NOT explicitly addressed  
- Confidentiality: NOT explicitly addressed

## Integrated Rule

**Rule (NEW - 2026-04-04):** For career development and professional growth knowledge, apply domain-specific metadata schema including network-knowledge tracking, decision-framework weighting, and explicit confidentiality levels.

**Why:** Career knowledge differs from standard knowledge types: it's highly personal/contextual, time-bound (market conditions change), network-dependent (relationships matter), and often involves sensitive information about people and negotiations. Generic Seed rules don't capture these distinctions.

**Test:** For career development notes: (1) Can you distinguish personal career experience from general principles? (2) Does temporal knowledge have validity windows? (3) Is network/relationship knowledge explicitly tracked with privacy considerations? (4) Are decision factors weighted?

**Implementation:**

```yaml
knowledge-type: career-development
career-knowledge-category: personal-experience|general-principle|market-data|network-knowledge|decision-framework
career-knowledge-subcategory: skill-development|job-transition|compensation|networking|leadership
temporal-validity:
  valid-from: 2026-01-01
  valid-until: 2027-01-01
  update-frequency: quarterly|semi-annually|annually
confidentiality-level: personal|shared|confidential  # personal=only you, shared=trusted circle, confidential=sensitive people/companies
network-knowledge:
  contains-personal-contacts: true|false
  contact-sharing-permission: true|false
decision-framework:
  factors-weighted: [factor1, factor2, factor3]
  weighting rationale: "Why these factors were weighted this way"
```

**Note structure for career knowledge:**
- **Career Principles** — General transferable knowledge (networking strategies, negotiation frameworks)
- **Career Experience** — Personal stories with context (my job transition, interview process)
- **Market Data** — Time-stamped compensation, job market trends (high expiry)
- **Network Knowledge** — Contacts, mentors, relationships (high confidentiality)
- **Decision Frameworks** — Frameworks for evaluating career choices

**Verification guidance:**
- Market data: High expiry → quarterly review required
- Principles: Cross-reference with multiple sources
- Personal experience: Mark as anecdotal, note context boundaries
- Network: Never verify publicly, maintain privacy boundaries

## Related Seed Rules

- [[Seed Gap - Career Development Knowledge Organization]] (source gap)
- [[Frontier Exploration - Personal Experience vs Published Knowledge Conflicts]]
- [[Frontier Exploration - Temporal Validity Bounds Rule]]
- [[Rule: Distinguish prescriptive from descriptive knowledge]]
- [[Rule: Tag and track conventional wisdom explicitly]]

## Gap Resolution Status

✓ Resolved: Personal vs. general tension (existing Seed rule)
✓ Resolved: Time sensitivity (existing temporal validity rule)
✓ NEW: Network knowledge tracking added
✓ NEW: Decision framework weighting added  
✓ NEW: Confidentiality levels added

This refinement completes the integration of the career development knowledge gap into the main Seed.