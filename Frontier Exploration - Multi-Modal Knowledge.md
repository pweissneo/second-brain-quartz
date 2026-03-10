---
last-reviewed: 2026-03-09
lifecycle: emerging
confidence: emerging
tags:
  - frontier-exploration
  - multi-modal
  - knowledge-types
---

# Frontier Exploration: Multi-Modal Knowledge

> How do we handle knowledge that exists beyond text?

## The Problem

The Seed focuses on text-based atomic notes with wikilinks. But many knowledge domains inherently involve multiple modalities:

- **Music theory**: Audio recordings, sheet music, performances
- **Cooking**: Video demonstrations, technique photos
- **Sports**: Technique videos, biomechanical analysis
- **Languages**: Audio pronunciation, conversation recordings
- **Art**: Visual references, technique demonstrations

An AI building a knowledge base on these topics using only text-based rules will miss core knowledge.

## Current Seed Gaps

1. **No guidance on embedding non-text media** - When should media be linked vs. embedded? How to handle broken media links?
2. **No guidance on multi-media atomicity** - Is a "note" with a 10-minute video one idea or many?
3. **No guidance on media-specific metadata** - Duration, format, quality, source reliability for recordings
4. **No guidance on text+media synthesis** - How to write a text note that references media without becoming meaningless if the media link dies

## Emerging Rule Suggestions

### Rule: Separate media references from core knowledge

**Why:** Media files rot, URLs die, platforms shut down. A knowledge base that depends on external media becomes unreliable over time.

**Test:** Can you understand the core knowledge from the text alone? If yes, the media is supplementary (good). If no, the note is fragile (needs fixing).

### Rule: Provide text summaries for all media

**Why:** Searchability. An AI can search text but cannot search inside a video or audio file without transcription.

**Test:** Does every media reference include a text summary that captures the key knowledge?

### Rule: Use domain-appropriate media formats

**Why:** Some formats are domain-standard (MIDI for music, SVG) and for diagrams are more searchable/portable than proprietary formats.

**Test:** For the domain, what is the standard format? Are media files in that format when possible?

## Test Case: Music Theory Knowledge Base

An AI building a music theory vault using only current Seed rules would:
- ✓ Create notes on chord theory, harmony, form
- ✓ Link between concepts
- ✗ Miss that listening to a chord progression is core knowledge, not supplementary
- ✗ Not know how to handle a 500-piece recording collection
- ✗ Not know whether to transcribe recordings to text (ABC notation, chord charts)

## Related

- [[AI-Assisted Knowledge Management Seed]] — The Seed this note extends
- [[Knowledge Processing]] - How new knowledge enters the vault
- [[Source Validation Over Time]] - Media links rot too
- [[Frontier Exploration - Jargon vs Plain Language]]
