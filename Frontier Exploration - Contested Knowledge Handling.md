---
last-reviewed: 2026-04-04
lifecycle: emerging
confidence: emerging
author-type: ai-assisted
gap-status: identified
gap-priority: medium
gap-source: manual
discovered: 2026-04-01
knowledge-type: meta
consensus-level: emerging
access-pattern: decision
tags:
  - frontier-exploration
  - contested-knowledge
  - conflict-resolution
---

# Frontier Exploration - Contested Knowledge Handling

## The Gap

The Seed covers knowledge that is **unverifiable** (can't ever be verified — future predictions, philosophical counterfactuals) and **subjective** (aesthetic judgment, personal preference). But it's missing guidance for **contested knowledge** — knowledge where multiple expert positions are genuinely valid, evidence is ambiguous, and the "right" answer genuinely depends on which expert you ask.

**Why this differs from existing rules:**

| Category | Nature | Seed Coverage |
|----------|--------|---------------|
| **Unverifiable** | Can't ever be known (future, qualia, cosmological) | Rule: tag as unverifiable |
| **Subjective** | Aesthetic/personal, no truth claim | Rule: tag with consensus level |
| **Framework-dependent** | Different frameworks, no single answer | Rule: tag as framework-dependent |
| **Contradictory** | Two verified notes conflict | Rule: resolution protocol |
| **Contested (GAP)** | Active expert disagreement, no resolution | No explicit rule |

## Why This Matters

Without explicit contested knowledge handling:
1. **Capture paralysis** — Agent avoids capturing topics where experts disagree
2. **False confidence** — Agent picks one side without acknowledging genuine uncertainty
3. **Imbalanced representation** — One position gets captured while others are ignored
4. **No context for resolution** — Future updates don't capture WHY positions changed

## Examples of Contested Knowledge

### Health/Nutrition
- Low-fat vs low-carb diets (both have evidence)
- Intermittent fasting schedules (different protocols, valid for different contexts)
- Supplement efficacy debates

### Education
- Learning styles theory (research challenges it, practitioners defend it)
- Reading instruction methods (phonics vs whole language)

### Technology
- Programming paradigms debates
- Architecture patterns (monolith vs microservices)
- Code style preferences

### Creative
- Composition rules that contradict (in music: "avoid parallel fifths" vs modern usage)
- Editing rules in writing

## What the Seed Is Missing

A rule for how to capture knowledge when the vault owner doesn't know which expert position is correct, but wants to track multiple perspectives and their rationales.

## Proposed Rule Direction

**Rule:** For knowledge where genuine expert disagreement exists with no clear resolution, capture multiple perspectives explicitly with contested-knowledge frontmatter, document the nature of disagreement, and avoid marking any single position as "verified."

**Why:** Contested knowledge is different from contradiction (two claims that can't both be true) — multiple positions may all be valid in different contexts. The Seed's contradiction resolution assumes one position "wins," which isn't appropriate for genuinely contested knowledge.

**Test:** For contested topics: (1) Are multiple positions documented? (2) Is disagreement type classified (evidence-conflict|methodology-disagreement|standards-differ|context-dependent)? (3) Is no single position marked as verified? (4) Are rationales for each position captured?

**Implementation approach:**
```yaml
contested-knowledge: true
contested-type: evidence-conflict|methodology-disagreement|standards-differ|context-dependent
expert-positions:
  - position: "Position A"
    evidence-strength: moderate
    proponents: ["Expert 1", "Expert 2"]
    rationale: "Why this position has merit"
  - position: "Position B"
    evidence-strength: moderate
    proponents: ["Expert 3", "Expert 4"]
    rationale: "Why this position has merit"
resolution-status: unresolved|context-dependent|evolving
update-signals: "What would shift this"
```

## Related Notes

- [[Distinguishing Craft Criticism from Aesthetic Judgment]] — related to subjective vs objective
- [[Seed Stress Test - Confidence Markers Rule Across Domains]]
- [[Frontier Exploration - Multi-Perspective Knowledge]]
- [[Knowledge Consensus Level Tracking]]
- [[Seed Refinement - Verification Mode Conflict Resolution Edge Cases]]