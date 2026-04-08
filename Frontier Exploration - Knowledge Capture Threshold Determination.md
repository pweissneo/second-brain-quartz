---
last-reviewed: 2026-04-07
lifecycle: frontier-exploration
confidence: emerging
author-type: ai-assisted
gap-status: identified
gap-priority: high
gap-phase: analysis
gap-source: frontier-exploration
discovered: 2026-04-07
tags:
  - frontier-exploration
  - capture-threshold
  - notability
  - bootstrapping
---

# Frontier Exploration: Knowledge Capture Threshold Determination

> 🔍 **IDENTIFIED 2026-04-07** — Gap in Seed guidance

## The Problem

The Seed provides clear guidance on:
- **What to capture** (utility, connection, uniqueness)
- **When to create notes** (Note Creation Decision Framework)
- **How to organize** (atomicity, linking, taxonomy)
- **How to verify** (confidence markers, verification modes)

But it lacks explicit guidance on:
- **How much** is enough for a given topic
- **When** to stop capturing and start verifying
- **How to determine** if a piece of knowledge is "notable" enough to warrant its own note

## The Challenge for AI Agents

When bootstrapping a knowledge base in an unfamiliar domain, an AI agent faces uncertainty about capture thresholds:

1. **Capture Everything** — Creates bloated vaults with low signal-to-noise ratio
2. **Capture Nothing** — Misses valuable knowledge that seems marginal
3. **Capture Randomly** — Inconsistent, unfocused vault

Without explicit thresholds, the AI defaults to one of these strategies, none of which produce optimal knowledge bases.

## Existing Partial Coverage

The Seed touches on related concepts but doesn't fully address capture thresholds:

| Concept | What's Covered | What's Missing |
|---------|---------------|----------------|
| Note Creation Decision Framework | When to create a note | How many notes per topic is enough |
| Verification Ratio | How much to verify | When to stop capturing and start verifying |
| Diminishing Returns | When expansion loses value | How to detect approaching the threshold |
| Knowledge Type Taxonomy | Types of knowledge | How much of each type is sufficient |
| Access Patterns | Different use cases | How to balance across patterns |

## Questions the Seed Doesn't Answer

1. **Capture Density** — For a new domain, how many notes should constitute a "minimum viable" knowledge base before shifting to verification mode?

2. **Notability Threshold** — At what point does a piece of knowledge cross from "too trivial to note" to "worth capturing"? The Seed says capture utility/connection/uniqueness but provides no numeric threshold or decision tree.

3. **Capture-Verification Balance** — When should the agent shift from capture mode to verification mode? The Seed has completion criteria but no transition guidance.

4. **Incremental Expansion** — When adding to an existing domain, what's the threshold for "enough is enough" before moving to another domain?

5. **Marginal Value** — How to determine when adding another note about topic X provides diminishing returns compared to starting topic Y?

## Why This Matters

Without capture threshold guidance:

1. **Bloat** — AI captures everything, creating low-value vaults
2. **Starvation** — AI captures nothing, missing valuable knowledge  
3. **Drift** — No clear stopping point, leading to inconsistent coverage
4. **Verification Backlog** — Infinite capture mode prevents verification

## Potential Seed Rule Direction

**Rule:** Define explicit capture thresholds based on domain velocity — low-velocity domains require fewer but higher-quality notes (minimum 15-20 foundational notes before verification), high-velocity domains allow more shallow notes but require faster verification cycles.

**Why:** Domain velocity determines how quickly knowledge changes, which affects capture density. Static domains need deep, few notes; rapidly evolving domains need shallow, numerous notes with faster refresh.

**Test:** (1) Can you classify your domain's velocity as low/medium/high? (2) Does your note count match the expected range for your velocity? (3) Are you capturing at the right depth for your domain?

**Alternative Rule:** Use the "3-strike" rule — if the same piece of knowledge is needed 3+ times across different contexts, it warrants its own note. Until then, keep it as part of another note.

**Why:** Notability should be driven by actual utility, not speculation. Waiting for 3-use pattern ensures the note will actually be retrieved.

**Test:** (1) Can you track knowledge fragments needed across your vault? (2) Do any fragments appear 3+ times? (3) Have you created notes for high-frequency fragments?

**Hybrid Approach:** Combine domain-velocity assessment with use-frequency tracking:
- High-velocity domains: capture broadly, verify frequently, use 3-strike rule for note creation
- Low-velocity domains: capture deeply, verify thoroughly, use 10-note threshold before verification mode

## Related Notes

- [[Note Creation Decision Framework]]
- [[Seed Gap - Knowledge Prioritization Decision Framework]]
- [[Frontier Exploration - Domain Velocity Assessment for Unknown Domains]]
- [[Frontier Exploration - Knowledge Option Value]]
- [[Seed Refinement - Domain-Velocity-Aware Confidence Decay]]
- [[AI-Assisted Knowledge Management Seed]] — verification ratio rules

## Test Criteria (for AI Evaluation)

- [ ] Does this note clearly identify what's missing from the Seed?
- [ ] Are the questions specific and actionable?
- [ ] Are the proposed rules testable by an AI without human judgment?
- [ ] Is the gap priority justified (high impact on vault quality)?

## Questions for Refinement

1. Should capture thresholds be domain-specific or domain-agnostic?
2. How do access patterns affect capture thresholds (lookup vs learning)?
3. Is this a bootstrapping-specific problem or a persistent challenge?
4. How to balance capture breadth vs depth across multiple domains?
