---
last-reviewed: 2026-03-13
confidence: emerging
author-type: ai-assisted
lifecycle: active
tags:
  - frontier-exploration
  - knowledge-types
  - threshold
---

# Frontier Exploration: Threshold Knowledge

Threshold knowledge captures the moments or conditions when something transitions from one state to another. Unlike temporal knowledge (things that change over time) or boundary knowledge (where something does/doesn't apply), threshold knowledge deals with **categorical transitions** — the specific points where a qualitative change occurs.

## The Problem

Many domains have knowledge that depends on recognizing when a threshold has been crossed:

- **Skill acquisition**: When has something been "learned"? When does practice become "proficiency"?
- **Project management**: When does a task become "overdue"? When does scope creep become "project drift"?
- **Finance**: When does spending become "excessive"? When does a price become "expensive"?
- **Relationships**: When does dating become "serious"? When does a disagreement become "conflict"?
- **Health**: When does fatigue become "exhaustion"? When does pain become "injury"?
- **Creative work**: When does iteration become "overworking"? When does refinement become "perfectionism"?

The Sorites paradox (when does a heap of sand become a heap?) illustrates the fundamental challenge: **boundaries between categories are often fuzzy, but we still need to make decisions**.

## Why It Matters for AI Knowledge Bases

Without explicit threshold knowledge:
1. AI agents cannot determine when a state transition has occurred
2. Advice that applies at one threshold may be wrong at another
3. Categorical claims (always/never) mask threshold dependencies
4. Decision support becomes unreliable without knowing "where we are"

## How to Capture Threshold Knowledge

### 1. Identify the Transition Points

For any domain, ask:
- What are the meaningful category boundaries?
- Where do qualitative changes occur?
- What indicators signal a transition?

### 2. Document the Indicators

Threshold knowledge should include:
- **Pre-threshold conditions**: What must be true before
- **Transition signals**: What indicates the threshold is being approached
- **Post-threshold conditions**: What is true after
- **Hysteresis**: Does the threshold differ depending on direction? (easier to enter than exit?)

### 3. Acknowledge Uncertainty

Many thresholds are:
- **Gradual**: Transition happens over time, not at a point
- **Context-dependent**: Threshold varies by individual/situation
- **Contested**: Experts disagree on where the threshold lies

## Seed Rule Proposal

**Rule:** For knowledge involving categorical transitions, explicitly document the threshold conditions and acknowledge uncertainty about boundary precision.

**Why:** Without explicit threshold knowledge, AI agents cannot accurately assess current state or predict state transitions. Advice that applies at one threshold may be harmful or useless at another.

**Test:** Pick 10 notes with categorical claims (always/never, when does X become Y). Can you identify:
1. What threshold the claim depends on?
2. What indicators signal the threshold?
3. Is uncertainty about the boundary acknowledged?

**Frontmatter:**
```yaml
threshold-knowledge: true
threshold-type: gradual|discrete|contested
pre-threshold: [conditions before transition]
post-threshold: [conditions after transition]
transition-indicators: [signals that threshold is near/crossed]
uncertainty-band: [range of uncertainty around threshold]
```

## Examples

### Skill Acquisition Thresholds
```
threshold-type: gradual
stages:
  - novice: "Cannot perform without guidance"
  - beginner: "Can perform with supervision"
  - intermediate: "Can perform independently"
  - advanced: "Can teach others"
  - expert: "Can innovate and handle edge cases"
transition-indicators: [error rate, time to complete, need for external reference]
```

### Project Health Thresholds
```
threshold-type: discrete
on-track:
  conditions: [budget variance <10%, timeline variance <2 weeks, scope stable]
scope-creep:
  conditions: [change requests >3, stakeholder requests untracked]
  transition-signals: [informal commitments, "just one more thing"]
project-drift:
  conditions: [original goal no longer primary objective]
  transition-signals: [mission statement drift, stakeholder confusion]
```

## Edge Cases

- **Contested thresholds**: Some thresholds have no consensus (e.g., "when is someone an expert?"). Present competing frameworks.
- **Individual variation**: Thresholds may differ by person. Use scope tags for individual-specific thresholds.
- **Temporal thresholds**: Some thresholds change over time (what was "expensive" in 1990 differs from 2020). Include temporal scope.
- **Composite thresholds**: Some transitions require multiple conditions simultaneously. Document the logical relationship (AND vs OR).

## Relationship to Existing Seed Rules

- Complements [[Types of Applicability Boundaries]] — thresholds are specific boundary cases
- Complements [[Frontier Exploration - Probabilistic Knowledge]] — threshold knowledge often involves probability of transition
- Complements [[Frontier Exploration - Expertise-Level Dependent Knowledge]] — thresholds may differ by skill level

## Related Notes

- [[Handling Temporal Knowledge]] — temporal knowledge deals with changes over time; threshold knowledge deals with categorical transitions
- [[Frontier Exploration - Threshold Knowledge]] is a candidate for inclusion in the Seed as a rule about documenting categorical transitions

## Test Questions

1. In your domain, what categorical transitions matter most?
2. Can you name 5 thresholds that affect your knowledge?
3. Do your notes acknowledge threshold uncertainty, or present thresholds as sharper than they are?
4. How would an AI agent determine "where you are" in a process without threshold knowledge?
