---
last-reviewed: 2026-03-19
last-updated: 2026-03-19
confidence: emerging
author-type: ai-assisted
lifecycle: evergreen
verification-status: unverified
tags:
  - frontier-exploration
  - troubleshooting
  - diagnostic-reasoning
  - knowledge-type
---

# Frontier Exploration - Troubleshooting and Diagnostic Knowledge

> Procedural knowledge tells you "how to do X." Troubleshooting knowledge tells you "what's wrong when X doesn't work." These are fundamentally different knowledge types with different structural needs.

## The Problem

The Seed excels at capturing procedural knowledge ("how to do X") but underweights **diagnostic reasoning** — the knowledge needed to figure out why something isn't working when there's no clear error message.

### Why This Is Different from Procedural Knowledge

| Procedural Knowledge | Troubleshooting Knowledge |
|---------------------|-------------------------|
| Forward: do this, then that | Backward: something broke, find the cause |
| Sequence matters | Order of investigation varies |
| Success is binary (did it work?) | Success is probabilistic (might be multiple causes) |
| Steps are deterministic | Symptoms may have multiple root causes |
| Testing is verification | Testing is elimination |

### Example Domains with Heavy Troubleshooting Component

- **Technical support**: Computer not working, network slow, software crashing
- **Healthcare**: Symptom → possible causes → tests → diagnosis  
- **Automotive**: Car making noise, engine light on, won't start
- **Home repair**: Leak, electrical problem, structural issue
- **Software debugging**: Bug reported, reproduce, isolate, fix
- **Gardening**: Plant dying, not fruiting, pest damage

### The Core Challenge

Troubleshooting requires **abductive reasoning** — inferring the most likely cause from observed effects. This differs from:
- **Deduction**: Apply rule to get result (procedural)
- **Induction**: Observe pattern to create rule (research)

Troubleshooting knowledge must capture:
1. Symptoms → possible causes mapping
2. Which investigations to try first (priority/safety)
3. What findings eliminate or confirm hypotheses
4. Interaction effects between potential causes

## Current Seed Gap

The Seed covers:
- Procedural content (recipes, code, tutorials)
- Verification-status for procedures
- Condition-triggered knowledge

What's missing:
- **Symptom → cause mapping structures**
- **Investigation prioritization** (what to check first)
- **Conflicting symptom handling** (multiple things wrong at once)
- **Uncertainty tracking** during diagnosis

## Types of Troubleshooting Knowledge

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

## Proposed Knowledge Structures

### 1. Symptom-Cause Notes

Create atomic notes for specific symptoms with:

```yaml
knowledge-type: troubleshooting
symptom: "What the user observes"
possible-causes:
  - cause: "First possible cause"
    likelihood: high|medium|low
    investigation: "How to check for this"
    confirms: "What finding means this is the cause"
    eliminates: "What finding rules this out"
  - cause: "Second possible cause"
    # ...
typical-context: "When this symptom commonly occurs"
```

### 2. Investigation Priority Framework

Not all investigations are equal. Troubleshooting notes should include:

```yaml
investigation-priority:
  - step: "Check power first"
    reason: "If no power, everything else is irrelevant"
    safety: "no-risk"
  - step: "Check obvious causes"
    reason: "Occam's razor - simplest explanation first"
    safety: "no-risk"
  - step: "Check dangerous causes"
    reason: "Safety-critical before comfort"
    safety: "high-voltage|structural|fire"
```

### 3. Differential Diagnosis Pattern

When multiple causes are possible, use a structure similar to medical differential diagnosis:

```yaml
differential:
  - condition: "Possible diagnosis A"
    ruling-criteria:
      - test: "Test to perform"
        if-positive: "Then A is likely"
        if-negative: "A is ruled out"
    urgency: emergency|urgent|routine
  - condition: "Possible diagnosis B"
    # ...
```

### 4. Interaction Effects

When causes aren't independent:

```yaml
interactions:
  - causes: ["Cause A", "Cause B"]
    effect: "When both present, symptoms are worse/masked"
    detection: "Must fix A before B becomes visible"
```

### Structuring Conditional Branches

#### For Simple Conditionals (2-3 branches)
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

#### For Complex Conditionals (4+ branches)
Create a decision-point hub that links to each branch as separate atomic notes:

```markdown
# Troubleshooting: Database Connection Errors [Hub]

This hub organizes database error troubleshooting paths.

## Common Errors

### Connection Refused
- Troubleshooting: Connection Refused
- Usually: port, firewall, or service down

### Timeout Errors  
- Troubleshooting: Connection Timeout
- Usually: network or query performance

### Authentication Failed
- Troubleshooting: Auth Errors
- Usually: credentials, permissions, or token expiry
```

