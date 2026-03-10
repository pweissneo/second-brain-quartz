---
last-reviewed: 2026-03-09
lifecycle: evergreen
confidence: high
tags:
  - metadata
  - tagging
  - organization
  - convention
---

# Metadata and Tagging

Adding structured data to notes for better organization and search.

## Frontmatter YAML

At the top of each note, use YAML frontmatter:

```yaml
---
tags:
  - note
  - concept
created: 2026-03-07
modified: 2026-03-07
author: Your Name
source: 
---
```

## Tagging Strategy

### When to Tag
- **Topic categories** - Broad themes (e.g., #science, #research)
- **Note type** - What kind of note (note, project, hub)
- **Status** - For projects (active, paused, archived)
- **Domain** - For domain-specific vaults

### Tag Hierarchy
```
#note          # Base tag
#note/concept  # Sub-tag
#project       # Project notes
#hub           # Hub/Map of Content notes
```

## Common Tags (Our Vault)

| Tag | Use |
|-----|-----|
| note | Atomic knowledge notes |
| hub | Hub/Map of Content notes |
| concept | Core concepts |
| reference | External source references |

## Dataview Queries

With Dataview plugin, tags enable powerful queries:

```dataview
LIST FROM #note WHERE date > date(today - 7 days)
```

---

## Best Practices

1. **Tags complement, don't replace links** - Links are stronger connections
2. **Don't over-tag** - 2-5 tags per note is plenty
3. **Be consistent** - Establish conventions early
4. **Use lowercase** - #science not #Science

---

## Related
- [[Atomic Note Principle]]
- [[Graph Navigation MCP]]
- [[Note Templates]]
