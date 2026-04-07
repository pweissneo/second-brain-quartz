---
last-reviewed: 2026-03-24
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - lifecycle
  - obsolete
  - maintenance
---

# Frontier Exploration - When a Note Has Become Obsolete

> This note explores when and how knowledge notes become obsolete in AI-managed knowledge bases.

## The Challenge

The Seed provides excellent rules for:
- When to split vs merge notes
- How to verify knowledge
- When content is "ready"

However, it lacks guidance on the inverse: **When should a note be retired?**

Knowledge becomes obsolete when:
1. The information it contains is no longer accurate
2. The domain has evolved past the note's content
3. The note has been superseded by better notes
4. The topic it covers no longer exists

Without explicit obsolete-handling rules, vaults accumulate stale knowledge that undermines trust.

## Why It Matters

Consider a programming knowledge base:
- A note about "How to use AngularJS" was once valuable
- AngularJS is now deprecated
- The note now misleads rather than informs

The same applies to:
- Tool recommendations for discontinued products
- Version-specific instructions for deprecated versions
- Fads that have passed
- Historical context that's no longer relevant

### The Trust Problem

Users who trust a knowledge base for accurate information will be misled by obsolete notes. Unlike human-managed bases where authors manually curate, AI-managed bases must explicitly handle lifecycle.

## Obsolescence Detection Strategies

### Strategy 1: Version Timestamps

Add explicit lifecycle markers in frontmatter:

```yaml
---
lifecycle: deprecated
deprecated-since: 2024-06
superseded-by: [[New Topic]]
reason: "Technology no longer maintained"
---
```

**Test:** Can you identify notes where `deprecated-since` date is >6 months old and have not been reviewed?

### Strategy 2: Retrieval Failure Inversion

The Seed mentions tracking retrieval failures (searches returning insufficient results). Obsolescence is the inverse: notes that get retrieved but aren't used.

Track:
- Notes with high incoming links but low engagement
- Notes that are always referenced as "don't do this"
- Notes where linked content is consistently ignored

### Strategy 3: Contested Flagging

When contradictory sources emerge, flag notes for review:

```yaml
---
verification-status: contested
contested-since: 2026-01
dispute-summary: "New research contradicts core assertion"
---
```

### Strategy 4: Domain-Specific Deprecation

For versioned domains (software, protocols, standards):

```yaml
---
applies-until-version: "1.0"
applies-from-version: "0.9"
version-note: "Valid for 0.9.x, broken in 1.0+"
---
```

## Obsolescence Actions

When a note is identified as obsolete:

| Action | When to Use |
|--------|-------------|
| **Deprecate** | Note still has historical value but should not be used |
| **Archive** | Note useful only for historical context |
| **Supersede** | New note renders this one incorrect |
| **Merge** | Obsolete content merged into updated note |
| **Delete | Note is actively harmful with no historical value |

## The Archive Pattern

Create an `_archive/` folder for deprecated notes:
- Keeps the vault clean
- Preserves historical knowledge
- Enables recovery if needed

**Test:** For notes marked `lifecycle: deprecated`, can you find the archived version?

## Stress Test: Web Development Vault

Imagine a web dev knowledge base in 2026:

| Note | Obsolete? | Action |
|------|-----------|--------|
| AngularJS Best Practices | Yes (deprecated 2023) | Deprecate + link to Angular |
| jQuery Selectors | Yes (native JS equivalent) | Supersede |
| IE11 Compatibility | Yes (EOL 2022) | Archive |
| CSS Grid Introduction | No (still valid) | Keep |
| Web Components | No (evolving but valid) | Keep with `lifecycle: evergreen` |

## Related Seed Rules

This note connects to [[Note Lifecycle Management]], [[Frontier Exploration - Knowledge Deprecation and Retirement Criteria]], and [[Frontier Exploration Hub]].

The Seed already has substantial lifecycle and deprecation rules in Section 7 (Evolution). This note supplements them:

1. **Existing (Section 7):** Notes evolve through lifecycle stages: draft → active → evergreen → deprecated → archived
2. **Existing (Section 7):** Deprecation workflow with metadata (deprecated-date, deprecated-reason, replaced-by)
3. **Existing (Section 7):** Obsolescence detection triggers (version-based, temporal, event-based)
4. **Existing (Section 7):** Archive vs. delete criteria

This note adds:
- **Retrieval failure inversion** — detecting obsolescence via low engagement despite high linking
- **Contested flagging** — handling when contradictory sources emerge
- **Domain-specific deprecation** — version ranges for software
- **Stress test framework** — practical examples of obsolescence decisions

---

*This note is a supplement to Seed Section 7 (Evolution), not a replacement.*
