---
last-reviewed: 2026-03-24
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
tags:
  - seed-rule
  - self-improvement
  - stress-testing
  - rule-evolution
---

# Seed Rule Proposal: Stress Test Integration

> When stress tests reveal that a Seed rule is incomplete or unenforceable, the refined version should be merged back into the Seed itself — not remain as a disconnected stress test note.

## The Problem

The vault has many stress test notes that analyze Seed rules and propose refinements. However, these refinements often remain as separate notes rather than being incorporated into the Seed. This creates two issues:

1. **Knowledge drift:** The Seed contains the original rule, while the refined thinking lives in stress test notes
2. **Inconsistent guidance:** AI agents following the Seed get outdated guidance

## The Pattern Found

In this heartbeat, I found this exact redundancy:
- **Seed:** "Use diverse link types" (lines 1124-1130) — vague, unenforceable
- **Stress Test:** "Stress Test - Diverse Link Types Rule.md" (144 lines) — detailed analysis, proposed refinements

The stress test provides:
- Clearer edge case definitions
- Proposed refinement options (Option A/B/C)
- Specific recommendations

But the Seed still contains the original vague rule.

## The Solution

**New Seed Rule:** After any stress test that proposes Seed modifications:
1. Review the stress test findings
2. If valid refinements are proposed, update the Seed rule
3. Mark the stress test note with `integrated: true` frontmatter
4. Move the stress test to a "resolved" subdirectory OR keep it as historical record

**Test:** Can you identify stress test notes that contain refinements to active Seed rules? If yes, has the Seed been updated?

## Rationale

Stress tests are valuable feedback loops. The insights they generate should improve the Seed, not remain as orphaned analysis. Without this integration, the vault's self-improvement mechanism is incomplete.

## Example

The "diverse link types" rule should be updated to include:
- Clear link type definitions (prerequisite, example, contrast, extension, analogy, category)
- Explicit exemptions for hub notes and sequential knowledge
- Testable criteria that AI can execute

## Related

- [[AI-Assisted Knowledge Management Seed]]
- [[Stress Test - Diverse Link Types Rule]]
- [[Self-Improvement Cycle]]
- [[Seed Gap Analysis Methodology]]
