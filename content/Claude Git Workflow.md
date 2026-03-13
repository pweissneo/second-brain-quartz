# Claude Git Workflow

Git workflow for AI agents working in knowledge bases.

---

## File Naming

- Use `kebab-case.md` or `CamelCase.md`
- Spaces in titles become hyphens in filenames
- Example: `Atomic Note Principle.md`

---

## Branching

AI should create a branch before changes:

```bash
git checkout -b Neo  # Create branch
# Make changes
git add -A
git commit -m "[Type] Description"
git push origin Neo
```

---

## Commit Format

```
[Type] Brief description

- Added: [new node/link]
- Fixed: [issue]
- Improved: [change]
```

Types: Add, Fix, Refactor, Improve, Document

---

## Related
- [[Claude Knowledge Base Setup]]
- [[Graph Maintenance]]
- [[Self-Improvement Cycle]]