#### For Linear Sequences
Tag with `temporal-type: sequence` and structure as ordered steps:

```markdown
---
temporal-type: sequence
prerequisites: []
---

# Troubleshooting: Application Won't Start

## Step 1: Check Logs
Look at the most recent log entries...

## Step 2: verify Dependencies
Check if all required services are running...

## Step 3: Test Configuration
Run the config validation command...

## Exit Criteria
Problem is resolved when: application starts without errors
```

### Key Principles for Conditional Knowledge

#### 1. Atomic Branches
Each branch (each "if" path) should be its own atomic note when:
- It needs more than 50 words to explain
- It's referenced elsewhere independently
- It has its own sub-branches

#### 2. Typed Relationships
Distinguish relationship types:
- **Diagnostic**: "if symptom, then try this"
- **Fallback**: "if first attempt doesn't work, try this instead"
- **Prerequisite**: "you must do X before Y"

#### 3. Exit Criteria
Every troubleshooting note should define:
- What success looks like
- When to stop trying branches
- When to escalate or seek help

## Proposed Seed Rules

### Rule: Distinguish Troubleshooting from Procedural Knowledge

**Rule:** Tag notes containing troubleshooting knowledge with `knowledge-type: troubleshooting` and separate from purely procedural notes.

**Why:** Troubleshooting requires different reasoning patterns (abductive vs. deductive) and different verification (symptom resolution vs. procedure completion).

**Test:** Can you categorize notes as: (a) purely procedural, (b) purely troubleshooting, (c) both?

### Rule: Include Investigation Priority in Troubleshooting Notes

**Rule:** Troubleshooting notes must include investigation priority — what to check first, second, third — with reasoning for each priority.

**Why:** Without priority, users face analysis paralysis. Some investigations are quick, some are time-consuming, some are dangerous. Priority enables efficient diagnosis.

**Test:** For troubleshooting notes, can you identify: (1) What to check first? (2) Why that order? (3) What's the fastest path to resolution?

### Rule: Track Uncertainty During Troubleshooting

**Rule:** Use explicit uncertainty markers during diagnosis: `diagnosis-status: investigating | probable | confirmed | ruled-out`.

**Why:** Premature certainty in troubleshooting leads to wrong fixes. Tracking uncertainty ensures systematic elimination of possibilities.

**Test:** Can you trace the progression from initial symptom to final resolution? Are eliminated causes documented?

### Rule: Include Safety Escalation in Technical Troubleshooting

**Rule:** For troubleshooting involving safety (electrical, structural, chemical), include explicit `safety-warning` frontmatter and escalation path.

**Why:** Some troubleshooting can cause harm if done incorrectly. Users need to know when to stop and call a professional.

**Test:** For technical troubleshooting notes, is there guidance on when to escalate?

## Test Criteria

- [ ] Can you distinguish troubleshooting knowledge from procedural knowledge?
- [ ] Do troubleshooting notes include investigation priority?
- [ ] Can you track which causes have been ruled out?
- [ ] Is safety guidance included for dangerous troubleshooting?
- [ ] Do troubleshooting notes pass the "next person" test: could someone else follow this diagnostic path?

## Related Notes

> **Note:** Content from [[Frontier Exploration - Troubleshooting and Diagnostic Knowledge]] has been merged into this note (2026-03-19).

- [[Stress Test - Verification Status Rule in Home Repair]] — Home repair as troubleshooting domain
- [[Frontier Exploration - Equipment and Tool Dependencies]] — Tool-specific troubleshooting
- [[AI-Assisted Knowledge Management Seed]] — Knowledge-type tagging

## Edge Cases

### When Troubleshooting Becomes Research

If the problem is novel and no known cause exists, troubleshooting transitions to research. Tag with:
```yaml
diagnosis-status: unknown-cause
recommended-action: document-symptoms | consult-expert | research
```

### When Multiple Things Are Broken

Sometimes troubleshooting reveals multiple problems. Structure as:
```yaml
primary-issue: "Main problem causing most symptoms"
secondary-issues: ["Other problems found while investigating"]
resolution-order: "Fix primary first, then re-evaluate secondary"
```

### When Symptoms Are Ambiguous

Vague symptoms ("it doesn't feel right") are hard to troubleshoot. Include:
```yaml
symptom-clarification:
  - question: "What specifically is wrong?"
    context: "When does it occur? What makes it better/worse?"
```

---

**Note:** This is frontier exploration. The rules proposed here are preliminary and should be tested against vaults containing troubleshooting knowledge before adding to the Seed.
