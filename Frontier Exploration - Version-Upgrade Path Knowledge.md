---
last-reviewed: 2026-03-23
last-updated: 2026-03-23
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
tags:
  - knowledge-management
  - version-upgrade
  - migration
  - frontier-exploration
---

# Frontier Exploration - Version-Upgrade Path Knowledge

> Knowledge about HOW to upgrade from one version to another, not just THAT a new version exists.

## The Gap

The Seed covers version-scoped knowledge (noting which version/framework a note applies to) and deprecation tracking (marking when knowledge becomes obsolete). However, it lacks guidance for capturing **upgrade path knowledge** — the practical guidance on how to transition from an old version to a new version.

When you learn that a tool you wrote about has released a major version update, you face questions the Seed doesn't address:

- **What actually changed?** Not just release notes, but what matters for your existing knowledge
- **How do you migrate?** Step-by-step guidance for transitioning from v1 to v2
- **Is it worth it?** When should you upgrade immediately vs. wait vs. stay on the old version?
- **What breaks?** Known incompatibilities or breaking changes that affect your existing notes

This is distinct from:
- **Deprecation** (marking old knowledge as obsolete)
- **Version scope** (tagging which version knowledge applies to)
- **Migration planning** (vault-level tool migration)

Upgrade path knowledge is domain-specific — it's about the tools, frameworks, and technologies you write about, not the vault itself.

## Why This Matters

1. **Practical value** — Users upgrading tools need migration guidance, not just "new version exists"
2. **Captures decision context** — Why you chose to upgrade (or not) is valuable personal knowledge
3. **Prevents knowledge fragmentation** — Without upgrade paths, old version notes and new version notes pile up without connection
4. **Enables future migrations** — When v3 releases, v1→v2→v3 paths become chainable

## Knowledge Structure

For version-upgrade knowledge, capture:

```yaml
version-upgrade: true
from-version: "1.x"
to-version: "2.x"
upgrade-status: pending|in-progress|completed|skipped
migration-type: minor|major|breaking
```

And in content:
- **Summary of changes** — What new in v2 that matters
- **Migration steps** — How to move from v1 to v2
- **Breaking changes** — What doesn't work the same
- **Decision rationale** — Why upgrading (or not) makes sense
- **Rollback plan** — How to go back if needed

## Connection to Existing Seed Rules

This extends:
- **Version-scoped knowledge** (Edge case stress test 2026-03-17 in diminishing returns)
- **Deprecation workflow** (Handling incorrect or outdated knowledge)
- **Tool-executable knowledge** (execution-type and execution-environment)
- **Compound conditions** (upgrade may have prerequisites)

## Test Cases

1. **Framework upgrade** — Learning that a web framework released v2. You capture: what changed, how to migrate existing code, whether the upgrade is worth it for your projects.

2. **Library deprecation** — A library you documented is deprecated. You capture: alternatives, migration timeline, whether to switch now or later.

3. **Language version** — A programming language released a new major version. You capture: new features, breaking changes, whether to upgrade your existing code.

4. **Tool sunset** — A tool you used is being discontinued. You capture: replacement options, migration path, timeline for transition.

## Questions for Seed Update

1. Should version-upgrade knowledge be mandatory for versioned tools?
2. How to handle chains of upgrades (v1→v2→v3)?
3. Should upgrade paths be separate notes or integrated into existing notes?
4. How to handle contested upgrades (some recommend, others warn against)?

## See Also

- [[Seed Stress Test - Version-Upgrade Path Knowledge]]
- [[Frontier Exploration - Knowledge Deprecation and Retirement Criteria]]
- [[Frontier Exploration - Tool-Executable Knowledge]]
- [[Frontier Exploration - Real-Time API-Dependent Knowledge]]