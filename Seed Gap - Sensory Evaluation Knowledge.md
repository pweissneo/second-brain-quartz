---
last-reviewed: 2026-03-22
last-updated: 2026-03-22
confidence: emerging
lifecycle: seed-extension
author-type: ai-assisted
tags: [seed-gap, sensory, evaluation, subjective-knowledge]
---

# Seed Gap: Sensory Evaluation Knowledge

> This note proposes new Seed rules for handling sensory evaluation knowledge — knowledge that depends on taste, smell, sight, sound, and touch to assess quality, characteristics, or value.

## The Challenge

Sensory evaluation knowledge exists in a unique space between objective and subjective knowledge:

- **Objective elements**: Chemical compounds in coffee, acoustic properties of speakers, material properties of fabrics
- **Subjective experience**: How something tastes to YOU, what YOU hear, how something FEELS

The Seed has rules for:
- Experiential knowledge (requires practice to verify)
- Embodied knowledge (requires physical sensation)
- Subjective domains (value is context-dependent)

But sensory evaluation has distinct characteristics:
1. **Reference-dependent**: "This coffee is bright" means nothing without reference to what "bright" tastes like
2. **Descriptive vocabulary is specialized**: Wine has "terroir", audio has "soundstage", coffee has "acidity"
3. **Quality exists on continua**: Not discrete categories
4. **Comparison is essential**: Single evaluations are nearly meaningless

## Domain Examples

### Wine Tasting
- Primary flavors, secondary aromas, tertiary notes
- Tannin structure, acidity, body
- Regional "typicality" (what Burgundy should taste like vs. what California tastes like)
- Vintage variation

### Coffee Cupping
- Acidity (bright vs. dull)
- Sweetness, body, aftertaste
- Flavor notes (fruity, floral, nutty, chocolate)
- Process methods affecting taste (washed, natural, honey)

### Audio Equipment
- Soundstage width/depth
- Treble extension, bass response
- Imaging and separation
- Tone signature (warm, neutral, bright)

### Food & Cooking
- Flavor balance (sweet, sour, salty, bitter, umami)
- Texture (mouthfeel)
- Aroma development
- Doneness indicators

### Materials & Textiles
- Hand (how fabric feels)
- Drape
- Visual properties (sheen, color depth)

## Proposed Rules

### Rule: Add Sensory Evaluation Type

**Rule:** For notes containing sensory evaluations (taste, smell, audio, visual, tactile), add `evaluation-type: sensory` frontmatter with supporting fields for reference-dependency, rating separation, and context.

**Why:** Sensory evaluation knowledge exists in a unique space between objective and subjective. It's reference-dependent (meaningless without benchmarks), uses specialized vocabularies that vary by domain, and includes both qualitative descriptions and quantitative ratings that serve different purposes. Without explicit handling, sensory notes become uninterpretable by AI agents and future readers.

**Test:** Pick 5 notes containing sensory evaluations (coffee tasting, wine reviews, audio equipment impressions, food descriptions). Does each have: (1) `evaluation-type: sensory`? (2) Reference or comparison basis documented? (3) Rating separated from description? (4) Environmental/context factors noted?

**Implementation:**
```yaml
evaluation-type: sensory
sensory-domain: coffee|wine|audio|food|textile|other
reference-benchmark: "What 'normal' or 'baseline' means"
comparison-basis: single-prior|multi-prior|standard|personal-baseline
sensory-evaluation:
  description: "Qualitative sensory description"
  rating:
    scale: "e.g., 100-point, 5-star"
    score: 92
    source: personal|critic|community
  context:
    - factor: "temperature"
      impact: "How this affected evaluation"
evaluation-setting: controlled|realistic|formal|casual
```

### Rule: Separate Sensory Ratings from Descriptions

**Why:** Sensory ratings (90-point scale, 5-star) and qualitative descriptions serve different purposes and have different reliability profiles. Ratings are comparative and scale-dependent; descriptions are more nuanced but subjective. AI agents need to know whether to trust the number, the words, or both.

**Test:** For sensory notes with ratings: (1) Is there both a rating AND a description? (2) Does frontmatter separate them? (3) Is rating source documented (personal, critic, community)?

**Implementation:** Use nested `sensory-evaluation` field with separate `description` and `rating` sub-fields.

### Rule: Track Sensory Evaluation Evolution

**Why:** Sensory evaluation changes over time as palate develops, equipment changes, or reference points shift. A coffee you rated "fruity" 3 years ago might rate differently now. Without evolution tracking, the vault contains contradictory evaluations with no way to understand why.

**Test:** For sensory notes evaluated more than once: (1) Is there an evolution log? (2) Does it note what changed (palate, equipment, reference)? (3) Is re-evaluation interval documented?

