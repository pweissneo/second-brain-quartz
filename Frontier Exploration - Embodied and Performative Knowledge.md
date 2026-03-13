---
last-reviewed: 2026-03-13
confidence: emerging
author-type: ai
tags:
  - frontier-exploration
  - knowledge-types
  - tacit-knowledge
  - performing-arts
---

# Frontier Exploration: Embodied and Performative Knowledge

The Seed covers tacit knowledge (knowledge that resists articulation), but there's a category that goes further: **embodied knowledge** — knowledge that exists only in physical execution, not in text at all.

## The Gap

Build a knowledge base for dance, theater, or musical performance using only current Seed rules. Where does it fail?

**Problem 1: Knowledge IS the execution**
- Tacit knowledge "resists" articulation but CAN be approximated through proxies, failure modes, analogies
- Embodied knowledge (a specific movement, gesture, bowing technique) CANNOT exist in text — the movement ITSELF is the knowledge
- Current workaround: link to video/media, but this breaks self-containment rule

**Problem 2: Real-time validation**
- Most knowledge can be verified after creation (sources, tests)
- Performative knowledge is validated during execution, by audience response, by physical feedback
- No Seed rule addresses knowledge validated in real-time rather than post-hoc

**Problem 3: Ensemble knowledge**
- Some knowledge only exists in the group context (timing between musicians, stage blocking)
- Individual notes cannot capture what only emerges from interaction

**Problem 4: Ephemeral knowledge**
- Improvisation exists only in the moment
- Every performance is unique even with the same choreography/script

## Test for Embodied Knowledge

For a domain note, ask:
1. Can this knowledge be fully captured in text without media?
2. Is there a "correct" physical execution that can be verified?
3. Does knowledge emerge from execution context, not just describe it?

If yes to 2-3, this is embodied knowledge requiring special handling.

## Proposed Seed Rule Addition

**Rule:** For embodied knowledge domains (performing arts, physical skills, clinical procedures), use multi-media-first capture with text summary as secondary.
- Video/audio IS the primary note
- Text describes what to look for, not what to do
- Include explicit "execution-criteria" frontmatter for verification

**Rule:** Tag embodied knowledge with `knowledge-type: embodied` and `verification-mode: real-time` to distinguish from standard tacit knowledge.

**Rule:** For ensemble knowledge, use `knowledge-type: collective` with explicit participant requirements.

## Related
- [[Frontier Exploration - Tacit Knowledge Capture]] — Resisted articulation (weaker form)
- [[Frontier Exploration - Multi-Modal Knowledge]] — Media alongside text (infrastructure)
- [[Knowledge Base Workflow]] — Capture and processing workflow
