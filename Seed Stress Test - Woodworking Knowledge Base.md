---
last-reviewed: 2026-03-22
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
tags:
  - seed-stress-test
  - woodworking-domain
  - edge-case
  - safety-critical
---

# Seed Stress Test: Woodworking Knowledge Base

Testing Seed rules in the woodworking domain reveals unique challenges around equipment dependencies, safety-critical procedures, and embodied skill knowledge.

---

## Domain Overview

Woodworking knowledge bases face unique challenges:
- Extensive equipment dependencies (specific tools for specific operations)
- Safety-critical knowledge (power tools can cause severe injury)
- Embodied skill knowledge (feel of joint fit, wood behavior under hand)
- Material variability (wood species, grain direction, moisture content)
- Technique knowledge varies by skill level and tool availability

---

## 1. Equipment Dependencies Rule

**Seed Rule:** For infrastructure-dependent domains, treat infrastructure configuration as a first-class dependency. Use `infrastructure-type:` field.

**Woodworking Application:**

### Edge Case: Tool Tier Assumptions

**Problem:** Notes about joinery techniques often assume specific tools:
- "Use a table saw" — professional equipment assumption
- "Use a hand plane" — traditional tool assumption  
- What about beginners with limited tools?

**Analysis:** Different tool tiers (professional shop, home workshop, hand tools only) dramatically affect what techniques are accessible.

**Seed Test:** For technique notes: Does frontmatter include `equipment-tier:` (professional | home-workshop | hand-tools-only)?

### Edge Case: Tool Compatibility

**Problem:** A technique using a jointer assumes you have one. But:
- Hand tool woodworkers use alternative methods (plane techniques)
- Budget shops use different approaches (tabletop planer vs jointer)

**Analysis:** The Seed's infrastructure rule handles this but woodworking has unique aspect: tool COMBINATIONS matter more than individual tools.

**Test:** Does technique documentation specify minimum tool combination, not just individual tools?

### Proposed Refinement

Add to Seed:
```yaml
equipment-tiers:
  professional: ["table-saw", "jointer", "planer", "bandsaw"]
  home-workshop: ["circular-saw", "hand-planes", "router"]
  hand-tools-only: ["hand-planes", "chisels", "handsaws"]
```

---

## 2. Safety-Critical Knowledge Rule

**Seed Rule:** For high-stakes knowledge, use `criticality: high` frontmatter and include explicit safety disclaimers.

**Woodworking Application:**

### Edge Case: Dust Collection Requirements

**Problem:** Some operations generate hazardous dust (hardwoods, MDF, exotic woods) but notes rarely specify respiratory protection needs.

**Test:** For operations generating significant dust:
1. Is there a `safety-equipment-required:` tag (n95 | respirator | dust-collection)?
2. Does the note specify?

### Edge Case: Hand Tool vs Power Tool Safety

**Problem:** Safety knowledge differs dramatically:
- Power tools: kickback, entanglement, noise
- Hand tools: sharpen-related injuries, chemical hazards (finish fumes)

**Analysis:** The Seed needs different safety-warning types.

**Test:** For safety-critical notes, is there `safety-type:` (mechanical | respiratory | chemical | noise | ergonomic)?

### Edge Case: Technique Difficulty vs Danger

**Problem:** A technique can be difficult but not dangerous (precise joinery), or easy but dangerous (router operation). These need different tags.

**Analysis:** Separate `difficulty:` from `danger:` tags.

**Test:** For high-risk operations: Does note have both `difficulty:` AND `danger-level:`?

---

## 3. Experiential/Embodied Knowledge Rule

**Seed Rule:** For domains with experiential knowledge, apply modified test: "Can I actually test this? Might outcome differ despite similar description?"

**Woodworking Application:**

### Edge Case: "Fit Should Be Snug"

**Problem:** Notes say "the joint should be snug" but snugness is a feel that develops with experience. Text cannot capture:
- How much pressure to assemble
- What "snug" feels like in different woods
- Difference between too tight and just right

