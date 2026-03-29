---
last-reviewed: 2026-03-18
last-updated: 2026-03-18
confidence: emerging
author-type: ai-assisted
lifecycle: evergreen
tags:
  - frontier-exploration
  - edge-cases
  - exceptions
  - knowledge-organization
review-by: 2026-03-28
---

# Frontier Exploration: Edge Case and Exception Knowledge Organization

> How should a knowledge base organize the exceptions, edge cases, and special conditions that modify or contradict general principles?

## The Gap

The Seed covers:
- Atomicity (one idea per note)
- Linking (meaningful connections)
- Context-gated knowledge (when knowledge applies)
- Framework-dependent knowledge (different approaches suit different contexts)

But it lacks explicit guidance on: **how to organize knowledge about edge cases** - the exceptions that modify, limit, or contradict general rules.

## Why This Matters

General principles are easy to capture: "Diversify your investments." But the value of a knowledge base often lies in edge cases:
- "EXCEPT when markets are highly correlated during crisis"
- "EXCEPT for this specific demographic"
- "EXCEPT when regulatory changes occur"

Without explicit edge case handling:
1. General rules become misleading (they're technically true but incomplete)
2. Exceptions get buried in note text and become invisible
3. Users can't easily find when exceptions apply

## The Problem in Practice

Consider a note: "Always use lapis lazuli for ultramarine blue in paintings"

This is misleading without exceptions:
- "Except historically, when azurite was used as a cheaper alternative"
- "Except in modern synthetic versions, which are chemically identical"
- "Except for cases where geological source matters for authenticity"

Current approaches:
- Add exceptions to the main note → note becomes bloated and violates atomicity
- Create separate exception notes → hard to discover, relationship to general rule is unclear
- Ignore exceptions → knowledge becomes inaccurate

## What Edge Cases Look Like

Edge cases modify general knowledge in several ways:

1. **Scope limitations**: "X is true, except in case Y"
   - "Index funds work for most investors, except those with very high net worth"

2. **Condition triggers**: "X applies when condition Y is met"
   - "Use the 4% withdrawal rule, unless market valuations are extreme"

3. **Temporal boundaries**: "X was true, now Y is true"
   - "The 4% rule was considered safe in 1994, now considered risky"

4. **Population-specific**: "X applies to group Y"
   - "Compound interest works, except for those with high inflation"

5. **Reverse exceptions**: "X seems like Y, but actually Z"
   - "This looks like a good opportunity, but actually it's a scam pattern"

## Proposed Seed Rules

### Rule: Tag exception-modifying knowledge with `exception-type`

**Rule:** When a note contains knowledge that modifies or limits a general principle, tag it with `exception-type` frontmatter.

**Why:** Without explicit tagging, exception knowledge is invisible to both navigation and AI reasoning. Tagging makes exceptions discoverable and allows reasoning systems to apply them appropriately.

**Test:** Can you find all exceptions to a general principle by querying for `exception-type`?

**Implementation:**
```yaml
exception-type: scope-limitation|condition-trigger|temporal-boundary|population-specific|reverse-exception
applies-to-principle: [[General Principle Note]]
conditions: "When this exception applies"
```

### Rule: Create exception hub notes for important general principles

**Rule:** For high-value general principles with multiple exceptions, create an exception hub note that links to the main principle AND all known exceptions.

**Why:** Users and AI agents need to find both the general rule AND its exceptions. Exception hubs make the complete picture discoverable.

**Test:** For principles with 3+ known exceptions: Is there an exception hub linking to all of them?

**Implementation:**
```yaml
# Exception Hub Example
# Main principle: [[Diversify Investments]]
# 
# - [[Exception - Crisis Correlation]] (scope-limitation)
# - [[Exception - High Net Worth]] (population-specific)  
# - [[Exception - Tax-Advantaged Accounts]] (condition-trigger)
```

### Rule: Structure exception notes to reference the principle they modify

**Rule:** Exception notes must include explicit `applies-to-principle` frontmatter linking to the general rule they modify.

**Why:** This enables bidirectional reasoning: from principle to exceptions, and from exception back to the principle it modifies.

**Test:** Can you trace from any exception back to its parent principle? Can you find all exceptions for any principle?

### Rule: Distinguish exceptions from counter-examples

**Rule:** Separate:
- **Exceptions**: cases where the general rule doesn't apply (but the rule is still valid in typical cases)
- **Counter-examples**: cases that suggest the general rule is wrong or incomplete

**Why:** Exceptions preserve the general rule's validity; counter-examples challenge it. Treating counter-examples as exceptions hides potential rule problems.

**Test:** For every tagged exception: Is this genuinely an exception (rule still valid in typical cases) or a counter-example (rule may be wrong)?

**Implementation:**
```yaml
exception-type: scope-limitation
exception-category: valid-exception  # Rule still generally valid
# vs
exception-category: counter-example  # Rule may need revision
```

### Rule: Include exception validity period

**Rule:** For exceptions tied to specific conditions (regulations, market states, technologies), include `exception-valid-until` or `exception-condition` frontmatter.

**Why:** Exceptions can become invalid as conditions change. Without validity tracking, stale exceptions misinform decisions.

**Test:** For time-sensitive exceptions: Can you identify when the exception no longer applies?

## Examples by Domain

### Finance/Investing
```
Principle: "Diversify across asset classes"
Exception: "Except during correlation crisis when all assets fall together"
Exception: "Except for high-net-worth individuals who have different constraints"
```

### Cooking
```
Principle: "Sear meat to develop flavor"
Exception: "Exception for fish - searing can make it tough"
Exception: "Exception for sous vide - sear after cooking for texture"
```

### Medicine
```
Principle: "Antibiotics treat bacterial infections"
Exception: "Exception for viral infections - antibiotics don't help"
Exception: "Exception for antibiotic-resistant strains"
```

## The Test

**Test:** Pick a general principle in your vault with known exceptions:
1. Can you identify all exceptions?
2. Are exceptions tagged with `exception-type`?
3. Is there an exception hub for this principle?
4. Can users find both the rule AND its exceptions?

If you cannot answer yes to all four, the gap exists in your vault.

---

## Related Seed Rules

- [[Frontier Exploration - Context-Gated Knowledge]] - Related but focuses on when knowledge applies, not what modifies it
- [[Frontier Exploration - Condition-Triggered Knowledge]] - Related but focuses on external conditions, not exception structures
- [[Seed Stress Test - Confidence Markers Rule Across Domains]] - Confidence may be lower for knowledge with many exceptions
- [[Frontier Exploration - Framework-Dependent Knowledge]] - Different frameworks can have different exceptions

---

## Why This Matters for AI Reasoning

When an AI agent uses vault knowledge for decision-making:
- Without exception tracking: Agent applies general rules universally (overgeneralization)
- With exception tracking: Agent can check applicability conditions before recommending

This is the difference between:
- "Investors should diversify" (potentially misleading)
- "Investors should diversify, EXCEPT in crisis correlation, EXCEPT for high-net-worth" (actionable)

The second is more useful but requires explicit exception handling.
