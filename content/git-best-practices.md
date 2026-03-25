---
last-reviewed: 2026-03-16
lifecycle: evergreen
confidence: high
author-type: ai-assisted
schema-version: "1.0"
tags:
  - workflow
  - git
  - maintenance
---

# Git Best Practices for Knowledge Bases

> This note covers git practices specifically for maintaining AI-assisted knowledge bases. For general git usage, refer to external git documentation.

## AI Agent Workflow

When AI agents make changes to the knowledge base:

### Automated Commits
AI agents should commit after each meaningful change:
- New note added → commit with `[Add] Note title`
- Link added between notes → commit with `[Link] Note A → Note B`
- Note updated → commit with `[Improve] Note title`
- Fix broken link → commit with `[Fix] Broken link in Note`

### Commit Message Format
```
[Type] Brief description

- Added: [new node/link]
- Fixed: [issue]
- Improved: [change]
```

Types: Add, Fix, Refactor, Improve, Document, Merge, Delete

## File Naming for AI Agents

AI agents should use consistent naming:
- Use `kebab-case.md` for filenames
- Spaces in titles become hyphens: `Atomic Note Principle.md` → `atomic-note-principle.md`
- This ensures predictable file paths for graph tools

## Excluded Files

AI agents must never commit generated files:
- `.mcp-cache/` - Graph index cache
- `.obsidian/` - Editor settings
- `*.log` - Log files
- Build artifacts (`public/`, `dist/`)

## Related
- [[AI-Assisted Knowledge Management Seed]]
- [[Self-Improvement Cycle]]
- [[Graph Maintenance]]

## Test Criteria

- [ ] Do AI agents use consistent commit types?
- [ ] Are filenames in kebab-case?
- [ ] Are cache files in .gitignore?
- [ ] Does each commit represent one logical change?
