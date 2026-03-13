---
last-reviewed: 2026-03-13
confidence: emerging
tags:
  - frontier-exploration
  - equipment
  - maintenance
  - domain-agnostic
---

# Frontier Exploration - Tool and Equipment Maintenance Knowledge

## The Gap

The Seed covers **equipment dependencies** (what tools you need to execute knowledge) but doesn't address **equipment maintenance knowledge** — the ongoing care required to keep tools functional. In domains like woodworking, music production, photography, automotive, and mechanical work, this is a distinct knowledge type with different characteristics:

- **Periodic** — maintenance must be done at intervals (oil changes, calibrations, inspections)
- **Conditional on ownership** — only relevant if you own the specific tool
- **Consequential** — neglect causes tool degradation, safety issues, or failure
- **Tool-specific** — often requires model/brand-specific information

## Why It Matters

A knowledge base about woodworking that tells you how to joint a board but doesn't tell you how to maintain your jointer is incomplete. Maintenance knowledge:
- Has a different lifecycle than procedural knowledge
- Requires tracking intervals and service history
- May reference specific models (different joiners have different maintenance needs)
- Has safety implications if neglected

## Proposed Seed Rule

> **Rule:** For equipment-intensive domains, create a maintenance knowledge layer separate from procedural knowledge — track service intervals, document maintenance procedures, and link maintenance notes to the equipment notes they apply to.
> **Why:** Maintenance knowledge has different characteristics (periodic, conditional, consequential) than procedural knowledge. Conflating them creates confusion about when maintenance is needed and what it involves.
> **Test:** In equipment-heavy domains: (1) Can you identify maintenance knowledge separate from usage knowledge? (2) Do equipment notes link to their maintenance requirements? (3) Is there a way to track service intervals?

## Implementation Structure

```yaml
equipment:
  name: Tool name
  maintenance:
    - task: Description
      interval: daily|weekly|monthly|yearly|hours-used
      procedure: [[Maintenance Note]]
      last-performed: YYYY-MM-DD
      next-due: YYYY-MM-DD
```

## Related Notes

- [[Equipment Dependencies]] — What tools are needed to execute knowledge
- [[Procedural Knowledge]] — How to use tools
- [[Tool Replacement Decisions]] — When to repair vs replace (future exploration)
