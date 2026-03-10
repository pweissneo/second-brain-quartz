---
last-reviewed: 2026-03-08
lifecycle: active
confidence: high
---

# Wikilinks

**Wikilinks** (also called internal links or bidilinks) are inline links using double square bracket syntax: `[[Atomic Note Principle]]`. They are the primary connection mechanism in this vault.

## Syntax Reference

| Type | Syntax | Renders As |
|------|--------|------------|
| Direct | `[[Atomic Note Principle]]` | Atomic Note Principle |
| With label | `[[Linking Principle\|Connection Quality]]` | Connection Quality |
| Section | `[[Graph Navigation MCP#Available Tools]]` | Graph Navigation MCP → Available Tools |

## Why Wikilinks Over Markdown Links

1. **No IDs needed** — Link by title, not by arbitrary identifier
2. **Auto-complete** — Tools suggest existing notes as you type
3. **Refactoring friendly** — Rename a note, links update automatically
4. **Readable source** — `[[Graph Navigation MCP]]` is clearer than `[Note 123](./notes/note-123.md)`
5. **Bidirectional by default** — Most tools show backlinks automatically

This aligns with the Seed rule requiring flat file structure with wikilinks — no nested folders.

## Creating Links Effectively

### The "Create as You Link" Pattern

When you write `[[New Concept]]` and the note doesn't exist:
- Most tools prompt to create it
- This encourages incremental note creation
- Prevents "note hoarding" where ideas are saved but never turned into notes

### Link Text Matters

| Prefer | Avoid |
|--------|-------|
| `[[Atomic Note Principle]]` | `[[ANP]]` (unclear abbreviation) |
| `[[Note Naming Conventions\|Naming]]` for variety | Same link text repeated |

### When NOT to Link

- Decorative use just to add links
- Keyword matches without conceptual connection
- Forcing links to meet a quota (quality over quantity)

See [[Linking Principle]] for the "why follow?" test every link should pass.

## Wikilinks and Graph Structure

Wikilinks create the knowledge graph:
- **Forward links**: Notes this note points to
- **Backlinks**: Notes that point to this note
- Together they form navigable paths

The Seed requires every note be reachable from [[_root]] in 3 hops or fewer. Wikilinks make this possible through:
- Hub notes ([[Hub Node Creation]])
- Dense but meaningful connections ([[Graph Traversal Efficiency]])

## Tool Support

Most modern knowledge management tools support wikilinks:
- **Obsidian**, **Logseq**, **RemNote** — Native support
- **Roam Research** — Uses double bracket syntax
- **Quartz**, **A庐山** — Static site generators parse wikilinks

This vault's [[Graph Navigation MCP]] can query the link structure programmatically.

## Best Practices Summary

1. Use descriptive titles: `[[Atomic Note Principle]]` not abbreviations
2. Create notes as you link — if it doesn't exist, make it
3. Bidirectional is automatic — most tools show backlinks
4. Test every link with the "why follow?" test from [[Linking Principle]]
5. Avoid over-linking — each link should add genuine value

## Related
- [[Linking Principle]] — Quality criteria for meaningful connections
- [[Note Insertion Strategy]] — Where to add new linked notes
- [[Graph Traversal Efficiency]] — Navigation within 3 hops
- [[Hub Node Creation]] — When to create navigation hubs
- [[Graph Maintenance]] — Keeping the graph healthy
