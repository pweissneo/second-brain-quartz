---
last-reviewed: 2026-03-10
lifecycle: evergreen
confidence: high
tags:
  - templates
  - methodology
  - structure
---

# Note Types and Templates

Different notes serve different functions in a knowledge base. This note covers both the types and standardized formats.

## Note Types by Function

### 1. Atomic Notes
Single idea, one concept. The building blocks.
- **Purpose:** Core knowledge units
- **Example:** "Photosynthesis" - one biological process, explained

### 2. Hub Notes (MOC)
Notes that organize related atomic notes.
- **Purpose:** Navigation and overview
- **Example:** "Biology MOC" links to all biology notes

### 3. Structure Notes
Notes about organization, not content.
- **Purpose:** System documentation
- **Example:** "Exportable Rules", "_root.md"

### 4. Project Notes
Time-bound, outcome-focused.
- **Purpose:** Track completion
- **Example:** "Build Knowledge Base Vault"

### 5. Reference Notes
External source storage.
- **Purpose:** Provenance
- **Example:** Book notes, article highlights

### 6. Archive Notes
Inactive, completed, deprecated.
- **Purpose:** Historical record
- **Example:** Old project notes

## Note Types by Lifecycle

| Type | When Created | When Archived |
|------|-------------|---------------|
| Seedling | First capture | After first link |
| Bud | First connections | After mature |
| Evergreen | Multiple links | Never (iterated) |

---

## Note Templates

Standardized formats ensure consistency and capture all needed fields.

### Atomic Note Template

```markdown
---
tags:
  - note
---

# [Concept Name]

Brief one-line definition.

## Key Points
- Point 1
- Point 2
- Point 3

## Why It Matters
[Explain significance in 1-2 sentences]

## Examples
- Example 1
- Example 2

## Related
- [[Atomic Note Principle]]
- [[Note Lifecycle Management]]
```

### Hub Note (MOC) Template

```markdown
# [Topic] MOC

Entry point for [topic area].

## Core Concepts
- [[Atomic Note Principle]] - One idea per note
- [[Linking Principle]] - Meaningful connections
- [[Graph Traversal Efficiency]] - Navigation within 3 hops

## Sub-Topics
### [Sub-topic A]
- [[Atomic Note Principle]]
- [[Linking Principle]]

### [Sub-topic B]
- [[Graph Traversal Efficiency]]
- [[Hub Node Creation]]

## Related
- [[Knowledge Graph Structure]]
- [[Graph Maintenance]]
```

### Project Note Template

```markdown
---
tags:
  - project
  - [domain]
status: [active|paused|completed]
---

# [Project Name]

## Goal
[One sentence: what are you trying to achieve?]

## Status
- [ ] Task 1
- [ ] Task 2
- [ ] Task 3

## Notes
[Project-specific notes]

## Links
- [[Knowledge Base Workflow]]
```

### Daily Note Template

```markdown
---
tags:
  - daily-note
date: {{YYYY-MM-DD}}
---

# Daily Notes - {{Month DD, YYYY}}

## Inputs
- 

## Thoughts
- 

## To Process
- 

## Done
- [ ]
```

## Related
- [[Atomic Note Principle]]
- [[Knowledge Base Workflow]]
- [[Writing as Thinking]]
- [[Note Lifecycle Management]]
- [[Stress Test - Expertise Level Rule in Foreign Language Learning]] — Example of expertise-level testing
