---
last-reviewed: 2026-04-07
last-updated: 2026-04-07
lifecycle: emerging
confidence: emerging
author-type: ai-assisted
verification-status: draft
tags:
  - frontier-exploration
  - knowledge-transfer
  - learning-modes
  - demonstration
domain: knowledge-management
knowledge-type: meta
retrieval-mode: hybrid
storage-pattern: atomic
access-pattern: learning
---

# Frontier Exploration: Learning-by-Demonstration Knowledge

## The Gap

The Seed covers knowledge types (procedural, conceptual, factual, experiential, relational, meta) and verification modalities (source, empirical, embodied, tool-dependent, social). But it misses a critical dimension: **how knowledge is acquired** — specifically, knowledge that fundamentally requires **demonstration and imitation** rather than written instructions.

## What is Learning-by-Demonstration?

Some knowledge cannot be effectively transferred through text alone — it requires:
- **Watching** an expert perform the action
- **Imitating** the performance with feedback
- **Observing** subtle physical cues that aren't easily described
- **Mimicking** timing, pressure, rhythm, or physical sensations

Examples:
- **Physical performance**: Playing an instrument, throwing a pottery wheel, performing surgery, athletic movements
- **Artistic techniques**: Brush strokes, knife skills, welding technique, sculpting form
- **Sensory calibration**: Recognizing a ripe fruit by touch, identifying off-flavors in food, hearing intonation errors
- **Technical maneuvers**: Parking a car, landing a plane, executing a gymnastics move

## Why This Matters for Knowledge Management

1. **Text-only capture is insufficient** — detailed written instructions for "how to hold a violin bow" cannot substitute for watching a master
2. **Gap detection fails** — an AI can audit wikilinks and metadata, but cannot detect "what demonstrations am I missing?"
3. **Verification is impossible for the AI** — the AI can verify the text makes sense, but cannot verify if the demonstration description is accurate
4. **The "written everything" assumption** — current Seed rules assume knowledge can be captured in notes, but demonstration-knowledge fundamentally resists text-only capture

## The Demonstration Paradox

This creates a paradox:
- Knowledge bases aim to capture all knowledge
- Demonstration-knowledge resists text capture
- But demonstration-knowledge is essential for many domains

The Seed needs guidance on how to handle this inherent limitation.

## Proposed Seed Rule Addition

> **Rule:** Distinguish knowledge that can be effectively captured in written form from knowledge that fundamentally requires demonstration — tag with `acquisition-mode: demonstration-required` when the skill cannot be learned to proficiency from text alone.
>
> **Why:** The Seed's verification rules assume the AI can verify correctness. But for demonstration-required knowledge, the AI can only verify the text is coherent and references are accurate — actual verification requires a human or expert to watch the learner perform. Without this distinction, AI agents overstate verification confidence for knowledge that requires physical practice.
>
> **Test:** For skill-knowledge notes: (1) Can you identify if this skill can be learned from text alone? (2) Does the note include links to video demonstrations or in-person training? (3) Does the verification-status acknowledge the AI cannot verify execution correctness?
>
> **Implementation:**
> ```yaml
> acquisition-mode: text-captured|demonstration-required|hybrid
> # For demonstration-required:
> demonstration-sources:
>   - type: video
>     url: "[YouTube/course]"
>     timestamp: "[relevant timestamp]"
>   - type: in-person
>     description: "required training"
> # For the note:
> ai-verification-limit: "Can verify text coherence; cannot verify execution correctness"
> ```

## Supporting Infrastructure

For demonstration-required knowledge, the vault should:
1. Link to video demonstrations where available
2. Identify in-person training requirements
3. Use `verification-modality: practice-required` to indicate human verification needed
4. Include "what to look for" observational guidance even if demonstration isn't available
5. Acknowledge in limitations that the note cannot fully convey the skill

## Related Gaps

- [[Seed Gap - Sensory Anchor Standardization]] — sensory cues that enable embodied knowledge
- [[Frontier Exploration - Embodied Knowledge]] — broader exploration of physical skill knowledge
- [[Frontier Exploration - Tacit Knowledge Capture]] — uncodified expert knowledge
- [[Seed Refinement - Physical Skill Domains - Music Performance Gaps]] — music-specific demonstration gap