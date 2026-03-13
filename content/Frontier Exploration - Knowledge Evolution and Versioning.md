---
title: Frontier Exploration - Knowledge Evolution and Versioning
type: note
status: seed-candidate
tags:
- frontier-exploration
- knowledge-evolution
- versioning
- temporal-knowledge
- deprecation
created: 2026-03-10
last-reviewed: 2026-03-10
confidence: emerging
lifecycle: active
---

# Frontier Exploration: Knowledge Evolution and Versioning

## The Problem

Knowledge is not static. What we understand to be true changes over time as:
- New research supersedes old understanding
- Contexts shift (economic conditions, technology, cultural norms)
- Models and frameworks are refined or replaced

The Seed handles temporal knowledge (sequences) and version-dependent knowledge (software), but there's a gap: **how should a knowledge base handle knowledge that has evolved — where the current understanding is different from what was captured in the past?**

## Why It Matters

1. **Accuracy drift**: Notes that were once accurate become misleading if not updated
2. **Provenance matters**: Knowing WHEN knowledge was true is as important as knowing WHAT is true
3. **Historical context**: Understanding how thinking evolved provides insight itself
4. **Update fatigue**: Complete rewrites lose the reasoning behind changes

## Current Seed Coverage

The Seed addresses:
- **Lifecycle stages** (draft → active → evergreen → deprecated)
- **Version-dependent knowledge** (software versions)
- **Temporal sequences** (history, processes)
- **Confidence markers** (high/emerging/disputed/obsolete)

What's missing: **systematic handling of knowledge evolution over time** — not just marking something as "deprecated" but tracking the evolution path.

## Approaches to Explore

### 1. Snapshot Model

Keep historical versions with timestamps:
```
Knowledge Note/
  ├── current.md (latest understanding)
  ├── 2024-01.md (superseded version)
  └── 2023-01.md (earlier version)
```

**Pros**: Clear history, easy to trace evolution
**Cons**: Duplication, complexity, unclear when snapshots are needed

### 2. Change Log Model

Single canonical note with explicit change history:
```markdown
# Topic Understanding

## Current Understanding (2026-03)
Current best practice is X because...

## Evolution History
- **2025-06**: Changed from Y to X based on new research
- **2024-01**: Changed from Z to Y based on field study
- **2023-03**: Original understanding Z
```

**Pros**: Single source of truth, explicit history
**Cons**: Note bloat, harder to find "current" quickly

### 3. Delta Model

Track changes as separate "delta" notes:
```
Topic/
  ├── Understanding (current summary)
  ├── Delta-2025-06 (what changed)
  └── Delta-2024-01 (what changed)
```

**Pros**: Separation of current state from history
**Cons**: Multiple notes to maintain, potential fragmentation

### 4. Replace-with-Reference Model

When knowledge changes significantly:
1. Mark old note as deprecated with pointer to new
2. Create entirely new note
3. Link from old to new explicitly

**Pros**: Clean current state, clear replacement path
**Cons**: Loses context about WHY changes happened

## Testable Insights

1. **Evolution complexity correlates with domain**: Scientific fields evolve faster than mathematical foundations; technology domains evolve faster than historical facts.

2. **Trigger events for evolution tracking**: New research publication, major world event, technology shift, framework abandonment.

3. **Not all changes need full versioning**: Minor corrections don't require history; significant paradigm shifts do.

4. **Graph structure affects evolution handling**: Highly interconnected notes are harder to version; atomic notes are easier.

5. **AI agents need explicit temporal markers**: Without dates on knowledge claims, AI cannot distinguish current from outdated.

## Seed Rule Candidates

### Rule: Track Knowledge Validity Period

> For knowledge domains where understanding has changed over time, include a `valid-from` date in frontmatter indicating when this understanding became accurate.

**Why**: Readers and AI agents need to know whether captured knowledge reflects current understanding.

**Test**: Pick 10 notes in an evolving domain. Can you determine when each piece of knowledge became accurate?

### Rule: Document Evolution Triggers

> When updating a note with significant changes, include a brief statement about what triggered the update.

**Why**: Understanding why knowledge changed helps readers evaluate the change and predict future changes.

**Test**: Pick 5 notes that have been updated. Can you identify what prompted each update?

### Rule: Link Historical Supersessions

> When knowledge is superseded, the deprecated note should link to the replacement note, and the replacement should acknowledge the superseded note.

**Why**: bidirectional supersession links enable tracing how understanding evolved.

**Test**: Find a deprecated note. Does it point forward to replacement? Does replacement acknowledge superseded?

### Rule: Set Review Triggers for Evolving Domains

> For domains with high change velocity (technology, science, current events), set explicit `review-when` triggers rather than relying on arbitrary time intervals.

**Why**: Arbitrary review schedules miss important changes; trigger-based scheduling ensures timely updates.

**Test**: In fast-changing domains, can you identify explicit conditions that should trigger review?

## Related Notes

- [[Temporal and Sequential Knowledge]] — For knowledge where order is intrinsic
- [[Version-Dependent Knowledge]] — For software/version-specific knowledge
- [[Deprecation Practices]] — Current lifecycle handling
- [[Confidence Markers]] — For disputed/obsolete knowledge
- [[Source Validation Over Time]] — For citation maintenance
