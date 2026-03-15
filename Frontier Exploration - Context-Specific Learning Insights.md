---
last-reviewed: 2026-03-14
confidence: emerging
lifecycle: active
review-by: 2026-03-21
author-type: ai-assisted
tags:
  - frontier-exploration
  - meta-learning
  - personal-knowledge
  - context-specific
---

# Frontier Exploration: Context-Specific Learning Insights

The Seed excels at capturing domain knowledge and general principles, but there's a gap: **how to capture knowledge about your own learning process** - what works specifically for you in your specific context.

## The Problem

General knowledge ("spacing improves retention") is valuable, but context-specific knowledge ("spaced repetition with Anki works for me, but only when I do 20 new cards/day maximum") is often more actionable. The Seed has rules for capturing personal experimentation results, but it doesn't address:

- How to distinguish general principles from your specific adaptation of them
- How to capture the specific parameters that make a technique work for you
- How to document what doesn't work FOR YOU even when it works for others

## Why This Matters

A knowledge base that only contains general principles forces you to rediscover your context every time. Knowledge that works:
- Documents not just WHAT but HOW (specific parameters, tools, timing)
- Captures your constraints and context upfront
- Distinguishes your experience from general advice

## Examples

**General:** "Spaced repetition improves long-term retention"
**Context-Specific:** "Spaced repetition with Anki works for me with 20 new cards/day max. Beyond 30, I burn out and stop. Review in morning, not evening."

**General:** "Write regularly to improve"
**Context-Specific:** "Writing morning pages works for me: 750 words, first thing, before checking email. Evening doesn't work - I'm too tired to be insightful."

**General:** "Build links between notes"
**Context-Specific:** "I need at least 3 links per new note before it feels 'anchored' in my vault. Less than that and I forget the note exists."

## Proposed Seed Rules (Draft)

**Rule:** Distinguish general principles from context-specific adaptations — use `applicability: universal|context-specific` frontmatter to tag whether knowledge applies broadly or only in specific situations.
**Why:** Context-specific knowledge (what works for you) has different maintenance needs than universal knowledge (what works for everyone). Tagging enables appropriate skepticism and adaptation.
**Test:** Can you identify which notes are universal principles vs. your specific adaptations? Do context-specific notes document the specific parameters that make them work?

**Rule:** For context-specific knowledge, document your specific constraints, tools, and parameters — not just the general approach.
**Why:** General advice without specific parameters forces reinvention. "Exercise in the morning" becomes actionable when you know "7am, 30 minutes, gym not home."
**Test:** For notes tagged context-specific: (1) Are specific tools or methods named? (2) Are specific parameters or quantities given? (3) Are constraints (time, energy, budget) documented?

**Rule:** Include a `worked-for:` field on notes describing techniques, capturing who (you) the adaptation worked for and under what conditions.
**Why:** Techniques that work for one person may not work for another. Documenting "worked for: me, when exhausted, with 3 kids" helps readers assess applicability.
**Test:** Can you identify notes with worked-for documentation? Do they specify conditions, not just outcomes?

## Test Cases

### Test Case 1: Learning Technique
**General knowledge:** "Interleaved practice improves retention"
**Your context:** "Interleaved practice works for language learning but NOT for math - different contexts need different approaches. For language: switch between listening/speaking/reading. For math: stick to problem sets."

### Test Case 2: Tool Preference
**General knowledge:** "Use a PKM tool that supports bidirectional linking"
**Your context:** "Obsidian works for me because of mobile app + local-first. Notion would fail because I need offline access. Logseq would work but the mobile experience isn't as smooth."

### Test Case 3: Time Management
**General knowledge:** "Time-blocking improves productivity"
**Your context:** "Time-blocking works only in 90-minute blocks, not 30-minute. Shorter blocks = more transition overhead. Also must do first thing, not later."

## Related

- [[AI-Assisted Knowledge Management Seed]] — Capturing personal experimentation results
- [[Frontier Exploration - User Situational Constraints]] — How constraints affect knowledge applicability
- [[Frontier Exploration - Knowledge Prioritization and Focus Decisions]] — Prioritizing what to capture
- [[Handling Contradictory Sources]] — When your experience contradicts sources
