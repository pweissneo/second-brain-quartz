---
last-reviewed: 2026-03-26
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
knowledge-type: structural
gap-status: identified
gap-priority: medium
gap-type: seed-missing
discovered: 2026-03-26
gap-source: frontier-exploration
tags:
  - seed-gap
  - multi-modal
  - knowledge-organization
  - cross-format
---

# Seed Gap - Multi-Modal Knowledge Organization

## The Gap

The Seed has basic rules for single-format notes (text, code) but lacks guidance for organizing knowledge when it exists in multiple modalities — text, images, audio, video, code, and interactive content. As knowledge bases incorporate more diverse content types, the Seed doesn't address the structural decisions unique to multi-modal knowledge.

## Why This Matters

- **Modality mismatch** — A single concept may be best explained in one format but represented in another. Without guidance, notes either balloon with mixed content or get fragmented across modality-specific notes.
- **Cross-modal linking** — How do you link from a text note to a video demonstration? From a code snippet to an audio explanation?
- **Verification complexity** — Text documentation may contradict video tutorial. The Seed's verification rules assume single-format sources.
- **Search and retrieval** — Text search won't find knowledge only in images or audio. Knowledge becomes "invisible" to standard queries.
- **Storage and maintenance** — Different modalities have different update cadences, storage costs, and obsolescence patterns.

## Gap Type

**Structural Knowledge Gap** — The Seed covers structural organization for text notes but lacks multi-modal structural rules.

## What the Seed Currently Covers

1. **Note atomicity** — Single-format guidance (keep procedures together)
2. **Linking** — Text-to-text wikilinks
3. **Verification** — Source-based verification
4. **Diminishing returns** — Single-format content assessment
5. **Multi-modal mention** — Edge case for images in notes, but not comprehensive

## What's Missing

### 1. Primary vs. Secondary Modality Decision

When knowledge exists in multiple formats, which is "primary" for search, verification, and navigation?

Current guidance: None. The Seed defaults to text as primary.

Missing guidance:
- When should video be primary (demonstration-heavy topics)?
- When should images be primary (visual identification)?
- When should code be primary (technical implementation)?
- How to handle equal-weight modalities (text + diagram both essential)?

### 2. Cross-Modal Linking Patterns

How should notes link across modalities?

Current guidance: Minimal (wikilinks work for filenames).

Missing patterns:
- Link to specific timestamp in audio/video
- Link to image regions (hotspots)
- Link to code sections (line numbers)
- Bidirectional links between modalities (text → video, video → text)

### 3. Modality-Specific Verification

How do you verify cross-modal consistency?

Current guidance: Single-source verification rules.

Missing:
- Text-to-video consistency checks
- Image-to-description alignment
- Code-to-tutorial synchronization
- When to treat modalities as independent vs. linked

### 4. Temporal Content Handling

Audio and video are temporal — they unfold over time. Text is static.

Current guidance: Limited (temporal knowledge rules).

Missing:
- When to prefer temporal formats (procedures that are hard to describe)
- How to structure video notes (chapters, timestamps, key moments)
- When temporal content should be summarized in static form

### 5. Modality Diminishing Returns

Does the diminishing returns test apply to video length, image count, audio duration?

Current guidance: None.

Missing:
- When is another image redundant vs. essential?
- How many video examples are too many?
- Duration thresholds for audio content

## Proposed Seed Rules

### Rule: Identify primary modality for each knowledge cluster

**Why:** Without explicit primary modality, search and navigation become inconsistent. Users don't know which format to check first. AI agents can't prioritize content appropriately.

**Test:** For knowledge clusters with multiple modalities: (1) Can you identify which modality is primary? (2) Does search return the primary modality first? (3) Is the primary modality documented in frontmatter?

**Implementation:**
```yaml
primary-modality: text|image|audio|video|code|interactive
secondary-modalities: [image, video]  # optional
modality-equal-weight: true  # when no clear primary
```

