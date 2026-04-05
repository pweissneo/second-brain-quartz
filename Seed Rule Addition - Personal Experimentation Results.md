---
last-reviewed: 2026-04-04
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
tags:
  - seed-rule
  - personal-knowledge
  - experimentation
  - negative-results
  - knowledge-type
---

# Seed Rule Addition: Personal Experimentation Results

> Capturing failed personal experiments — a distinct knowledge type

## Rule

**Rule:** Capture personal experimentation results explicitly — track what you tried, your specific context, why it failed for you, and conditions for potential retry.
**Why:** Personal experimentation results are high-value knowledge that cannot be obtained from any external source. Without explicit capture, you'll repeat failed experiments. This is distinct from general negative knowledge (universal truths) and experiential knowledge (general lessons).
**Test:** Can you answer: "What have I tried that didn't work for me, specifically, and why?" for at least 3 experiments? For each: (1) Is the specific context documented? (2) Is the failure reason tied to your context, not universal? (3) Are retry conditions stated?

## Distinction from Existing Categories

| Knowledge Type | Scope | Example | Capture Pattern |
|----------------|-------|---------|------------------|
| Negative Knowledge | Universal | "Searing doesn't seal in juices" | General principle |
| Trade-off Knowledge | Context-dependent | "Speed vs. thoroughness tradeoff" | Both sides + conditions |
| Experiential Knowledge | General lessons | "What I learned from X experiences" | Lesson + context |
| **Personal Experimentation Results** | **Specific failed experiments** | **"Sunday meal prep failed for me because I need variety"** | **Specific attempt + failure reason** |

## Implementation

### Frontmatter Fields

```yaml
knowledge-type: procedural|conceptual|factual|experiential|relational|meta
experiment-status: pending|in-progress|success|failed|abandoned
experiment-context: "Your specific situation (equipment, time, preferences, constraints)"
experiment-outcome: "What happened when you tried it"
experiment-failure-reason: "Why it failed for YOUR specific context (not universal)"
experiment-retry-conditions: "When you might try again (if any)"
```

### Example Note Structure

```markdown
# Failed Experiment: [What You Tried]

## Context
Your specific situation when you tried this.

## What Happened
The outcome — be specific.

## Why It Failed for Me
[Your specific reason — not "this doesn't work" but "this doesn't work for me because..."]

## Would I Try Again?
Under what conditions, if any?

## Related
- What general principle (if any) does this inform?
- What alternative approach works better for your context?
```

### Storage Pattern

Personal experimentation results should be stored:
- **Near related knowledge**: If it's food-related, store near food notes; if it's productivity, near productivity notes
- **With experiment metadata**: The frontmatter fields enable filtering and retrieval
- **Linked to general principles**: Connect to any general knowledge this relates to

### Retrieval Mode

- **Search by experiment-status**: Find failed experiments before trying similar approaches
- **Browse by context**: When facing similar constraints, check for relevant experiments
- **Graph traversal**: Link experiments to related general knowledge

### Verification Approach

Personal experimentation results are verified through:
1. **Re-execution**: Trying again under stated retry conditions
2. **Self-consistency**: Checking if failure reason makes sense
3. **Iteration**: Updating as you learn more about your context

They are NOT verified through:
- External sources (no one else has your specific context)
- Authority (your context is unique)

## Relationship to Existing Seed Rules

This extends:

1. **Knowledge Type Taxonomy**: Adds experiment-status as a subtype of experiential
2. **Source-Origin Tracking**: Complements `source-origin-type: empirical` for documented experiments
3. **Personal Knowledge**: Specifically captures failed personal experiments vs. general personal insights

## Edge Cases

1. **Successful experiments**: Capture these too! But treat differently — success may be context-specific too.
2. **Ongoing experiments**: Use `experiment-status: in-progress` with expected completion timeline.
3. **Abandoned directions**: Distinguish from failures — abandonment may be strategic, not a "failure."
4. **Group experiments**: If multiple people tried, capture each person's context separately.

## Test in Action

**Stress Test - Cooking Domain:**
- Note: "I tried sous-vide steak at 130°F for 2 hours and it was tough"
- Check: Is context specific? (temperature, time, cut of meat, personal preference for doneness)
- Check: Is failure reason tied to personal context? ("I prefer medium-rare and 130°F gave me medium")
- Check: Are retry conditions stated? ("Try 125°F or different cut")

**Stress Test - Productivity Domain:**
- Note: "Tried time-blocking and failed"
- Check: Is this useful? NO — too generic
- Better: "Tried time-blocking with 25-minute increments and failed because my work has unpredictable interruptions"
- Context: Specific to your work type
- Failure reason: Tied to your specific situation

## Related Seed Notes

- [[Seed Rule Addition - Knowledge Without External Sources]] — original/synthesized knowledge
- [[Frontier Exploration - Personal Experimentation Results]] — frontier exploration note
- [[Confidence Markers]] — confidence scoring for experimental knowledge
- [[Knowledge Type Taxonomy]] — existing taxonomy this extends
