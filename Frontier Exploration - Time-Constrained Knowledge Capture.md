---
last-reviewed: 2026-04-08
last-updated: 2026-04-08
lifecycle: frontier-exploration
confidence: emerging
author-type: ai-assisted
knowledge-type: meta
access-pattern: decision
tags:
  - frontier-exploration
  - capture-priority
  - time-constraints
  - seed-gap
  - agent-behavior
---

# Frontier Exploration - Time-Constrained Knowledge Capture

> How AI agents should prioritize and execute knowledge capture when operating under time constraints

## The Problem

AI agents often operate under time constraints in production environments. Current Seed rules assume adequate time for processing and reviewing notes. However, in real-world usage, agents may have only minutes or seconds to capture knowledge before moving to the next task.

The Seed lacks guidance for **time-budgeted knowledge capture** - how to produce maximum value under time pressure.

## Two Dimensions of the Problem

### Dimension 1: Minimum Viable Capture
When time is limited, what's the minimum that ensures the capture is useful even if never completed?

### Dimension 2: Capture Prioritization  
When multiple knowledge items qualify for capture but you must stop early, which should be captured first?

---

## Part A: Minimum Viable Capture

### Proposed Rule: Minimum Viable Capture

**Rule (PROPOSED):** When time-constrained, ensure every capture includes at minimum:
1. **One wikilink** — establishes connection in the knowledge graph
2. **One source or provenance** — establishes credibility
3. **A clear question or summary** — even if brief

**Why:** Without connectivity and provenance, partial captures become orphans that are difficult to complete later. These baseline elements ensure even quick captures contribute to the graph structure and remain findable.

**Test:** Can you complete this capture later with just the question/summary? Is there at least one incoming link from the note you referenced? Is there a source URL or author mentioned?

### Proposed Rule: Time-Budget Frontmatter

**Rule (PROPOSED):** For captures made under time pressure, include explicit `capture-budget:` frontmatter:

```yaml
capture-budget: 1m     # Quick capture (<2 minutes)
capture-budget: 5m     # Standard capture  
capture-budget: 15m    # Extended capture
capture-budget: 30m+   # Full processing
```

**Test:** Did you specify time budget in frontmatter? Does the capture quality match the stated budget?

### Proposed Rule: Completion Tracking

**Rule (PROPOSED):** Partial captures should be marked with `lifecycle: incomplete` for easy identification:

```yaml
lifecycle: incomplete
completion-priority: high|medium|low
estimated-completion: 5m|15m|30m|1h+
```

**Test:** Are incomplete notes identifiable via lifecycle? Is there a clear completion path?

---

## Part B: Session-Level Capture Prioritization

### The Problem

Within a single capture session, when the agent encounters multiple knowledge items faster than it can process them, what determines the order?

### Real-World Scenario

Imagine an AI agent attending a lecture or reading a complex source that contains:
- Foundational concepts (needed to understand everything else)
- Detailed examples (enrich understanding)
- Historical context (interesting but not essential)
- Edge cases (important for advanced use)
- Quick tips (easy to capture, high value)

If the agent must stop before capturing everything, which should it prioritize?

### Why This Matters

1. **Time-bounded capture** — Real learning sessions have natural end points
2. **Attention decay** — Later content may be captured with lower quality
3. **Dependency chains** — Some knowledge requires prerequisites to understand
4. **Sunk cost** — Easy-to-capture items shouldn't crowd out important ones

### Proposed Priority Factors

#### 1. Dependency Priority
Knowledge that other knowledge depends on should be captured first.

**Test:** Can you identify 3+ other notes that would benefit from understanding this first?

#### 2. Verification Expiry Priority
Knowledge that becomes harder to verify over time gets priority.

**Test:** Does this knowledge have a verification window that closes? (ephemeral, time-sensitive, location-specific)

#### 3. Foundation Priority
Conceptual knowledge that enables procedural knowledge gets priority.

**Test:** Does this explain "why" for multiple "how" notes?

#### 4. Uniqueness Priority
Knowledge that's unlikely to be found elsewhere gets priority.

**Test:** Is this available in standard references? Would losing this hurt the vault uniquely?

#### 5. Reversibility Priority
Knowledge that's harder to recover gets priority over easily re-capturable knowledge.

**Test:** Would you need to re-experience the source to recover this? (live events, personal demos)

### Domain-Specific Considerations

| Domain | Highest Priority | Lowest Priority |
|--------|-----------------|------------------|
| Academic lectures | Core concepts, formulas | Historical asides |
| Workshops | Safety procedures, key techniques | Optional variations |
| Technical docs | API signatures, constraints | Examples, edge cases |
| Field experience | Unique observations | General knowledge |
| Conversations | Decisions made, commitments | pleasantries |

---

## Suggested Seed Addition

**Rule:** When multiple knowledge items qualify for capture within a single session, prioritize by: (1) dependency-critical knowledge, (2) verification-expiring knowledge, (3) foundation-enabling knowledge, (4) unique-to-this-source knowledge, (5) hard-to-recover knowledge. Ensure every capture includes minimum: one wikilink, one source, and a clear summary.

**Why:** Capturing order affects vault quality. Dependencies missed mean broken links. Expiring knowledge lost can't be recovered. Foundation knowledge enables other captures. Without minimum standards, partial captures become unfindable orphans.

**Test:** For a time-constrained capture session:
1. Can you rank 5+ capture candidates by these factors?
2. Does your ranking differ from arbitrary or FIFO capture?
3. Are the highest-priority items actually captured first?
4. Does every capture include at least one link, one source, and a clear summary?

---

## Why This Matters

Without time-constrained capture rules:
- Agents either capture nothing (perfectionism) or capture noise (quantity over quality)
- Quick captures become unfindable orphans
- The graph loses connectivity from partial captures
- Important knowledge gets missed when time runs out

With time-budgeted capture:
- Agents can contribute under any time constraint
- Partial captures remain findable and completable
- The graph grows more robustly
- Priority ensures high-value items aren't lost

## Related Seed Rules

- [[Best Practice - Progress Over Perfection]] — quality vs. completeness tradeoff
- [[Frontier Exploration - Anticipatory Knowledge Capture]] — related but about future needs
- [[Seed Gap - Knowledge Prioritization Decision Framework]] — broader prioritization
- [[Note Lifecycle Management]] — incomplete note lifecycle
- [[AI-Assisted Knowledge Management Seed]] — Core Seed rules

## Test Criteria

- [ ] Can you identify notes made under time constraints (capture-budget frontmatter)?
- [ ] Do time-constrained notes have at least one link and one source?
- [ ] Are incomplete notes identifiable via lifecycle: incomplete?
- [ ] Can you rank capture candidates by priority factors?
- [ ] Does your ranking differ from arbitrary or FIFO?

---

**Note:** This is frontier exploration, consolidated from two related notes (2026-04-08). The rules proposed here are hypotheses that need stress testing across domains.