**Decision guidance:**
- Conceptual explanation → text primary
- Physical demonstration → video primary
- Technical implementation → code primary
- Visual identification → image primary
- Auditory interpretation → audio primary

### Rule: Create cross-modal links with specificity

**Why:** Generic wikilinks to media files lose context. "See the video" is less useful than "see timestamp 2:34 where the technique is demonstrated."

**Test:** For cross-modal links: (1) Do links specify relevant sections (timestamp, image region, code lines)? (2) Is there a summary in the link text? (3) Can users find the specific content without watching entire video?

**Implementation:**
```
[[video:demonstration.mp4#t=2:34]] - specific timestamp
[[image:technique-diagram.png#region=step-3]] - image region (if supported)
[[code:main.py#lines=45-67]] - code section
```

If platform doesn't support anchors: include in link text "video at 2:34 mark"

### Rule: Verify cross-modal consistency at verification time

**Why:** Text and video can drift out of sync. Without explicit cross-modal verification, contradictions accumulate silently.

**Test:** For multi-modal knowledge: (1) Do verification checks include cross-modal consistency? (2) Are contradictions flagged? (3) Is there a "modality-sync" status?

**Implementation:**
```yaml
verification-status: verified|cross-modal-verified|pending
cross-modal-consistent: true|false|partial
last-sync-check: 2026-03-26
```

**Verification approach:**
- For linked text-video: Watch key sections, confirm text accuracy
- For code-tutorial: Execute code, confirm it works as described
- For image-description: Verify image shows what description claims

### Rule: Provide static summaries for temporal content

**Why:** Video and audio require time to consume. Users may want to know if content is relevant before committing time. Search engines can't index audio content.

**Test:** For audio/video content: (1) Is there a static summary? (2) Does the summary include key timestamps? (3) Can users decide relevance without consuming full content?

**Implementation:**
- Required frontmatter for video/audio:
```yaml
duration-minutes: 12
summary: "3-paragraph summary of key points"
key-timestamps:
  - "0:00 - Introduction"
  - "2:34 - Core technique demonstration"
  - "9:45 - Common mistakes"
```

### Rule: Apply modality-aware diminishing returns

**Why:** The diminishing returns test needs modification for multi-modal content. A 10th image isn't equivalent to a 10th paragraph.

**Test:** For multi-modal content: (1) Does diminishing returns account for modality-specific thresholds? (2) Are redundant images flagged separately from redundant text? (3) Is utility measured differently for visual vs. textual content?

**Modified test:**
- **Images:** More than 5-7 per note is likely redundant unless they're distinct visual examples (different angles, stages, variations)
- **Video:** More than 2-3 demonstrations of same technique is likely redundant
- **Audio:** Multiple episodes on same topic → consider consolidation
- **Code:** Multiple implementation approaches → evaluate if all are needed

**Modality utility assessment:**
- Visual: Does this image show something text cannot? (diagrams, examples)
- Video: Does this demonstrate something text can't convey? (motion, timing, technique)
- Audio: Is spoken explanation essential? (tone, nuance, interview)
- Code: Is executable demonstration necessary?

## Related Seed Rules

- [[Atomic Note Principle]] — May need modification for multi-modal
- [[Diminishing Returns Testing]] — Extend for modalities
- [[Verification Workflow]] — Cross-modal verification
- [[Frontier Exploration - Multi-Modal Knowledge]] — Existing exploration note

## Test for Gap Closure

Can you:
1. Identify primary modality for each knowledge cluster?
2. Create specific cross-modal links with timestamps/regions?
3. Verify cross-modal consistency during verification?
4. Provide static summaries for temporal content?
5. Apply modality-aware diminishing returns?

If yes to all 5, the gap is closed.

## See Also

- [[Frontier Exploration - Multi-Modal Knowledge]]
- [[Seed Stress Test - Multi-Modal Knowledge in Technical Vaults]]
- [[Knowledge Access Pattern Optimization]] — Search across modalities