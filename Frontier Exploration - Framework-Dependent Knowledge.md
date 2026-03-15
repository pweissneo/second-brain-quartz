---
last-reviewed: 2026-03-11
lifecycle: active
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - framework-dependent
  - knowledge-types
  - scope
applies-to: [all-frameworks]
example-type: illustrative
---

# Frontier Exploration - Framework and Context-Dependent Knowledge

> How to handle knowledge that is true in one framework, style, or context but false or meaningless in another — including competing frameworks that are epistemologically equivalent but mutually incompatible

## The Problem

Some knowledge is not universally valid — its truth or applicability depends on the framework, paradigm, style, or context being applied. The Seed handles contradictory sources (two experts disagreeing) and subjective preferences (different tastes), but lacks guidance for **framework-dependent knowledge** where the same statement has different validity across paradigms or contexts.

This note covers two related but distinct cases:

1. **Framework-dependent knowledge**: The same statement has different truth values in different frameworks (e.g., "use classes" is true in OOP but false in Functional)
2. **Competing frameworks**: Multiple epistemologically equivalent but mutually incompatible frameworks (e.g., Copenhagen vs Many-worlds in quantum mechanics)

## Why This Matters for AI Agents

An AI building a knowledge base from scratch using only current Seed rules would:
- ✓ Correctly identify contradictory sources and create synthesis notes
- ✓ Correctly present subjective preferences as options
- ✗ FAIL to recognize when knowledge is framework-dependent
- ✗ Potentially give harmful advice by universalizing framework-specific rules

### Competing Frameworks: The Special Case

Some knowledge domains have **competing frameworks** that are:
- **Internally consistent** — each framework has its own logic
- **Empirically supported** — each has evidence, though different types
- **Mutually incompatible** — they cannot both be true simultaneously
- **Equally valid** — no framework is clearly "wrong"

Examples:
- **Physics**: Copenhagen interpretation vs. Many-worlds vs. Bohemian mechanics (quantum mechanics)
- **Economics**: Keynesian vs. Austrian vs. Monetarist vs. MMT
- **Psychology**: Psychoanalysis vs. Behaviorism vs. Cognitive vs. Humanistic
- **Philosophy**: Various schools (existentialism, utilitarianism, deontology, virtue ethics)
- **Medicine**: Allopathic vs. naturopathic vs. traditional systems
- **Law**: Common law vs. civil law traditions

This is different from:
- **Contradictory sources** — where one is wrong (covered by Seed)
- **Subjective opinions** — where all are valid preferences (covered by Seed)
- **Equivalent approaches** — where context determines best choice (covered by Seed)

Knowledge bases naturally imply preference through:
- **Presentation order** — First = default = implicit endorsement
- **Link structure** — More links = more important
- **Detail level** — Deeper coverage implies endorsement
- **Language** — Words like "orthodox" vs "alternative" carry judgment

## Examples Across Domains

> **Note:** The following tables contain illustrative examples — hypothetical teaching examples that demonstrate the concept of framework-dependent knowledge. They are not factual claims about any specific framework.

### Programming Paradigms
| Statement | OOP View | Functional View |
|-----------|----------|------------------|
| "Use classes for organization" | True - core paradigm | False - use functions |
| "Mutable state is dangerous" | Caution Fundamental anti-pattern |
ed but accepted || "Functions should be pure" | Not required | Required |

### Writing Styles
| Statement | Technical Writing | Literary Prose |
|-----------|------------------|----------------|
| "Use passive voice sparingly" | True - clarity rule | Irrelevant |
| "Minimize adjectives" | True - precision | False - richness |
| "Show, don't tell" | Sometimes | Core principle |

### Music Theory
| Statement | Classical | Jazz |
|-----------|-----------|------|
| "Parallel fifths are forbidden" | True - voice-leading rule | False - common practice |
| "Use extended harmonies" | Advanced technique | Standard practice |
| "Strict meter matters" | Fundamental | Can be flexible |

### Scientific Methods
| Statement | Quantitative Research | Qualitative Research |
|-----------|---------------------|---------------------|
| "Sample size matters" | Critical | Less critical |
| "Statistical significance proves causation" | Misuse | N/A |
| "Triangulation strengthens findings" | Helpful | Essential |

