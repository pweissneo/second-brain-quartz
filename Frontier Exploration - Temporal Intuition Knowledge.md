---
lifecycle: seed-extension
last-updated: 2026-04-06
confidence: medium
knowledge-type: conceptual
access-pattern: decision
tags: frontier-gap, cooking, intuition, timing, process-knowledge
---

# Frontier Exploration - Temporal Intuition Knowledge in Cooking

## The Gap

The current Seed addresses knowledge types, verification methods, and access patterns, but lacks guidance for **temporal process knowledge** — knowledge about when to take action during a time-sensitive process rather than what action to take.

In cooking, this manifests as:
- "When the bread has risen enough" (visual/tactile cues)
- "Cook until the sauce clings to the spoon" (rheological state)
- "Remove from heat when the edges start to bubble" (visual timing)

This is different from **procedural knowledge** (the steps) and **factual knowledge** (temperatures, times). It's **recognition-based knowledge** — the ability to recognize a state that signals "now is the time to act."

## Why This Matters for AI Agents

An AI building a cooking knowledge base following current Seed rules would capture:
- Procedural: "Bring to a simmer, then reduce heat"
- Factual: "Simmer for 10 minutes"

But it would miss:
- Recognition: "Simmer until the surface shimmers and small bubbles form every 2-3 seconds"
- Timing: "The 10-minute timer starts when the liquid first reaches a simmer, not when you turn on the burner"

This creates a verification gap — the AI can verify that steps are documented, but cannot verify that temporal intuition is captured.

## The Missing Seed Rule

**Rule (PROPOSED):** For time-sensitive procedural knowledge, distinguish between **clock time** (measurable duration) and **process state** (recognizable condition). Document both, prioritizing process state for steps where timing varies.

**Why:** Clock time alone is insufficient for many procedural domains. Process state recognition is often more reliable and transferable than fixed durations. Without explicit guidance to capture both, AI agents default to clock-time-only documentation.

**Test:** For procedural notes with time components: (1) Can you identify both clock-time and process-state indicators? (2) Are process states described in recognizable terms (visual, tactile, auditory)? (3) Would someone with domain experience recognize the process state descriptions?

## Domains Where This Applies

- **Cooking:** Visual cues, texture checks, temperature intuition
- **Craft (pottery, woodworking):** "When the clay holds its shape," "when the finish is tacky"
- **Photography:** "When the histogram peaks," "when subject focus locks"
- **Medical:** "When the patient shows X response," "when the needle flashback appears"
- **Any iterative process:** Where human judgment determines timing

## Implementation Guidance

For process-state documentation:
1. Describe the **visual** indicator (what does it look like?)
2. Describe the **tactile** indicator (what does it feel like?)
3. Describe the **auditory** indicator (what does it sound like?)
4. Provide **clock time as fallback** when process state is ambiguous

```yaml
temporal-knowledge:
  clock-time: "10 minutes"
  process-state: "small bubbles every 2-3 seconds across surface"
  visual-cue: "surface shimmers with small, steady bubbles"
  tactile-cue: "gentle bubbling felt through pot bottom"
  auditory-cue: "soft, steady simmer sound"
```

## Related Notes

- [[Frontier Exploration - Embodied Knowledge]] — captures physical skill knowledge
- [[Seed Refinement - Embodied Knowledge Spectrum]] — refines how to capture embodied vs descriptive
- [[Frontier Exploration - Knowledge That Requires Active Practice to Validate]] — verifies process knowledge
