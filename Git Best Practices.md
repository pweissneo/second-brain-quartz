---
last-reviewed: 2026-03-08
lifecycle: evergreen
confidence: high
tags:
  - workflow
  - git
  - maintenance
---

# Git Best Practices for Knowledge Bases

Using Git properly keeps the knowledge base clean and maintainable.

## File Naming
Use consistent naming conventions:
- Use `kebab-case.md` or `CamelCase.md`
- Spaces in titles become hyphens in filenames
- Example: `Atomic Note Principle.md`

## Branching Workflow
Create a branch before making changes:

```bash
git checkout -b branch-name  # Create branch
## Make changes
git add -A
git commit -m "[Type] Description"
git push origin branch-name
```

## Rules

### 1. Atomic Commits
Each commit should represent **one logical change**:
- ✅ Good: "Add Zettelkasten Method node"
- ❌ Bad: "Self-improvement iteration 2"

### 2. Descriptive Messages
Commit messages should describe the **knowledge added**:
```
Add atomic node about [topic]
Add linking principle for [concept]
Refactor [node] into smaller atomic nodes
```

### 3. Ignore Cache Files
Never commit generated files:
- `.mcp-cache/` - Graph index cache
- `.obsidian/` - Editor settings
- `.vault-sources.sqlite` - Provenance database
- `*.log` - Log files

### 4. Iteration Log Strategy
The [[Self-Improvement Cycle]] tracks iterations. It should **not** be updated in every commit. Instead:
- Only log significant improvements
- Or keep the log locally and sync periodically

## Commit Template
```
[Type] Brief description

- Added: [new node/link]
- Fixed: [issue]
- Improved: [change]
```

Types: Add, Fix, Refactor, Improve, Document

## Related
- [[AI-Assisted Knowledge Management Seed]]
- [[Claude Knowledge Base Setup]]
- [[Self-Improvement Cycle]]
- [[Graph Maintenance]]