### Historical Context (related to Framework)
| Statement | Modern Medicine | Historical Medicine |
|-----------|-----------------|---------------------|
| "Bloodletting is harmful" | True | Context-dependent |
| "Bloodletting has limited therapeutic use" | False | True in specific contexts |

## The Three Categories

### 1. Contradictory Sources (Handled by Seed)
- Two experts disagree on facts
- Both could be right in different contexts
- **Solution:** Present both viewpoints with attribution

### 2. Subjective Preferences (Handled by Seed)
- Different people have different tastes
- No objective truth
- **Solution:** Present as options, don't over-synthesize

### 3. Framework/Context-Dependent (This Note)
- The same statement has different truth values in different frameworks
- OR multiple epistemologically equivalent but mutually incompatible frameworks exist
- **Requires:** Explicit framework tagging, separate variants, clear scope

## Seed Gap Analysis

Current Seed has:
- ✓ Confidence markers (high/emerging/disputed/obsolete)
- ✓ Handling contradictory sources (synthesis notes)
- ✓ Distinguishing objective vs subjective
- ✓ Jurisdiction/region tags
- ✓ Context-scope tagging for some rules

Missing:
- No systematic approach to identifying framework-dependent knowledge
- No guidance on when to create framework-specific variants vs universal rules
- No "valid-in" or "applies-to" frontmatter convention for frameworks/styles
- No guidance for competing frameworks (neutral presentation, evidence standards within frameworks)

## Proposed Seed Rules

### Rule: Identify framework-dependent knowledge and tag with scope metadata

**Why:** Without scope metadata, readers (and AIs) apply knowledge in wrong contexts. A rule true in one framework may be harmful in another.

**Test:** For notes containing absolute statements ("always", "never", "best practice"):
1. Does this claim depend on a specific framework/paradigm?
2. Is there scope/applies-to metadata?
3. Are validity conditions explicitly stated?
4. Could the same knowledge apply differently in another framework?

### Rule: Create framework-specific variant notes rather than universalizing context-dependent knowledge

**Why:** Universalizing ("X is good/bad") when it's framework-dependent creates misleading knowledge. Better to have "X is good in Y framework" than "X is good" with hidden caveats.

**Test:** For framework-dependent knowledge:
1. Are there separate notes for different frameworks?
2. Does each variant explicitly state its scope?
3. Is there a canonical note that references the variants?

### Rule: Use frontmatter `applies-to` field for framework-dependent knowledge

**Why:** Structured metadata allows AIs to query applicability and helps readers understand scope.

**Test:** Pick 10 notes with absolute statements. Check for `applies-to:` or `framework:` frontmatter field.

### Rule: Present competing frameworks in neutral order (alphabetical or historical, not by perceived correctness)

**Why:** Presentation order implies endorsement. Alphabetical or historical order is neutral.

**Test:** Can you identify the implied order of endorsement in your framework notes?

### Rule: Acknowledge evidence standards vary by framework

**Why:** What counts as evidence in one framework may not in another. A knowledge base applying only Western scientific standards to all frameworks is not neutral.

**Test:** For each framework, can you identify its evidence standards?

## Implementation Guidance

1. **Scan for absolute statements** - "always", "never", "best", "correct way"
2. **Ask:** Is this true in all frameworks?
3. **If no:** Add `applies-to:` frontmatter
4. **If strongly framework-dependent:** Create variant notes
5. **For competing frameworks:** Create explicit hub notes, tag with `framework:`, present neutrally

## Testable Insights

1. **Framework neutrality is achievable but requires effort** — Without explicit rules, neutral presentation is impossible.

2. **All frameworks have blind spots** — Acknowledging what each framework misses is as important as describing what it includes.

3. **Practical integration is where users need most help** — Theoretical comparison is easy; knowing when to apply which is hard.

4. **Framework choice often reflects values, not just evidence** — Economics and ethics especially.

## Related
- [[Handling Contradictory Sources]]
- [[Confidence Markers]]
- [[Frontier Exploration - Comparative Knowledge Structures]]
- [[AI-Assisted Knowledge Management Seed]]
