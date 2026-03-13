---
last-reviewed: 2026-03-08
lifecycle: evergreen
confidence: high
---

# Handling Outdated Information

Keeping your second brain accurate and current.

## The Problem

Notes become outdated:
- Technology changes
- Understanding evolves
- Facts become incorrect
- Links break

## Strategies

### 1. Version Tracking
Add metadata to track changes:

```yaml
---
created: 2025-01-15
modified: 2026-03-07
status: [current|needs-update|deprecated]
---
```

### 2. Deprecation Markers
For outdated notes:

```markdown
# Deprecated: [Old Concept]

> **Status:** This concept has been superseded by [[Note Types]]

**Reason:** [Brief explanation]
**Date:** 2026-03-07
```

### 3. Evergreen Updates
Per [[Note Lifecycle Management]], iterate on notes rather than abandoning:
- Update instead of creating new
- Keep historical context
- Link to updated versions

### 4. Regular Review
Per [[Graph Maintenance]]:
- Quarterly review of old notes
- Check for broken links
- Verify accuracy

## Red Flags

- Notes with old dates
- Contradictions between notes
- Broken [[Wikilinks]]
- Outdated tool recommendations

## Best Practices

1. **Date everything** - Frontmatter with created/modified
2. **Version your ideas** - Don't delete, deprecate
3. **Review regularly** - [[Self-Improvement Cycle]]
4. **Trust but verify** - Don't assume notes are correct

## Related
- [[Note Lifecycle Management]]
- [[Graph Maintenance]]
- [[Self-Improvement Cycle]]
- [[Metadata and Tagging]]
- [[Trust and Verify]]
