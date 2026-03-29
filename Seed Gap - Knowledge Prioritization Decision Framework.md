---
last-reviewed: 2026-03-28
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
knowledge-type: structural
tags:
  - seed-gap
  - prioritization
  - decision-framework
  - exploration-exploitation
gap-status: resolved
gap-priority: high
gap-phase: discovery
gap-source: frontier-exploration-woodworking
gap-type: seed-missing
discovered: 2026-03-28
resolved: 2026-03-29
gap-resolution-note: Rules added - "Systematically identify knowledge gaps and prioritize filling them" and "Set explicit priority signals for capture"
replaced-by: [[AI-Assisted Knowledge Management Seed]]
related:
  - "[[Frontier Exploration - Knowledge Prioritization and Focus Decisions]]"
  - "[[AI-Assisted Knowledge Management Seed]]"
---

# Seed Gap: Knowledge Prioritization Decision Framework

## The Gap

The Seed provides rules for:
- How to structure individual notes (atomicity)
- How to connect notes (linking)
- How to organize the graph (hubs, navigation)
- How to maintain quality over time

But it lacks guidance on:
- **What to capture next** when starting fresh
- **When to stop adding new topics** and start deepening
- **How to prioritize** competing knowledge gaps
- **How to know when the vault is "complete enough"**

## Where AI Gets Stuck

When building a knowledge base about woodworking using ONLY the Seed:

1. AI reads Seed rules about atomicity, linking, hub creation
2. AI faces a blank slate: "What should I capture first?"
3. Seed has no prioritization rules — only structural ones
4. Without guidance, AI either:
   - (a) captures whatever is most accessible, not most useful
   - (b) gets stuck in analysis paralysis
   - (c) creates imbalanced coverage (too much on some topics, none on others)
5. The resulting knowledge base reflects what was easy to find, not what the domain needs

## What the Seed Is Missing

Current Seed language:
> "Define explicit completion criteria for each knowledge domain — state what 'done' looks like before collecting."

But it doesn't include:
- **Exploration-Exploitation balance** — when to add new topics vs deepen existing ones
- **Prioritization criteria** — how to rank competing knowledge gaps
- **Completion signals** — what indicates the vault is "complete enough"
- **Focus decision rules** — how to choose between breadth vs depth

## Domain Applicability

This gap matters most in:
- **New vaults** (<50 notes) — where prioritization matters most
- **Multi-domain vaults** — where competing domains need balance
- **Long-running vaults** — where exploration-exploitation trade-offs emerge

## Resolution Options

### 1. Add Prioritization Rules to Seed

**Proposed Rule (Exploration-Exploitation Balance):**

**Rule:** Balance exploration (adding new topics) and exploitation (deepening existing ones) based on vault maturity — new vaults favor exploration 70/30, mature vaults favor exploitation 80/20.
**Why:** Without explicit balance guidance, AI agents default to exploration (easier, more visible) or exploitation (safer), creating imbalanced vaults. Pure exploration creates shallow vaults with many thin topics; pure exploitation creates stagnant vaults that miss valuable new domains.
**Test:** Can you categorize recent capture activity as primarily exploration or exploitation? Is the ratio appropriate for vault maturity (<50 notes = exploration, >200 notes = exploitation)?

**Implementation:**
- Track note creation date distribution across topics
- Measure average outgoing links per topic
- Flag when a hub has <3 incoming links (underexplored) or >20 (potential sprawl)
- Define vault maturity thresholds

### 2. Add Priority Decision Rules

**Proposed Rule (Knowledge Gap Prioritization):**

**Rule:** Prioritize knowledge gaps by impact × inverse effort. Prioritize gaps that block other knowledge (prerequisite gaps) first, then gaps that enable frequent tasks (utility gaps), then nice-to-have gaps.
**Why:** Without prioritization, agents work on interesting gaps rather than important ones. Impact × inverse effort ensures high-value work gets done first.
**Test:** Can you rank knowledge gaps by: (1) does it block other knowledge? (2) does it enable frequent tasks? (3) is it nice-to-have? Are top-ranked gaps addressed first?

### 3. Add Completion Signals

**Proposed Rule (Vault Maturity Indicators):**

**Rule:** A knowledge base is "complete enough" when: (1) core concepts have 3+ outgoing links, (2) common queries return satisfactory results >70% of time, (3) no prerequisite gaps exist for high-priority topics.
**Why:** "Complete" is a moving target. Explicit maturity indicators let agents know when to shift from exploration to exploitation, preventing both premature closure and infinite expansion.
**Test:** Does the vault meet all three maturity indicators? If not, which indicator is furthest from threshold?

## Test Scenario: Woodworking Knowledge Base

An AI building a woodworking knowledge base using only current Seed would face:

1. "What woodworking topic should I document first?" → No guidance
2. "When have I documented enough basic topics?" → No guidance
3. "Should I add new techniques or deepen existing ones?" → No guidance
4. "Is my knowledge base complete enough to be useful?" → No guidance

The proposed rules would guide:
1. Start with core concepts (wood types, tool fundamentals, safety)
2. Build toward entry points (getting started, basic techniques)
3. Balance breadth (multiple tool types, wood species) with depth (specific techniques)
4. Measure completion by query success rate, not note count

## Related Notes

- [[Frontier Exploration - Knowledge Prioritization and Focus Decisions]] — Detailed framework this gap relates to
- [[AI-Assisted Knowledge Management Seed]] — Foundation rules (missing prioritization framework)
- [[Seed Stress Test - Woodworking Knowledge Base]] — Domain stress test with prioritization implications