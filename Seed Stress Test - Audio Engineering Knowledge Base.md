---
last-reviewed: 2026-03-18
lifecycle: active
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
tags:
  - seed-stress-test
  - audio-engineering
  - domain-specific
  - equipment-chain
---

# Seed Stress Test: Audio Engineering Knowledge Base

Testing Seed rules in the domain of audio engineering (recording, mixing, mastering) to identify gaps and refine rules.

## Domain Overview

Audio engineering knowledge has unique characteristics:
- **Signal chain organization**: Knowledge naturally flows from source → capture → processing → output
- **Equipment interdependence**: Audio problems often stem from interaction between components, not single devices
- **Software version dependencies**: Plugin behavior changes between versions; DAW versions introduce/migrate features
- **Domain-specific terminology**: Terms like "gain staging," "headroom," "phase" have specific meanings that differ from general usage
- **Sensory verification**: "Does it sound good?" requires listening, not just reading

---

## 1. Equipment Chain Knowledge

**Seed Rule:** For knowledge that lives in the gaps between tools, version combinations matter.

**Audio Engineering Application:**

### Edge Case: Signal Chain Dependencies

**Problem:** "Use EQ before compression" is common advice, but the optimal order depends on:
- The specific EQ and compressor
- The source material
- The goal (transparency vs. effect)

**Test:** Does technique advice document the specific equipment context it applies to?

**Edge Case:** Different plugins behave differently. A technique that works in one plugin may not transfer.

**Solution:** Add `plugin-context:` field for techniques that depend on specific plugins, and `plugin-equivalent:` to link alternatives across different manufacturers.

### Edge Case: Hardware vs. Software Differences

**Problem:** "Use a high-pass filter" differs significantly between hardware (analog EQs have specific characteristics) and software (linear phase option, different filter designs).

**Solution:** For equipment-dependent knowledge, add `equipment-type: analog|digital|hybrid` to clarify which context the knowledge applies to.

---

## 2. Completion Criteria in Audio Engineering

**Seed Rule:** Define explicit completion criteria for each knowledge domain — state what "done" looks like before collecting.

**Audio Engineering Application:**

### Edge Case: What Does "Done" Look Like?

**Problem:** Audio engineering has no natural completion point:
- Infinite plugin possibilities
- New techniques constantly emerging
- Equipment choices are vast

**Analysis:** What IS a reasonable completion target?

| Coverage Level | Description | Notes |
|----------------|-------------|-------|
| Core | Understanding signal flow, basic processing | ~30 notes |
| Intermediate | Common techniques, common equipment | ~75 notes |
| Advanced | Specialized processing, workflow optimization | ~150 notes |
| Mastery | Deep expertise, edge cases, niche equipment | 200+ notes |

**Test:** Can you state what completion looks like at each level?

### Edge Case: Domain Taxonomy is Equipment-Based

**Problem:** Audio engineering taxonomy is built on equipment categories:
- Input → Microphones → Preamps → Processing → Output
- Each category has sub-categories

**Analysis:** Unlike cooking (cuisine-based) or biology (biological taxonomy), audio engineering taxonomy is essentially the signal chain.

**Test:** Does the vault reflect this natural structure? Are there hub notes for each major processing category (EQ, compression, reverb, etc.)?

---

## 3. The Signal Chain Gap

**Seed Gap Identified:**

The Seed doesn't explicitly handle **knowledge organized around a sequential processing chain** where each stage transforms the output of the previous.

**Problem:** Audio knowledge naturally follows signal flow:
1. Source/Input (microphones, instruments)
2. Capture (preamps, converters)
3. Correction (EQ, noise reduction)
4. Enhancement (compression, saturation)
5. Space (reverb, delay)
6. Output (mastering, delivery)

Each stage's knowledge is interdependent with adjacent stages, but the Seed treats notes as atomic units without explicit chain tracking.

**Proposed Rule:**

> **Rule:** For knowledge domains organized around sequential processing chains (audio signal chains, manufacturing processes, development pipelines), add `chain-position:` frontmatter to indicate where in the chain the knowledge applies.
> 
> **Why:** Knowledge at different chain positions has different characteristics - early stages affect everything downstream, while late stages only affect final output. Chain position enables filtering by processing stage and understanding dependencies.
> 
> **Test:** Can you filter notes by their position in the processing chain? Do adjacent-chain notes link to each other?

