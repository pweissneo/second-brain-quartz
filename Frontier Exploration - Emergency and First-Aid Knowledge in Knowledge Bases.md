---
last-updated: 2026-03-27
last-reviewed: 2026-03-27
confidence: emerging
author-type: ai-assisted
gap-status: identified
lifecycle: experimental
knowledge-type: conceptual
access-pattern: decision
tags:
  - frontier-exploration
  - emergency-knowledge
  - first-aid
  - safety-critical
---

# Frontier Exploration - Emergency and First-Aid Knowledge in Knowledge Bases

## The Gap

The Seed covers many domains but lacks explicit guidance for emergency and first-aid knowledge — knowledge you hope to never use but desperately need when the moment arrives. This is fundamentally different from other knowledge types in how it should be captured, organized, and maintained.

## Why This Matters

Emergency knowledge has unique properties:
1. **Verification is negative** — you hope to never verify it (unlike recipes you can taste-test)
2. **Stakes are highest** — wrong knowledge in an emergency causes real harm
3. **Time-critical access** — during an emergency, you can't afford to search through complex navigation
4. **Emotional interference** — stress degrades cognitive performance when you need knowledge most

The Seed handles verification through source-checking, empirical testing, and embodied verification — but emergency knowledge requires a fourth category: **preparedness verification** (knowledge that can only be validated through practice drills, not through actual emergency use).

## Domain-Specific Considerations

### First-Aid Knowledge Types
- **Procedural sequences** (CPR steps, wound treatment) — must be atomic, no branching
- **Contra-indications** (what NOT to do) — negative-space knowledge is critical
- **Dosage/measurement** (epinephrine, aspirin) — tool-dependent verification
- **Escalation triggers** (when to call 911) — threshold knowledge
- **Equipment locations** (first-aid kit, AED) — context-dependent, links to physical locations

### Emergency Response Knowledge
- **Natural disaster protocols** (earthquake, flood, wildfire)
- **Power/utility failures** (backup power, water outage)
- **Medical emergencies** (stroke signs, heart attack, allergic reaction)
- **Fire and evacuation** — procedural, time-critical
- **Security threats** — dynamic, may require real-time updates

### Characteristics That Differ From Standard Knowledge

| Standard Knowledge | Emergency Knowledge |
|-------------------|---------------------|
| Verify by testing | Verify by practice drills (hope to never use) |
| Complex navigation OK | Must be reachable in <3 clicks from any state |
| Can be verbose | Must be scannable under stress |
| Updates welcome | Changes require careful re-learning |
| Personal context adds value | Standardized may be safer than personalized |

## What the Seed Lacks

1. **"Hoping to never verify" verification mode** — knowledge validated through drills, not actual use
2. **Emergency access optimization** — rules for making critical knowledge reachable instantly
3. **Emotional state-aware formatting** — knowledge structured for cognitively degraded users
4. **Stale-date for emergency skills** — CPR, first-aid certifications expire, knowledge should too
5. **Practice drill tracking** — knowing WHEN you last practiced emergency skills

## Proposed Seed Rules (Rule/Why/Test format)

**Rule:** Emergency knowledge must follow strict atomicity with no conditional branching — each step must be a single, executable action.
**Why:** Cognitive load under stress is severely degraded. Conditional logic ("if X, then Y, else Z") fails when users are panicked. Sequential, linear procedures are the only reliable format.
**Test:** Can every emergency note be executed by reading sequentially without making any decisions?

**Rule:** Emergency knowledge must be accessible from any note within 3 hops or via dedicated emergency hub.
**Why:** Emergencies happen unexpectedly — you might be in any location in the vault when time-critical knowledge is needed. Complex navigation wastes seconds that matter.
**Test:** From any random note, can you reach emergency procedures in ≤3 clicks?

**Rule:** Emergency knowledge should be reviewed and drilled quarterly — knowledge that can't be recalled under practice conditions is unreliable in real emergencies.
**Why:** Knowledge that lives only in the vault isn't internalized. Practice drills expose gaps between "documented" and "usable" knowledge.
**Test:** Can you perform the emergency procedure from memory without looking at the note? (This is the actual test.)

**Rule:** Tag emergency knowledge with expiration dates for skills that have certification periods (CPR, first-aid, AED).
**Why:** Emergency procedures change as new medical evidence emerges. Certifications exist for a reason — the knowledge has a validity window.
**Test:** For emergency notes with certification equivalents, does frontmatter include `certification-valid-until:` and `last-practiced:`?

**Rule:** Emergency knowledge should not include personalized variations unless explicitly tested — standardized approaches are safer than creative adaptations.
**Why:** In emergencies, deviation from standard protocols increases error risk. Personalized tips are valuable in other domains but dangerous here.
**Test:** For emergency notes, is any deviation from standard protocols explicitly marked as `variation-tested: true` with verification evidence?

**Rule:** Use visual format for emergency knowledge when spatial relationships matter (Heimlich maneuver positions, CPR hand placement, tourniquet location).
**Why:** Under stress, reading comprehension degrades faster than visual pattern recognition. Visual formats communicate position/location faster than text.
**Test:** For emergency procedures involving body positions or locations: Is there a visual aid that communicates the essential spatial information?

## Edge Cases

**Expired certification knowledge:** If you hold an older certification (e.g., 2018 CPR), your knowledge may be outdated. Tag with `certification-status: expired` and maintain only as historical reference, not action guide.

**Conflicting sources:** Different organizations (Red Cross, AHA, WHO) may have slightly different procedures. The rule: default to the most recent major certification body's guidance, document variations with `protocol-variant:`.

**Domain-specific emergencies:** Cooking (choking, burns), woodworking (eye injury, amputation), photography (electrical shock). These need their own emergency sections within domain hubs.

**Emotional aftermath knowledge:** What to do AFTER the emergency (psychological first-aid, documentation, insurance claims) is different from during-emergency procedures. This could be separate from time-critical knowledge.

## Implementation

```yaml
emergency-type: first-aid|disaster|medical|fire|security|utility
time-critical: true  # must be reachable quickly
certification-equivalent: "AHA CPR 2020"
certification-valid-until: 2027-03-27
last-practiced: 2026-01-15
verification-mode: drill-verified  # not "source-verified" or "empirically-tested"
variation-tested: false  # default to standard, only true if you tested your variation
format-optimized: stress-tested  # validated under simulated stress conditions
```

## Related Seed Rules That Apply

- [[Seed Stress Test - Decision Threshold Rule in Emergency Medicine]] (existing stress test)
- [[Frontier Exploration - Crisis and Emergency Response Knowledge]] (existing exploration)
- [[Frontier Exploration - Wilderness Survival Knowledge Bases]] (related domain)

## What's Missing from the Seed

The Seed needs explicit "drill verification" mode for knowledge that can only be validated through practice, not through actual use. The current verification modes (source, empirical, tool-dependent, embodied) don't cover knowledge you hope to never verify.

---

**Confidence:** emerging — this is a new frontier exploration, not a mature rule
**Next Steps:** Run stress tests on emergency scenarios, test access-time from various vault locations, compare against actual emergency training materials