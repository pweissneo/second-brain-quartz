---
last-reviewed: 2026-03-14
lifecycle: active
confidence: emerging
author-type: ai-assisted
tags:
  - seed-refinement
  - stress-test
  - atomicity
  - domain-gaps
type: insight
author: neo
created: 2026-03-14
summary: Stress test of word count rule reveals gaps for reference content and aggregated collections
---

# Stress Test: Word Count Rule (100-300 words)

**Domain tested:** Multiple (cooking, medicine, law, music theory)

## Stress Test Results

### Rule Tested
> Notes should be 100-300 words. Under 100 is too thin; over 300 likely contains multiple ideas.

### Findings

#### 1. Reference Content Not Explicitly Covered

**Problem:** The rule has edge cases for:
- Procedural content (recipes, tutorials, code)
- Educational/explanatory content
- Comprehensive principle notes
- Single creative works

**Missing:** Reference content that is NOT procedural but still legitimately exceeds 300 words:
- Drug monographs (indications, contraindications, dosage, side effects, interactions, pharmacology)
- Device specifications
- Anatomical entries
- Encyclopedia-style entries

**Test scenario:** A note about "Acetaminophen" that covers all pharmacological aspects could easily be 2000+ words. This is ONE drug (one "idea" by domain standards) but exceeds 300 words.

**Current workaround:** Would need to classify as "procedural" or "educational" but neither fits well.

#### 2. Legal Documents Misclassified

**Problem:** Edge case mentions "legal documents" as procedural content. But:
- Contracts aren't executed step-by-step like recipes
- Statutes aren't tutorials
- Legal documents are reference content - you consult them, don't follow them

**Test scenario:** A commercial lease agreement is legitimately one "concept" (the lease) but could be 50+ pages.

#### 3. Hub Notes for Aggregated Collections

**Problem:** Recipe collections ("50 Italian Pasta Recipes"), music playlists, reading lists - these are hub notes that legitimately aggregate many items.

**Current guidance:** Hub notes under 200 words are acceptable per another rule. But a comprehensive hub might need 500+ words to describe its scope.

**Test scenario:** "Italian Cooking Methods" hub with descriptions of 15 different techniques - each description needs context to be useful.

#### 4. Domain Patterns vs Individual Works

**Problem:** The rule covers "single creative works" (one painting, one book) but not:
- Musical forms (sonata form, rondo form - patterns, not single works)
- Architectural styles
- Design patterns in software

**Test scenario:** "Sonata Form" - a pattern that appears in hundreds of compositions, not a single work. Documenting it comprehensively could exceed 300 words.

## Proposed Rule Refinements

### Add Reference Content Edge Case

```
**Edge case:** Reference content (drug monographs, device specifications, 
encyclopedia entries, taxonomic classifications) may legitimately exceed 
300 words when covering one complete reference unit. The test: (1) Is this 
a single reference entity (one drug, one device, one species)? (2) Would 
splitting make it harder to look up? (3) Are parts not independently 
reusable? Keep together if yes to 1-2; split only if yes to 3.
```

### Clarify Legal Documents Classification

```
**Edge case:** Legal documents (contracts, statutes, regulations) are 
reference content, not procedural content. Apply the reference content 
test: (1) Is this one legal instrument? (2) Does the user consult it 
rather than execute it linearly? (3) Would splitting impair legal context? 
Keep together if yes.
```

### Add Aggregated Hub Guidance

```
**Edge case:** Hub notes that aggregate many items (collections, playlists, 
reading lists, technique indexes) may exceed 300 words when each item 
needs contextual description. The test: (1) Is this a pure navigation hub 
(under 200 words acceptable)? (2) Does each aggregated item need explanation 
beyond just a title? (3) Is the description essential to understanding scope? 
Expand hub if yes to 2-3.
```

### Expand Pattern Documentation

```
**Edge case:** Domain patterns (musical forms, architectural styles, design 
patterns, methodological frameworks) are valid atomic units even when 
exceeding 300 words. The test: (1) Is this a reusable pattern rather than 
a single instance? (2) Does the pattern have multiple components that must 
be understood together? (3) Is this referenced by multiple individual works? 
Keep together if yes to any.
```

## Lessons Learned

1. The procedural/reference/educational trichotomy is useful but not complete
2. Domain-specific "atomic units" differ - what's "one idea" varies by domain
3. Hub notes have different atomicity requirements than content notes
4. Legal documents are a significant gap - they're commonly stored in KBs

## Related Notes
- [[Atomic Note Principle]]
- [[AI-Assisted Knowledge Management Seed]]
- [[Domain-Specific Knowledge Bases]]
