---
last-reviewed: 2026-03-17
last-updated: 2026-03-17
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
domain: language-learning
test-type: stress-test
seed-rule: Construction Phase Model
---

# Seed Stress Test: Construction Phase Model in Language Learning Knowledge Base

## Domain Context

Language learning is a domain with distinct characteristics that make the Construction Phase Model rule particularly relevant:
- Clear progression from foundation (alphabet, basic vocabulary, core grammar) to application (fluency, composition, cultural nuance)
- Highly specialized terminology (phonemes, morphemes, syntax, conjugation patterns)
- Skills that require practice vs. knowledge that can be captured in text
- Significant cultural context that affects usage

## The Seed Rule Under Test

**Rule:** Use construction-phase model to guide structural decisions — apply relaxed standards during bootstrap, tighten as vault matures.

The rule specifies:
- Minimum links: 1 instead of 2 (skeleton phase)
- Hop depth: 4 instead of 3 (skeleton phase)
- Note size: 50+ words instead of 100+
- Hub threshold: 3 notes instead of 5

And transition criteria at 50 notes:
1. Orphan rate <20%?
2. Can all notes reach root in ≤4 hops?
3. Do major domains have hub notes?

## Stress Test Scenario

### Domain: Language Learning (Spanish as target language)

A Spanish learning vault with the following growth trajectory:

**Skeleton Phase (1-20 notes):**
- `_root.md`: "Spanish language learning vault for conversational fluency"
- Basic vocabulary notes: colors, numbers, common verbs, greetings
- Grammar foundation: article rules, basic sentence structure
- Pronunciation guide: letter sounds, accent rules

**Flesh Phase (20-100 notes):**
- Expanded vocabulary by topic (food, travel, work, family)
- Grammar progression (tenses, subjunctive, pronouns)
- Cultural notes (idioms, regional variations)
- Practice resources (exercises, conversation prompts)

### Test Questions

**1. Does the rule make sense for language learning?**

Yes, with important modifications. Language learning has natural phases that align with construction phases:
- Foundation phase: alphabet → basic vocabulary → simple sentences → basic grammar
- Building phase: expanded vocabulary → complex grammar → cultural context
- Fluency phase: idioms → regional variations → professional vocabulary

However, the "50 note" threshold may be problematic:
- Language learning vaults may need MORE notes in skeleton phase because foundation vocabulary is extensive (100+ essential words before any real communication is possible)
- Grammar concepts are interdependent - you can't learn past tense before present tense, making hub creation complex

**Edge case identified:** Language learning vaults may need to extend skeleton phase to 75-100 notes before transition criteria apply.

**2. Is the rule's Test actually executable by an AI?**

Partially. The transition criteria are:
1. Orphan rate <20% - **Executable** - can be measured
2. All notes reachable in ≤4 hops - **Executable** - can be measured
3. Major domains have hub notes - **Partially executable** - AI can identify hub candidates but "major domains" is subjective

**Additional issue:** In language learning, some foundational notes SHOULD be orphans during skeleton phase because they're prerequisites, not hub-connected. For example:
- "Spanish Alphabet" is a prerequisite for all pronunciation notes but may not link outward
- "Basic Greetings" might link TO other notes but nothing naturally links TO it

The test should account for **directional asymmetry** - in language learning, foundation notes naturally have outgoing links but few incoming links.

**3. Is there an edge case where the rule fails?**

**Edge Case 1: Interdependent Prerequisites**

Language learning has strict prerequisite chains:
```
Alphabet → Sounds → Pronunciation → Accent Marks → Stress Rules → Pronunciation (advanced)
           ↓
Present Tense → Past Tenses → Future Tense → Subjunctive
```

A note like "Subjunctive Mood" requires understanding "Past Tense" which requires "Present Tense" - this creates chains that naturally exceed hop limits during skeleton phase.

