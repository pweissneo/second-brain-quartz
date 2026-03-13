---
last-reviewed: 2026-03-09
lifecycle: emerging
confidence: emerging
tags:
  - frontier-exploration
  - context-dependent
  - knowledge-types
  - style-variation
---

# Frontier Exploration: Context-Style-Dependent Knowledge

> When does knowledge change meaning depending on the framework, style, or approach being applied?

## The Problem

Some knowledge is not universally true or false — its validity depends on the context, style, or framework being applied. The Seed handles contradictory sources and subjective preferences, but lacks guidance for **contextual truth** where the same statement has different validity across styles/approaches.

## Examples from Different Domains

### Music Composition
- Classical counterpoint: "Avoid parallel fifths" — strict rule
- Jazz harmony: Parallel fifths are common and beautiful
- Same knowledge ("parallel fifths") → TRUE in jazz, FALSE in classical

### Programming
- "Global variables are bad" — generally true in structured programming
- "Global constants are acceptable" — depends on language and scale
- "Use classes for everything" — true in OOP, false in functional paradigms

### Writing
- "Use passive voice sparingly" — true for most technical writing
- "Passive voice is appropriate for scientific objectivity" — domain-dependent
- "Never use adverbs" — true in Hemingway-style minimalism, false in literary prose

### Medicine
- "Bloodletting is harmful" — true in modern medicine
- "Bloodletting has limited therapeutic use" — true in specific historical contexts
- Same topic, different validity based on era/methodology

## Why Current Seed Rules Are Insufficient

### Contradictory Sources (existing)
- Two experts disagree on the facts
- Solution: Present both viewpoints with attribution

### Subjective Preferences (existing)
- Different people have different tastes
- Solution: Present as options, don't over-synthesize

### Context-Style-Dependent (MISSING)
- The same statement has different truth values depending on the framework
- Requires: Explicit context tagging, separate validity conditions, framework-specific notes

## Current Seed Gap

The Seed has:
- Confidence markers (high/emerging/disputed/obsolete)
- Handling contradictory sources (synthesis notes)
- Distinguishing objective vs subjective

But NO rule for:
1. Identifying when knowledge is context-dependent
2. Structuring context-dependent knowledge so validity conditions are explicit
3. Creating framework-specific variants while maintaining a canonical note

## Suggested Seed Rules

### Rule: Tag context-dependent knowledge with scope metadata

**Why:** Without scope metadata, readers (and AIs) don't know where knowledge applies. A rule that's true in one context may be harmful in another.

**Test:** For notes containing absolute statements ("always", "never", "best"), check: (1) Is there a scope/context tag? (2) Are validity conditions explicitly stated? (3) Could the same knowledge apply differently in another context?

### Rule: Create framework-specific variant notes rather than universalizing context-dependent knowledge

**Why:** Universalizing ("X is good/bad") when it's actually context-dependent creates misleading knowledge. Better to have "X is good in Y framework" than "X is good" with hidden caveats.

**Test:** For context-dependent knowledge: (1) Are there separate notes for different frameworks? (2) Does each variant explicitly state its scope? (3) Is there a canonical note that references the variants?

### Rule: Include a "valid-in" or "applies-to" frontmatter field for style/framework-dependent knowledge

**Why:** Structured metadata allows AIs to query "what does this apply to?" and helps readers understand scope.

**Test:** Pick 10 notes with absolute statements. Do they have scope/applies-to metadata? If not, is there a clear indication of context limitation in the text?

## Stress Test: Music Theory Vault

An AI building a music theory vault using only current Seed rules would:
- ✓ Create atomic notes on harmony, counterpoint, chord progressions
- ✓ Handle contradictory sources (different theorists disagreeing)
- ✗ Not tag "avoid parallel fifths" as classical-only
- ✗ Not create jazz-variant notes for context-dependent rules
- ✗ Potentially give harmful advice by universalizing context-specific rules

With the new rules:
- [[Parallel Fifths (Classical)]] — tagged applies-to: classical-counterpoint
- [[Parallel Fifths (Jazz)]] — tagged applies-to: jazz-harmony
- [[Parallel Fifths (Summary)]] — canonical note linking to variants

## Related

- [[Handling Contradictory Sources]] — Related but different
- [[Confidence Markers]] — Extends confidence with scope
- [[AI-Assisted Knowledge Management Seed]] — The authoritative rules
