---
last-reviewed: 2026-03-15
confidence: emerging
author-type: ai-assisted
lifecycle: evergreen
thinking-tool: false
tags:
  - frontier-gap
  - style-specific
  - music
  - conflicting-rules
---

# Frontier Gap: Conflicting Style-Specific Rules in Creative Domains

## The Problem

In music composition, different styles have "rules" that directly contradict each other:

- **Classical harmony:** Parallel fifths are forbidden — they create "empty" sound
- **Jazz/pop:** Parallel motion between voices is common and creates desired voice-leading effects
- **Classical counterpoint:** Voice independence is paramount
- **Block chord jazz:** Voices moving together in clusters is the entire point

The same action (two voices moving in parallel) is **correct** in one style and **incorrect** in another. This isn't a matter of subjective preference or competing frameworks with different assumptions — both styles claim their approach produces better results.

## Why Current Seed Rules Are Insufficient

The Seed covers competing frameworks with `framework:` tagging ( Keynesian vs Austrian). But musical style conflicts are different:

1. **The contradiction is prescriptive, not descriptive** — economics frameworks describe different models of how markets work; musical styles prescribe what you *should* do to achieve desired results

2. **Expertise level doesn't resolve it** — a master of classical composition and a master of jazz composition both have "expert" status but give contradictory advice

3. **There's no empirical resolution** — unlike science where evidence can settle debates, musical effectiveness is partly subjective and context-dependent

4. **The "right" answer depends on intent** — parallel fifths ARE wrong for Bach chorales AND correct for Bill Evans piano voicings — the styles have different goals

## What the Seed Needs

A new rule or edge case clarifying:

1. **Style-specific rule contradictions** differ from framework disagreements — they're not about "what is true" but "what works for this purpose"

2. **Tag with both framework AND style** — use `style:` frontmatter in addition to `framework:` to distinguish the specific aesthetic tradition

3. **Include explicit compatibility mapping** — document what CAN transfer between styles and what CANNOT:
   ```yaml
   style-compatibility:
     classical-harmony:
       transferable-to: []
       not-transferable-to: [jazz-voicing]
     jazz-voicing:
       transferable-to: [contemporary-pop]
       not-transferable-to: [classical-counterpoint]
   ```

4. **Prescribe intent-based resolution** — when styles conflict, the resolution depends on what the user is trying to achieve, not which style is "better"

## Related Notes

- [[Frontier Exploration - Competing Organizational Structures]]
- [[Frontier Exploration - Expert Heuristics and Rules of Thumb]]
- [[Distinguishing Craft Criticism from Aesthetic Judgment]]

## Test Case

An AI building a music knowledge base should be able to answer:
- "When is parallel motion correct?" → It depends on style intent
- "Can I apply jazz voice-leading to classical composition?" → With modification, rarely directly
- "Who can I ask to resolve this conflict?" → A practitioner of BOTH styles, not a single-style expert
