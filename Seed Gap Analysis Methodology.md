---
last-reviewed: 2026-03-22
lifecycle: evergreen
confidence: high
author-type: ai-assisted
verification-status: verified
tags:
  - seed-gap
  - methodology
  - domain-analysis
schema-version: "1.0"
---

# Seed Gap Analysis Methodology

> A framework for identifying what the Seed is missing when applying it to specific domains through stress testing.

## Why This Note Exists

The Seed is a general-purpose framework for AI-assisted knowledge management. However, it was designed to be domain-agnostic, which means domain-specific gaps emerge when applying it to particular fields. This note documents the methodology for identifying and documenting these gaps.

## The Pattern

All Seed Gap notes follow this structure:

1. **The Gap** — What the Seed doesn't cover for this domain
2. **Where AI Gets Stuck** — Concrete problems an AI would face when building a KB from scratch
3. **What the Seed Is Missing** — Specific rules or modifications needed
4. **Proposed Seed Extension** — Concrete rule proposals with Rule/Why/Test format

## Domain-Specific Findings

### Finance and Investment Knowledge Bases

**Key Gaps Identified:**

1. **Financial Advisory Level Distinction** — Need `financial-advisory-level:` frontmatter:
   - `general-education`: Universal principles
   - `planning-guidance`: Frameworks with constraints
   - `personalized-advice`: Requires individual assessment

2. **Investment Framework Tagging** — Need `investment-framework:` (value, growth, momentum, index-passive, factor-investing)

3. **Analysis Expertise Level** — Need `expertise-level:` (professional, educated-amateur, retail)

4. **Data Range and Source** — Need `data-range:` and `data-source:` for historical financial data

5. **Prediction Confidence** — Need `prediction-confidence:` and `time-horizon:` for forward-looking statements

6. **Framework-Dependent Knowledge** — Claims true in one framework but not others

**See:** [[Seed Gap - Finance and Investment Knowledge Bases]]

### Education and Pedagogy Knowledge Bases

**Key Gaps Identified:**

1. **Dual-Audience Knowledge** — Notes serve different audiences (self, students, peers)
2. **Curriculum Structure vs Emergent Structure** — Education uses intentional curriculum structure
3. **Temporal Knowledge Cycles** — Semester, academic year, grade-level progressions
4. **Assessment Integration** — How assessments fit into the knowledge graph
5. **Differentiation Variants** — Same knowledge needs multiple presentations

**Proposed Rules:**
- `audience:` frontmatter
- Curriculum-first organization
- Verification windows by evidence type
- Differentiation variants with `base-concept:` linking

**See:** [[Seed Gap - Education and Pedagogy Knowledge Bases]]

### Music Composition Knowledge Bases

**Key Gaps Identified:**

1. **Musical Motif Tracking** — Recurring melodic/rhythmic ideas across compositions
2. **Harmonic Progression Representation** — Typed relationships between chords
3. **Temporal Structure Layers** — Multiple simultaneous layers (melody, harmony, rhythm)
4. **Experiential "Feel" Documentation** — Subjective quality tags
5. **Tacit Aural Knowledge** — Ear training as prerequisite tacit skill
6. **Canonical Compositional Forms** — Sonata Allegro, Rondo, etc.
7. **Emotional/Affective Dimensions** — Key characteristics, chord qualities
8. **Notation System Expectations** — Chord symbols, standard notation, lead sheets

**Proposed Rules:**
- Motif transformation metadata
- `temporal-layer:` tags
- `affect:` tags for emotional quality
- `prerequisite-type: tacit` for skill dependencies
- Canonical structure hub notes

**See:** [[Seed Gap - Music Composition Knowledge Bases]]

### Fiscal Year Organization in Tax Knowledge Bases

**Key Gaps Identified:**

1. **Tax Year Specificity** — Knowledge organized by tax year rather than calendar year
2. **Multi-year Knowledge** — Permanent, temporary, and scheduled provisions
3. **Jurisdiction Layering** — Federal, state, local, international
4. **Regulatory Source Hierarchy** — IRC, Treasury Regulations, Revenue Rulings
5. **Practitioner Knowledge** — Client-specific, software-specific, practice-area-specific

**Proposed Rule:**
```yaml
fiscal-period:
  period-type: tax-year | fiscal-year | quarter
  period-start: YYYY-MM-DD
  period-end: YYYY-MM-DD
  jurisdiction: US-Federal | US-State-CA | etc.
  provision-type: permanent | temporary | scheduled
```

**See:** [[Seed Gap - Fiscal Year Organization in Tax Knowledge Bases]]

## Cross-Domain Patterns

### Common Gap Categories

When analyzing domains, these categories frequently reveal gaps:

1. **Domain-Specific Knowledge Types** — New types of knowledge unique to the domain
2. **Audience Differentiation** — Knowledge serves different consumers
3. **Temporal Structures** — Domain-specific time cycles
4. **Verification Timelines** — Domain-specific evidence collection windows
5. **Source Hierarchies** — Domain-specific authority structures
6. **Constraint Systems** — Domain-specific parameters that affect applicability
7. **Notation/Format Conventions** — Domain-specific representation systems

### Generic to Domain-Specific Transitions

Many Seed rules need domain-specific adaptation:

| Generic Seed Rule | Domain-Specific Adaptation |
|-----------------|----------------------------|
| Confidence markers | Prediction confidence + time horizon (finance) |
| Expertise level | Advisory level (finance), audience (education) |
| Temporal knowledge | Fiscal periods (tax), curriculum cycles (education) |
| Knowledge types | Musical motifs, affective dimensions (music) |
| Source types | Regulatory hierarchy (tax), notation systems (music) |

## Methodology for Identifying New Gaps

When stress-testing the Seed for a new domain:

1. **Apply existing Seed rules** — Build a sample knowledge base
2. **Note where AI gets stuck** — Document friction points
3. **Identify domain-specific patterns** — What's unique to this domain?
4. **Check cross-domain categories** — Use the list above
5. **Propose Seed modifications** — Rule/Why/Test format
6. **Verify proposals** — Test against multiple examples

## Test for Gap Identification

1. Pick a domain (one not yet analyzed)
2. Imagine building a knowledge base from scratch using only the Seed
3. Document where the AI would lack guidance
4. Check if any existing Seed Gap note covers this domain
5. If not, create a new Seed Gap note following the pattern

## Related Notes

- [[AI-Assisted Knowledge Management Seed]]
- [[Seed Stress Test - 5-1 Ratio Across Domains]]
- [[Seed Stress Test - Cooking Knowledge Base]]
- [[Frontier Exploration - Domain-Specific Knowledge Bases]]
- [[Exportable Rules]]

---

**These notes exist in parallel:**
- Seed Gaps - Domain-Specific Extensions.md (merged from 7 domain-specific gap notes)
- Seed Gap - Safety Review for Historical Sources.md (preserved - addresses different gap type)
- Seed Gap - Sensory Evaluation Knowledge.md (preserved - detailed sensory evaluation rules)

**Rationale:** Seven Seed Gap notes with identical structure were merged into Seed Gaps - Domain-Specific Extensions.md. Two gap notes were preserved: Safety Review addresses a specific safety-related gap type distinct from domain analysis, and Sensory Evaluation provides more detailed rules that warranted separate retention.
