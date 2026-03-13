---
lifecycle: draft
confidence: emerging
author-type: ai-assisted
last-reviewed: 2026-03-12
tags:
- frontier-exploration
- tool-knowledge
- navigation
- interface-knowledge
---

# Frontier Exploration - Tool-Interface Knowledge

> Knowledge that exists in the mechanics of how we interact with systems rather than as declarative content we capture in notes.

## The Problem

Some knowledge isn't about WHAT - it's about WHERE and HOW in an interface or tool:

- Knowing `Cmd+K` opens the command palette in VS Code
- Knowing `~/.config/` contains configuration files on Linux
- Knowing the "Export" option is under File → Share → Export (not File → Export)
- Knowing the API endpoint `/api/v2/users` returns user data
- Knowing the password is in the 1Password vault under "Work - Server Credentials"

This is **tool-interface knowledge** - knowledge about navigating and operating within systems. It's fundamentally different from:

- **Procedural knowledge**: How to perform a task (how to bake bread)
- **Equipment dependencies**: What physical tools are required (stand mixer, thermometer)
- **Domain knowledge**: What you know about a subject (medical diagnosis, legal precedent)

## Why It Matters for AI Knowledge Bases

When building a KB about a tool or system:

1. **Interface knowledge vs. content knowledge**: A note about "how to use the search feature" is different from "what the search found"
2. **Navigation knowledge expires differently**: Menu paths change with UI updates; keybindings change with versions
3. **Tool knowledge can be generic or specific**: `Ctrl+F` works across most apps; `/api/users` is specific to one API

## How to Handle Tool-Interface Knowledge

### Option 1: Capture as Procedural Notes
Create notes like "VS Code Keyboard Shortcuts" with explicit scope:
```
---
tool: VS Code
version-scope: 1.75+
application-type: interface-navigation
---
```

### Option 2: Link to Official Documentation
For rapidly-changing interfaces, link out rather than capture:
```
See: VS Code Command Palette Documentation (external link)
```

### Option 3: Abstract to General Principles
Some tool knowledge generalizes:
- "Modal dialogs require explicit dismissal"
- "CLI tools prefer flags over prompts"
- "REST APIs use consistent HTTP methods"

These abstract principles become evergreen; specific keybindings are version-dependent.

## Key Distinctions

| Type | Changes With | Capture Strategy |
|------|--------------|------------------|
| Interface layout | UI updates | Link to docs; abstract patterns |
| Keyboard shortcuts | Version updates | Version-scoped notes; link to current cheatsheet |
| File paths | OS/tool version | Abstract to "config location patterns" |
| API endpoints | API version | Version-scoped; document deprecated paths |
| Menu locations | UI redesigns | Abstract to "feature categories" |

## Open Questions

1. **Should tool-interface knowledge be in the same vault as domain knowledge?**
   - Arguments for: Helps users navigate the tool they use to access the KB
   - Arguments against: Different lifecycle (interface changes faster than ideas)

2. **How version-specific should tool notes be?**
   - Too specific: Every minor version needs new notes
   - Too generic: Advice becomes useless

3. **When does tool knowledge become domain knowledge?**
   - Learning vim keybindings is tool knowledge
   - Learning vim as a philosophy of modal editing becomes domain knowledge

## Test Cases

**Test 1**: Can you distinguish tool-interface knowledge from procedural knowledge?
- "How to search in Obsidian" = procedural (steps to perform)
- "Ctrl+P opens quick switcher" = tool-interface (specific keybinding)

**Test 2**: Is version scope appropriate?
- VS Code keybindings: Likely stable within major versions → version-scope appropriate
- Menu paths in web apps: Change frequently → link to docs, don't capture

**Test 3**: Does the knowledge generalize?
- "Most apps use Ctrl+F for search" → General principle, worth capturing
- "Only Photoshop uses Cmd+Opt+Shift+S for specific export" → Too specific, link to docs

## Related

- [[Frontier Exploration - API and External Service Dependencies]] - Related to API endpoint knowledge
- [[Linking Principle]] - The Seed rule about meaningful connections between notes
- [[Graph Navigation Best Practices]] - How to navigate knowledge using graph tools
- [[Stress Test - Seed Rules in Programming Knowledge Bases]] - Testing Seed rules in software development
- [[AI-Assisted Knowledge Management Seed]] - Foundation rules including version scope requirements
