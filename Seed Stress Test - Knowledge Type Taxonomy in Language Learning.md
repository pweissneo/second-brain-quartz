---
last-reviewed: 2026-04-03
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
verification-mode: source
verification-status: verified
access-pattern: learning
tags:
  - seed-stress-test
  - knowledge-type-taxonomy
  - language-learning
gap-status: identified
gap-source: stress-test
---

# Seed Stress Test: Knowledge Type Taxonomy in Language Learning

> Testing the Knowledge Type Taxonomy rule in the language learning domain.
> Date: 2026-04-03

## Rule Under Test

**Rule (NEW - 2026-04-03):** Define and apply a Knowledge Type Taxonomy — classify every note by its primary knowledge type and apply type-specific storage, retrieval, and verification rules.

**Test:** (1) Can you classify each note by knowledge type (procedural/conceptual/factual/experiential/relational/meta)? (2) Does each type follow type-specific organization? (3) Can you answer "what knowledge type answers this question?" for 5 common queries? (4) Are retrieval paths optimized for the knowledge type's natural query pattern?

---

## Language Learning Domain Analysis

### Unique Knowledge Types in Language Learning

Language learning has distinct knowledge types that map imperfectly to the base taxonomy:

| Base Type | Language Learning Example | Issue |
|-----------|--------------------------|-------|
| Procedural | How to conjugate a verb | Grammar rules ARE procedural but have exceptions |
| Conceptual | Why subjunctive mood exists | Heavy conceptual but context-dependent |
| Factual | Word definition | Too simplistic — words have multiple meanings |
| Experiential | How it feels to produce a sound | Embodied knowledge critical but hard to capture |
| Relational | Synonyms, antonyms, cognates | Many-to-many relationships |
| Meta | How to learn vocabulary | Meta-knowledge is central |

### Domain-Specific Extensions Needed

The base taxonomy needs language learning extensions:

```yaml
# Extended knowledge types for language learning
knowledge-type: vocabulary-receptive    # recognize word
knowledge-type: vocabulary-productive   # use word in speech/writing
knowledge-type: grammar-declarative     # know the rule
knowledge-type: grammar-procedural      # apply the rule automatically
knowledge-type: pronunciation-articulatory  # physical speech mechanics
knowledge-type: pronunciation-auditory  # understanding sounds
knowledge-type: cultural-contextual     # social norms
knowledge-type: cultural-linguistic     # idioms, register
```

---

## Stress Test Questions

### 1. Does the test's query type recognition work for language learning?

**Query Pattern Mapping:**

```yaml
query-patterns:
  "how do I conjugate X":        procedural → grammar-procedural
  "what does X mean":            factual → vocabulary-receptive
  "when do I use subjunctive":    conceptual → grammar-declarative
  "how do you pronounce X":      procedural → pronunciation-articulatory
  "is X appropriate here":      relational → cultural-contextual
  "what's the difference between X and Y": relational → vocabulary-relational
  "how do I say X in language Z": factual → vocabulary-productive
```

**Test:** Can an AI agent correctly map language learning queries to knowledge types?

**Issue Found:** The base pattern `"what is X": factual` is too simplistic for language learning. "What is subjunctive?" is not factual — it's conceptual. The pattern needs sub-patterns.

### 2. Are retrieval paths optimized for language learning query patterns?

**Problem:** Common language learning queries don't map to the base retrieval modes:

| Query | Expected Retrieval | Base Taxonomy Says |
|-------|-------------------|-------------------|
| "words for eating" | Browse (by semantic field) | Search (exact-match) |
| "explain like I'm 5" | Browse (by complexity level) | Search |
| "conversational phrases" | Browse (by register) | Search |
| "listening practice" | Browse (by difficulty) | Hybrid |

**Issue Found:** Language learning retrieval is heavily browse-oriented, not search-oriented. The base taxonomy assumes search for factual but language learning is exception.

### 3. Does type-specific verification work?

| Knowledge Type | Base Verification | Language Learning Reality |
|---------------|-------------------|--------------------------|
| Vocabulary | Source reliability | Need active production test (speak/write it) |
| Pronunciation | Empirical | Need auditory verification (someone confirms) |
| Grammar | Logical consistency | Need production verification (create sentence) |
| Cultural | Social validation | Need context verification (native speaker confirm) |