**Implementation:**
```yaml
sensory-evolution:
  evaluations:
    - date: 2023-01-15
      description: "Bright, fruity, complex"
      score: 88
    - date: 2026-03-22
      description: "Balanced, chocolate notes emerged"
      score: 91
  change-reason: palate-development|equipment-change|reference-shift
```

### Rule: Document Sensory Context Dependencies

**Why:** Sensory evaluation is highly context-dependent. Coffee tastes different at altitude, audio sounds different in treated rooms, wine tastes different with food. Without context documentation, evaluations are not reproducible or comparable.

**Test:** For sensory notes: (1) Are key environmental factors documented (temperature, setting, companions)? (2) Does the note acknowledge how context affects the evaluation? (3) Can a reader understand what conditions the evaluation applies to?

**Implementation:**
```yaml
sensory-context:
  environment-factors:
    - factor: "temperature"
      value: "68°F"
      impact: "Above 75°F, fruit notes diminish"
    - factor: "food-pairing"
      value: "fasting"
      impact: "Palate more sensitive"
  evaluation-setting: formal|casual|comparative-blind
```

### Rule: Map Sensory Vocabulary Across Domains

**Why:** Terms like "bright", "warm", "smooth", "bold" mean different things in different sensory domains. Coffee "brightness" is acidity; audio "brightness" is treble presence; wine "brightness" is vibrant fruit. Without mapping, AI agents cannot interpret cross-domain sensory notes correctly.

**Test:** Pick sensory notes using ambiguous terms. Does the vault have a terminology mapping note or frontmatter that clarifies what the term means in this specific domain?

**Implementation:** Create domain-specific vocabulary notes or include mapping in frontmatter:
```yaml
sensory-vocabulary:
  bright:
    coffee: "lively acidity, not sour"
    audio: "treble presence, not harsh"
    wine: "vibrant acidity"
```

## Edge Cases

### Edge Case: Cross-Domain Sensory Notes

Some evaluations span multiple senses (food and wine pairing involves taste + smell + mouthfeel). Use multiple `sensory-domain` values:
```yaml
sensory-domain: [food, wine]
```

### Edge Case: Consensus vs. Personal Evaluation

When personal evaluation differs from critic/community consensus, document both:
```yaml
rating:
  personal: 88
  critic-average: 92
  consensus-note: "I rate consistently lower than critics"
```

### Edge Case: Developing Palate

For beginners, include calibration guidance:
```yaml
calibration-guidance:
  - "Start with reference samples"
  - "Compare side-by-side"
  - "Track over time"
  expected-development: "Palate typically develops over 6-12 months"
```

## Interaction with Existing Seed Rules

- **Atomicity**: Sensory evaluation notes may legitimately exceed 300 words because the evaluation IS the atomic unit
- **Verification**: Sensory verification means calibration against reference + consistency over time, not source-checking
- **5:1 Ratio**: During sensory skill development, allow higher general vocabulary (3:1) for learning domain terminology before personal evaluations dominate
- **Confidence**: Sensory confidence should reflect calibration status, not source quality

## Test Scenarios

### Test 1: Coffee Cupping Note

Input: A coffee cupping note with flavor descriptors, acidity rating, body assessment
Expected: Frontmatter with `evaluation-type: sensory`, `sensory-domain: coffee`, separated description and rating, context factors (brew method, water, temperature)

### Test 2: Audio Equipment Review

Input: Headphone review with sound signature description, comparison to prior headphones
Expected: `evaluation-type: sensory`, `sensory-domain: audio`, evolution tracking if previously reviewed, objective specs separated from subjective sound

### Test 3: Wine Tasting Note

Input: Wine note with region, vintage, tasting notes, score
Expected: `evaluation-type: sensory`, `sensory-domain: wine`, regional typicality noted, vintage variation acknowledged, personal vs. critic score calibration

---

*This Seed Gap was identified during a vault heartbeat using FRONTIER_EXPLORATION on sensory evaluation knowledge domains (wine, coffee, audio, food, textiles).*

## Related Notes

### Seed Foundation
- [[AI-Assisted Knowledge Management Seed]] — The core Seed this gap proposes extensions to
- [[Seed Gap - Finance and Investment Knowledge Bases]] — Other Seed gaps for comparison
- [[Seed Gap - Finance and Investment Knowledge Bases]] — Finance-related gaps (personal finance gap now incorporated into Seed)

### Frontier Explorations
- [[Frontier Exploration - Sensory Knowledge Capture]] — General exploration of sensory knowledge capture challenges
- [[Frontier Exploration - Expertise-Level Dependent Knowledge]] — How expertise affects evaluation
- [[Frontier Exploration - Multi-Perspective Knowledge]] — Multiple viewpoints on subjective topics
- [[Frontier Gap - Embodied Knowledge]] — Physical sensation knowledge

### Seed Stress Tests
- [[Seed Stress Test - Embodied Knowledge Rule]] — Stress testing embodied knowledge handling

### Structural
- [[Graph Maintenance]] — For maintaining note connectivity
