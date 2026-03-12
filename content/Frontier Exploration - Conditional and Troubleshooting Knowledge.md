---
last-reviewed: 2026-03-11
lifecycle: draft
confidence: emerging
tags:
  - frontier-exploration
  - conditional-knowledge
  - troubleshooting
  - decision-tree
---

# Frontier Exploration: Conditional and Troubleshooting Knowledge

> How should a knowledge base handle if-then branches, decision trees, and troubleshooting guidance?

## The Problem

Some knowledge is inherently conditional:
- "If X, then do Y"
- "When troubleshooting, check A, then B, then C"
- "Conditional logic: if/else/elseif branches"

The Seed has rules for:
- Atomicity (one idea per note)
- Linking (meaningful connections)
- Sequential knowledge (where order IS the knowledge)

But it's missing guidance on HOW to structure conditional/troubleshooting knowledge that involves branching logic.

## Where AI Agents Get Stuck

When building troubleshooting guides using only current Seed rules:

1. Do you embed all branches in one note or split them?
2. How do you represent if/then/else logic in a linear note?
3. When does a decision tree become too complex for one note?
4. How do you handle exit criteria (when is the problem solved)?

## Types of Conditional Knowledge

### Diagnostic Trees
"Symptom → Possible Cause → Resolution"
- "Computer won't turn on" → Check power → Check outlet → etc.
- "Garden plants dying" → Check water → Check soil → Check pests

### Decision Trees
"Condition → Option A vs Option B"
- "Server down" → "Check status page" → "If red, alert on-call; if green, user error"
- "Recipe too salty" → "Add acid" vs "Add fat" vs "Dilute"

### Troubleshooting Sequences
"Try these steps in order"
- Reboot → Check logs → Check config → Contact support

### Conditional Recommendations
"It depends on X"
- "If beginner, use X; if advanced, use Y"
- "If on Mac, do X; if Windows, do Y"

## Proposed Approach

### For Simple Conditionals (2-3 branches)
Embed in a single note with clear formatting:

```markdown
# Troubleshooting: Sauce Too Salty

## Possible Fixes

### Add Acid
- Works by: acid counteracts salt perception
- Best for: tomato-based sauces
- How: add lemon juice or vinegar

### Add Fat
- Works by: fat dissolves salt particles
- Best for: cream-based sauces  
- How: add butter or heavy cream

### Dilute
- Works by: reduces salt concentration
- Best for: soups and stews
- How: add more liquid (will change consistency)
```

### For Complex Conditionals (4+ branches)
Create a decision-point hub that links to each branch as separate atomic notes:

```markdown
> ⚠️ *Illustrative example — hypothetical notes for demonstration*

# Troubleshooting: Database Connection Errors [Hub]

This hub organizes database error troubleshooting paths.

## Common Errors

### Connection Refused
- Troubleshooting: Connection Refused (hypothetical)
- Usually: port, firewall, or service down

### Timeout Errors  
- Troubleshooting: Connection Timeout (hypothetical)
- Usually: network or query performance

### Authentication Failed
- Troubleshooting: Auth Errors (hypothetical)
- Usually: credentials, permissions, or token expiry
```

### For Linear Sequences
Tag with `temporal-type: sequence` and structure as ordered steps:

```markdown
---
temporal-type: sequence
prerequisites: []
---

# Troubleshooting: Application Won't Start

## Step 1: Check Logs
Look at the most recent log entries...

## Step 2: Verify Dependencies
Check if all required services are running...

## Step 3: Test Configuration
Run the config validation command...

## Exit Criteria
Problem is resolved when: application starts without errors
```

## Key Principles

### 1. Atomic Branches
Each branch (each "if" path) should be its own atomic note when:
- It needs more than 50 words to explain
- It's referenced elsewhere independently
- It has its own sub-branches

### 2. Typed Relationships
Distinguish relationship types:
- **Diagnostic**: "if symptom, then try this"
- **Fallback**: "if first attempt doesn't work, try this instead"
- **Prerequisite**: "you must do X before Y"

### 3. Exit Criteria
Every troubleshooting note should define:
- What success looks like
- When to stop trying branches
- When to escalate or seek help

## Test for AI Agents

1. Does this note have 3+ conditional branches? → Consider splitting to hub + spoke
2. Can you identify the relationship type for each branch? (diagnostic, fallback, prerequisite)
3. Are exit criteria defined? Can users tell when they're done?
4. Is each branch atomic (one idea) or does it contain sub-conditionals?

## Rule Proposal

**Rule:** For conditional/troubleshooting knowledge with 3+ branches, create a decision-point hub that links to each branch as separate atomic notes — do not embed all branches in one note.

**Why:** Embedding 3+ conditional branches violates atomicity and makes the note unusable. Splitting without a hub loses the decision context.

**Test:** Pick a troubleshooting note. (1) Does it have 3+ branches? → Hub + spoke. (2) Can you distinguish primary attempts from fallback attempts? → Typed relationships. (3) Is exit criteria defined? → Clear success conditions.

## Related
- [[Frontier Exploration - Temporal and Sequential Knowledge]]
- [[Frontier Exploration - Framework-Dependent Knowledge]]
- [[AI-Assisted Knowledge Management Seed]]