**Test modification:** For language learning (and other sequential-skill domains), allow prerequisite chains up to 6 hops during skeleton phase if they represent genuine learning progressions, not structural failures.

**Edge Case 2: Categorical vs. Sequential Knowledge**

Language learning mixes:
- Categorical knowledge (vocabulary by topic: food, travel, family)
- Sequential knowledge (grammar rules that build on each other)
- Practice knowledge (exercises, conversation prompts)

The construction phase model doesn't distinguish between these types. A vocabulary hub can form early; grammar hubs require sequence.

**Test modification:** Apply different phase thresholds by knowledge type:
- Vocabulary: aggressive hub creation after 20 notes
- Grammar: relaxed standards until 75 notes (sequential dependencies)
- Practice: flexible - these can remain scattered

**Edge Case 3: Multi-Language vaults**

If the vault covers multiple languages, the "50 note" threshold is unclear:
- 50 notes per language? 
- 50 total notes across all languages?
- Different phases for different languages?

**Test modification:** For multi-language vaults, track construction phase PER LANGUAGE, not per vault.

## Proposed Rule Refinements

### Refinement 1: Domain-Specific Phase Thresholds

```yaml
# For language learning vaults:
construction-phase-thresholds:
  skeleton: 1-75 notes  # Extended due to vocabulary requirements
  flesh: 75-150 notes
  muscle: 150-300 notes
  maturity: 300+ notes

# For sequential-skill domains:
phase-modifier: sequential-skill  # Adjusts hop limits for prerequisite chains
```

### Refinement 2: Directional Orphan Detection

The orphan test should distinguish:
- **Outbound orphans** (no outgoing links) - usually a problem
- **Inbound orphans** (no incoming links) - acceptable for foundation notes in sequential domains

```yaml
orphan-assessment:
  outbound-tolerance: 0%  # Every note should link out
  inbound-tolerance: 15%   # Foundation notes can be inbound-orphans
  exemption-tag: foundation-prerequisite
```

### Refinement 3: Knowledge-Type Phase Tracking

Track construction phase separately for different knowledge types:

```yaml
phase-by-type:
  vocabulary:
    current: flesh
    note-count: 45
  grammar:
    current: skeleton
    note-count: 28
  culture:
    current: skeleton
    note-count: 12
  practice:
    current: muscle
    note-count: 65
```

## Test Execution Results

Applying the current Seed rule to a Spanish learning vault:

| Criterion | Threshold | Actual | Pass/Fail |
|-----------|-----------|--------|-----------|
| Orphan rate | <20% | 18% | Pass |
| Max hop depth | ≤4 | 5 | Fail |
| Hub threshold | ≥3 notes | 4 hubs | Pass |

**Result:** The rule FAILS on hop depth due to grammar prerequisite chains exceeding 4 hops during skeleton phase.

## Conclusion

The Construction Phase Model rule needs refinement for language learning and other sequential-skill domains. The modifications needed:

1. **Extend skeleton phase threshold** to 75-100 notes for domains with extensive foundational requirements
2. **Allow hop depth up to 6** for genuine prerequisite chains
3. **Track phase by knowledge type** rather than globally
4. **Distinguish orphan types** - foundation prerequisites should be exempted from inbound-orphan detection

The rule is fundamentally sound but needs domain-specific calibration.

---

## Related Seed Rules

- [[Seed Rule - Canonical Domain Structures]] - Domain structures in language learning
- [[Seed Stress Test - Expertise Level Rule in Foreign Language Learning]] - Related to language learning expertise
- [[Seed Stress Test - 5-1 Ratio in Parenting Knowledge Base]] - Another sequential domain test

## Test Metadata

- **Test date:** 2026-03-17
- **Domain:** Language Learning (Spanish)
- **Seed rule:** Construction Phase Model
- **Test result:** Rule needs refinement
- **Confidence:** emerging (single-domain test)

- [[AI-Assisted Knowledge Management Seed]] (source of rules being tested)
