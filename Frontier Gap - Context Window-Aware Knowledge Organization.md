---
last-reviewed: 2026-04-03
last-updated: 2026-04-03
lifecycle: emerging
confidence: medium
author-type: ai-assisted
gap-status: resolved
gap-priority: medium
gap-phase: resolved
gap-severity: useful
gap-source: frontier-exploration
resolved: 2026-04-04
resolved-by: [[Seed Refinement - Context Window-Aware Knowledge Organization]]
---

# Frontier Gap: Context Window-Aware Knowledge Organization

> This note captures an identified gap in the Seed's coverage: how should knowledge bases adapt when the AI agent has limited context window?

## The Problem

The Seed assumes AI agents can process entire vaults, run graph queries, and evaluate notes holistically. But real AI deployments have context windows:

- Claude (Anthropic): 100K-200K tokens
- GPT-4 (OpenAI): 128K tokens  
- Gemini (Google): 128K-1M tokens
- Local models: Often <8K tokens

When context is limited, agents cannot:
- Load the full vault graph at once
- Run comprehensive gap analyses
- Evaluate all Seed rules simultaneously
- Maintain long working memory of vault structure

## What the Seed Lacks

1. **Context-budgeting rules** — How to organize knowledge so it fits in limited context
2. **Chunking strategies** — How to split large vaults for processing
3. **Prioritization under constraint** — Which Seed rules to apply first when you can't apply all
4. **Summarization protocols** — How to create compact vault representations
5. **Progressive loading** — How to load vault portions strategically

## Why It Matters

Without context-aware rules:
- Large vaults (>500 notes) become unmanageable for smaller context models
- Vault health automation fails when agents can't see the full picture
- Gap identification becomes incomplete
- Seed stress tests cannot run on limited-context agents

## Related Notes

- [[Seed Refinement - Vault Self-Monitoring and Health Intelligence]] — Assumes full vault access
- [[Frontier Exploration - Automated Vault Health Monitoring]] — Same problem
- [[Seed Gap - Multi-Vault Migration Knowledge]] — Related but about platform migration, not context

## Test for Resolution

When this gap is addressed, the Seed should include:
1. A rule about organizing vaults for context-limited processing
2. A test that checks if a vault can be analyzed in <50K tokens
3. A strategy for progressive vault loading
4. Guidance on when to use summarization vs. filtering

## Proposed Rule (Draft)

**Rule:** For vaults exceeding 50% of typical context window capacity, implement context-budgeting strategies — chunked analysis, progressive loading, or summarization layers.
**Why:** Without context-budgeting, large vaults become unmanageable for AI agents with limited context, breaking automated maintenance.
**Test:** (1) Can the vault be analyzed in under 50K tokens? (2) Is there a chunking strategy for full coverage? (3) Is summarization layer available for overview tasks?

---

*This gap was identified during FRONTIER_EXPLORATION on 2026-04-03. The domain tested was AI agent constraints.*
