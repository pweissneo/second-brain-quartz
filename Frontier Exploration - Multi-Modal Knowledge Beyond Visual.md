---
last-reviewed: 2026-04-07
last-updated: 2026-04-07
lifecycle: deprecated
confidence: high
author-type: ai-assisted
redirect_to: "[[Frontier Exploration - Multi-Modal Knowledge]]"
correction-type: merged
correction-date: 2026-04-07
correction-note: "Content merged into main multi-modal note. Added symbolic vs experiential distinction from [[Frontier Exploration - Multi-Modal Knowledge Representation in Music]]."
---

# Frontier Exploration - Multi-Modal Knowledge Beyond Visual ⚠️ DEPRECATED

> ⚠️ DEPRECATED: This note has been integrated into [[Frontier Exploration - Multi-Modal Knowledge]]. The rules below are now part of that note's comprehensive multi-modal guidance.

## The Gap

The Seed includes robust guidance for visual knowledge representation (diagrams, charts, maps) but lacks equivalent guidance for other sensory modalities, particularly **audio knowledge** (music, podcasts, soundscapes, oral traditions) and **kinesthetic knowledge** (movement patterns, physical techniques).

When building a knowledge base about music, podcasts, sound design, dance, or martial arts, an AI agent following the current Seed would:
- Default to text descriptions of audio/kinesthetic content
- Miss domain-specific retrieval patterns unique to these modalities
- Apply visual-knowledge rules inappropriately to non-visual content

## Why This Matters

Different modalities have different:
- **Natural query patterns**: "what does X sound like?" vs "what does X look like?"
- **Verification methods**: Audio requires listening verification, not just source-checking
- **Storage patterns**: Sequential/time-based vs. spatial/hierarchical
- **Accessibility requirements**: Different accommodations needed (transcription vs. alt-text)

## Domain Examples

- **Music composition**: Sequential listening, harmonic analysis, melodic patterns
- **Podcasts**: Episode-based navigation, topic timestamps
- **Sound design**: Spectral analysis, psychoacoustic principles
- **Dance/movement**: Video essential, text insufficient
- **Oral traditions**: Audio recording primary, transcription secondary

## Proposed Seed Rule

**Rule:** For knowledge dependent on audio, video, or kinesthetic representation, include the primary sensory format alongside text and apply modality-specific retrieval patterns.

**Why:** Text-only representation loses essential information in modalities where the sensory experience IS the knowledge. Converting audio knowledge to text loses timing, timbre, and emotional quality. Converting movement to text loses spatial and temporal dynamics.

**Test:** (1) Can you identify the primary modality for this knowledge? (2) Does the note include the primary sensory format or explicit reference to it? (3) Does retrieval pattern match modality (sequential for audio, spatial for movement)? (4) Is accessibility addressed (transcription, description, captions)?

**Implementation:**
```yaml
knowledge-modalities: [audio, visual, kinesthetic, textual]
primary-modality: audio
audio-type: music|podcast|soundscape|oral|environmental
retrieval-pattern: sequential|spatial|temporal|hybrid
includes-media: true
media-format: mp3|wave|video|transcription
accessibility: transcript-provided|description-provided|media-essential
```

## Related Seed Rules

- [[Frontier Exploration - Visual Knowledge Representation in Knowledge Bases]]
- [[Frontier Exploration - Multi-Modal Knowledge]]
- [[Seed Stress Test - Visual Knowledge Rule Across Domains]]

## Test Scenario

An AI agent building a music theory knowledge base using ONLY current Seed rules would produce text-heavy notes with musical notation (visual) but no audio references. The agent would not know to:
- Link to audio examples
- Use sequential (time-based) navigation for compositions
- Include listening verification as a verification mode
- Handle knowledge that's inherently temporal (musical phrases, development)

---

*Deprecated 2026-04-06: The proposed rules above have been integrated into [[Frontier Exploration - Multi-Modal Knowledge]], which now includes comprehensive guidance for audio, visual, and kinesthetic modalities.*
