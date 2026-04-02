---
last-reviewed: 2026-03-27
last-updated: 2026-03-27
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
verification-status: unverified
tags:
  - frontier-exploration
  - resource-allocation
  - capture-strategy
  - decision-making
  - roi
gap-type: seed-missing
---

# Frontier Exploration: Knowledge Capture Resource Allocation

> When should an AI agent stop capturing new knowledge and start verifying existing knowledge? How to evaluate the return on investment for knowledge capture vs. other activities?

## The Problem

The Seed provides extensive guidance on:
- How to capture knowledge (atomicity, linking, verification)
- How to organize knowledge (hubs, navigation, graph structure)
- How to maintain quality (verification ratio, lifecycle management)

But it lacks guidance on:
- **When to stop capturing** and start verifying/deepening
- **How to evaluate capture ROI** — is this knowledge worth the cost?
- **Resource allocation decisions** — what's the optimal split between capture, verification, and organization?
- **Diminishing returns detection** — when does adding more notes stop improving the knowledge base?

## Where AI Gets Stuck

An AI agent following current Seed rules might:
1. Continuously capture new topics without ever verifying them
2. Add low-value knowledge that creates maintenance burden without utility
3. Spend equal effort on rare edge cases and core knowledge
4. Never evaluate whether the knowledge base is "good enough"
5. Chase novelty rather than depth when depth would provide more value

### The Capture Trap

The Seed emphasizes capture (adding new notes) but doesn't set boundaries. This creates a capture trap:
- More notes = more maintenance burden
- More topics = more surface area to verify
- More links = more potential broken connections
- No stopping rule = infinite growth with no quality guarantee

## The Gap: Resource Allocation Framework

The Seed needs explicit guidance on knowledge capture resource allocation — how to decide:
1. **Capture vs. Verify** — When to shift from adding new notes to verifying existing ones
2. **Explore vs. Exploit** — When to add new topics vs. deepen existing ones
3. **Marginal value** — Is the next note worth the cost?
4. **Completion assessment** — Is the knowledge base "complete enough" for its purpose?

### Current Seed Coverage

The Seed does mention:
> "Balance exploration (adding new topics) and exploitation (deepening existing ones) based on vault maturity — new vaults favor exploration (70/30), mature vaults favor exploitation (80/20)."

> "Define explicit completion criteria for each knowledge domain — state what 'done' looks like before collecting."

But these are scattered and lack operational specificity:
- No explicit capture-to-verify ratio rule
- No marginal value calculation method
- No completion threshold with verification requirement
- No resource allocation decision tree

## Proposed Rule Concepts

### Rule: Implement Capture-Verify Balance with Explicit Thresholds

**Rule:** Maintain explicit capture-to-verify ratio based on vault maturity — new vaults (first 50 notes) capture at 70/30, mature vaults (200+ notes) verify at 70/30. When unverified notes exceed 40% of total vault, pause capture and prioritize verification.

**Why:** Without explicit thresholds, AI agents default to capture (more visible, more fun) and neglect verification (invisible, tedious). This creates accumulation of unverified knowledge that undermines trust. Explicit thresholds force the shift.

**Test:**
1. Can you calculate your current capture-to-verify ratio?
2. Is your ratio appropriate for your vault's maturity?
3. Do you have a process to shift from capture to verify when thresholds are hit?

**Implementation:**
```yaml
vault-metrics:
  capture-verify-ratio: 65/35  # capture/verify
  unverified-percentage: 38
  verification-backlog: 23  # notes pending verification
  capture-pause-threshold: 40  # pause capture at 40% unverified
```

### Rule: Calculate Marginal Capture Value Before Adding Notes

**Rule:** Before adding a new note, evaluate marginal value: Does this note address a retrieval gap, prerequisite gap, or high-frequency need? Low-value captures (curiosity-driven without clear utility) should be deprioritized in favor of verified high-value additions.

**Why:** Every note has cost: storage, maintenance, verification burden, link management. Without marginal value assessment, vaults accumulate low-utility notes that create noise without improving capability. The cost of capture extends beyond creation to ongoing maintenance.

**Test:**
1. Can you articulate why each new note is worth the cost?
2. Does the note fill a known gap or serve a demonstrated need?
3. What verification burden does this note add?

**Marginal Value Assessment:**
| Factor | High Value | Low Value |
|--------|------------|-----------|
| Retrieval gap | Fills a known search failure | No demonstrated need |
| Prerequisite | Enables understanding of existing topics | Standalone curiosity |
| Frequency | Addresses recurring need | One-time interest |
| Verification | Can be verified in reasonable time | Unverifiable |

