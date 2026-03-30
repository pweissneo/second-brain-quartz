---
last-reviewed: 2026-03-30
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
verification-status: unverified
gap-status: identified
gap-priority: high
gap-type: seed-missing
gap-source: frontier-exploration
tags:
  - seed-gap
  - emergency
  - crisis
  - retrieval-speed
  - verification
schema-version: "1.0"
---

# Seed Gap: Emergency Knowledge Retrieval Speed

> Identified: 2026-03-30 via FRONTIER_EXPLORATION on crisis/emergency response note
> Gap type: seed-missing
> Confidence: emerging

## Gap Description

The Seed covers drill-verified knowledge (Rule 2026-03-27) but lacks guidance for **retrieval speed** in emergency contexts. The existing rule assumes verification happens through practice drills, but doesn't address:

1. **Single-view retrieval requirement** — Emergency responders can't navigate 3 hops during a crisis
2. **Minimum confidence thresholds** — The Seed has no explicit "confidence too low for emergency use" cutoff
3. **Temporal decay for critical knowledge** — CPR guidelines change; old versions are actively dangerous
4. **Format requirements for high-stress retrieval** — Visual flowcharts beat text in panic states

The Frontier Exploration note "Crisis and Emergency Response Knowledge" documents this gap comprehensively but has not been converted to a Seed Gap note with proposed integration.

## What the Frontier Exploration Note Provides

- **Emergency knowledge category** with response-criticality, time-to-action, training-mode
- **Single-action note format** for critical-response notes (self-contained, no links required)
- **Emergency verification protocol** with 90-day max recency for life-critical content
- **Retrieval format hierarchy** (visual → abbreviated → full → background)
- **Offline and solo operation requirements** (printable reference cards)
- **Four emergency knowledge types**: immediate-action, decision-tree, reference-card, checklist

## Proposed Rule in Rule/Why/Test Format

**Rule:** For emergency and crisis-response knowledge, design for single-view retrieval with minimum confidence thresholds, explicit recency requirements, and panic-optimized formatting.

**Why:** Crisis domains require execution under stress. Standard atomicity (multi-note traversals), standard verification timelines (weeks), and standard navigation depth (3 hops) assume calm reading — not panic retrieval. Without explicit emergency knowledge guidance, vaults produce "helpful" notes that are useless when seconds count.

**Test:** For notes tagged `emergency-knowledge: true`:
1. Self-contained — can execute core action without navigating to other notes?
2. Confidence is `high` or `immediate-action` (not `emerging`, `low`, or `speculative`)?
3. `last-updated` is within 90 days for life-critical content?
4. Visual aid present (flowchart/image for panic-state retrieval)?
5. `offline-capable: true` if knowledge must function without connectivity?
6. Does it extend drill-verified rule or stand independently?

**Clarification:** This rule and the drill-verified rule (2026-03-27) are orthogonal:
- Drill-verified = "is the procedure correct?"
- Emergency retrieval = "can the procedure be executed under stress?"

Both may apply to the same note. A note can be drill-verified AND meet emergency retrieval requirements — OR it can meet only one. Tag accordingly.

**Retrieval format hierarchy for emergency notes:**
1. **Visual flowchart** — process in single image (primary for crisis use)
2. **Abbreviated text** — signal → action, no explanation (secondary)
3. **Full note** — explanation for training, not crisis use (tertiary)
4. **Background/links** — deep context after crisis resolves (never in crisis)

**Single-action note structure for critical-response:**
- **Header:** Clear signal (e.g., "CHOKING: ADULT")
- **One-line action:** The exact step to take
- **Visual aid:** Embedded flowchart or image
- **Fallback:** "If no equipment" alternatives when known
- **No links required:** Self-contained within one view

## Edge Cases

### Contested Emergency Procedures
Different authorities teach different approaches (e.g., Heimlich vs. chest thrusts). Tag with `procedure-status: contested`, document which authorities recommend what, and do NOT present contested as single truth.

### Equipment-Dependent Procedures
Some emergencies require specific equipment (AED, EpiPen). Include required equipment explicitly, equipment alternatives when known, and "If no equipment" fallback procedures.

### Confidence Threshold Enforcement
Notes tagged `emergency-knowledge: true` with `confidence: emerging` should trigger a warning during compliance audit. The minimum confidence for life-critical knowledge is `high`.

### Relationship to Drill-Verified Rule
The drill-verified rule (2026-03-27) handles verification methodology. This gap handles **retrieval format and speed** — they're orthogonal. Emergency knowledge needs BOTH drill verification (correct procedure) AND fast retrieval (can execute under stress).

## Related Seed Rules

- Rule (2026-03-27): Drill-verified knowledge — provides verification methodology
- Edge case (2026-03-28): Safety procedures with drill verification — home repair, woodworking, electrical
- Gap identification: Safety-critical domains — includes "incomplete emergency procedures" as a safety gap type

## Source Note

[[Frontier Exploration - Crisis and Emergency Response Knowledge]] — The comprehensive frontier exploration note this Seed Gap is derived from.

## Resolution Path

1. Create this Seed Gap note (✅ done 2026-03-30)
2. Review and refine proposed rule against Seed conventions
3. Propose integration into [[AI-Assisted Knowledge Management Seed]] as new rule section
4. Archive or merge this note after Seed integration