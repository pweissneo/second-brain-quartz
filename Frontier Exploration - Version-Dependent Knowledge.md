---
last-reviewed: 2026-03-10
confidence: emerging
lifecycle: active
tags:
  - frontier-exploration
  - knowledge-management
  - version-dependency
  - temporal-knowledge
---

# Frontier Exploration - Version-Dependent Knowledge

> How to handle knowledge that only applies to specific software versions, tool releases, or library iterations
> 
> **Note:** This note previously proposed Seed rules that are now implemented in the Seed. See [[AI-Assisted Knowledge Management Seed]] for the authoritative rules.

## The Problem

Some knowledge is not just "true in this context" but "true ONLY in this version". Examples:
- "Python best practices" differs between Python 2 and Python 3
- "React Hooks" require React 16.8+
- "CSS Grid" support varies by browser versions
- "Kubernetes deployment" patterns change with each major K8s release

The Seed handles:
- **Jurisdiction** (legal/regional scope)
- **Climate zones** (environmental scope)  
- **Framework scope** (applies-to metadata)

But it lacks explicit handling for **version dependencies** — knowledge whose validity changes with software/tool/library versions.

## Why This Matters

1. **Staleness is systematic, not random**: Unlike "best practices" that evolve slowly, version-specific knowledge becomes obsolete predictably (when the version reaches EOL or is superseded)

2. **Migration paths need tracking**: Moving from version X to Y often requires specific steps; a knowledge base should capture this

3. **AI agents can't infer versions**: An AI seeing "how to configure X" doesn't know if it's for v1, v2, or v3 without explicit metadata

## Seed Rules (Now Implemented)

The Seed now includes version-scope handling. See [[AI-Assisted Knowledge Management Seed]] for the authoritative rules:

- **Version scope rule:** For knowledge that applies only to specific software versions, include explicit version scope in frontmatter.
- **EOL review rule:** For rapidly-evolving domains, include an `eol-estimate` or `review-when` field.
- **Migration hub rule:** Create version-migration hub notes when moving between major versions affects 5+ notes.

This note is retained for historical context and as a practical example of applying version-scoped knowledge.

## Edge Cases

- **Long-term support (LTS) versions**: Some versions have extended support. Mark with `version-lts: true` and note the support end date
- **Rolling releases**: For continuous deployment (Chrome, Firefox), use `version: latest` and note the knowledge was verified against latest at `last-reviewed` date
- **Breaking changes**: When a new version introduces breaking changes, create a synthesis note comparing versions rather than overwriting

## Related Notes
- [[Frontier Exploration - Framework-Dependent Knowledge]] — Related but focuses on "framework" as conceptual approach, not version numbers
- [[Handling Temporal Knowledge]] — How to handle time-sensitive data
- [[Frontier Exploration - Knowledge Abstraction Levels]] — Version knowledge sits at the application layer
