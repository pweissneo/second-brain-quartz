---
last-reviewed: 2026-03-28
lifecycle: emerging
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
tags:
  - seed-stress-test
  - woodworking-domain
  - edge-case
  - link-density
---

# Seed Stress Test: 2-Outgoing-Links Rule in Woodworking

Testing whether the "at least 2 outgoing links" rule works in the woodworking domain.

---

## The Rule Under Test

**Seed Rule:** Check for debt accumulation patterns — review the 10 most recent notes. Do they each have at least 2 outgoing links?

**Context:** This rule appears in the Implementation section (line 4126), not as a formal Seed rule. It's meant to catch debt patterns during capture.

---

## Domain Application: Woodworking

Woodworking knowledge has unique characteristics that stress this rule:

1. **Equipment-dependent techniques** — techniques that assume specific tools may not link to other concepts naturally
2. **Specialized historical joinery** — obscure techniques may only connect to their parent category
3. **Safety-critical knowledge** — safety notes may be standalone warnings rather than connected concepts
4. **Foundational primitives** — basic tools, wood types, and fundamental concepts that everything references

---

## Edge Case 1: Specialized Historical Joinery

**Scenario:** A note about "Through-Tenon" joinery.

**Natural connections:**
- Links to: Mortise and Tenon (parent technique)
- Links to: Joinery (category hub)

**Total: 2 links** — barely meets threshold, but what about more obscure joints?

**Analysis:** Some historical joinery (carcase corners, specific dovetail variants, heritage furniture techniques) may genuinely have only one strong connection. The Seed already accounts for this with `specialized: true` tag, but the stress test is whether the rule acknowledges this edge case.

**Test:** For specialized historical techniques, is `specialized: true` or `niche: historical` frontmatter present?

---

## Edge Case 2: Equipment-Specific Techniques

**Scenario:** A note about "Table Saw Resaw Technique."

**Natural connections:**
- Links to: Table Saw (equipment note)
- Links to: Resawing (technique)

**Total: 2 links** — but this assumes the user has a table saw.

**Problem:** A hand-tool-only woodworker sees this note and sees no path to their existing knowledge. The 2-link rule measures structural density but doesn't measure applicability across equipment tiers.

**Analysis:** Equipment-specific notes may genuinely have fewer useful connections for users with different tool sets. The rule measures structural health (graph density) but not utility (accessibility across user contexts).

**Test:** For equipment-dependent notes: Does frontmatter include `equipment-tier:` (professional | home-workshop | hand-tools-only)? Is there a generic principle note that all equipment tiers can link to?

---

## Edge Case 3: Safety Warnings

**Scenario:** A note about "Table Saw Kickback Safety."

**Natural connections:**
- Links to: Table Saw (equipment)
- Links to: Safety (general category)

**Total: 2 links** — but safety warnings are often standalone — you don't "explore from" a warning, you read it and return.

**Analysis:** Safety-critical notes serve a different purpose than exploratory notes. They should be accessible via backlinks from the equipment/procedure they protect, not require outgoing links to be "complete."

**Seed refinement proposal:** Safety notes should be linked TO (via backlinks from equipment/procedures) not required to link OUT. The rule should distinguish:
- **Exploratory notes:** Should have outgoing links (enable navigation)
- **Reference/warning notes:** Should have backlinks (enable discovery)

**Test:** For safety-critical notes: Are they linked via backlinks from the equipment or procedure they address?

---

## Edge Case 4: Foundational Primitives

**Scenario:** A note about "Wood Grain Direction."

**Natural connections:**
- Links to: Wood Properties (maybe)
- Links to: (nothing else naturally)

**Total: 1 link** — but grain direction is a foundational concept that EVERY woodworking note references, either explicitly or implicitly.

**Analysis:** The Seed accounts for this with `foundational: true` tag, but the stress test is whether this tag is consistently applied in practice.

**Test:** For notes with <2 links: Is there `foundational: true` frontmatter? Or is it just a structural gap?

---

## Edge Case 5: Finish Chemistry

**Scenario:** A note about "Wood Finish Types."

**Natural connections:**
- Links to: Finishing (category)
- Links to: (varies — maybe Oil, Polyurethane, Shellac)

**Problem:** Finish chemistry knowledge bridges materials science, health/safety, and application technique. A note might link to finishing category and... what else? Material science isn't typically in a woodworking vault.

**Analysis:** Cross-domain knowledge (chemistry, physics, health) may not have natural links within a single-domain vault. The rule assumes knowledge is domain-contained, but real-world knowledge crosses boundaries.

**Seed refinement proposal:** For cross-domain knowledge, allow relaxed link counts OR create bridging hub notes that connect domain to adjacent domains.

**Test:** For cross-domain notes: Is there a bridging hub that connects the domain to adjacent domains (materials → chemistry, anatomy → medicine)?

---

## Summary of Findings

| Edge Case | Current Handling | Stress Test Result |
|-----------|------------------|-------------------|
| Specialized historical joinery | `specialized: true` tag | ✅ Adequate |
| Equipment-specific techniques | `equipment-tier` field exists | ⚠️ Tier connectivity not enforced |
| Safety warnings | No special handling | ❌ Wrong direction — should be linked TO, not FROM |
| Foundational primitives | `foundational: true` tag | ✅ Adequate (if applied) |
| Cross-domain knowledge | No handling | ❌ Gap — assumes domain containment |

---

## Proposed Seed Refinements

### Refinement 1: Note Type Distinction

Add to Seed: Different note types have different link expectations:

```yaml
note-type: exploratory | reference | safety | foundational
# exploratory: should have outgoing links (enable navigation)
# reference: should have backlinks (enable discovery)
# safety: should be referenced by equipment/procedure notes
# foundational: allowed <2 links, tagged foundational: true
```

**Test:** For each note, can you identify its type? Does it meet the link expectation for its type?

### Refinement 2: Equipment Tier Connectivity

For equipment-dependent domains, ensure each equipment tier has a generic principle that connects to equipment-specific notes:

- [[Woodworking Principles]] (tier-agnostic)
  - links to → [[Resawing]] (links to equipment-specific sub-notes)

**Test:** For equipment-specific notes: Is there a tier-agnostic hub that users with different equipment can navigate to?

### Refinement 3: Safety Note Pattern

Safety notes should be referenced BY the equipment/procedure they protect, not required to link OUT to other notes.

**Test:** Run: For each safety note, check backlinks. Does the equipment/procedure it protects link TO it?

---

## Domain-Specific Test for Woodworking

For a woodworking knowledge base, run this test:

1. List all notes with <2 outgoing links
2. For each: Check if it has `foundational: true`, `specialized: true`, or `safety: true`
3. If none of those apply: Flag as potential debt
4. For safety notes specifically: Check backlinks instead of outgoing links

**Expected result:** ~15-20% of notes should have <2 outgoing links (foundational, specialized, safety notes). If >30%, there's a structural problem.

---

## Conclusion

The 2-outgoing-links rule works adequately for most woodworking notes but fails for:
1. Safety-critical notes (wrong direction)
2. Equipment-specific notes (doesn't measure cross-tier accessibility)
3. Cross-domain knowledge (assumes domain containment)

The rule should be replaced or supplemented with a note-type-aware link expectation that distinguishes exploratory notes (need outgoing) from reference/safety notes (need backlinks).

---

**See also:**
- [[Seed Stress Test - Woodworking Knowledge Base]] (comprehensive domain test)
- [[Seed Rule - Distributed Understanding]] (cross-domain knowledge handling)
- [[Frontier Exploration - Equipment and Tool Dependencies]] (equipment-tier handling)