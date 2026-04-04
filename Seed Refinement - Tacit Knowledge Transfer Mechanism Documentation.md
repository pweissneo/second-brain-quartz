---
last-reviewed: 2026-04-04
last-updated: 2026-04-04
lifecycle: seed-refinement
confidence: emerging
author-type: ai-assisted
tags:
  - seed-refinement
  - tacit-knowledge
  - transfer-mechanism
  - knowledge-type
level: extension
schema-version: "1.0"
---

# Seed Refinement - Tacit Knowledge Transfer Mechanism Documentation

> How should knowledge bases document HOW tacit knowledge transfers between people?

## The Gap

The Seed covers embodied knowledge capture and sensory anchors, but lacks explicit guidance for **transfer mechanisms** — the different ways tacit knowledge moves from one person to another.

From [[Frontier Exploration - Tacit Knowledge Transfer Mechanisms]]:
- Same knowledge (how to make hollandaise) can transfer via written recipe, video, or apprenticeship
- Transfer efficiency and completeness vary dramatically by mechanism
- The Seed doesn't document WHICH mechanism works for different knowledge types
- Missing: mechanism documentation, incomplete transfer warnings, mechanism-appropriate formatting

## Why This Matters

Without transfer mechanism rules, AI agents will:
1. Capture tacit knowledge as text when video/demonstration is more effective
2. Not warn readers when text capture is insufficient for full transfer
3. Treat all tacit knowledge as equally transferable (it isn't)
4. Create notes that capture WHAT but not HOW to learn it

## Proposed Seed Rules

### Rule 1: Document Transfer Mechanism

**Rule:** For notes containing tacit or embodied knowledge, document the mechanism through which it transfers most effectively.
**Why:** Tacit knowledge captured via one mechanism may not transfer via another. Documenting the mechanism helps readers find appropriate learning paths and set realistic expectations.
**Test:** For notes with `knowledge-type: experiential` or tags indicating embodied/tacit knowledge: (1) Is `transfer-mechanism` documented in frontmatter? (2) Does the note explain what access/conditions are needed? (3) Is there guidance on mechanism-appropriate formats?

**Implementation:**
```yaml
transfer-mechanism: apprenticeship|mentorship|community|analogical|story-based|documented
tacit-level: high|medium|low
mechanism-prerequisites:
  - "Human expert availability"
  - "Physical co-presence"
best-transfer-format: video|audio|process-documentation|narrative|text
```

### Rule 2: Incomplete Transfer Flag

**Rule:** When knowledge was captured through one transfer mechanism but requires a different mechanism to fully transfer, flag as `transfer-incomplete: true` with explanation.
**Why:** A written note about a physical technique may be "correct" but incomplete — the reader cannot fully learn from text what requires practice with feedback. Explicit flags prevent overconfidence in text-only learning.
**Test:** For notes with high tacit-level: (1) Is there a transfer-incomplete flag if format differs from optimal mechanism? (2) Does the note acknowledge what is lost in text capture? (3) Is there guidance on how to complete the transfer?

**Implementation:**
```yaml
transfer-incomplete: true
transfer-gap: "Text captures the recipe but not the feel of correct consistency"
completion-path: "Practice under supervision with feedback"
```

### Rule 3: Mechanism-Appropriate Capture Format

**Rule:** Match capture format to transfer mechanism — use audio/video/process-documentation for skill-based tacit knowledge, narrative for experiential knowledge, annotated examples for pattern-based tacit knowledge.
**Why:** Text is the default format but not optimal for all tacit knowledge. Matching format to mechanism increases transfer effectiveness and sets appropriate expectations.
**Test:** For skill-based tacit knowledge (crafts, physical techniques, performance arts): Is capture format audio/video/process-documentation rather than text-only, OR is there explicit acknowledgment of text limitations?

## Stress Test: Cooking Domain

### Question 1: Does this rule make sense for cooking?

**Yes.** Cooking has heavy tacit knowledge:
- Knife skills (requires apprenticeship-style practice with feedback)
- Timing judgment (requires watching and doing, not reading)
- Taste adjustment (requires tasting, not textual description)
- Technique feel (sensory anchors help but don't replace doing)

A note on "making hollandaise" with only written instructions should have:
- `transfer-mechanism: mentorship` (or `community` for video教程)
- `tacit-level: high`
- `transfer-incomplete: true` (text alone insufficient)
- `completion-path: Practice under supervision`

### Question 2: Is the rule's Test actually executable by an AI?

**Partially.** An AI can:
- Identify tacit knowledge from knowledge-type and tags
- Check for transfer-mechanism frontmatter
- Flag when text-only captures technique but not skill
- Verify mechanism-prerequisites are documented

But determining WHICH mechanism is optimal requires domain knowledge the AI may not have — it should suggest mechanisms based on knowledge type, not decide authoritatively.

### Question 3: Is there an edge case where the rule fails?

**Yes.**
- **Access inequality**: Optimal transfer mechanism (human apprenticeship) may be unavailable — flag what's practical, not just optimal
- **Hybrid mechanisms**: Some knowledge transfers through multiple mechanisms in sequence (read theory → watch demo → practice)
- **Individual variation**: Some people can transfer more from text than others
- **Mechanism evolution**: What required apprenticeship may now have good video documentation (phyllo pastry)

## Implementation Priority

This refinement addresses a genuine Seed gap (knowledge-type-missing). The proposed rules are:
1. Testable by AI (check frontmatter, verify flags exist)
2. Domain-agnostic (mechanisms apply to any tacit knowledge)
3. Non-breaking (additive metadata, no existing rules broken)

## Related Notes

- [[Frontier Exploration - Tacit Knowledge Transfer Mechanisms]] — Original gap documentation
- [[Frontier Exploration - Embodied Knowledge]] — Related knowledge type
- [[Seed Gap - Sensory Anchor Standardization]] — Partial solution for text-based tacit transfer
- [[Seed Refinement - Cross-Domain Knowledge Transfer]] — Different aspect of transfer (cross-domain applicability)
- [[AI-Assisted Knowledge Management Seed]] — Foundation rules

## Status

**Proposed for Seed integration** — needs testing across multiple domains (music, crafts, sports) before full integration.