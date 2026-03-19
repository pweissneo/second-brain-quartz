---
last-reviewed: 2026-03-18
lifecycle: evergreen
confidence: high
author-type: ai-assisted
tags:
  - frontier-exploration
  - access-patterns
  - retrieval
  - use-cases
  - implementation
created: 2026-03-18
---

# Frontier Exploration - Knowledge Access Patterns

> Implementation depth for the presentation-style rule — practical strategies for organizing knowledge by access pattern.

## Seed Rule Reference

This note expands on the Seed rule:
> **Rule:** Match note structure to primary purpose — distinguish reference notes (optimized for retrieval) from explanatory notes (optimized for understanding).

## The Core Challenge

Reference and explanatory notes have genuinely conflicting structural needs:

| Aspect | Reference | Explanatory |
|--------|-----------|-------------|
| **Structure** | Dense headers, bullets | Narrative flow, prose |
| **Length** | Concise, scannable | Comprehensive, detailed |
| **Examples** | Inline, minimal | Full context, expandable |
| **Links** | Cross-references | Background context |

## Implementation Strategies

### Strategy 1: Single Note with Clear Sections

For notes that must serve both purposes:

```markdown
# Command Reference

## Quick Lookup (Reference)
- Syntax: `command [options]`
- Common flags: -a, -b, -c

## Deep Dive (Explanatory)
### How It Works
[Explanation of underlying mechanism]

### Examples with Context
[Full examples showing usage]
```

**When to use:** Both purposes are frequently needed, content is short enough to not overwhelm.

### Strategy 2: Hub + Separate Notes

Create a hub that links to separate reference and explanatory notes:

```
[[Topic Hub]]
  ├── [[Topic - Quick Reference]]
  └── [[Topic - Deep Explanation]]
```

**When to use:** One purpose dominates, or content is lengthy.

### Strategy 3: Collapsible Sections

Use markdown details/summary for hybrid access:

```markdown
<details>
<summary>Quick Reference</summary>

[Scannable content here]

</details>

## Deep Explanation

[Narrative content here]
```

**When to use:** Markdown tools support collapsible sections, user prefers single file.

## Domain-Specific Guidance

### API/Documentation Vaults
- Heavily reference-optimized
- Use Strategy 1 with quick-reference section at top
- Link to separate explanatory tutorials

### Learning Vaults
- Heavily explanatory-optimized
- Use Strategy 2 to keep reference as sidebar
- Include quick-recall sections within explanatory notes

### Mixed-Use Vaults
- Assess dominant access pattern per note
- Default to explanatory unless proven otherwise
- Track actual access patterns to guide optimization

## Testing Access Pattern Choice

Ask:
1. **Primary question:** Will users mostly "look up" or "learn from" this?
2. **Content fit:** Does the structure match the purpose?
3. **User feedback:** Do users struggle to find what they need?

## Related

- [[Note Types and Templates]]
- [[Frontier Exploration - Context-Gated Knowledge]]
- [[AI-Assisted Knowledge Management Seed]] — see "Match note structure to primary purpose" rule
