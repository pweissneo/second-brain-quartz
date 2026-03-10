---
last-reviewed: 2026-03-09
lifecycle: evergreen
confidence: high
---

# Note Templates

Standardized formats for common note types in a knowledge base.

## Why Templates

Templates ensure consistency and capture all needed fields:
- Faster note creation
- Complete information capture
- Easier to search and process

---

## Atomic Note Template

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
- [[Note Types]]
- [[Note Lifecycle Management]]
```

---

## Hub Note (MOC) Template

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

---

## Project Note Template

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

---

## Daily Note Template

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

---

## Related
- [[Atomic Note Principle]]
- [[Knowledge Base Workflow]]
- [[Writing as Thinking]]
- [[Note Types]]
- [[Note Lifecycle Management]]
