---
last-reviewed: 2026-03-09
lifecycle: emerging
confidence: emerging
tags:
  - frontier-exploration
  - framework-dependent
  - knowledge-types
  - scope
---

# Frontier Exploration: Framework and Context-Dependent Knowledge

> How to handle knowledge that is true in one framework, style, or context but false or meaningless in another

## The Problem

Some knowledge is not universally valid — its truth or applicability depends on the framework, paradigm, style, or context being applied. The Seed handles contradictory sources (two experts disagreeing) and subjective preferences (different tastes), but lacks guidance for **framework-dependent knowledge** where the same statement has different validity across paradigms or contexts.

## Why This Matters for AI Agents

An AI building a knowledge base from scratch using only current Seed rules would:
- ✓ Correctly identify contradictory sources and create synthesis notes
- ✓ Correctly present subjective preferences as options
- ✗ FAIL to recognize when knowledge is framework-dependent
- ✗ Potentially give harmful advice by universalizing framework-specific rules

## Examples Across Domains

### Programming Paradigms
| Statement | OOP View | Functional View |
|-----------|----------|------------------|
| "Use classes for organization" | True - core paradigm | False - use functions |
| "Mutable state is dangerous" | Cautioned but accepted | Fundamental anti-pattern |
| "Functions should be pure" | Not required | Required |

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

### 3. Framework/Context-Dependent (MISSING from Seed)
- The same statement has different truth values in different frameworks
- Universalizing creates misleading or harmful knowledge
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

## Implementation Guidance

1. **Scan for absolute statements** - "always", "never", "best", "correct way"
2. **Ask:** Is this true in all frameworks?
3. **If no:** Add `applies-to:` frontmatter
4. **If strongly framework-dependent:** Create variant notes

## Related
- [[Handling Contradictory Sources]]
- [[Confidence Markers]]
- [[AI-Assisted Knowledge Management Seed]]