### Rule: Define Completion Thresholds with Verification Requirements

**Rule:** A knowledge domain is "complete enough" when: (1) can answer 80% of typical queries for that domain, (2) core concepts have verification status, (3) hub nodes have 5+ outgoing links each, (4) orphan rate <15%. Beyond this threshold, prioritize verification over new capture.

**Why:** Without completion thresholds, capture continues indefinitely. The Seed mentions completion criteria but doesn't enforce them. Explicit thresholds prevent infinite capture and ensure minimum quality before moving on.

**Test:**
1. For your core domains, can you answer 80% of typical queries?
2. What's your verification status on foundational notes?
3. Are hubs well-connected (5+ links)?
4. Is orphan rate acceptable (<15%)?

### Rule: Evaluate Capture ROI at Regular Intervals

**Rule:** Monthly, calculate knowledge capture ROI: (utility delivered / effort invested). Measure utility via retrieval success rate, query satisfaction, and knowledge application frequency. If ROI is declining for 3+ consecutive periods, shift from capture to verification/depth.

**Why:** Capture ROI naturally declines as easy knowledge is captured and only edge cases remain. Declining ROI is a signal to shift strategy. Without measurement, this signal is invisible.

**Test:**
1. Do you track retrieval success rate over time?
2. Can you measure knowledge application frequency?
3. Is there a process to detect declining ROI?

**Implementation:**
```yaml
roi-metrics:
  retrieval-success-rate: 0.78  # queries answered satisfactorily
  query-satisfaction: 0.82  # users find what they need
  application-frequency: 0.45  # notes referenced in work
  roi-trend: declining|stable|improving
  strategy-shift-recommended: verify  # when declining > 3 periods
```

### Rule: Apply Pareto Analysis to Knowledge Domains

**Rule:** Identify the 20% of knowledge domains that deliver 80% of utility. Focus verification and deepening effort there first. Don't over-invest in low-utility domains just because they're interesting.

**Why:** Not all knowledge is equal in utility. Some domains get used constantly, others never get referenced. Pareto analysis ensures effort goes where it matters most.

**Test:**
1. Can you identify your top 20% most-used knowledge domains?
2. Are verification resources allocated to high-utility domains?
3. Are you over-investing in low-utility curiosity topics?

## Edge Cases

### Edge Case: New Domain Entry

When entering a new domain, capture-first mode is appropriate. The rule should apply after initial bootstrap (20+ notes in domain).

### Edge Case: Research vs. Application Vault

Research vaults may have lower utility metrics (knowledge captured for future use, not immediate application). Adjust ROI expectations accordingly.

### Edge Case: Collaborator Contributions

When others contribute notes, capture may come from external sources. Verify contributed notes before they count as "verified."

### Edge Case: Safety-Critical Domains

In safety-critical domains (medical, legal, engineering), verification requirements should be stricter. Completion thresholds should require higher verification ratios.

## Relationship to Existing Seed Rules

This extends rather than conflicts with:
- Exploration/exploitation balance rule (complements with operational thresholds)
- Completion criteria (adds verification requirement)
- Verification ratio (adds capture-verify ratio context)
- Gap identification (prioritizes by utility, not just gap existence)

## Test for AI Agents

```
Assessing resource allocation coverage:
1. Can you calculate your capture-to-verify ratio?
2. Do you evaluate marginal value before adding notes?
3. Have you defined completion thresholds for core domains?
4. Do you track ROI metrics and adjust strategy?
5. Can you identify your high-utility vs. low-utility domains?
```

## Related Notes

- [[Frontier Exploration - Knowledge Prioritization and Focus Decisions]] — prioritization framework
- [[Frontier Exploration - Vault-Process Meta-Knowledge]] — meta-knowledge about the vault itself
- [[AI-Assisted Knowledge Management Seed]] — foundation being extended
- [[Seed Stress Test - Diminishing Returns Rule Across Domains]] — diminishing returns detection

## Conclusion

The Seed needs explicit resource allocation guidance. Without it, AI agents optimize for visible activity (capture) over invisible quality (verification). The proposed rules add operational specificity to existing guidance about exploration/exploitation balance and completion criteria.

**Next steps:**
1. Test capture-verify ratio thresholds in practice
2. Refine marginal value assessment criteria
3. Develop ROI tracking method
4. Add to Seed if validated