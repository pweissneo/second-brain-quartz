---
last-reviewed: 2026-03-08
lifecycle: evergreen
confidence: high
---

# Trust and Verify in Knowledge Management

Don't trust your notes blindly - verify and update.

## The Problem

Your notes may contain:
- Outdated information
- Misremembered facts
- Incomplete understanding
- Source rot

## Trust, But Verify

### 1. Source Verification
Always cite sources. When you can't verify, mark note:
```yaml
---
verified: false
---
```

### 2. Freshness Check
Review notes periodically:
- Tech notes: 6 months
- Concepts: 1 year
- History: 2 years

### 3. Contradiction Detection
When you find contradictions:
- Don't delete either note
- Add context explaining both
- Note which is more current

### 4. Update, Don't Replace
Per [[Note Lifecycle Management]]:
- Keep history of changes
- Note what changed and why
- Link to deprecated versions

## Red Flags

| Flag | Action |
|------|--------|
| Old created date | Verify accuracy |
| No sources | Add or mark unverified |
| Contradiction | Add context |
| Broken links | Fix or update |

## The Verification Habit

1. When using a note, glance at frontmatter
2. If old, schedule verification
3. When verifying, check sources
4. Update frontmatter `last-reviewed` date

## Related
- [[Handling Temporal Knowledge]]
- [[Note Lifecycle Management]]
- [[Metadata and Tagging]]
- [[The Forgetting Curve]]
- [[Sources Provenance MCP]]
