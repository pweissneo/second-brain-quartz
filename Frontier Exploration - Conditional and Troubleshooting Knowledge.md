---
created: 2026-03-11
last-reviewed: 2026-03-11
confidence: high
lifecycle: deprecated
tags:
  - frontier-exploration
  - structure
  - conditional
  - troubleshooting
  - superseded
---

> **⚠️ DEPRECATED:** These proposed rules have been incorporated into the Seed.
> See: [[AI-Assisted Knowledge Management Seed]] → Rules: "For conditional/troubleshooting knowledge with 3+ branches", "Include exit criteria in troubleshooting notes"

# Frontier Exploration - Conditional and Troubleshooting Knowledge

> How should a knowledge base capture knowledge that depends on conditions, outcomes, or "if X then Y" decision trees?

---

## The Problem

Consider building a knowledge base about:
- **Troubleshooting**: "If the car won't start, check battery; if battery is good, check starter"
- **Diagnostics**: "If fever + cough, consider pneumonia; if fever + rash, consider measles"
- **Conditional procedures**: "Apply method A; if results are X, proceed to B; if results are Y, try C"

The current Seed handles:
- **Linear procedures** → Atomic notes with clear steps
- **Prerequisites** → `prerequisites` field for required prior knowledge
- **Sequential knowledge** → `temporal-type: sequence` for ordered knowledge

But none of these capture **branching logic** — knowledge where the next step depends on the current outcome.

## Why This Matters

Without guidance, AIs treat all knowledge as linear:
- Notes become massive "if-then-else" chains that violate atomicity
- OR branches get split into separate notes that lose context
- Troubleshooting knowledge becomes unusable because you can't track where you are in the decision tree

Common failures:
- **Procedural notes with 20+ conditional branches** — violates atomicity, impossible to use
- **Every branch as a separate note** — loses the overall flow/context
- **No way to track "where am I" in a troubleshooting flow**

## Proposed Approach

### Structure Options for Conditional Knowledge

| Scenario | Recommended Structure |
|----------|---------------------|
| Simple 2-branch (if/else) | Single note with clearly marked sections |
| 3+ branches | Separate note per branch condition, hub for decision point |
| Multi-step with branches at each step | Hub + linked decision tree, NOT linear notes |
| Troubleshooting with multiple failure points | Problem/solution pairs, linked by "if this then try that" |

### Key Distinction

**Linear procedure** → Do A, then B, then C (always the same path)
**Conditional procedure** → Do A; if result X, do B; if result Y, do C (path varies)

### Template for Troubleshooting Notes

```markdown
---
type: troubleshooting
condition: [what symptom or state triggers this]
next-steps:
  - if: [condition A]
    then: [link to branch note A]
  - if: [condition B]  
    then: [link to branch note B]
---

# Troubleshooting: [Problem Name]

## Symptoms
[What to look for]

## Initial Check
[First diagnostic step]

## Branching Outcomes
### If [Outcome A]
→ Link to note explaining how to handle outcome A

### If [Outcome B]
→ Link to note explaining how to handle outcome B
```

### Seed Rule Proposal

**Rule:** For conditional/troubleshooting knowledge with 3+ branches, create a decision-point hub that links to each branch as separate atomic notes — do not embed all branches in one note.
**Why:** Embedding 3+ branches violates atomicity and makes the note unusable; splitting without a hub loses the decision context.
**Test:** Pick a note with conditional branches. (1) Does it have 3+ branches? (2) If yes, is there a hub note explaining the decision point? (3) Are branches linked from the hub?

**Rule:** Use typed links or frontmatter to clarify the relationship between troubleshooting steps — distinguish "if symptom then try" from "if that doesn't work then try" (sequential vs. fallback).
**Why:** Readers need to know whether to try all options or stop at the first success.
**Test:** For troubleshooting notes with multiple steps: (1) Can you distinguish primary attempts from fallback attempts? (2) Is the relationship between steps explicit?

**Rule:** For conditional knowledge, include an "exit criteria" — how do you know the problem is solved or that you've reached a dead end?
**Why:** Without exit criteria, users don't know when to stop trying branches.
**Test:** Pick a troubleshooting note. Can you identify: (1) What success looks like? (2) When to escalate or seek help?

## Testing the Gap

A knowledge base has a gap in handling conditional knowledge if:
1. You find notes with "if...then...else...if...then" structures longer than 300 words
2. Troubleshooting flows require reading multiple notes without understanding the decision tree
3. Users can't determine which branch applies to their situation

## Related Notes

- [[Atomic Note Principle]] — When splitting is appropriate
- [[Frontier Exploration - Temporal and Sequential Knowledge]] — For ordered knowledge without branching
- [[Frontier Exploration - Procedural Knowledge Verification]] — For testing procedures
