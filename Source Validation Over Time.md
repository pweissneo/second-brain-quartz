---
last-reviewed: 2026-03-09
lifecycle: emerging
confidence: emerging
tags:
  - source-management
  - validation
  - quality
---

# Source Validation Over Time

> Citations are only as good as their availability. A cited source that no longer exists is noise, not knowledge.

## The Problem

The Seed requires citing sources, but cited URLs rot over time. A note citing a blog post from 2023 may still exist in the vault in 2026, but the link may be dead. The knowledge base accumulates "ghost citations" — references that look legitimate but lead nowhere.

## When to Validate

- **Before publishing** — Always check that a source URL works before adding it
- **During reviews** — Include source URL validation in the review checklist  
- **Periodically** — Run link checks on notes older than 6 months
- **On discovery** — When you encounter a dead link, flag it immediately

## How to Validate

1. **Automated checks** — Use tools that check HTTP status codes for all external links
2. **Manual spot-checks** — For critical sources, actually visit the page
3. **Archive fallback** — When a source is dead, check if archive.org has a snapshot

## What to Do With Dead Sources

| Situation | Action |
|-----------|--------|
| Source moved | Update to new URL if found |
| Source archived | Add archive.org link alongside dead link |
| Source truly gone | Mark as `source: unavailable`; keep citation for provenance |
| Content contradicted | Create synthesis note; deprecate old note |

## Confidence Signaling

When citing sources, include confidence metadata:

- `source: live` — URL verified working within last 30 days
- `source: archived` — Only archive.org snapshot available  
- `source: unavailable` — Source no longer accessible

## Related

- [[Handling Temporal Knowledge]] — General guidance on stale content
- [[Trust and Verify]] — Quality validation principles
- [[Sources Provenance MCP]] — Source tracking tooling
