---
last-reviewed: 2026-03-23
last-updated: 2026-03-23
confidence: high
lifecycle: seed-extension
author-type: ai-assisted
tags:
  - seed-gap
  - domain-analysis
  - stress-test-findings
schema-version: "1.0"
---

# Seed Gaps: Domain-Specific Knowledge Base Extensions

> Proposed Seed rules identified through stress testing various knowledge domains. These gaps are not yet incorporated into the core Seed but represent validated refinements.

This note consolidates domain-specific Seed gaps identified through systematic stress testing across multiple fields. Each domain revealed unique challenges requiring Seed extensions.

---

## Domain 1: Finance and Investment

### Gap 1.1: Financial Advisory Level Distinction

**Proposed Rule:** For finance/investment knowledge bases, add `financial-advisory-level:` frontmatter:
- `general-education`: Principles anyone can learn (e.g., "diversification reduces risk")
- `planning-guidance`: Frameworks for personal planning (e.g., "60/40 portfolio allocation")
- `personalized-advice`: Requires individual assessment (cannot be in KB)

**Why:** Finance advice ranges from universal principles to specific recommendations that require personalized assessment. Without explicit level tagging, readers cannot distinguish what's applicable universally vs. what needs professional advice.

**Test:** Can you categorize financial notes by advisory level? Do general-education notes include appropriate disclaimers?

### Gap 1.2: Investment Framework Tagging

**Proposed Rule:** For investment analysis notes, add `investment-framework:` frontmatter:
- `value-investing`, `growth-investing`, `momentum`, `index-passive`, `factor-investing`

**Why:** Investment advice that contradicts often stems from different frameworks, not conflicting facts. Tagging enables readers to understand which perspective informs the analysis.

### Gap 1.3: Analysis Expertise Level

**Proposed Rule:** For analysis-type knowledge in finance, add `expertise-level:` (`professional`, `educated-amateur`, `retail`)

**Why:** Analysis from professionals carries different weight than retail investors. Expertise tagging enables appropriate skepticism.

### Gap 1.4: Data Range and Source

**Proposed Rule:** For financial data claims, add `data-range:` and `data-source:` frontmatter.

**Why:** Financial data claims depend heavily on time period selection. Without explicit range, readers cannot verify or understand selection bias.

### Gap 1.5: Prediction Confidence

**Proposed Rule:** For forward-looking statements, add `prediction-confidence:` and `time-horizon:`.

**Why:** "This stock will rise" differs from "earnings may grow" but both are forward-looking. Confidence levels help readers assess certainty.

### Gap 1.6: Framework-Dependent Knowledge

**Proposed Rule:** For framework-dependent claims, add `framework-dependent: true` and list applicable frameworks.

**Why:** "Low P/E indicates undervalued" is true within value framework but not universally.

---

## Domain 2: Education and Pedagogy

### Gap 2.1: Dual-Audience Knowledge

**Proposed Rule:** Notes serving different audiences (self, students, peers) need `audience:` frontmatter.

**Why:** The same knowledge serves different purposes for different consumers. A note for students differs from one for peers.

### Gap 2.2: Curriculum Structure vs Emergent Structure

**Proposed Rule:** Education uses intentional curriculum structure — allow deviation from purely emergent graph structure.

**Why:** Education naturally follows curriculum sequences that may not emerge organically from the graph.

### Gap 2.3: Temporal Knowledge Cycles

**Proposed Rule:** Add `semester:`, `academic-year:`, `grade-level:` fields for education-specific temporal cycles.

**Why:** Education operates on temporal cycles (semesters, academic years) different from general temporal knowledge.

### Gap 2.4: Differentiation Variants

**Proposed Rule:** Same knowledge needs multiple presentations for different levels — use `base-concept:` linking.

**Why:** A concept taught to beginners differs from advanced students. Differentiation variants needed.

---

## Domain 3: Music Composition

### Gap 3.1: Musical Motif Tracking

**Proposed Rule:** Add `motif-transformations:` frontmatter for recurring melodic/rhythmic ideas across compositions.

**Why:** Musical composition involves developing motifs across works — tracking transformations is core to compositional knowledge.

### Gap 3.2: Harmonic Progression Representation

**Proposed Rule:** Add `harmonic-relationship:` typed relationships between chords.

**Why:** Chord relationships (dominant to tonic, modulation) are fundamental to composition knowledge.

### Gap 3.3: Temporal Structure Layers

**Proposed Rule:** Add `temporal-layer:` tags for multiple simultaneous layers (melody, harmony, rhythm).

**Why:** Music has parallel temporal structures that interact — single linear representation misses this.

### Gap 3.4: Tacit Aural Knowledge

**Proposed Rule:** Add `prerequisite-type: tacit` for skill dependencies that require ear training.

**Why:** Ear training is prerequisite tacit knowledge — can't be fully captured in notes.

### Gap 3.5: Canonical Compositional Forms

**Proposed Rule:** Create hub notes for canonical forms (Sonata Allegro, Rondo, Theme and Variations).

**Why:** These are fundamental structural templates in Western music composition.

### Gap 3.6: Emotional/Affective Dimensions

**Proposed Rule:** Add `affect:` tags for emotional quality (key characteristics, chord qualities).

**Why:** Music's emotional impact is central to composition but poorly captured in current schema.

---

## Domain 4: Tax Knowledge (Fiscal Year Organization)

### Gap 4.1: Tax Year Specificity

**Proposed Rule:** Knowledge organized by tax year rather than calendar year — add `fiscal-period:` frontmatter.

**Why:** Tax knowledge is inherently tied to fiscal periods, not calendar years.

