---
last-reviewed: 2026-04-02
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
gap-status: identified
gap-priority: medium
gap-type: frontier-gap
discovered: 2026-04-02
gap-source: frontier-exploration
analysis-notes: "Exploring frontier gap: provisional/evolving knowledge lifecycle. Seed has gap lifecycle and note lifecycle, but no guidance for knowledge that is genuinely in transition — being synthesized, crystallizing, or pending resolution."
tags:
  - frontier-gap
  - provisional-knowledge
  - evolving-concepts
  - meta-knowledge
---

# Frontier Gap - Provisional and Evolving Knowledge Lifecycle

## The Gap

The Seed covers note lifecycle (creation → review → verification → maintenance → deprecation) and gap lifecycle (identified → analyzed → proposed → integrated → deprecated). But there's a category neither covers: **knowledge that is genuinely in transition** — ideas being synthesized, concepts crystallizing, or conclusions pending.

Examples of provisional/evolving knowledge:
- A note synthesizing multiple sources where synthesis is incomplete
- A concept that emerged from pattern detection but needs more validation
- A decision note where the "right" answer is still being researched
- A frontier exploration note that captured insights but hasn't crystallized into actionable guidance
- A Seed Gap note that's been "analyzed" for months without progressing to "proposed"

## Why This Matters

Without guidance for provisional knowledge:

1. **Synthesis orphans**: Multi-source synthesis notes get created but never marked as "complete" — they linger in perpetual "in progress" state
2. **Frontier note stagnation**: Frontier Exploration notes capture insights but have no path to become Seed rules or be merged into existing content
3. **Analysis paralysis**: When knowledge is genuinely uncertain, agents don't know how to mark it — it feels wrong to tag it "verified" but also wrong to leave it completely unmarked
4. **False confidence**: Notes that are "being synthesized" may appear more certain than they are, misleading retrieval

## What the Seed Currently Covers

### Gap Lifecycle (Partial)
- Gap notes have stages: identified → analyzed → proposed → integrated → deprecated
- But this is for *gaps* (missing knowledge), not for *knowledge in transition*

### Note Lifecycle
- Stages: draft → active → review → verified → maintained → deprecated
- But assumes knowledge is either "ready" or "not ready" — doesn't capture "being processed"

### Confidence Markers
- Options: high, medium, low, emerging, speculative
- "emerging" and "speculative" are close but:
  - "emerging" = gaining acceptance, not necessarily "being worked on"
  - "speculative" = may be wrong, not "pending resolution"

### Knowledge Freshness
- Dating requirements for verification
- But doesn't address knowledge that's actively being developed

## The Pattern: In-Transition Knowledge

This gap sits between:
- **Note lifecycle** (stage of a note's existence)
- **Gap lifecycle** (stage of a knowledge gap)
- **Confidence markers** (certainty level of content)

What's missing: **process markers** — knowledge about where knowledge is in the synthesis/evolution pipeline.

### Types of In-Transition Knowledge

1. **Synthesis in progress** — combining multiple sources, synthesis not complete
2. **Analysis pending** — pattern detected, validation needed
3. **Decision pending** — researched but conclusion not reached
4. **Crystallizing** — concept forming, needs more exposure
5. **Revision in progress** — major update underway

### Current Workarounds (Inconsistent)

- Notes use "last-updated: [date]" but don't indicate *what* updated
- Notes may say "IN PROGRESS" or "TODO" in title, but no frontmatter
- Frontier Exploration notes capture insights but have no "next steps" tracking
- Seed Gap notes track lifecycle but regular knowledge doesn't

## Proposed Seed Rules

### Rule: Add synthesis-status frontmatter for multi-source knowledge

**Why:** Multi-source synthesis is a critical knowledge type but synthesis completeness isn't tracked. Without synthesis-status, notes that combine multiple perspectives linger without clear completion criteria.

**Test:** For any note tagged with multiple sources:
1. Is `synthesis-status` present? (values: analyzing, synthesizing, complete, blocked)
2. If synthesizing, is `synthesis-blocked-by` documented?
3. If complete, is `synthesis-date` recorded?

### Rule: Add frontier-status frontmatter for emerging concepts

**Why:** Frontier Exploration captures insights that may become Seed rules or merge into existing content. Without frontier-status, these notes stagnate — they capture ideas but never resolve.

**Test:** For any note tagged "frontier-exploration":
1. Is `frontier-status` present? (values: capturing, analyzing, crystallizing, integrating, deprecated)
2. Is `frontier-next-action` documented?
3. Is `frontier-resolution-deadline` set?

### Rule: Distinguish "emerging confidence" from "in-progress process"

**Why:** Current "emerging" confidence means "gaining acceptance" but may also apply to knowledge being actively developed. These are different concepts — one is about acceptance, the other is about process state.

**Test:** Can you determine:
1. Is this knowledge "emerging" because it's gaining acceptance? (confidence)
2. Is this knowledge "in-progress" because it's being developed? (process)
3. Are both tracked separately?

### Rule: Define resolution criteria for Seed Gap stagnation

**Why:** Seed Gap notes can stay in "analyzed" indefinitely without progressing. Without staleness thresholds, gaps accumulate without resolution.

**Test:**
1. Are Seed Gap notes in "analyzed" status >30 days flagged?
2. Is `gap-stagnation-trigger` documented?
3. Is there a deprecation pathway for stalled gaps?

## Connection to Existing Seed Rules

- **Note Lifecycle Management**: Extend with synthesis-status values
- **Confidence Markers**: Add "in-progress" as orthogonal dimension
- **Gap Lifecycle**: Apply similar stagnation detection to frontier notes
- **Self-Improvement Cycle**: Connect to process tracking

## Domain Applicability

This gap is most critical for:
- **Research synthesis** (academic, scientific knowledge bases)
- **Decision support** (where conclusions are actively being developed)
- **Frontier exploration** (any vault doing active pattern detection)
- **Multi-source integration** (complex domains requiring synthesis)

## Test Case: Cooking Knowledge Base

An AI agent is building a cooking knowledge base. It creates:
- "Ingredient Substitution Patterns" (synthesizing 5 sources)
- "Flavor Pairing Principles" (emerging from pattern analysis)
- "Kitchen Equipment Trade-offs" (decision pending more research)

Without provisional knowledge guidance:
- All three notes look like completed notes (no differentiation)
- The agent doesn't know if substitution patterns synthesis is complete
- No mechanism to track that flavor pairing is still "crystallizing"
- Equipment trade-offs may appear more resolved than they are

With provisional knowledge guidance:
- "Ingredient Substitution Patterns" has `synthesis-status: complete` ✓
- "Flavor Pairing Principles" has `frontier-status: crystallizing`, `frontier-next-action: validate-with-expert-chef`
- "Kitchen Equipment Trade-offs" has `confidence: medium`, `decision-status: pending`, `pending-factors: [budget, space-constraints]`

## Next Steps

1. Validate this is a genuine gap (not already covered by Seed rules)
2. Test proposed rules against at least 3 domains
3. Refine frontmatter schema
4. Integrate with existing lifecycle models

---

**See also:**
- [[Seed Gap - Seed Rule Lifecycle Management]] (related meta-knowledge gap)
- [[Frontier Exploration - Multi-Source Synthesis]]
- [[Confidence Markers]]
- [[Note Lifecycle Management]]
