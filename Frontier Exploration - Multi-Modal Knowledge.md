---
lifecycle: seed-extension
confidence: high
author-type: ai-assisted
last-reviewed: 2026-03-30
verification-status: verified
schema-version: "1.0"
level: principle
tags: [knowledge-type, multi-modal, media, frontier]
gap-status: integrated
see-also: "[[AI-Assisted Knowledge Management Seed]]"
---

# Frontier Exploration - Multi-Modal Knowledge in Knowledge Bases

> Knowledge that exists in forms beyond plain text — images, audio, video, diagrams, interactive content.

## The Gap

The Seed treats all knowledge as text-based notes with wikilinks. But significant knowledge domains involve or depend on multi-modal content:

- **Visual knowledge**: Photographs, diagrams, charts, maps, architectural plans
- **Audio knowledge**: Music, spoken content (podcasts, lectures), environmental sounds
- **Video knowledge**: Screencasts, tutorials, demonstrations, performance recordings
- **Interactive knowledge**: Simulations, calculators, interactive visualizations

The Seed has no guidance on:
1. When to embed/link multi-modal content vs. describe it in text
2. How to make multi-modal knowledge discoverable and searchable
3. Storage and organization of media files
4. Verification of multi-modal knowledge

## Why This Matters

Multi-modal knowledge is fundamentally different from text:

- **Cannot be searched** in the same way (OCR aside)
- **Requires different tools** to verify (watch a video vs. read a note)
- **Has different redundancy patterns** (same image vs. same idea expressed differently)
- **Embodied knowledge** often requires visual/audio demonstration

Without Seed rules, AI agents either ignore multi-modal content or treat it as decorative, missing the knowledge value.

## Proposed Seed Rules

### Rule: Identify knowledge types in frontmatter

For notes involving multi-modal content, add `knowledge-modality:` field:

```yaml
knowledge-modality: text-only|text+image|text+audio|text+video|interactive
media-files:
  - image: filename.jpg
    description: "What this image shows"
  - audio: recording.mp3
    description: "What this audio demonstrates"
```

**Test:** Can you categorize each note by its knowledge modality? Are media files properly documented?

### Rule: Prefer text descriptions for searchable knowledge; link media for verification

Knowledge that needs to be discovered via search should exist primarily in text. Media serves as verification or demonstration, not the primary carrier of knowledge.

**Test:** Can a user find this knowledge by searching text? Is the media supplementary (verification/demonstration) rather than essential (the knowledge only exists in the media)?

### Rule: Handle visual pattern recognition separately

Visual pattern recognition (identifying species, detecting defects, reading charts) requires exposure to multiple examples. Notes should link to media galleries or collections rather than describing in text alone.

**Test:** For visual recognition notes: Are there 5+ example images linked? Could someone learn the pattern from the linked examples?

### Rule: Track media dependencies

Knowledge that depends on specific media files should document:
- What media is required
- Where it's stored
- How to access it

**Test:** For knowledge requiring media: Can you identify all dependencies? Are they accessible (local files exist, URLs still work)?

### Rule: Assess modal essentiality before capturing knowledge

**Why:** In some domains, text alone cannot convey the knowledge. Attempting to capture "how dough should feel" in text alone guarantees failure. Assessing modal essentiality upfront prevents incomplete knowledge capture.

**Test:** For the knowledge you want to capture: (1) Can this be fully conveyed in text alone? (2) Would missing the visual/audio/kinesthetic element make the knowledge incomplete? (3) Can you name what text cannot capture?

**Modal essentiality levels:**
- `text-sufficient`: Text alone conveys the knowledge fully
- `text-primary-media-optional`: Text works but media significantly enhances understanding
- `media-essential`: Cannot be understood without the non-text modality
- `multi-modal-required`: Requires multiple modalities (e.g., video with audio)

**Implementation:**
```yaml
modal-essentiality: text-primary-media-optional
media-types-required: [image, audio]
media-purpose: "Conveys [X] that text cannot"
```

### Rule: Create dual-layer notes for media-essential knowledge

**Why:** Media files rot (links die, platforms shut down, formats become obsolete). A knowledge base that depends on external media becomes unreliable over time. Dual-layer notes ensure knowledge survives media loss while preserving enhancement value.

**Test:** For notes tagged media-essential: (1) Is there a text layer that conveys the core knowledge? (2) Does the media enhance but not replace text? (3) If all media links died, would the note still have value?

### Rule: Tag media with accessibility metadata

**Why:** Media is often inaccessible to some users (blind/visually impaired for images, deaf/hard-of-hearing for audio, those with slow connections for video). Accessibility metadata enables appropriate alternatives.

**Test:** For each media element: (1) Is there alt-text for images? (2) Are there captions/transcripts for audio/video? (3) Can users understand the content without requiring the media?

### Rule: Prefer portable, open formats for media capture

**Why:** Proprietary formats become obsolete; open formats survive. MIDI survives while QuickTime videos from 1990 may be unwatchable. Domain-appropriate open formats (SVG for diagrams, ABC notation for music, Markdown with embedded images) ensure longevity.

