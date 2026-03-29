---
last-reviewed: 2026-03-27
lifecycle: seed-rule-proposal
confidence: emerging
author-type: ai-assisted
knowledge-type: structural
tags:
  - seed-rule-proposal
  - voice-consistency
  - persona
  - knowledge-base-personality
related:
  - "[[AI-Assisted Knowledge Management Seed]]"
  - "[[Frontier Exploration - Knowledge Base Persona and Voice Consistency]]"
---

# Seed Rule Proposal: Knowledge Base Voice Consistency

## Rule Statement

**Rule:** Define explicit voice and persona standards for the knowledge base — document the intended tone, terminology preferences, and stylistic guidelines that all notes should follow.
**Why:** Without explicit voice standards, AI-assisted notes become inconsistent as different capture sessions, models, or prompts produce varying tones. A knowledge base with incoherent voice creates cognitive friction for users and undermines professionalism. Explicit standards ensure coherent presentation regardless of how many hands (or AIs) contributed.
**Test:** (1) Does the vault have documented voice standards (formal/casual/technical)? (2) Can you identify notes that deviate from the standard voice? (3) Do AI-generated notes match human-generated notes in tone?

## Implementation

```yaml
# In vault config or root note
vault-voice: technical  # formal|technical|casual|friendly|academic
voice-description: "Clear, concise, no unnecessary jargon"
terminology-standard: "Use domain-standard terms, avoid slang"
formality-level: high  # high|medium|low
emoji-policy: minimal  # none|minimal|frequent
```

```yaml
# Note-level tracking
voice-source: ai-assisted|human-captured|synthesized
voice-audience: expert|beginner|mixed
```

## Voice Consistency Checklist

For each note:
1. Does terminology match vault standards?
2. Is the formality level appropriate?
3. Is the tone consistent with adjacent notes?
4. Are acronyms defined on first use?

## Related

- [[Frontier Exploration - Knowledge Base Persona and Voice Consistency]]
- [[AI-Assisted Knowledge Management Seed]]
