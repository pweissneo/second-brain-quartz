---
last-updated: 2026-03-28
confidence: emerging
author-type: ai-assisted
lifecycle: draft
---

# Frontier Exploration - Knowledge Calibration by Use Intent

## The Gap

The Seed provides robust rules for organizing knowledge (atomicity, linking, verification) but lacks explicit guidance for calibrating knowledge presentation to the user's *intent* in accessing it. When someone opens a knowledge base, they have different goals:

- **Reference lookup** — "How do I do X right now?"
- **Learning** — "I want to understand this topic deeply"
- **Decision support** — "Should I choose A or B?"
- **Inspiration** — "What could I create/explore?"
- **Troubleshooting** — "Why did X fail and how do I fix it?"

The same knowledge should be presented differently depending on the access intent, but the Seed doesn't address this.

## Why This Matters

An AI building a knowledge base from scratch using only current Seed rules would:

1. **Over-organize for one use case** — Notes optimized for reference may be too terse for learning; notes good for learning may be too verbose for quick lookup
2. **Miss intent-based navigation** — Users can't filter by "I need help NOW" vs "I have time to learn"
3. **Create wrong entry points** — A troubleshooting user needs different first links than a learning user

## The Missing Rule

**Rule:** For mature vaults (>100 notes), explicitly tag primary use intent for each note and create navigation paths optimized for different access intents.

**Why:** Knowledge that serves reference lookup efficiently may fail for learning; knowledge good for inspiration may be too vague for decision support. Without explicit use intent tagging, AI agents cannot calibrate presentation or create appropriate navigation paths.

**Test:** For vaults >100 notes: (1) Can you identify notes tagged by use intent (reference|learning|decision|inspiration|troubleshooting)? (2) Do different intent categories have different structure/size expectations? (3) Can a user entering with a specific intent find an appropriate entry point?

## Implementation

```yaml
use-intent: reference|learning|decision|inspiration|troubleshooting
primary-intent: primary intent when accessing this note
secondary-intent: acceptable alternate intents
intent-specific-structure:
  reference:
    expected-length: short
    format: bulleted-steps|quick-ref
    entry-point: direct
  learning:
    expected-length: medium-long
    format: narrative|progressive
    entry-point: prerequisite-linked
  decision:
    expected-length: short
    format: pros-cons|comparison-matrix
    entry-point: criteria-summary
  inspiration:
    expected-length: medium
    format: examples-links|variations
    entry-point: open-ended
  troubleshooting:
    expected-length: short-medium
    format: symptom-diagnosis-resolution
    entry-point: error-symptom
```

## Connection to Existing Seed Rules

- **Context-frame** (line ~900+) already addresses purpose-based presentation (patient-education vs clinical) — extend this concept to access intent
- **Diminishing returns test** calculates utility but doesn't distinguish WHY someone would use the note
- **Note types** exist but don't map to access intent

## Test Scenario

Imagine an AI building a knowledge base for **cooking**:

- **Reference lookup:** "How long do I cook chicken breast?" → needs exact temps/times
- **Learning:** "What makes a good sauce?" → needs techniques/explanations  
- **Decision support:** "Should I use butter or oil?" → needs comparison/pros-cons
- **Inspiration:** "What can I make with leftover chicken?" → needs variations/examples
- **Troubleshooting:** "Why is my sauce grainy?" → needs diagnosis/resolution

Current Seed handles note creation but doesn't ensure all five access patterns have appropriate paths.

## Related Notes

- [[Frontier Exploration - Knowledge Presentation Calibration Knowledge]] — related but different angle
- [[Note Types and Templates]] — note type structure
- [[Context-Gated Knowledge]] — context-based access