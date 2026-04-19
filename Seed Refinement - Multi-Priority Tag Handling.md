---
last-reviewed: 2026-04-08
lifecycle: seed-refinement
confidence: medium
author-type: ai-assisted
knowledge-type: meta
access-pattern: lookup
verification-status: in-progress
tags:
  - seed-refinement
  - verification-priority
  - compliance-gap
schema-version: "1.0"
---

# Seed Refinement: Multi-Priority Tag Handling

## Rule

**When a note spans multiple verification priority levels, default to the highest priority level for verification purposes.**

## Why

The current Seed's Verification Priority rule (line ~663) addresses single-priority notes but doesn't handle notes that legitimately span multiple priority categories. Real-world knowledge often crosses boundaries:

- A note on "Woodworking Joints" covers both basic joints (medium priority) and advanced structural joints (high priority for structural integrity)
- A cooking note on "Knife Skills" covers both basic safety (low priority) and advanced techniques that could cause serious injury (high priority)
- A home repair note on "Electrical Basics" covers simple tasks (medium priority) and dangerous ones (critical priority)

Without explicit handling, these notes either get under-verified (assigned lowest common denominator) or cause ambiguity in automated workflows.

## Test

Can you answer YES to all of these?

1. Do multi-priority notes have `verification-priority:` set to the highest applicable priority?
2. Is there documentation of why the note spans multiple priority levels?
3. Can automated systems correctly prioritize these notes for verification scheduling?
4. Do downstream verification rules (e.g., verification-ratio calculation) account for multi-priority notes correctly?

## Implementation

```yaml
verification-priority: critical|high|medium|low
priority-spans:  # Optional: document multi-priority nature
  - level: high
    reason: "Contains structural joinery knowledge"
  - level: medium
    reason: "Contains basic joint fundamentals"
priority-override: highest  # or explicit-lowest (rare)
```

### Handling in Verification Workflow

1. **Detection:** Notes with multiple `audience:`, `use-case:`, or content spanning different expertise levels
2. **Default behavior:** Set `verification-priority` to highest applicable level
3. **Override documentation:** If intentionally setting lower priority, document `priority-override` with rationale
4. **Verification scope:** At minimum priority level, verify all content; at higher priority, also verify edge cases and advanced applications

## Edge Cases

**Inherited priority:** When a note references another high-priority note, should it inherit that priority? Default: No — priority is based on the note's own content, not its references. Exception: Synthesis notes that predominantly reference high-priority content may inherit.

**Priority drift:** As notes grow, they may expand into higher-priority territory. Track `priority-history` in frontmatter when priority level changes.

**Domain-specific priority thresholds:** Some domains have different priority boundaries. Document in domain-specific seed refinements.

## Related

- [[Seed Refinement - Verification Priority Hierarchy Edge Cases]] — Original refinement
- [[Compliance Audit - Verification Priority Refinement Integration]] — Audit identifying this gap
- [[AI-Assisted Knowledge Management Seed.md]] — Main Seed document

## Status

**Proposed for Seed integration.** This addresses the multi-priority handling gap identified in the 2026-04-08 compliance audit.