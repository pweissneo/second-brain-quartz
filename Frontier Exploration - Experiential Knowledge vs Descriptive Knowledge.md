---
last-reviewed: 2026-03-29
last-updated: 2026-03-29
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - knowledge-types
  - epistemology
  - experience
---

# Frontier Exploration: Experiential Knowledge vs Descriptive Knowledge

> When does the thing itself become the knowledge? When is a description sufficient?

---

## The Distinction

**Experiential knowledge** — knowledge that IS the experience:
- A vacation photo album IS the memory
- A recorded lecture IS the learning
- A played game IS the strategy understanding
- A cooked meal IS the recipe knowledge

**Descriptive knowledge** — knowledge that describes the experience:
- A travel journal describes the vacation
- Notes about teaching convey the lecture
- A note about strategy explains the game
- A written recipe captures the dish

---

## The Problem

The Seed assumes knowledge is captured as notes — text describing ideas. But some knowledge IS the thing itself, not a description of the thing.

When should you capture:
- The experience directly (photos, recordings, samples)?
- A description of the experience (notes, summaries, transcripts)?
- Both?

---

## When Experiential Capture Works

**Direct experience IS the knowledge when:**
1. The experience is irreproducible (unique events)
2. Tacit knowledge can't be fully articulated (physical skills)
3. The medium IS the message (art, music, performance)
4. Access/logistics make re-experiencing difficult

**Examples:**
- Family photos ARE the memory — no amount of description replaces viewing
- A recorded piano performance IS the music — notation describes but doesn't replace
- A sample of yarn IS the color/texture — words can't convey

---

## When Descriptive Capture Works

**Notes ARE sufficient when:**
1. The experience is reproducible
2. The knowledge is the principle, not the instance
3. Access to experience is easy/cheap
4. Re-experiencing adds no new value

**Examples:**
- Mathematical proofs — the reasoning matters, not the reading experience
- Historical facts — no one can re-experience Rome
- Methodologies — principles transfer across contexts

---

## The Spectrum

Most knowledge sits on a spectrum:

| Pure Experiential ←→ | Pure Descriptive |
|---------------------|---------------|
| Vacation photos | Historical timeline |
| Recorded music | Music theory |
| Played game | Strategy principles |
| Cooked dish | Recipe with technique notes |
| Sample swatch | Fabric properties |

---

## Seed Rules Already Address

The Seed partially covers:
- **Multi-modal knowledge** — addresses visual, audio, video alongside text
- **Embodied knowledge** — addresses tacit skills
- **Tool-executable knowledge** — addresses procedural capture

But neither explicitly addresses: when is capturing the experience MORE correct than capturing a description?

---

## Recommendations for the Seed

The gap: No explicit rule on when to prioritize experiential vs descriptive capture.

**Rule suggestion:**
> **Rule:** Distinguish experiential vs descriptive knowledge capture — when the experience itself is the knowledge (unique, irreproducible, or tacit), capture directly. When the principle is the knowledge (transferable, reproducible), capture descriptively.
> **Why:** Capturing a description of experiential knowledge loses essential detail. Capturing experience when description suffices bloats the vault with redundant media.
> **Test:** For this knowledge: (1) Is it unique/irproducible? (2) Would re-experiencing add value? (3) Is the tacit component essential? If yes to 2+, prioritize experiential capture.

---

## Implementation

Tag knowledge type:
```yaml
knowledge-capture-mode: experiential|descriptive|both
experiential-component: unique|reproducible
tacit-essential: true|false
```

---

## Related Notes

- [[Frontier Exploration - Multi-Modal Knowledge]]
- [[Frontier Exploration - Embodied Knowledge]]
- [[Frontier Exploration - Sensory Knowledge Capture]]