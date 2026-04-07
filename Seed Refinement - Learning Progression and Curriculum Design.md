---
last-reviewed: 2026-04-05
lifecycle: seed-refinement
confidence: emerging
author-type: ai-assisted
knowledge-type: structural
verification-status: emerging
tags:
  - seed-refinement
  - learning
  - progression
  - curriculum
  - entry-points
---

# Seed Refinement: Learning Progression and Curriculum Design

> How should knowledge bases capture the implicit ordering of knowledge for learning purposes?

## The Gap

The Seed mentions "learning paths: Sequential progression for understanding" as an access pattern but lacks explicit rules for:

1. **Entry point identification** — How to determine which notes are suitable starting points
2. **Milestone definition** — What marks progress from beginner to intermediate to advanced
3. **Exit criteria** — How a learner knows they've covered "enough" for basic competence
4. **Prerequisite vs. learning dependency** — Distinguishing content dependencies from pedagogical order

The current Seed handles prerequisites via frontmatter but doesn't address curriculum design principles.

## Evidence

The vault contains related but distinct notes:
- [[Frontier Exploration - Learning Progression and Curriculum Design]] — Identifies the gap
- Seed mentions learning paths but provides no design rules
- Prerequisite tracking exists but learning progression rules don't

## Proposed Rule Addition

**Rule:** For learning-focused knowledge bases, define explicit learning progression with three components:
- **Entry points:** Notes suitable for complete beginners (0 prerequisites or only universal prerequisites)
- **Milestone nodes:** Notes marking competence thresholds (beginner/intermediate/advanced)
- **Exit criteria:** Explicit definition of what "basic competence" means in the domain

**Why:** Without explicit progression, learning vaults become reference vaults. Learners need a path, not just a connected graph. The Seed's current focus on reference completeness doesn't address learning completeness.

**Test:** (1) Can you trace a learning path from zero to basic competence? (2) Are there explicit milestone notes marking progress? (3) Can a learner determine when they've "completed" the basics? (4) Are entry points distinguishable from advanced content?

**Implementation:**
```yaml
learning-role: entry-point | milestone | advanced | reference
learning-stage: beginner | intermediate | advanced
prerequisite-knowledge: [list of required notes]
minimum-competence-criteria: "What a learner should know after completing this stage"
```

## Stress Test: Language Learning

| Current Seed | With Refinement |
|--------------|-----------------|
| Notes on vocabulary, grammar, pronunciation linked | Entry point: "Basic pronunciation rules" (no prerequisites) |
| No milestone marking | Milestone: "500 most common words" = beginner complete |
| No exit criteria | Exit: "Can have simple conversation about familiar topics" |
| All notes equally accessible | Entry points explicitly tagged, advanced tagged |

## Related Notes

- [[Frontier Exploration - Learning Progression and Curriculum Design]] — Gap identification
- [[Seed Stress Test - Prerequisites Rule in Framework Learning]] — Existing prerequisite rules
- [[AI-Assisted Knowledge Management Seed]] — Foundation rules

---

*Refinement generated during: REDUNDANCY_SCAN heartbeat (2026-04-05)*
*Note: REDUNDANCY_SCAN found no redundant pairs, but discovered Seed gap through learning progression topic exploration*