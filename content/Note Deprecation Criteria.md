---
last-reviewed: 2026-03-08
lifecycle: evergreen
confidence: high
---

# Note Deprecation Criteria

> When should a note be marked deprecated?

## The Challenge

The Seed says notes should have lifecycle stages (draft → active → evergreen → deprecated), but doesn't specify when to deprecate.

## Clear Criteria

Mark a note deprecated when:

### 1. Contradicted by New Information
- New evidence fundamentally contradicts the note's core claim
- A better note covers the same topic more accurately
- Source material has been superseded

### 2. Redundancy
- Another note covers the same topic more completely
- Content has been merged into other notes
- Multiple notes on same topic exist (consolidate instead)

### 3. Outdated Domain Context
- Technology/process has changed
- Best practices have evolved
- Examples are no longer relevant

### 4. Low Value
- Very few incoming links (isolated)
- Content is too generic to be useful
- Doesn't serve the vault's purpose

## The Deprecation Process

1. **Don't delete** — always mark deprecated, never remove
2. **Add frontmatter:** `lifecycle: deprecated`
3. **Add pointer:** "This topic is now covered by [[New Note Name]]"
4. **Update links** — redirect readers to replacement

## What NOT to Deprecate

- Notes with high incoming links (hub notes)
- Foundational concepts (atomicity, linking principles)
- Notes that are still factually correct
- Personal perspectives that remain valid

## Related
- [[Note Lifecycle Management]]
- [[Handling Outdated Information]]
- [[AI-Assisted Knowledge Management Seed]]
