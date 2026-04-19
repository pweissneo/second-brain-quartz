---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-03-31
lifecycle: seed-extension
confidence: emerging
tags:
  - seed-stress-test
  - seed-refinement
  - temporal-knowledge
  - terminology-evolution
related:
  - "[[AI-Assisted Knowledge Management Seed]]"
  - "[[Seed Gap - Evolving Terminology in Fast-Moving Domains]]"
  - "[[Handling Temporal Knowledge]]"
---

# Seed Refinement: Temporal Validity Bounds Rule

> Stress testing the Seed against fast-evolving domains reveals a gap in how individual note validity is systematically tracked.

## The Gap

The Seed has robust rules for:
- Schema version tracking (`schema-version:` in frontmatter)
- Temporal knowledge handling (dates, time-sensitive facts)
- Outdated knowledge correction (`correction-type: outdated`)

But it lacks an **upfront** rule for systematically declaring when knowledge is valid:

> "This knowledge applies FROM version X UNTIL version Y"

The current approach is reactive (mark outdated AFTER it becomes outdated) rather than proactive (declare validity bounds UPFRONT so AI can track when review is needed).

## Scenario Where Current Seed Falls Short

**Scenario:** Building a knowledge base about a programming language (e.g., Python) where:
- Python 3.8 introduced walrus operator (:=)
- Python 3.9 introduced dictionary union operators (| and |=)
- Python 3.10 introduced pattern matching
- Python 3.11 introduced exception groups

**Current approach:**
1. Note says "Use walrus operator" without version context
2. Later, when Python 4.0 arrives, someone marks it as outdated
3. Problem: The note was already misleading for Python 2 users from the start

**Better approach:**
1. Note frontmatter includes `applies-from-version: "3.8"`
2. Note frontmatter includes `applies-until-version: null` (or specific version when known)
3. AI agent can query: "What notes will break when Python 4.0 releases?"

## Proposed Rule

**Rule (PROPOSED):** For knowledge bases in fast-evolving domains (software, research, medicine, standards), include temporal validity bounds in frontmatter when applicable.

**Why:** Without explicit validity bounds, the Seed's correction workflow catches outdated knowledge AFTER damage is done. Proactive bounds enable:
- Pre-emptive identification of notes needing review when versions update
- Clear communication to users about when knowledge applies
- Automated gap detection (notes without validity bounds in versioned domains)

**Test:** For notes in fast-evolving domains: (1) Does frontmatter include `applies-from-version:` or `applies-until-version:`? (2) Can you list all notes that will need review when the next version releases? (3) Are validity bounds missing only for evergreen knowledge?

**Implementation:**
```yaml
---
applies-from-version: "3.8"      # First version where this applies
applies-until-version: null      # null = still valid, "4.0" = deprecated by 4.0
version-note: "Walrus operator introduced in 3.8"  # Optional context
---
```

**When NOT to use:**
- Evergreen knowledge (fundamental concepts that don't change)
- Domain-agnostic principles
- Historical knowledge (intentionally documenting past states)

## Connection to Existing Rules

This rule **complements**, not replaces:
- **Schema version** — tracks metadata schema evolution, not knowledge validity → [[AI-Assisted Knowledge Management Seed]]
- **Correction workflow** — handles outdated knowledge reactively → [[Note Lifecycle Management]]
- **Gap identification** — can leverage validity bounds for proactive tracking → [[Handling Temporal Knowledge]]

Also see [[Seed Gap - Evolving Terminology in Fast-Moving Domains]] for related terminology tracking guidance.

## Domain Applicability

| Domain | Validity Bounds Needed? | Example |
|--------|------------------------|---------|
| Software (versions) | Yes | Python 3.8+, React 18+ |
| Standards | Yes | HTTP/2, TLS 1.2+ |
| Medical guidelines | Yes | AHA CPR 2020-2025 |
| Legal/jurisdiction | Yes | US law pre-/post-2023 |
| Craft/physical | Rarely | Evergreen techniques |
| Mathematics | Rarely | Evergreen theorems |

**Test:** For your domain, can you identify 5+ notes that SHOULD have version bounds but DON'T?