### Gap 4.2: Multi-year Knowledge Classification

**Proposed Rule:** Add `provision-type:` (`permanent`, `temporary`, `scheduled`) for tax provisions.

**Why:** Tax provisions have different temporal characteristics — permanent differs from scheduled to expire.

### Gap 4.3: Jurisdiction Layering

**Proposed Rule:** Add `jurisdiction:` with federal/state/local/international layering.

**Why:** Tax knowledge applies at multiple jurisdiction levels that may conflict.

### Gap 4.4: Regulatory Source Hierarchy

**Proposed Rule:** Add `source-type:` for IRC, Treasury Regulations, Revenue Rulings, case law.

**Why:** Authority hierarchy matters in tax — regulation trumps ruling, ruling trumps practice.

---

## Domain 5: Sensory Evaluation (Wine, Coffee, Audio, Food)

### Gap 5.1: Sensory Evaluation Type

**Proposed Rule:** Add `evaluation-type: sensory` with `sensory-domain:` (coffee, wine, audio, food, textile).

**Why:** Sensory evaluation exists between objective and subjective — it's reference-dependent and uses specialized vocabularies.

### Gap 5.2: Separate Ratings from Descriptions

**Proposed Rule:** Separate `sensory-evaluation.rating` from `sensory-evaluation.description`.

**Why:** Ratings and descriptions serve different purposes with different reliability profiles.

### Gap 5.3: Sensory Evaluation Evolution

**Proposed Rule:** Add `sensory-evolution:` tracking how evaluations change over time.

**Why:** Palate develops, equipment changes — evaluations evolve and may contradict without context.

### Gap 5.4: Sensory Context Dependencies

**Proposed Rule:** Add `sensory-context.environment-factors:` for temperature, setting, food pairing.

**Why:** Sensory evaluation is highly context-dependent — coffee tastes different at altitude.

### Gap 5.5: Cross-Domain Sensory Vocabulary Mapping

**Proposed Rule:** Map ambiguous terms across domains (coffee "bright" ≠ audio "bright").

**Why:** Terms like "bright", "warm", "smooth" mean different things in different sensory domains.

---

## Domain 6: Language Learning

### Gap 6.1: Proficiency Level Tagging

**Proposed Rule:** Add `proficiency-target:` (A1-C2) and `skill-type:` (receptive, productive, interactive).

**Why:** Language learning knowledge applies differently at different proficiency levels.

### Gap 6.2: Temporal Cycle for Language Acquisition

**Proposed Rule:** Track progress over longer horizons (years, not weeks) — add `acquisition-phase:`.

**Why:** Language acquisition operates on different timelines than other knowledge domains.

### Gap 6.3: Mutually-Supporting Knowledge

**Proposed Rule:** For vocabulary/grammar, use `learning-support: bidirectional`.

**Why:** Language skills reinforce each other (vocabulary and grammar) — this needs explicit tagging.

### Gap 6.4: Immersion vs. Study Distinction

**Proposed Rule:** Add `learning-mode:` (immersion, study, hybrid) — different modes need different knowledge types.

**Why:** Learning from immersion produces different knowledge than study-based learning.

---

## Domain 7: Workshop Crafts (Equipment Tier)

### Gap 7.1: Equipment Tier Field

**Proposed Rule:** Add `equipment-tier:` (professional, home-workshop, hand-tools-only, minimal).

**Why:** Woodworking, metalworking, and crafts have explicit equipment tiers that dramatically affect technique applicability.

### Gap 7.2: Tier Adaptations

**Proposed Rule:** Document `tier-adaptations:` for techniques that work differently across equipment levels.

**Why:** A technique requiring a planer differs for hand-tool-only workshops.

### Gap 7.3: Safety Review for Historical Sources

**Proposed Rule:** For pre-1950 technique sources, add `safety-review-required: true` and `historical-source: true`.

**Why:** Historical sources lack power tool safety information that didn't exist then.

---

## Common Gap Patterns Across Domains

| Pattern | Domains Affected |
|---------|------------------|
| Domain-specific knowledge types | Finance, Music, Sensory |
| Audience differentiation | Education, Finance |
| Temporal structures | Tax, Education, Language |
| Verification timelines | Sensory, Crafts |
| Source hierarchies | Tax, Finance |
| Constraint systems | Finance, Education |
| Notation/format conventions | Music, Tax |

---

## Validation: Why These Gaps Are Real

Each gap was identified through:
1. Building a sample knowledge base using only current Seed rules
2. Documenting where AI agents got stuck
3. Proposing specific modifications with Rule/Why/Test format

The gaps are NOT:
- Already covered by existing Seed rules
- Too specific to be Seed-level guidance
- Hypothetical — they emerged from actual stress testing

---

## Relationship to Seed

These gaps are incorporated into the core Seed when validated across multiple domains. See [[Seed Gap Analysis Methodology]] for the methodology used.

---

## Related Notes

- [[Seed Gap Analysis Methodology]] — How these gaps were identified
- [[AI-Assisted Knowledge Management Seed]] — Core Seed being extended
- [[Seed Stress Test - Cooking Knowledge Base]]
- [[Seed Stress Test - Woodworking Knowledge Base]]
- [[Seed Stress Test - Music Composition Knowledge Bases]]
- [[Seed Stress Test - Finance and Investment Knowledge Base]]

---

*This note was created through a REDUNDANCY_SCAN heartbeat that identified 7 Seed Gap notes with identical structure as documented in Seed Gap Analysis Methodology. The notes were merged to eliminate redundancy while preserving all domain-specific content.*