---
last-reviewed: 2026-03-21
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
tags:
  - seed-stress-test
  - decision-making
  - software-architecture
  - threshold
---

# Seed Stress Test - Decision Threshold Rule in Software Architecture

> Testing the "Decision Threshold Knowledge" rule against software architecture domain (2026-03-21)

## Rule Being Tested

**From Seed (Navigation section):**
> Add decision threshold guidance for actionable knowledge — when knowledge recommends a decision, include explicit criteria for when to stop gathering information and act.
> 
> Use frontmatter: `decision-horizon:`, `reversibility:`, `decision-threshold:`, `waiting-cost:`

## Domain Context

Software architecture decisions involve:
- Technology selection (languages, frameworks, databases)
- Pattern decisions (microservices vs monolith, event-driven vs request-response)
- Scaling strategies
- Infrastructure choices

## Stress Test Questions

### 1. Does the rule make sense for this domain?

**Yes.** Software architecture is decision-heavy. Architects constantly face "when is enough research enough?" questions. The rule directly applies.

### 2. Is the rule's Test actually executable by an AI?

**Partially.** The fields are clear:
- `decision-horizon`: immediate|flexible|open
- `reversibility:`: easy|hard|one-shot  
- `decision-threshold`: explicit criteria
- `waiting-cost`: high|low|moderate

However, software architecture has nuances:
- **Multiple stakeholder perspectives**: A decision might have different thresholds for CTO vs. lead engineer vs. team
- **Technical debt implications**: Some decisions have compounding reversibility costs
- **Technology lifecycle**: Framework versions become deprecated, affecting threshold validity

### 3. Edge cases where the rule fails

**Edge Case 1: Interdependent Decisions**
Architecture decisions rarely stand alone. Choosing Kubernetes affects database choice; selecting a language constrains framework options. The current rule assumes single decisions.

**Edge Case 2: Reversibility Varies by Scope**
A microservice architecture decision might be:
- Easy to reverse at module level (extract service back)
- Hard to reverse at organizational level (team restructure needed)

**Edge Case 3: Technology Domain Velocity**
Software tech moves fast. A decision threshold valid today may be obsolete in 6 months due to:
- New framework releases
- Deprecation announcements  
- Community consensus shifts

**Edge Case 4: Team Capability Dependent**
Same decision has different thresholds depending on team expertise. A pattern might be "right" for one team and "wrong" for another.

## Proposed Refinements

### For Software Architecture Knowledge:

```yaml
decision-horizon: immediate|flexible|open
reversibility: easy|hard|one-shot
decision-threshold: "Explicit criteria"
waiting-cost: high|low|moderate
# New fields for software domain:
stakeholder-perspectives:
  - role: cto
    threshold-differ: "cost > $X"
  - role: lead-engineer
    threshold-differ: "implementation complexity > Y"
interdependency-scope: ["related decision 1", "related decision 2"]
technology-validity-period: "6 months"  # for fast-moving domains
team-capability-dependent: true|false
```

### Modified Test for Software Architecture:

1. Does this decision have explicit threshold criteria?
2. Is the reversibility scope clearly defined (module vs system vs org level)?
3. Are interdependencies with other architecture decisions documented?
4. Is the technology validity period specified?
5. Does the threshold account for team capability variations?

## What I Learned

Software architecture decisions have unique characteristics that the current rule doesn't capture:
- Multi-stakeholder thresholds (different roles have different risk tolerances)
- Interdependency chains (decisions build on each other)
- Technology-specific validity periods (fast-moving vs stable tech)
- Team-capability dependency (thresholds are context-specific)

## Related Seed Rules

- [[Seed Stress Test - Advisory Validity Tracking in Financial Planning]] — similar temporal considerations
- [[Frontier Exploration - Decision Threshold Knowledge]] — original exploration
- [[Stress Test - Seed Rules in Programming Knowledge Bases]] — programming domain issues

## Status

This is a seed stress test document. If the insights are valuable, propose rule refinement to the Seed.

---

**Note created during heartbeat 2026-03-21**