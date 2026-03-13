# Claude Agent Configuration

Setting up CLAUDE.md and AGENTS.md for AI agents.

---

## CLAUDE.md Template

The main instruction file. Put in vault root.

```markdown
# CLAUDE.md - [Vault Name]

## Purpose
[What this knowledge base covers]

## Structure
- Notes are atomic (one idea per file)
- Use [[Wikilinks]] to connect notes
- MCP servers: vault-graph, vault-sources

## Agent Guidelines
- Read before responding
- Follow [[Atomic Note Principle]]
- Use graph tools to navigate
- Make one logical change per commit
```

---

## AGENTS.md Template (Optional)

For Codex or multi-agent setups.

```markdown
# AGENTS.md

## Agent Behavior
- Always read CLAUDE.md first
- Follow vault principles
- Commit changes to "Neo" branch
```

---

## Related
- [[Claude Knowledge Base Setup]]
- [[Claude Git Workflow]]
