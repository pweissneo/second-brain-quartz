---
last-reviewed: 2026-03-14
lifecycle: active
confidence: emerging
author-type: ai-assisted
tags:
  - seed-stress-test
  - stub-notes
  - mathematics
---

# Seed Stress Test: Stub Notes Rule in Mathematics Knowledge Base

## Rule Under Test

**Seed Rule:** Notes under 50 words must either be explicitly marked as stubs (with `status: stub` or `todo: true`) or must provide sufficient substance to stand alone.

**Original Test:** Count words in notes under 50 words. Does each have a stub marker OR contain a complete definition/explanation that could stand alone?

## Stress Test Domain

Mathematics knowledge base — chosen because:
- Contains many inherently short notes (theorems, lemmas, definitions)
- Has standard notation elements that are single tokens
- Includes abbreviations (gcd, lcm, iff)
- Has both foundational concepts and advanced theorems
- Domain unit concepts (operators, symbols) are genuinely atomic

## Analysis

### Does the Rule Make Sense for Mathematics?

**Yes, with modifications.** The spirit of the rule — notes should either be complete or intentionally incomplete — applies. However, mathematics has legitimate notes under 50 words that are complete:

1. **Theorem statements** — A theorem like "The square root of 2 is irrational" is complete in ~7 words
2. **Definition notes** — "A prime number is a natural number greater than 1 with no positive divisors other than 1 and itself" is ~20 words and complete
3. **Notation elements** — Single symbols like "π" or "∞" are genuinely atomic
4. **Abbreviation notes** — "gcd: greatest common divisor" is 4 words and complete

### Is the Test Executable by an AI?

**Partially.** The test is executable for:
- Counting words: trivial
- Checking for stub markers: trivial
- Checking "sufficient substance": **problematic** — this requires judgment about whether a definition is "complete"

The original edge case list mentions "domain unit concepts — standard notation elements, measurement units, or definition-atomic concepts" but doesn't explicitly cover:
- Mathematical notation elements
- Theorem statements
- Abbreviation definitions

### Edge Cases Identified

#### Edge Case 1: Single-Symbol Notes
Notes that are just a symbol (π, ∞, Σ) are genuinely atomic. The note title IS the content. A stub marker would be misleading.

**Test:** If note is <10 words AND the note title is a single token that represents the entire concept, it may be complete by nature.

#### Edge Case 2: Theorem Statements
A theorem statement can be complete in fewer than 50 words. The theorem IS the knowledge; the proof (if any) is supplementary.

**Test:** For notes tagged `type: theorem` or containing theorem statements, the test should be: "Does this state the complete theorem including all conditions and conclusions?" rather than word count.

#### Edge Case 3: Abbreviation Definitions
"gcd: greatest common divisor" is 4 words but completely defines the term.

**Test:** For abbreviation notes, check if the expansion is accurate and complete — word count is irrelevant.

#### Edge Case 4: Notation Definitions
"∫: integral symbol used to denote integration" is 7 words and complete.

**Test:** Notes about notation elements should be evaluated on whether they explain the notation's meaning and typical usage, not word count.

#### Edge Case 5: Lemma vs Theorem
Lemmas are often shorter than theorems because they're preparatory results. A 15-word lemma can be as complete as a 30-word theorem.

**Test:** Notes tagged `type: lemma` should be evaluated like theorems — completeness matters, not length.

## Recommendations

### Refine the Seed Rule

The rule should explicitly acknowledge mathematically complete short notes:

```markdown
**Rule:** Notes under 50 words must either be explicitly marked as stubs (with `status: stub` or `todo: true`) OR must provide sufficient substance to stand alone.
**Why:** Thin notes without markers waste graph space and mislead — they appear complete but contain no real knowledge. Stubs signal intentional incompleteness; unmarkedly thin notes are quality failures.
**Test:** Count words in notes under 50 words. Does each have a stub marker OR contain a complete definition/explanation that could stand alone?
**Edge case:** Procedural content (recipes, tutorials, code samples, technical specs, reference tables, legal documents) may legitimately exceed 300 words. Use atomicity test (one idea per note) as the primary check; word count is secondary for procedural formats.
**Edge case:** Domain unit concepts — standard notation elements, measurement units, or definition-atomic concepts — may legitimately fall below 100 words. Examples: musical dynamics (piano, forte), SI units (meter, kilogram), mathematical axioms, chemical elements. These are not stubs; their brevity is inherent to their nature. Verify: (1) Is this a standard unit/notation element of the domain? (2) Would expanding it add meaning, or just padding?
**Edge case (NEW):** Mathematical notation elements (symbols, operators) and abbreviation definitions are inherently short. A note defining "gcd" as "greatest common divisor" is complete regardless of word count. The test: (1) Is this a notation element or abbreviation? (2) Does the note accurately define/explain it? Word count should not apply.
**Edge case (NEW):** Theorem and lemma statements are complete when they state all conditions and conclusions, regardless of length. A 15-word theorem can be more complete than a 40-word draft. The test: (1) Is this a theorem/lemma? (2) Are all conditions stated? (3) Is the conclusion stated? Word count should not apply.
```

### Updated Test

```markdown
**Test:** Count words in notes under 50 words. Does each have a stub marker OR meet one of these exceptions:
1. Is tagged as a hub or redirect note?
2. Is a domain unit concept (standard notation, measurement units, symbols)?
3. Is an abbreviation with complete expansion?
4. Is a theorem/lemma statement with all conditions and conclusions?
5. Provides a complete definition that could stand alone without requiring external context?
If yes to any exception, the note passes. If no to all, flag for review.
```

## Conclusion

The stub notes rule needs explicit mathematical domain exceptions. The word count test is a useful heuristic but fails for:
- Mathematical notation elements
- Abbreviation definitions  
- Complete theorem statements

The Seed should acknowledge these as exceptions rather than requiring stub markers for genuinely complete short notes.

---

## Related
- [[AI-Assisted Knowledge Management Seed]] — Master Seed file
- [[Stress Test - Atomicity Rule Across Domains]] — Cross-domain atomicity (consolidated from domain-specific tests)
- [[Note Types and Templates]] — For understanding note types like theorem, lemma, stub