**Domain-specific preferences:**
- Diagrams: SVG > PNG > JPEG
- Music: ABC notation, MIDI > MP3
- Technical drawings: SVG > PDF > raster images
- Video: WebM > MP4 (for web-native)
- 3D: OBJ, GLTF > proprietary formats

### Rule: Separate media source from media summary

**Why:** Linking to external media (YouTube, Spotify, external servers) creates dependency on service availability. Media summary ensures knowledge survives link rot while source enables access when available.

### Rule: For temporal-spatial knowledge, capture both media AND text description of what to observe

**Why:** "Watch this video" without guidance on what to look for is passive consumption, not knowledge capture. Explicit observation prompts transform media into learning.

### Rule: Distinguish symbolic from experiential knowledge by modality

**Why:** Some knowledge exists in symbolic form (sheet music, notation, diagrams) while the same knowledge has an experiential form (how it sounds, how it feels to perform). Both exist in domains like music, dance, crafts. Treating experiential knowledge as symbolic leads to verification failures—the symbolic form might be correct but the execution wrong.

**Test:** (1) Can you distinguish between symbolic knowledge (the representation) and experiential knowledge (the execution/feeling)? (2) Do verification criteria match the knowledge type (symbolic: logically consistent? experiential: does it feel/sound right)? (3) Are both forms captured, or just one?

**Implementation:**
```yaml
knowledge-form: symbolic|experiential|hybrid
symbolic-representation: notation|diagram|chart|formula
experiential-elements: [sound, kinesthetic, emotional]
verification-mode: symbolic|experiential|both
```

### Rule: For experiential domains, require media capture of successful outcomes

**Why:** In domains like cooking, music, crafts, the gap between "knowing the theory" and "executing successfully" is large. Media of successful outcomes provides reference for self-assessment.

### Rule: Include scale/reference indicators in visual media

**Why:** Images without scale are misleading - "this mushroom looks like this" fails when the photo is close-up. Reference indicators enable accurate assessment.

### Rule: Apply modality-specific retrieval patterns

**Why:** Audio and kinesthetic knowledge have different natural query patterns than visual/text. Music requires sequential (time-based) navigation, movement requires spatial patterns. Applying visual-knowledge rules to audio/kinesthetic domains fails.

**Test:** For audio knowledge: (1) Does retrieval support sequential navigation (track order, timeline)? (2) Are timestamps available for key moments? (3) Is there sequential browsing for compositions? For kinesthetic knowledge: (1) Is video essential content, not just supplement? (2) Are spatial movement patterns documented? (3) Can text alone convey the knowledge, or is media required?

**Implementation for audio:**
```yaml
retrieval-pattern: sequential
audio-type: music|podcast|soundscape|oral|environmental
includes-timestamps: true
```

**Implementation for kinesthetic:**
```yaml
retrieval-pattern: spatial
media-essential: true
video-demonstration: true
```

### Rule: Apply accessibility requirements by modality

**Why:** Audio requires transcription, not alt-text (which is for images). Visual content requires alt-text. Different modalities have different accessibility solutions.

**Test:** (1) For audio: Is there transcript provided? (2) For video with audio: Are there captions? (3) For visual: Is alt-text provided? (4) Can users understand the content without requiring the specific modality?

## Domains Where This Matters Most

1. **Cooking/Food**: Visual doneness, texture, color
2. **Music/Audio**: Sound quality, technique execution  
3. **Medicine/Clinical**: Physical exam findings, imaging
4. **Art/Design**: Visual techniques, color theory
5. **Crafts/Trades**: Physical techniques, tool use
6. **Science/Engineering**: Diagrams, equipment, procedures
7. **Sports/Fitness**: Movement patterns, form

## Edge Cases

- **Diagrams vs. text**: Flowcharts and diagrams often convey structure better than text. Use embedded images when they genuinely improve understanding.
- **Audio learning**: Language learning, music education benefit from audio. Track audio files with transcript references.
- **Video tutorials**: Technical skills often better demonstrated than described. Link to videos; summarize key points in text for searchability.
- **Obsolete media**: Links to YouTube videos, hosted images can die. Track `media-valid-until:` for time-sensitive content.

## Related Seed Rules

- [[AI-Assisted Knowledge Management Seed#Separate core knowledge from supplementary media]]
- [[AI-Assisted Knowledge Management Seed#Use domain-appropriate formats for embedded media]]
- [[AI-Assisted Knowledge Management Seed#Rule (NEW - 2026-03-21): For embodied knowledge]]
- [[Frontier Gap - Embodied Knowledge]]
- [[Frontier Exploration - Molecular and Structural Knowledge Representation]] — Related for domains where structure determines function

---

*This note captures a frontier gap in the Seed for multi-modal knowledge representation. The rules above are proposals for Seed extension. Merged from redundant note "Frontier Exploration - Multi-Modal Knowledge Representation.md" on 2026-03-24.*