**Analysis:** This is embodied knowledge that cannot be fully captured in text.

**Test:** For fit-dependent techniques:
1. Does note include sensory-equivalent description ("should require mallet taps, not finger pressure")?
2. Is there a `skill-level-required:` tag?

### Edge Case: Wood Behavior Knowledge

**Problem:** "Let the wood acclimate" — but how do you know when it's ready? 
- Movement expectations vary by species
- Seasonal humidity matters
- Experience teaches what "ready" looks/sounds like

**Test:** For material-handling notes: Does note include observable indicators, not just time durations?

### Proposed Refinement

For woodworking, add `embodied-knowledge:` field:
```yaml
embodied-knowledge: true
sensory-cues: "description of what to feel/hear/observe"
skill-threshold: beginner | intermediate | advanced
```

---

## 4. Source Quality: Technique Reliability

**Seed Rule:** Track source reliability and verification status separately.

**Woodworking Application:**

| Source Type | Reliability | Example |
|-------------|-------------|---------|
| Furniture maker with teaching background | High | Lost Art Press, Popular Woodworking |
| YouTuber with product sponsorship | Medium-Variable | May favor tools they sell |
| Magazine (published) | Medium | Editorial process but may be legacy |
| Forum posts | Low-Variable | Anecdotal, skill-dependent |
| Historical (pre-1950) | Variable | Techniques valid, may lack safety |

### Edge Case: Historical Technique Sources

