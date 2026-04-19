---
last-reviewed: 2026-04-09
lifecycle: redirect
redirect: true
redirect-target: Voice and Persona Consistency - Consolidated
tags:
  - redirect
  - voice-consistency
  - consolidated
---

# Redirect

This proposal has been superseded by the integrated Seed rule. See [[Voice and Persona Consistency - Consolidated]] for the consolidated exploration.
related:
  - "[[AI-Assisted Knowledge Management Seed]]"
  - "[[Frontier Exploration - Knowledge Base Voice and Persona Consistency]]"
tags:
  - seed-rule-proposal
  - voice-consistency
  - persona
  - knowledge-base-personality
  - quality-standard
---

# Seed Rule Proposal: Knowledge Base Voice Consistency

## Rule Statement

**Rule:** Define explicit voice and persona standards for the knowledge base — document the intended tone, terminology preferences, and stylistic guidelines that all notes should follow.

**Why:** Without explicit voice standards, AI-assisted notes become inconsistent as different capture sessions, models, or prompts produce varying tones. A knowledge base with incoherent voice creates cognitive friction for users and undermines professionalism. Explicit standards ensure coherent presentation regardless of how many hands (or AIs) contributed.

**Test:** (1) Does the vault have documented voice standards (formal/casual/technical)? (2) Can you identify notes that deviate from the standard voice? (3) Do AI-generated notes match human-generated notes in tone? (4) Is audience-appropriate voice tracked per note?

## Implementation

```yaml
# Vault-level standards (in _root.md or _schema.md)
vault-voice: technical  # formal|technical|casual|friendly|academic
vault-formality: high  # high|medium|low
vault-terminology: "domain-standard|plain-language|mixed"
vault-emoji: minimal  # none|minimal|frequent

# Note-level tracking
voice-source: ai-assisted|human-captured|synthesized
voice-audience: expert|beginner|mixed
```

## Voice Consistency Checklist

For each note:
1. Does terminology match vault standards?
2. Is the formality level appropriate for audience?
3. Is the tone consistent with adjacent notes?
4. Are acronyms defined on first use?
5. Is voice-audience marked appropriately?

## Relationship to Seed

This proposal was identified through **compliance audit** — the Seed currently lacks explicit voice standards, creating inconsistency risk across AI-assisted captures. It complements the Seed's existing quality rules (Atomic Note Principle, Linking Principle) by adding a presentation layer.

**Integration pathway:** This should be added to Seed section 1 (Foundation) as a structural convention alongside naming conventions and schema design.

## Related

- [[Frontier Exploration - Knowledge Base Voice and Persona Consistency]]
- [[AI-Assisted Knowledge Management Seed]]
- [[Schema]]
