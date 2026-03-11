---
last-reviewed: 2026-03-08
lifecycle: evergreen
confidence: high
level: concrete
---

# Claude Knowledge Base Setup

> How to bootstrap an AI-friendly knowledge base for Claude, Codex, Gemini, and other AI agents.

---

## Agent Configuration Files

| Agent | Config File | Purpose |
|-------|-------------|---------|
| **Claude** | `CLAUDE.md` | Instructions for Claude Code |
| **Codex** | `AGENTS.md` | Agent behavior guidelines |
| **Gemini** | `.gemini/rules` | Gemini instructions |
| **OpenAI** | `instructions.md` | Custom guide |

This guide focuses on **CLAUDE.md**, but principles apply to all.

### CLAUDE.md Template

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

### AGENTS.md Template (Optional)

For Codex or multi-agent setups.

```markdown
# AGENTS.md

## Agent Behavior
- Always read CLAUDE.md first
- Follow vault principles
- Commit changes to "Neo" branch
```

---

## Agent Workflow

```
1. Read CLAUDE.md for instructions
2. Pull latest: git pull origin main
3. Navigate: graph_search, graph_hubs
4. Read relevant notes
5. Make one atomic change
6. Commit: git add -A && git commit -m "[Type] What"
7. Push: git push origin main
```

---

## Quick Start

1. Create `CLAUDE.md` with vault purpose
2. Add `_root.md` as entry point
3. Add 3 foundational notes:
   - [[Atomic Note Principle]]
   - [[Linking Principle]]
   - [[Graph Traversal Efficiency]]
4. Configure MCP servers
5. Add to Git and push

---

## Detailed Guides

- [[Graph Navigation MCP]] - Graph query tools
- [[Sources Provenance MCP]] - Source tracking
- [[Git Best Practices]] - Branching, commits for AI agents

### MCP Configuration

Configure `.mcp.json` for vault navigation:

```json
{
  "mcpServers": {
    "vault-graph": {
      "command": "node",
      "args": ["/path/to/vault-graph.js"],
      "env": { "VAULT_PATH": "/path/to/vault" }
    },
    "vault-sources": {
      "command": "node", 
      "args": ["/path/to/vault-sources-mcp/dist/src/index.js"],
      "env": { "VAULT_PATH": "/path/to/vault" }
    }
  }
}
```

---

## Related
- [[AI-Assisted Knowledge Management Seed]]
- [[Self-Improvement Cycle]]
- [[Graph Navigation MCP]]
