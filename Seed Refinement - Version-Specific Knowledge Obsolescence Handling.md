---
last-reviewed: 2026-04-02
last-updated: 2026-04-02
lifecycle: seed-refinement
confidence: emerging
author-type: ai-assisted
knowledge-type: conceptual
access-pattern: lookup
tags:
  - seed-refinement
  - lifecycle
  - obsolescence
  - versioning
resolution-status: absorbed
resolution-note: "Version-specific handling complements (not duplicates) general deprecation workflow in Seed lines 2147+. This note remains as domain-specific extension - not resolved, just distinct scope."
---

# Seed Refinement - Version-Specific Knowledge Obsolescence Handling

> How should knowledge bases handle knowledge that becomes obsolete for specific versions while remaining valid for others?

## The Gap

The Seed has robust rules for:
- Note lifecycle stages (draft → active → evergreen → deprecated → archived)
- Deprecation workflow (deprecated-date, deprecated-reason, replaced-by)
- Obsolescence detection (version-based, temporal, event-based)

However, it lacks guidance on **version-specific obsolescence** — when knowledge is correct for one version but incorrect for another. This differs from:
- **Complete deprecation:** Knowledge no longer valid anywhere
- **Temporal obsolescence:** Knowledge was time-bound and expired
- **Supersession:** Better knowledge replaced it

Version-specific obsolescence applies when:
- Software versions have breaking changes
- Protocols evolve with new versions
- Standards update with new specifications
- Tools change behavior between versions

## Why This Matters

Consider a programming knowledge base:
- Note: "Use `array.map()` for transformation" — valid in ES6+
- Note: "Use `for` loops for performance" — outdated in modern JS engines

Without version-specific handling, both notes appear equally valid. Users can't distinguish "this works in current version" from "this only works in old version."

## The Missing Rule

**Rule:** For version-sensitive knowledge, include explicit `applies-from-version` and/or `applies-until-version` frontmatter to define validity boundaries.

**Why:** Presenting version-specific knowledge as universally valid misleads users. Version boundaries provide clear validity signals that enable appropriate use.

**Test:** For version-sensitive notes (software, protocols, standards): (1) Do notes include version boundary markers? (2) Can users identify which versions the knowledge applies to? (3) Are there clear links to alternative notes for different versions?

**Implementation:**
```yaml
applies-from-version: "2.0"      # Valid starting this version
applies-until-version: "3.0"      # Valid until this version (exclusive)
valid-for-versions: ["2.0", "2.1", "2.2"]  # Explicit list

# For version ranges with clear boundaries
version-boundary-note: "Breaking changes in 3.0 documented in [[Breaking Changes in v3]]"
```

## Connection to Existing Seed Rules

This refinement extends [[Note Lifecycle Management]] (Section 7 - Evolution):

- **Existing:** `lifecycle: deprecated` marks notes no longer valid
- **Gap:** No mechanism to mark notes VALID but LIMITED to specific versions

The refinement adds:
- Version boundary markers for precision
- Clear linkage to version-specific alternatives
- Explicit "this applies to version X but not Y" signaling

## Stress Test: Package Management

**Domain:** Package manager knowledge base

| Note | Current Seed | With Refinement |
|------|--------------|-----------------|
| `npm install --save` | Deprecated (general statement) | `applies-until-version: "5.0"`, `valid-for: ["4.x"]` |
| `npm install` (v7+) | No version markers | `applies-from-version: "7.0"` |
| `package-lock.json` behavior | Mixed guidance | Separate notes per version with boundaries |

## Related Notes

- [[Frontier Exploration - When a Note Has Become Obsolete]] — general obsolescence
- [[Note Lifecycle Management]] — lifecycle stages
- [[Frontier Exploration - Knowledge Deprecation and Retirement Criteria]] — deprecation workflow
- [[Seed Stress Test - Version-Upgrade Path Knowledge]] — version migration