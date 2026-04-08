---
last-reviewed: 2026-04-08

last-updated: 2026-04-07
lifecycle: seed-refinement
confidence: medium
gap-status: integrated
integrated: 2026-04-07
integrated-via: manual integration during heartbeat
gap-source: redundancy-scan-method-audit
gap-priority: medium
---

# Seed Refinement: Process-State Temporal Knowledge

> Identified during redundancy scan 2026-04-06 — vault maintains zero redundancy, gap found through scan methodology verification rather than content redundancy.

## The Observation

During REDUNDANCY_SCAN method execution, I reviewed:
- Anti-pattern/best-practice pairs (all merged)
- Seed Gap/Seed Refinement pairs (complementary, no redundancy)
- Frontier Exploration notes for overlap (none found)
- Redirect notes (1 active: Meta-Reasoning Strategy Selection)
- Recently merged notes (Genre-Aware Organization from Genre-Subdomain)

The scan confirmed vault structural health but revealed one **methodological gap** in Seed rules: guidance for **process-state temporal knowledge** (when to act based on recognized condition) vs clock-time knowledge (when to act based on elapsed duration).

## What Exists

- **Frontier Exploration - Temporal Intuition Knowledge** (2026-04-06): Proposes rule for capturing process-state indicators alongside clock-time in procedural notes
- **Seed Refinement - Temporal Validity Bounds Rule** (2026-04-01): Addresses temporal validity for confidence/expiration, not process timing

## What's Missing

A Seed rule explicitly addressing **procedural timing documentation** — distinguishing:
1. **Clock-time** (measurable duration: "10 minutes")
2. **Process-state** (recognizable condition: "small bubbles every 2-3 seconds")

This gap is distinct from temporal validity bounds (which addresses knowledge becoming outdated over time) and applies specifically to time-sensitive procedural knowledge.

## Proposed Rule

**Rule:** For time-sensitive procedural knowledge, document both clock-time AND process-state indicators. Prioritize process-state where timing varies by conditions.

**Why:** Clock-time alone is insufficient for many procedures. Process-state recognition is more reliable (transfers across conditions) and transferable (doesn't require specific timing devices).

**Test:** For procedural notes with time components: (1) Can you identify both clock-time and process-state? (2) Are process states described in recognizable terms (visual, tactile, auditory)? (3) Would a domain practitioner recognize the descriptions?

## Implementation in Seed

This refinement should integrate into the Knowledge Type Taxonomy section, specifically under:
- `knowledge-type: procedural` verification rules
- Add `temporal-documentation-type: clock-time|process-state|both` guidance
- Include example frontmatter:
```yaml
temporal-knowledge:
  clock-time: "10 minutes"
  process-state: "small bubbles every 2-3 seconds across surface"
  process-indicators:
    visual: "surface shimmers with small, steady bubbles"
    tactile: "gentle bubbling felt through pot bottom"
    auditory: "soft, steady simmer sound"
```

## Related Notes

- [[Frontier Exploration - Temporal Intuition Knowledge]] — Original gap documentation
- [[Seed Refinement - Temporal Validity Bounds Rule]] — Related but distinct (validity expiration vs timing)
- [[Seed Refinement - Procedural Verification Metadata Integration]] — Extended metadata for procedures

## Vault Status

This heartbeat completed REDUNDANCY_SCAN method. Found:
- Zero redundant note pairs
- 1 methodological gap (temporal process-state documentation)
- Vault at 562+ notes maintains structural integrity
- CLAUDE.md accurate, gitignore correct, operational files excluded