---
last-reviewed: 2026-03-28
last-updated: 2026-03-28
lifecycle: emerging
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - prompt-engineering
  - templates
gap-status: identified
gap-source: frontier-exploration
---

# Frontier Exploration: Prompt and Template Capture

> How should AI knowledge bases capture and reuse effective prompts, commands, and template notes?

## The Gap

The Seed covers:
- Note creation and extension decisions
- Knowledge source types
- Verification workflows
- Template workflows for recurring knowledge

The Seed does NOT explicitly address:
- **Prompts**: Effective commands/instructions that produce quality vault work
- **Templates**: Reusable structures for note types
- **Exemplars**: High-quality example notes to guide generation

## Why This Matters

AI agents (including this vault's maintenance agent) operate via prompts. Capturing effective prompts is meta-knowledge about knowledge work — just as valuable as the knowledge itself.

Without prompt capture:
- Different sessions produce inconsistent quality
- Effective techniques are lost between sessions
- Hard to replicate successful approaches

## What to Capture

### 1. Prompts (commands to AI agents)

Examples of prompts worth capturing:
- Discovery method selection prompts (like `pick-method.sh` output)
- Quality assessment prompts
- Linking prompts
- Verification prompts
- Conflict resolution prompts

### 2. Templates (note structures)

Templates for recurring note types:
- Seed rule format
- Anti-pattern format  
- Best practice format
- Frontier exploration format
- Seed stress test format

### 3. Exemplars (example notes)

High-quality examples that demonstrate:
- Ideal structure for new notes
- Proper frontmatter usage
- Link density and quality

## Implementation Approaches

### Option A: Separate Prompt Vault

Create a dedicated vault for prompts/templates:
- Prompts.md — Effective commands
- Templates.md — Note structures
- Exemplars.md — Example notes

### Option B: Embed in Operational Notes

Include prompts in CLAUDE.md or operational files:
- Embedded for convenience
- Risk: mixing operational vs. knowledge content

### Option C: Metavault Approach

Create a "vault about the vault" (meta-vault) separate from domain knowledge:
- Captures vault operation, not domain content
- Clear separation of concerns

## Questions for Seed Update

1. Should prompts be captured as knowledge notes?
2. Is template knowledge distinct from content knowledge?
3. How do exemplars relate to verification?

## Related

- [[Frontier Exploration - AI Agent Behavioral Patterns in Knowledge Management]]
- [[AI-Assisted Knowledge Management Seed]]
- [[TOOLS.md]] — Local tool notes