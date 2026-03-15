---
last-reviewed: 2026-03-12
lifecycle: active
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - onboarding
  - navigation
  - ai-optimization
created: 2026-03-12
---

# Frontier Exploration - Knowledge Base Onboarding

> How do you help new users (human or AI) understand how to navigate and use a knowledge base effectively?

## The Problem

A knowledge base can be perfectly structured according to all Seed rules, but if newcomers can't find their way around, the structure is useless. Unlike human brains that naturally develop "navigation sense" over time, newcomers need explicit guidance.

## Why Current Rules Are Incomplete

The Seed covers:
- Graph traversal efficiency (max 3 hops from _root)
- Hub note creation for topic clustering
- Entry points for different expertise levels

But it lacks guidance on:
- Explicit navigation tutorials for newcomers
- AI agent onboarding prompts
- How to communicate vault conventions
- What to explore first vs. what can wait

## The Onboarding Challenge

### For Humans
- Where do I start?
- What conventions does this vault use?
- How should I navigate?
- What's worth exploring first?

### For AI Agents
- What is this vault about? (purpose)
- What rules govern this vault? (conventions)
- How do I find what I need? (navigation)
- What's the quality standard? (expectations)

## Core Onboarding Elements

### 1. Vault Purpose Statement

The _root.md should contain:
- One-sentence vault purpose
- Primary use case (learning? reference? both?)
- Target audience

**Test:** Can someone understand what this vault is for in 30 seconds?

### 2. Conventions Primer

Create a note explaining:
- Note naming conventions
- Link syntax expectations
- Frontmatter standards
- Any domain-specific formatting

**Test:** Can someone predict how a new note should be named?

### 3. Navigation Guide

Include:
- Recommended first steps
- Key hub locations
- How to find related notes
- How to search effectively

**Test:** Can a newcomer find relevant notes without asking for help?

### 4. Quality Signals

Explain:
- How to identify high-quality notes
- What confidence markers mean
- How to verify information
- When notes were last reviewed

**Test:** Can someone assess note reliability without reading every word?

## Onboarding Note Templates

### For Human Users

```markdown
# Welcome to [Vault Name]

This vault contains [brief description].

## Quick Start
1. Start at [[_root]] for an overview
2. Explore hub notes (like [[Hub Node Creation]]) for specific topics
3. Use search to find specific concepts

## Key Conventions
- Notes use [[Wikilinks]]
- Frontmatter includes last-reviewed dates
- Confidence markers indicate reliability

## Recommended Path
- New to the topic: Start with [[AI-Assisted Knowledge Management Seed]]
- Looking for specific info: Use search
- Want to explore: Follow hub links
```

### For AI Agents

```markdown
# AI Agent Onboarding

## Vault Rules
- Follow Seed rules in [[AI-Assisted Knowledge Management Seed]]
- Every note should be atomic (one idea)
- Links should be meaningful, not decorative

## Navigation
- Start from [[_root]]
- Use hubs to explore topic clusters
- Check note age before trusting temporal data

## Quality Standards
- Look for last-reviewed dates
- Check confidence markers
- Verify sources before citing
```

## Structural Recommendations

### Dedicated Onboarding Note

Create a dedicated note (e.g., "Vault Onboarding" or "_getting-started") that serves as the entry point beyond _root. This allows:
- More detailed guidance than _root can hold
- Visual aids (if supported)
- Step-by-step walkthroughs
- Links to examples

### AI-Optimized Entry Points

For AI agents, ensure:
- Seed is easily accessible
- Conventions are parseable
- Quality indicators are machine-readable
- Entry points exist at multiple expertise levels

### First-Visit vs. Returning Visitor

Consider structuring onboarding for:
- **First visit:** Full introduction, purpose, navigation basics
- **Returning visitor:** What's new, quick reference, search tips

## Testing Onboarding Effectiveness

1. **Newcomer test:** Give someone the vault with no context. Can they find what they need in 5 minutes?

2. **AI agent test:** Ask an AI to find specific information. Does it navigate effectively?

3. **Navigation audit:** Track how long it takes new users to reach edge notes. If >10 minutes, onboarding needs work.

## Related

- [[_root]] — Vault entry point
- [[AI-Assisted Knowledge Management Seed]] — Full rule set
- [[Hub Node Creation]] — Topic clustering
- [[Graph Traversal Efficiency]] — Navigation rules
- [[Frontier Exploration - AI-Optimized Knowledge Bases]] — AI-specific structure