**Issue Found:** Base verification approaches assume single-mode verification. Language learning requires **simultaneous multi-modal verification** (see [[Seed Gap - Multi-Modal Verification Tracking]]).

### 4. Does storage pattern match language learning needs?

| Base Type | Base Storage | Language Learning Needs |
|-----------|--------------|------------------------|
| Procedural | Sequential, complete | Grammar rules need contextual variants (formal/informal) |
| Conceptual | Atomic, highly linked | Grammar concepts interdepend (tenses affect mood affects aspect) |
| Factual | Compact, reference-linked | Vocabulary needs contextual examples per meaning |
| Experiential | Context-rich | Pronunciation needs audio embedding |

**Issue Found:** Language learning requires **context-variant storage** — the same concept needs multiple notes for different learner levels (beginner vs. advanced explanation).

---

## Edge Cases Identified

### 1. Active vs. Passive Knowledge

**Problem:** "Know a word" has multiple levels:

- Passive recognition (see word → know meaning)
- Active recall (think of meaning → produce word)
- Productive mastery (use word correctly in novel sentence)

**Current taxonomy:** Single `knowledge-type` cannot capture this gradient.

**Proposed fix:** Add `proficiency-level: receptive|productive|mastered` frontmatter.

### 2. Context-Dependent Meaning

**Problem:** Same word has different meanings in different contexts:
- "Light" (weight) vs "light" (illumination) vs "light" (color)
- Meaning depends on register, dialect, formal/informal

**Current taxonomy:** Single `knowledge-type: factual` cannot capture polysemy.

**Proposed fix:** Add `polysemous: true` with `meanings:` array in frontmatter.

### 3. Modality-Specific Knowledge

**Problem:** Same grammar can be expressed as:
- Written form (correct spelling)
- Spoken form (different pronunciation)
- Both have different error types and verification needs

**Current taxonomy:** Single knowledge type can't distinguish.

**Proposed fix:** Add `modality: written|spoken|listening|reading` frontmatter.

### 4. Learner-Level Dependent Organization

**Problem:** A grammar note for beginners differs from advanced:
- Beginner: "Subjunctive expresses wish/hope"
- Advanced: "Subjunctive triggers:祝愿动词,态度形容词,连词"

**Current taxonomy:** Single note can't serve both.

**Proposed fix:** Use `learner-level: A1|A2|B1|B2|C1|C2` frontmatter with separate notes.

---

## Modified Test for Language Learning

For language learning knowledge bases, the test becomes:

1. **Classification:** Can you classify each note by both base type AND language-specific extension?

2. **Organization:** Do vocabulary notes have contextual examples? Do grammar notes have learner-level variants?

3. **Query mapping:** Can you map "how do I say X" vs "what does X mean" to different types?

4. **Retrieval optimization:** 
   - Vocabulary → browse by semantic field
   - Grammar → browse by complexity level
   - Phrases → browse by context (formal, informal, travel, business)

5. **Verification:** Do vocabulary notes track both receptive (recognition) AND productive (production) status?

---

## Related Seed Rules and Gaps

- [[AI-Assisted Knowledge Management Seed]] — Knowledge Type Taxonomy rule (2026-04-03)
- [[Seed Gap - Knowledge Type Taxonomy and Retrieval Optimization]] — already integrated
- [[Seed Gap - Multi-Modal Verification Tracking]] — identified gap, related to verification issue
- [[Frontier Exploration - Language Learning Knowledge Base Gaps]] — earlier gap analysis
- [[Frontier Exploration - Multi-Modal Knowledge]] — partial coverage

---

## Conclusion

The Knowledge Type Taxonomy rule is a significant improvement, but language learning exposes its limitations:

1. **Query pattern mapping** needs domain-specific sub-patterns for language queries
2. **Retrieval paths** for language learning are predominantly browse-oriented, not search
3. **Verification** requires multi-modal tracking (see seed gap)
4. **Storage** needs context-variant organization (learner level, register, context)
5. **Active vs passive** distinction is critical for vocabulary but not in base taxonomy

The core insight holds: Type-aware organization enables better retrieval. But language learning needs richer type extensions than most domains.

**Test for Seed improvement:** Can an AI agent build a language learning knowledge base that answers:
- "How do I say X?" (productive vocabulary)
- "What's the difference between X and Y?" (relational)
- "Is this grammatically correct?" (procedural grammar)

With current taxonomy: Partially — needs extensions.