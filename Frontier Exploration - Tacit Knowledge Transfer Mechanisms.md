---
lifecycle: seed-extension
confidence: emerging
last-reviewed: 2026-03-29
author-type: ai-assisted
gap-type: knowledge-type-missing
tags:
  - frontier-exploration
  - knowledge-type
  - tacit-knowledge
  - transfer-mechanisms
  - seed-gap
related:
  - "[[Frontier Exploration - Embodied Knowledge]]"
  - "[[Frontier Exploration - Intuition vs Analysis Knowledge]]"
  - "[[Seed Gap - Sensory Anchor Standardization]]"
---

# Frontier Exploration: Tacit Knowledge Transfer Mechanisms

## The Gap

The Seed covers:
- **Embodied knowledge** — knowledge that requires physical sensation to fully understand
- **Sensory anchors** — textual approximations of sensory cues
- **Experiential verification** — testing through practice

But it misses a distinct category: **transfer mechanisms** — the different ways tacit knowledge moves from one person (or source) to another.

Tacit knowledge is "we know more than we can tell" (Polanyi). The Seed addresses WHAT tacit knowledge is and how to capture it, but not HOW it transfers between people.

## Why It Matters

Without explicit transfer mechanism rules, AI agents building knowledge bases in domains with heavy tacit knowledge will:
- Capture tacit knowledge as "content" when it should be documented as "process"
- Miss that some knowledge can only transfer through specific mechanisms (apprenticeship, not reading)
- Treat all tacit knowledge as equally transferable when mechanisms vary dramatically
- Create notes that capture WHAT but not HOW to learn it

## The Knowledge Type

Transfer mechanisms are distinct from knowledge types. A recipe (procedural) might transfer via:
- Written recipe (low tacit)
- Video demonstration (medium tacit)
- Cooking alongside the chef (high tacit)

The SAME knowledge (how to make hollandaise) has different transfer mechanisms with different efficiency and completeness.

### Transfer Mechanism Spectrum

| Mechanism | Tacit Level | Speed | Completeness | Requirements |
|-----------|-------------|-------|--------------|--------------|
| Written documentation | Low | Fast | Partial | Reading ability |
| Audio/video demonstration | Medium | Medium | Better | Media access |
| Annotated examples | Medium | Medium | Good | Example availability |
| Mentorship/apprenticeship | High | Slow | Best | Human availability |
| Communities of practice | High | Slow | Variable | Social access |
| Analogical transfer | Medium | Medium | Partial | Cross-domain knowledge |
| Story-based transfer | Medium | Fast | Good | Narrative skills |

## What the Seed Lacks

The Seed doesn't have explicit rules for:

1. **Mechanism documentation** — How to capture WHICH transfer mechanism works for a given knowledge type
2. **Incomplete transfer warning** — When knowledge was captured through one mechanism but requires another to fully transfer
3. **Mechanism prerequisites** — What access or conditions are needed for each transfer mechanism
4. **Mechanism-appropriate formatting** — Should tacit knowledge be captured as text, video, audio, or process documentation?

## Proposed Rules

### Rule: Document Transfer Mechanism

**Rule:** For tacit knowledge notes, document the mechanism through which it transfers most effectively.
**Why:** Tacit knowledge captured via one mechanism may not transfer via another. Documenting the mechanism helps readers find appropriate learning paths.
**Test:** For notes tagged as embodied or tacit: (1) Is transfer-mechanism documented? (2) Does the note explain what access/conditions are needed? (3) Is there a warning when text-only is insufficient?

**Implementation:**
```yaml
transfer-mechanism: apprenticeship|mentorship|community|analogical|story-based|documented
tacit-level: high|medium|low
mechanism-prerequisites:
  - "Human expert availability"
  - "Physical co-presence"
transfer-warning: "Text alone insufficient — requires demonstration"
best-transfer-format: video|audio|process-documentation|narrative
```

### Rule: Incomplete Transfer Flag

**Rule:** When tacit knowledge is captured in text format but requires a different mechanism to fully transfer, flag as `transfer-incomplete: true` with explanation.
**Why:** A written note about a physical technique may be "correct" but incomplete — the reader cannot fully learn from text what requires practice with feedback.
**Test:** For tacit knowledge notes in text format: (1) Is there a transfer-incomplete flag if the mechanism differs? (2) Does the note acknowledge what is lost in text capture? (3) Is there guidance on how to complete the transfer?

### Rule: Mechanism-Appropriate Capture Format

**Rule:** Match capture format to transfer mechanism — use video/audio for skill-based tacit knowledge, narrative for experiential knowledge, annotated examples for pattern-based tacit knowledge.
**Why:** Text is the default format but not optimal for all tacit knowledge. Matching format to mechanism increases transfer effectiveness.
**Test:** For skill-based tacit knowledge (crafts, physical techniques, performance): Is capture format audio/video/process-documentation rather than text-only?

## Stress Test: Cooking Domain

### Question 1: Does this rule make sense for cooking?

**Yes.** Cooking has heavy tacit knowledge:
- Knife skills (requires apprenticeship-style practice with feedback)
- Timing judgment (requires watching and doing, not reading)
- Taste adjustment (requires tasting, not textual description)
- Technique feel (sensory anchors help but don't replace doing)

### Question 2: Is the rule's Test actually executable by an AI?

**Partially.** An AI can:
- Identify tacit knowledge from embodied-component tags
- Check for transfer-mechanism frontmatter
- Flag when text-only captures technique but not skill

But determining WHICH mechanism is optimal requires domain knowledge the AI may not have.

### Question 3: Is there an edge case where the rule fails?

**Yes.**
- **Access inequality**: Optimal transfer mechanism (human apprenticeship) may be unavailable
- **Hybrid mechanisms**: Some knowledge transfers through multiple mechanisms in sequence
- **Individual variation**: Some people can transfer more from text than others

## Edge Cases

### 1. Transfer Chain Documentation

Some knowledge requires a CHAIN of mechanisms:
- Read theory → Watch demonstration → Practice with feedback → Teach others

Document the chain, not just one mechanism.

### 2. Transfer Mechanism Evolution

Some knowledge that was once high-tacit becomes low-tacit as it gets better documented:
- Making phyllo pastry was once apprenticeship-only
- Now has good video documentation

Track whether transfer mechanism has changed with better documentation.

### 3. Cross-Domain Tacit Transfer

Some tacit knowledge transfers via analogy:
- Cooking technique → pottery technique
- Music timing → dance timing

Analogical transfer is a mechanism with its own requirements (cross-domain knowledge availability).

### 4. Transfer Efficiency vs Completeness

Sometimes faster mechanisms (videos) are "good enough" even if slower mechanisms (apprenticeship) are more complete.

Document both the optimal and practical options.

## Related Patterns

This connects to:
- [[Frontier Exploration - Embodied Knowledge]] — the knowledge type this addresses
- [[Frontier Exploration - Intuition vs Analysis Knowledge]] — intuition is tacit knowledge requiring specific transfer mechanisms
- [[Seed Gap - Sensory Anchor Standardization]] — partial solution for text-based tacit transfer
- [[Frontier Exploration - Knowledge Modality]] — format matching

## Gap Type

This is a **knowledge-type-missing** gap — the Seed has rules for embodied knowledge capture but not for the transfer mechanisms that enable tacit knowledge to move between people.