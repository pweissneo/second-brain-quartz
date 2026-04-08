---
last-reviewed: 2026-04-08
last-updated: 2026-04-08
lifecycle: frontier-exploration
confidence: emerging
author-type: ai-assisted
knowledge-type: meta
tags:
  - frontier-exploration
  - seed-gap
  - capture-priority
  - decision-framework
---

# Frontier Exploration - Knowledge Capture Priority Under Time Constraints

> When an AI agent has more knowledge to capture than time allows, how should it prioritize what to capture first?

## The Problem

The Seed has guidance on:
- **Capture priority for unfamiliar domains** — what to capture first when bootstrapping
- **Decision threshold** — when to create a new note vs skip
- **Knowledge capture strategy** — overall approaches to capturing

But there's a gap: **within a single capture session**, when the agent encounters multiple knowledge items faster than it can process them, what determines the order?

## Real-World Scenario

Imagine an AI agent attending a lecture or reading a complex source that contains:
- Foundational concepts (needed to understand everything else)
- Detailed examples (enrich understanding)
- Historical context (interesting but not essential)
- Edge cases (important for advanced use)
- Quick tips (easy to capture, high value)

If the agent must stop before capturing everything, which should it prioritize?

## Why This Matters

1. **Time-bounded capture** — Real learning sessions have natural end points
2. **Attention decay** — Later content may be captured with lower quality
3. **Dependency chains** — Some knowledge requires prerequisites to understand
4. **Sunk cost** — Easy-to-capture items shouldn't crowd out important ones

## Existing Related Seed Rules

| Rule | What It Covers | What's Missing |
|------|---------------|----------------|
| Capture Priority Sequence for Unfamiliar Domains | Initial bootstrap priority | Session-level within-source priority |
| Decision Threshold Rule | Whether to create a note | Which note to create first when many qualify |
| Knowledge Type Taxonomy | Types of knowledge | Priority when multiple types present |

## Proposed Priority Factors

### 1. Dependency Priority
Knowledge that other knowledge depends on should be captured first.

**Test:** Can you identify 3+ other notes that would benefit from understanding this first?

### 2. Verification Expiry Priority
Knowledge that becomes harder to verify over time gets priority.

**Test:** Does this knowledge have a verification window that closes? (ephemeral, time-sensitive, location-specific)

### 3. Foundation Priority
Conceptual knowledge that enables procedural knowledge gets priority.

**Test:** Does this explain "why" for multiple "how" notes?

### 4. Uniqueness Priority
Knowledge that's unlikely to be found elsewhere gets priority.

**Test:** Is this available in standard references? Would losing this hurt the vault uniquely?

### 5. Reversibility Priority
Knowledge that's harder to recover gets priority over easily re-capturable knowledge.

**Test:** Would you need to re-experience the source to recover this? (live events, personal demos)

## Domain-Specific Considerations

| Domain | Highest Priority | Lowest Priority |
|--------|-----------------|------------------|
| Academic lectures | Core concepts, formulas | Historical asides |
| Workshops | Safety procedures, key techniques | Optional variations |
| Technical docs | API signatures, constraints | Examples, edge cases |
| Field experience | Unique observations | General knowledge |
| Conversations | Decisions made, commitments | pleasantries |

## The Gap

The Seed lacks explicit guidance for **session-level capture prioritization** when:
- Multiple knowledge items qualify for capture
- Time or attention is constrained
- Order matters for retention or understanding

## Suggested Seed Addition

**Rule:** When multiple knowledge items qualify for capture within a single session, prioritize by: (1) dependency-critical knowledge, (2) verification-expiring knowledge, (3) foundation-enabling knowledge, (4) unique-to-this-source knowledge, (5) hard-to-recover knowledge.

**Why:** Capturing order affects vault quality. Dependencies missed mean broken links. Expiring knowledge lost can't be recovered. Foundation knowledge enables other captures.

**Test:** For a time-constrained capture session:
1. Can you rank 5+ capture candidates by these factors?
2. Does your ranking differ from arbitrary or FIFO capture?
3. Are the highest-priority items actually captured first?

## Related

- [[Seed Gap - Knowledge Prioritization Decision Framework]]
- [[Frontier Exploration - Capture Priority Sequence for Unfamiliar Domains]]
- [[Frontier Exploration - Time-Constrained Knowledge Capture]]
- [[Seed Refinement - Time-Constrained Capture Integration]]
- [[AI-Assisted Knowledge Management Seed]] — Core Seed rules