**Problem:** Traditional joinery books (2020s reprints of 1900s techniques) often lack safety information for power tools (which didn't exist then).

**Test:** For historical sources: Is there `safety-review-required:` flag?

---

## 5. Atomicity: Project Notes vs Technique Notes

**Seed Rule:** Notes should be 100-300 words. Notes >300 likely contain multiple ideas.

**Woodworking Application:**

### Edge Case: Complete Project Plans

**Problem:** A furniture project note with cut list, steps, and finishing could exceed 2000 words.

**Analysis:** Is this one idea (build this piece) or multiple (cut list, process, finishing)?

**Test:** For project notes: Is there clear separation between:
- Project overview (one note)
- Component procedures (linked notes)
- Finishing process (linked note)

### Edge Case: Jig and Fixture Notes

**Problem:** A jig for a specific operation might only need one note (design + build + use together).

**Analysis:** Jigs are tools to make other operations — they should be atomic per operation, not per component.

**Test:** For jig notes: Is the jig documented with its intended operation linked?

---

## 6. Link Density: Specialty Joinery

**Seed Rule:** Every note must link to at least 2 other notes OR be tagged `foundational: true` OR `specialized: true`.

**Woodworking Application:**

### Edge Case: Obscure Joinery Types

**Problem:** "Through-tenon" might only naturally link to "Mortise and Tenon" and "Joinery."

**Analysis:** Two links meets minimum. But some historical joinery (carcase corners, dovetail variants) may genuinely have only one natural connection.

**Test:** For specialized historical joinery: Is there `specialized: true` tag?

---

## 7. The 5:1 Ratio in Woodworking

**Seed Rule:** Capture insights, decisions, and experiences (personal) over restatable facts (general).

**Woodworking Application:**

### Edge Case: General Woodworking Knowledge

**Problem:** "How to cut a dovetail" is general knowledge available in many books. But:
- Your specific approach (Marking gauge method vs knife method)
- Your tooling choices and why
- Your setup process (what works in YOUR shop)

These ARE personal and valuable.

**Test:** For technique notes: Does the note include YOUR specific approach, not just the general method?

### Edge Case: Tool-Specific Knowledge

**Problem:** "How to use a block plane" general knowledge. But:
- Your specific angle recommendations based on your wood choices
- Your technique for end grain
- Your sharpening approach

These are personal.

**Test:** For tool notes: Is there `personal-insight:` documenting YOUR specific approach?

---

## Summary of Edge Cases

| Seed Rule | Edge Case | Proposed Solution |
|-----------|-----------|-------------------|
| Equipment Dependencies | Tool tier assumptions | Add `equipment-tier:` field |
| Safety-Critical | Dust collection, hand vs power | Add `safety-type:` and `safety-equipment-required:` |
| Experiential Knowledge | "Fit should be snug" | Add `embodied-knowledge:` with sensory cues |
| Source Quality | Historical sources lack safety | Add `safety-review-required:` for historical |
| Atomicity | Project plans exceed 300 words | Separate overview from components |
| 5:1 Ratio | General techniques with personal approach | Add `personal-insight:` field |

---

## NEW Edge Case (2026-03-22): Wood Species-Specific Technique Adaptation

**Problem**: The same technique often produces different results or requires different approaches depending on wood species. Current Seed rules don't capture this variability:

- **Hardness variation**: Cutting oak requires different blade/gouge sharpness than pine
- **Grain behavior**: Open-grained woods (oak, ash) vs closed-grained (maple, cherry) respond differently to hand tools
- **Density effects**: Heavy woods require different feed rates and cutting depths
- **Oil content**: oily woods (teak, cocobolo) cause glue adhesion problems
- **Color/staining**: Some woods stain differently, affecting finishing decisions

**Example**: "Plane the surface flat" - but:
- Pine: light passes, sharp iron, watch for tear-out on end grain
- Maple: sharper iron needed, watch for burning
- Walnut: moderate settings, good results relatively easy
- Oak: heavy passes, watch for interlocked grain tear-out

**Analysis**: The Seed's compound-conditions rule helps but doesn't specifically address **material-variable techniques** - procedures where the same action produces different outcomes based on material properties.

**Test**: For technique notes that apply to multiple wood species:
1. Does frontmatter include `species-sensitivity:` (high | medium | low)?
2. For high sensitivity: Are species-specific variations documented?
3. Does the note warn about species that need special handling?

**Proposed Refinement**: Add species sensitivity field:
```yaml
species-sensitivity: high  # technique varies significantly by wood
species-variations:
  - species: [oak, ash, elm]  # open-grained hardwoods
    adjustment: "Use shear cutting angle, watch for tear-out"
  - species: [maple, cherry, birch]  # closed-grained
    adjustment: "Keep tools sharper, watch for burning"
  - species: [teak, cocobilo, rosewood]  # oily
    adjustment: "Use epoxy or specialized glue, avoid oil finish"
```

**Status**: IMPLEMENTED - partially covered by compound-conditions rule (2026-03-22), but domain-specific guidance improves AI executability.

---

## Implementation Status (2026-03-26)

| Proposed Addition | Status | Notes |
|------------------|--------|-------|
| `equipment-tier:` | ✅ IMPLEMENTED | Added to Seed (lines 176-188) as workshop-dependent craft edge case |
| `safety-type:` | ✅ IMPLEMENTED | Added to Seed (lines 2882-2895) |
| `embodied-knowledge:` | ✅ IMPLEMENTED | Covered by `embodied-component:` (lines 440-451) |
| `safety-review-required:` | ✅ IMPLEMENTED | Added to Seed (line 200) for historical sources |
| `personal-insight:` | ✅ IMPLEMENTED | Covered by 5:1 woodworking calibration (lines 807-822) with modified test; general `your-context:` field applies |
| Species-specific variations | ✅ PARTIAL | Covered by compound-conditions rule (2026-03-22) |

**Note (2026-03-26):** The woodworking-specific 5:1 calibration rule (lines 807-822 in Seed) explicitly addresses the `personal-insight:` gap by providing a modified test that recognizes tool-specific, material-specific, and project-specific knowledge as personal. The implementation table is now accurate.

---

## Related

- [[AI-Assisted Knowledge Management Seed]]
- [[Seed Stress Test - Craft Knowledge Bases]]
- [[Seed Stress Test - Home Repair Knowledge Base]]
- [[Stress Test - Equipment Dependencies Rule Across Domains]]
