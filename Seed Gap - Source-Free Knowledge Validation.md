---
gap-type: seed-missing
gap-status: identified
gap-priority: medium
gap-phase: discovery
discovered: 2026-03-29
confidence: medium
author-type: ai-assisted
---

# Seed Gap - Source-Free Knowledge Validation

## The Gap

The Seed covers how to verify knowledge USING external sources (Confidence Markers, Source Quality Hierarchy, Verification Status) but does not address a common scenario: **knowledge created through personal experimentation with zero external sources to verify against.**

Examples:
- Personal experimentation results (cooking techniques, productivity systems, learning methods)
- Self-discovered shortcuts or insights
- Knowledge from limited personal experience in a new domain
- Domain with no available experts or documentation

## Why This Matters

Without guidance, AI agents either:
1. Mark all sourceless knowledge as low-confidence (potentially useful knowledge gets discarded)
2. Over-confidently present personal findings as universal truth
3. Skip capturing valuable personal knowledge entirely (because "it's not verifiable")

## Proposed Rule

**Rule:** For knowledge without external sources, explicitly mark it as experiential and apply higher scrutiny for claims that imply universality.
**Why:** Experiential knowledge is valid and valuable but must not masquerade as externally verified. Distinguishing "I tested this" from "this is universally true" prevents misinformation while capturing useful personal knowledge.
**Test:** For notes without source-type frontmatter: (1) Is this knowledge from personal experience? (2) If yes, does it claim universality where none exists? (3) Does frontmatter include `source-type: experiential` and `confidence: personal`?

## Implementation

```yaml
source-type: experiential|published|expert|collaborative|derived
# experiential = from personal testing/observation
# published = from external publications
# expert = from verified domain experts
# collaborative = from community consensus
# derived = synthesized from other notes

# Confidence adjustments for experiential:
confidence: personal  # lower than 'high', indicates personal validation only
validation-note: "What testing was done"
```