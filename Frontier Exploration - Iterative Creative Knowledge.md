---
last-reviewed: 2026-04-02
last-updated: 2026-04-02
confidence: high
lifecycle: evergreen
author-type: ai-assisted
tags:
  - frontier-exploration
  - knowledge-process
  - creative-process
  - iteration
level: frontier
process-type: iterative
gap-status: resolved
gap-resolved: 2026-03-29
---

# Frontier Exploration - Iterative Creative Knowledge

> Knowledge that involves cyclic evaluation and decision-making, not just linear sequences.

> **Status (2026-04-02):** This gap has been RESOLVED. The Seed now includes iterative-evaluative knowledge rules (see [[AI-Assisted Knowledge Management Seed.md]]). This note is preserved for reference and examples.

## The Problem

Many creative and technical processes aren't sequences — they're **loops**. You try something, evaluate the result, then decide what to do next. The Seed's sequential knowledge rules assume a predetermined path, but iterative processes require different structure.

Examples:
- **Music composition**: Try a melody → evaluate harmony → adjust → evaluate again → decide to keep or try different direction
- **Painting**: Apply color → step back → evaluate → add contrast → evaluate → decide next move
- **Writing**: Draft → read aloud → revise → evaluate flow → revise again
- **Design**: Prototype → test → iterate → test → decide on final
- **Coding**: Write code → run tests → debug → refactor → evaluate → iterate

In each case, the "next step" isn't predetermined — it depends on evaluating the current state.

## What the Seed Covers

The Seed covers:
- Sequential knowledge (where order IS the knowledge)
- Procedural content (recipes, tutorials)
- Troubleshooting (conditional branches)
- Temporal knowledge

## What's Now Covered

The Seed now includes iterative-evaluative knowledge rules (integrated 2026-03-29):

1. **Process type tagging** — Distinguish linear-sequential from iterative-evaluative knowledge
2. **Evaluation criteria capture** — Separate evaluation from process steps
3. **Termination conditions** — Explicit stopping criteria for iterative processes

See [[AI-Assisted Knowledge Management Seed.md]] for the complete rules.

## Proposed Rules (for reference - now in Seed)

### Rule: Distinguish linear-sequential from iterative-evaluative knowledge

**Why**: Linear-sequential knowledge has a fixed order (history, recipes); iterative-evaluative knowledge has decision loops where next steps depend on evaluating current state. Treating loops as sequences misrepresents the knowledge and makes it unusable.

**Test**: For a process note: (1) Is the next step predetermined, or does it depend on evaluating the current state? (2) Could a reasonable practitioner choose different next steps? (3) Is there an evaluation criterion that guides iteration? If yes to 2-3, this is iterative-evaluative.

### Rule: For iterative knowledge, capture evaluation criteria separate from process steps

**Why**: The evaluation criteria (does this melody "work"? is the contrast strong enough?) are different from the actions (add contrast, try different chord). Separating them makes the knowledge reusable — the criteria can apply to any iteration, not just one specific process.

**Test**: Can you identify evaluation criteria that would apply to multiple iterations? Are they clearly distinguished from action steps?

### Rule: Use explicit termination conditions for iterative processes

**Why**: Unlike sequential knowledge (done when steps are complete), iterative knowledge needs explicit stopping conditions. Without them, practitioners either stop arbitrarily or never stop ("one more iteration").

**Test**: Does the note specify: (1) When is the iteration "good enough"? (2) What's the time/resource constraint? (3) When should the practitioner stop and move on?

### Rule: Tag iterative knowledge with `process-type: iterative` and include `evaluation-criteria:` field

**Why**: Iterative knowledge requires different handling than sequential — AIs need to know this isn't a fixed path. Evaluation criteria field makes the judgment explicit.

**Test**: Can you identify iterative notes by their frontmatter? Can an AI agent determine what "success" looks like without executing the process?

## Gap Analysis (RESOLVED)

An AI building a music composition knowledge base using current Seed rules can now:
1. **Evaluation criteria** — Use `evaluation-criteria:` frontmatter field
2. **Branching iterations** — Use `process-type: iterative` with decision node
3. **Termination conditions** — Apply explicit termination rule from Seed
4. **Aesthetic judgment** — Link to embodied knowledge principles

The Seed's rules (2026-03-29+) now cover "evaluate, decide, iterate" loops.

## Test Case (ARCHIVED - Rules Now Exist)

An AI using current Seed rules (post-2026-03-29) CAN now capture:
- How to evaluate whether a melody works in context
- When to iterate on a section vs. move on
- How to decide between two valid compositional choices
- When a piece is "finished"

The gap has been resolved through Seed integration.

## Related Notes (Updated 2026-04-02)

- [[AI-Assisted Knowledge Management Seed.md]] — Iterative-evaluative rules now integrated
- [[Handling Temporal Knowledge]] — Covers linear sequences
- [[Frontier Exploration - Troubleshooting and Diagnostic Knowledge]] — Covers branching but in diagnostic context
- [[Frontier Gap - Embodied Knowledge]] — Related to aesthetic judgment which is often tacit
- [[Frontier Exploration - Sensory Knowledge Capture]] — Evaluation often involves sensory assessment

## Test Case: Music Composition Knowledge Base

Using only current Seed rules, an AI would create:
- Notes on scales, chords, progressions (atomic, linked)
- Notes on compositional techniques (sequential)
- Notes on common patterns (procedural)

But it would NOT capture:
- How to evaluate whether a melody works in context
- When to iterate on a section vs. move on
- How to decide between two valid compositional choices
- When a piece is "finished"

This is a significant gap for any creative domain.
