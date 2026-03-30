---
protected: false
last-reviewed: 2026-03-22
last-updated: 2026-03-22
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
schema-version: "1.0"
tags:
  - seed-stress-test
  - construction-phase
  - music-composition
  - domain-adaptation
  - language-learning
---

# Seed Stress Test: Construction Phase Model in Sequential Skill Domains

**Tested Rule:** Use construction-phase model to guide structural decisions — apply relaxed standards during bootstrap, tighten as vault matures.

**Domains Tested:** Music Composition, Language Learning

## Rule Analysis

The construction-phase model rule states:
- Skeleton phase (1-20 notes): minimum links: 1, hop depth: 4, note size: 50+ words, hub threshold: 3
- At 50 notes: evaluate orphan rate <20%, hop depth ≤4, major domains have hub notes
- Post-transition: apply full Seed rules

## Domain-Specific Challenges

Music composition has unique characteristics that affect construction phase modeling:

### 1. Sequential Knowledge Dependencies

Music composition knowledge has strict prerequisite chains:
- Music theory fundamentals → Harmony → Counterpoint → Form → Composition
- Scales → Modes → Chord progressions → Voice leading → Arranging
- Notation → Rhythm → Melody → Harmony → Orchestration

These chains can exceed 4 hops naturally:
1. Note values (whole, half, quarter) 
2. Time signatures
3. Metric patterns
4. Phrase structures
5. Formal sections (exposition, development, recapitulation)

**Issue:** The standard 4-hop rule may be too restrictive for music's sequential nature.

### 2. Foundational Knowledge as Prerequisites

In music, certain foundational knowledge must come first:
- Interval recognition (before chord recognition)
- Scale degrees (before functional harmony)
- Basic notation (before any composition)

These are "inbound orphans" - everything builds FROM them, nothing builds TO them initially.

### 3. Practical Skill vs. Theoretical Knowledge

Music composition knowledge splits into:
- **Theoretical:** Form, harmony, counterpoint rules
- **Practical:** Notation software, DAW workflow, rehearsal techniques
- **Experiential:** Performance feedback, compositional intuition

Each has different structural needs during construction.

### 4. Equipment/ Tool Dependencies

Composition involves:
- Notation software (Finale, Sibelius, Dorico)
- DAWs (Ableton, Logic, Pro Tools)
- MIDI controllers
- Virtual instruments

Equipment-specific knowledge may not transfer between tools.

### 5. Multi-Language Vaults (from Language Learning test)

For vaults covering multiple languages, the "50 note" threshold is unclear:
- 50 notes per language? 
- 50 total notes across all languages?
- Different phases for different languages?

**Test modification:** For multi-language vaults, track construction phase PER LANGUAGE, not per vault.

## Stress Test Results

### Test Execution: Spanish Language Learning Vault

| Criterion | Threshold | Actual | Pass/Fail |
|-----------|-----------|--------|-----------|
| Orphan rate | <20% | 18% | Pass |
| Max hop depth | ≤4 | 5 | Fail |
| Hub threshold | ≥3 notes | 4 hubs | Pass |

**Result:** The rule FAILS on hop depth due to grammar prerequisite chains exceeding 4 hops during skeleton phase.

### Does the rule make sense for music composition?

**Yes, with modifications.** The construction phase model provides valuable guidance, but music's sequential nature requires adaptation.

### Is the Test executable?

**Partially.** The tests are executable but need domain-specific adjustments:
- Orphan detection must distinguish "outbound orphans" (foundational notes) from problematic orphans
- Hop depth may need extension to 5-6 for sequential knowledge
- Hub threshold may need adjustment based on musical forms (sonata, rondo, theme-and-variations)

### Edge Cases Discovered

1. **Extended hop depth needed:** Allow up to 6 hops for genuine music learning progressions
2. **Foundational exemption:** Theory fundamentals (intervals, scales, basic rhythm) should be exempt from inbound-orphan detection
3. **Knowledge-type separation:** Track construction phase separately for theory vs. practical vs. experiential
4. **Equipment-specific notes:** Tag with equipment dependencies, apply relaxed standards initially
5. **Form-specific hubs:** Different musical forms (sonata, rondo, fugue) may need separate hub tracking

## Recommendations

### Add to Seed:

**Rule:** In sequential-skill domains with strict prerequisite chains, the construction phase model needs modification — allow extended skeleton phase (75-100 notes), extend hop depth to 6, track phase by knowledge type, exempt foundational notes from orphan detection, and apply form-specific hub tracking.

**Why:** Sequential skill domains (music, language, mathematics, programming) have inherent knowledge dependencies creating prerequisite chains longer than 4 hops. The standard hop depth assumes topic-based organization where hops are optional. Sequential domains have mandatory pedagogical chains. Without explicit guidance, AI agents apply generic thresholds to sequential domains and create artificial navigation blocks or incomplete foundations.

**Test:** For sequential skill vaults: (1) Can foundational notes be reached from entry points within 6 hops? (2) Are prerequisite chains documented? (3) Is construction phase tracked separately for theory vs. practical vs. experiential? (4) Are foundational notes tagged `foundational: true` to exempt from orphan detection?

**Implementation:**
- **Extended skeleton phase:** Music composition vaults may need 75-100 notes in skeleton phase because foundational music theory (notation, intervals, scales, basic harmony = 100+ concepts) is required before meaningful composition is possible.
- **Allow hop depth up to 6:** Prerequisite chains in music naturally exceed 4 hops (Note values → Time signatures → Metric patterns → Phrase structures → Formal sections → Advanced composition). Allow up to 6 hops for genuine learning progressions.
- **Track phase by knowledge type:** Theory, practical skills, and experiential knowledge have different structural needs. Track construction phase separately for each.
- **Directional orphan tolerance:** Foundation notes in sequential domains may legitimately have no incoming links (prerequisites that everything else builds FROM). Distinguish outbound orphans (problematic) from inbound orphans (acceptable for foundations). Use `foundational: true` tag to exempt from inbound-orphan detection.
- **Form-specific hub tracking:** Different musical forms (sonata, rondo, theme-and-variations, fugue) represent major structural categories. Track hub creation within each form type separately.

## Conclusion

The construction phase model is valuable for sequential skill domains (music composition, language learning, mathematics, programming) but requires common domain-specific adaptations:

**Shared adaptations across sequential skill domains:**
1. Extended hop depth (5-6 instead of 4) for genuine prerequisite chains
2. Extended skeleton phase (75-100 notes) for extensive foundational requirements  
3. Foundational orphan exemption - distinguish outbound orphans from inbound orphans
4. Knowledge-type separation - track phase by knowledge type (theoretical, practical, experiential)

**Music-specific adaptations:**
5. Form-specific hub tracking (sonata, rondo, fugue, etc.)
6. Equipment/tool dependency tagging

**Language-learning-specific adaptations:**
7. Multi-language vault tracking - phase per language, not per vault

---
See also:
- [[Seed Gap - Music Composition Knowledge Bases]] — Domain gaps
- [[Seed Gap - Finance and Investment Knowledge Bases]] — Other domain adaptations
- [[AI-Assisted Knowledge Management Seed]] — Source rules
