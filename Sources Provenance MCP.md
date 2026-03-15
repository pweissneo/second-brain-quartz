---
last-reviewed: 2026-03-08
lifecycle: evergreen
confidence: high
tags:
  - mcp
  - sources
  - tooling
author-type: human
source-url: https://github.com/pascalweiss/vault-sources-mcp
---

# Sources Provenance MCP

> **GitHub:** https://github.com/pascalweiss/vault-sources-mcp

The **vault-sources MCP server** tracks the provenance of knowledge — which input sources (transcripts, book chapters, articles) generated which notes in the vault.

## Purpose

When an AI agent processes information and creates notes, it's useful to know:
- Where did this information come from?
- Which source inspired this note?
- What's the lineage of this knowledge?

## Available Tools

### db_status
Check the database status.
```
db_status()
```

### db_init
Initialize the provenance database.
```
db_init()
```

### generate_note_id
Generate a unique ID for a note.
```
generate_note_id()
```

### register_note
Register a note with its source.
```
register_note(note_id: "note-id", source_id: "source-id")
```

### mark_note_deleted
Mark a note as deleted.
```
mark_note_deleted(note_id: "note-id")
```

## How It Works

The vault-sources MCP maintains a separate SQLite database (`.vault-sources.sqlite`) that tracks:
- Input sources (documents, conversations, URLs)
- Generated notes
- Links between sources and notes

This enables **provenance tracking** — knowing the origin of every piece of knowledge in your vault.

## Related
- [[Graph Traversal Efficiency]] - For navigating the knowledge graph
- [[AI-Assisted Knowledge Management]] - AI-powered knowledge management
- [[Claude Knowledge Base Setup]] - Setting up AI agents with MCP servers
- [[Exportable Rules]] - Rules that can be exported to other AI agents
- [[Self-Improvement Cycle]] - How the vault uses MCP tools in its improvement cycle