**Implementation:**
```yaml
chain-position: input|capture|correction|enhancement|space|output
chain-stage-number: 1-6  # position in sequence
adjacent-stages: ["stage-before", "stage-after"]  # optional explicit links
```

**Example:** A note about "gain staging" applies at the capture stage (position 2) and affects everything downstream. A note about "master buss processing" applies at the output stage (position 6) and only affects final delivery.

---

## 4. Version-Specific Knowledge

**Seed Rule:** Track knowledge validity periods.

**Audio Engineering Application:**

### Edge Case: Plugin Version Dependencies

**Problem:** "Use FabFilter Pro-Q 3 for linear phase EQ" - this knowledge is version-specific. Pro-Q 2 had different features.

**Test:** Do plugin-specific notes include version scope? Is there a `version:` field?

### Edge Case: DAW Migration Knowledge

**Problem:** Moving from Pro Tools to Logic Pro requires learning new workflows, shortcuts, and terminology.

**Analysis:** This is migration knowledge - knowledge about transitioning between tools, not about the tools themselves.

**Solution:** For migration knowledge, add `migration-from:` and `migration-to:` fields to track transition paths.

### Edge Case: Legacy Equipment Knowledge

**Problem:** Vintage gear (Neve 1073, SSL 4000) has specific characteristics that newer gear may not replicate.

**Test:** Is vintage equipment explicitly tagged as such? Is there a `vintage-era:` field for equipment notes?

---

## 5. Sensory Verification in Audio

**Seed Rule:** For experiential domains, include verification-status field.

**Audio Engineering Application:**

### Edge Case: "Does It Sound Good?"

**Problem:** Audio engineering knowledge often can't be verified by reading - you must listen.

**Solution:** Add `verification-method: listening|measurement|both` for audio-specific notes.

### Edge Case: Monitoring Environment Dependencies

**Problem:** "The mix sounds good" depends on the monitoring system (speakers, room acoustics, headphones).

**Solution:** Add `monitoring-context:` field (studio-monitor|headphones|car|earbuds) since the same audio can sound different in different contexts.

---

## 6. Terminology Conflicts

**Seed Rule:** Terminology must be consistent across the vault.

**Audio Engineering Application:**

### Edge Case: Conflicting Terminology

**Problem:** Audio has terms that mean different things in different contexts:
- "Headroom": analog (voltage before clipping) vs. digital (dB below 0)
- "Gain": volume increase vs. input sensitivity
- "Warmth": subjective, no standard definition

**Solution:** For domain-specific terminology that varies by context, create definition notes that explicitly document the different meanings.

---

## Summary

| Seed Rule | Edge Case | Solution |
|-----------|-----------|----------|
| Equipment dependencies | Signal chain interdependence | Add `chain-position:` for sequential processing domains |
| Completion criteria | No natural stopping point | Define coverage levels (core/intermediate/advanced/mastery) |
| Version tracking | Plugin version dependencies | Add `plugin-context:` and `version:` fields |
| Experiential verification | "Does it sound good?" | Add `verification-method:` and `monitoring-context:` |
| Terminology consistency | Context-dependent terms | Document conflicting definitions explicitly |

---

## Proposed Seed Addition

> **Rule:** For knowledge domains organized around sequential processing chains, use `chain-position:` frontmatter to indicate where in the chain the knowledge applies.
> 
> **Why:** Sequential chain domains (audio, manufacturing, development) have knowledge that depends on processing stage. Chain position enables filtering and understanding downstream impacts.
> 
> **Test:** Can you filter notes by chain position? Do cross-chain notes document their dependencies?

---

## Related

- [[AI-Assisted Knowledge Management Seed]]
- [[Seed Gap - Music Composition Knowledge Bases]]
- [[Frontier Exploration - Podcasting and Audio Content Knowledge Bases]]
- [[Seed Stress Test - Cooking Knowledge Base]]
- [[Seed Stress Test - Automotive Repair Knowledge Base]]