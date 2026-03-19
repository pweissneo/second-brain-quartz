---
last-reviewed: 2026-03-17
lifecycle: emerging
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - conditional-knowledge
  - activation-conditions
  - state-knowledge
---
# Frontier Exploration - Condition-Triggered Knowledge

> How to manage knowledge that becomes relevant based on specific conditions or states being met, not merely based on time passage.

## The Gap

The Seed handles temporal knowledge (knowledge that changes over time) through decay functions and review triggers. But there's a distinct category of knowledge that doesn't decay with time — instead, it becomes relevant or actionable when specific **conditions** or **states** are met.

**Examples:**
- Trading strategies that should be active during specific market regimes (bull markets, high volatility, trending vs ranging)
- Game strategies that apply in specific game states (opening, midgame, endgame; or specific matchup types)
- Emergency response procedures that activate when specific conditions occur (power outage, data breach, medical emergency)
- Business continuity plans triggered by specific events
- Seasonal operational procedures (winter vs summer operations)
- Equipment configurations for different conditions (high altitude, extreme temperatures)

This is **condition-triggered knowledge** — knowledge whose applicability depends on external conditions being true, not on time having passed.

## Why Current Seed Rules Are Incomplete

1. **Temporal decay doesn't capture condition dependency**: A trading strategy doesn't become stale because 30 days passed — it becomes irrelevant because market conditions changed.

2. **Verification status doesn't apply**: The strategy isn't "unverified" — it's "waiting for the right conditions to test."

3. **Lifecycle states miss the point**: A strategy isn't "active" or "deprecated" — it's "appropriate for current conditions" or "inappropriate for current conditions."

4. **The "when to apply" question is unanswered**: The Seed doesn't tell agents how to determine which knowledge applies to the current context.

## Key Distinctions

### Time-Triggered vs Condition-Triggered

| Aspect | Time-Triggered | Condition-Triggered |
|--------|---------------|---------------------|
| Trigger | Calendar/clock | External state |
| Staleness | Days since review | Condition change |
| Testing | Execute on schedule | Execute when condition met |
| Relevance | Decreases with age | Depends on context |

### State Knowledge vs Procedure Knowledge

- **State knowledge**: Describes the current condition (market is volatile, it's winter, emergency active)
- **Procedure knowledge**: What to do when in that state

Both need linking — procedure notes should reference the state notes that activate them.

## Proposed Seed Rule

**Rule:** For condition-triggered knowledge, include explicit `activation-conditions` frontmatter specifying what state must be true for this knowledge to apply.

**Why:** Without explicit condition tracking, AI agents cannot determine which knowledge is relevant to the current context. Condition-triggered knowledge that's never evaluated against conditions becomes invisible — users can't find what they need when they need it.

**Test:** For condition-triggered notes: (1) Is there `activation-conditions:` frontmatter? (2) Can you identify the states that must be true? (3) Is there a mechanism to evaluate current state against conditions?

**Implementation:**
```yaml
activation-conditions:
  - condition: "market-regime"
    equals: "high-volatility"
  - condition: "season"
    in: ["winter", "early-spring"]
  - condition: "emergency-type"
    is-one-of: ["medical", "fire", "security"]
```

**Condition evaluation:**
- `equals`: exact match
- `not-equals`: exclusion
- `in`: member of list
- `greater-than` / `less-than`: numeric thresholds
- `any-of`: multiple valid conditions

### State Notes

Create explicit state notes that describe conditions:
- [[Market Regime Classification]] — Current market state taxonomy
- [[Seasonal Operation Modes]] — Seasonal business states
- [[Emergency Type Taxonomy]] — Types of emergency conditions

State notes should:
- Have `type: state-definition`
- Include `valid-states:` listing all possible states
- Include `current-state:` (updated when conditions change)

### Transition Triggers

Some conditions have **transition triggers** — moments when state changes:
- Market regime changes (detected via indicators)
- Season transitions (dates, temperatures)
- Emergency activation (事件 triggers)

**Rule:** For state knowledge, include `transition-trigger:` frontmatter specifying how to detect state changes.

**Test:** Can you detect when conditions have changed? Is there an explicit trigger mechanism?

## Knowledge Activation States

Extend the existing activation-state framework:

| State | Meaning | Transition |
|-------|---------|------------|
| `captured` | Raw input | → processed when condition identified |
| `processed` | Condition mapped | → ready when condition could occur |
| `ready` | Applicable when condition met | → applied when condition active |
| `applied` | Used in current context | → evaluated when condition ends |
| `evaluated` | Outcome captured | → ready for next activation |

## Retrieval Implications

When answering queries:
1. Identify current conditions (what state are we in?)
2. Filter knowledge by activation conditions
3. Present condition-appropriate knowledge first
4. Note when knowledge is "ready but not currently applicable"

## Related Seed Rules

- [[Handling Temporal Knowledge]] — Time-based decay (complements condition-triggered)
- [[Knowledge Activation States]] — Activation framework being extended
- [[Frontier Exploration - Seasonal and Cyclical Knowledge]] — Calendar-based conditions (related)
- [[Frontier Exploration - Emergency and Crisis Knowledge]] — Event-triggered activation

## Test Questions

1. Can you identify knowledge that should only apply in specific conditions?
2. Do those notes explicitly document their activation conditions?
3. Can your retrieval system filter by current conditions?
4. When conditions change, do you update which knowledge is "ready" vs "applied"?

---

**Questions for Seed refinement:**
- Should condition-triggered knowledge have separate verification workflows?
- How do you test knowledge that's only applicable in rare conditions?
- Should there be a "condition monitor" that alerts when relevant knowledge becomes applicable?
