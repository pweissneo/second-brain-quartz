---
last-reviewed: 2026-04-03
last-updated: 2026-04-03
lifecycle: seed-refinement
confidence: emerging
author-type: ai-assisted
verification-status: draft
tags:
  - seed-refinement
  - word-count
  - atomicity
  - testability
gap-type: seed-weakness
gap-status: identified
gap-priority: medium
gap-severity: moderate
discovered: 2026-04-03
---

# Seed Refinement: Word Count Rule Testability

> A proposed improvement to make the 100-300 word count rule more executable by AI agents.

## Gap Identification

**Original Issue:** The Seed's word count rule (notes should be 100-300 words) is not reliably testable because:
- The test asks "does this contain one idea?" — a subjective judgment
- It asks "would splitting make it harder to use?" — requires domain knowledge
- It asks "are parts independently reusable?" — requires understanding the knowledge

An AI agent cannot reliably answer these questions, especially for domains outside its training.

**Evidence from Stress Test:**
- 76.4% of vault notes exceed 300 words
- Median word count is 738 words
- Many notes are legitimately large (Frontier Exploration, comprehensive topic coverage)
- The Seed has many edge cases, but the core rule is untestable

**Root Cause:** The rule conflates two different things:
1. **Length guidance** (100-300 words is a reasonable target)
2. **Atomicity test** (one idea per note) — which is inherently subjective

## Proposed Seed Refinement

**Rule (REFINED):** Use mechanical word count thresholds with categorical exceptions — flag notes outside 100-300 words for review, apply categorical exemption without judgment.

**Why:** The original test is not executable. Mechanical thresholds with categorical exemptions allow AI agents to:
1. Identify notes needing review (mechanical)
2. Apply categorical exemptions without subjective judgment
3. Focus human review on ambiguous cases

**Test:**
1. Count words in note (after stripping frontmatter)
2. If 100-300 words: PASS — no review needed
3. If <100 or >300 words: check categorical exemptions below
4. If no exemption applies: flag for review

**Categorical Exemptions (>300 words, automatically valid):**
- Procedural content (recipes, tutorials, code samples, technical specs)
- Reference content (encyclopedia entries, drug monographs, specifications)
- Domain patterns (musical forms, architectural styles, design patterns)
- Stress test notes (notes that test Seed rules)
- Frontier exploration notes (notes exploring new topics comprehensively)
- Seed gap notes (notes documenting gaps to be resolved)

**Categorical Exemptions (<100 words, automatically valid):**
- Technique definitions (complete physical technique with name, action, outcome)
- Mathematical notation (theorems, lemmas, abbreviation definitions)
- Hub/redirect notes
- Complete short procedural content (self-contained procedures)

**Notes requiring human review (no categorical exemption):**
- Notes 100-300 words: PASS (no review)
- Notes <100 words without exemption: review for completeness
- Notes >300 words without exemption: review for atomicity

## Revised Test Algorithm

```
function compliance_test(note):
    words = count_words(note.content)
    
    if 100 <= words <= 300:
        return "PASS"
    
    if words < 100:
        if is_technique_definition(note) OR is_hub(note) OR is_short_procedural(note):
            return "PASS"
        return "FLAG: review for completeness"
    
    if words > 300:
        if is_procedural(note) OR is_reference(note) OR is_domain_pattern(note):
            return "PASS"
        if note.title matches "Seed Stress Test*" OR "Frontier Exploration*" OR "Seed Gap*":
            return "PASS"
        return "FLAG: review for atomicity"
```

## Alternative: Proxy-Based Test

Instead of trying to make the atomicity test executable, replace it with a proxy test:

**Proxy Test:** Notes should have a one-sentence summary. If you cannot extract a single sentence that captures the note's essence, it likely contains multiple ideas.

This is more executable:
1. Can an AI extract a one-sentence summary?
2. Does the summary match the note's content?
3. Is the summary actionable/representative?

## Implementation Notes

This refinement:
- Keeps the 100-300 word guidance as a useful heuristic
- Makes the test executable via categorical exemptions
- Reduces need for subjective judgment
- Focuses human review on genuinely ambiguous cases

## Related Seed Rules

- [[AI-Assisted Knowledge Management Seed]] — Primary Seed
- [[Seed Refinement - Test Executability in Seed Stress Tests]] — Related refinement
- Seed rule: "Notes should be 100-300 words"
- Edge cases for procedural, reference, domain pattern, technique content

## Source

Discovered during SEED_STRESS_TEST heartbeat 2026-04-03