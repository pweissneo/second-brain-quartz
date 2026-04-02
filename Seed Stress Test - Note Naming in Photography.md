---
last-reviewed: 2026-03-22
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
tags:
  - seed-stress-test
  - note-naming
  - photography-domain
related-seed-rule: [[AI-Assisted Knowledge Management Seed#Note Naming]]
---

# Seed Stress Test: Note Naming Rule in Photography

This note tests the [[AI-Assisted Knowledge Management Seed#Use consistent note naming]] rule against the photography domain.

## Domain Overview

Photography knowledge bases have unique naming challenges:
- Heavy use of technical terminology (aperture, ISO, shutter speed, focal length)
- Camera brand ecosystems with their own terminology (Nikon Z-mount, Canon RF, Sony E-mount)
- Complex lens product names (Nikkor Z 70-200mm f/2.8 VR S)
- Style and genre names (portrait, landscape, street, documentary)
- Equipment model numbers that don't follow natural language patterns (A7IV, R5, Z6II)

## Seed Rule Under Test

**Rule:** Use consistent note naming — descriptive noun phrases, title case, kebab-case for filenames.

**Why:** Inconsistent naming hurts search accuracy and graph readability.

**Test:** Do note titles follow a consistent pattern? Can you predict a new note's title?

**Edge case:** Domain-specific abbreviations (MRI, ECG) are acceptable when they are standard terminology.

---

## Stress Test Analysis

### Does This Rule Make Sense for Photography?

**Yes, with significant domain adaptation.** Photography has standardized terminology that often conflicts with generic naming conventions.

| Challenge | Example | Conflict with Generic Rule |
|-----------|---------|---------------------------|
| Technical abbreviations | "ISO", "f-stop", "mm" | Abbreviations are standard, not domain-specific jargon |
| Product model numbers | "A7IV", "R5", "Z6II" | Not descriptive noun phrases, but essential for precision |
| Focal length terminology | "50mm", "70-200mm" | Numbers + unit, not noun phrases |
| Genre terminology | "Portrait", "Landscape" | Works well with title case |
| Technique names | "Long Exposure", "Bokeh" | Works well |

### Is the Test Executable?

**Partially.** The test asks "Can you predict a new note's title?" but photography has multiple valid naming approaches:

1. **Technical-first:** "Nikon Z-mount Lens Selection" vs "Which Nikon Lens"
2. **Brand-specific:** "Canon RF 50mm f/1.2L" vs "Fast 50mm Prime Lenses"
3. **Concept-first:** "Aperture and Depth of Field" vs "f-stop"

The rule favors consistency over all approaches being predictable - which is correct, but the test doesn't specify which convention to follow.

### Edge Cases Identified

#### 1. Equipment Model Naming
Product model numbers (A7IV, R5, Z6II) are how photographers actually search and identify gear. Converting to "Sony Alpha 7 IV Camera" reduces precision and matches how photographers DON'T think.

**Recommendation:** Add edge case for equipment model numbers:
- Model numbers can be used as-is when they're the standard search term
- Add parenthetical brand if needed: "Sony A7IV (Alpha 7 IV)"

#### 2. Focal Length as Identifier
Focal lengths (50mm, 85mm, 24-70mm) are the primary way photographers categorize lenses. Converting to "Fifty Millimeter Focal Length" is technically correct but useless in practice.

**Recommendation:** Add edge case for focal length notation:
- Standard notation (50mm, f/2.8) is acceptable
- For descriptive notes: "50mm Portrait Lenses" (focal length + use case)

#### 3. Abbreviation vs Full Term
Photography uses both extensively:
- "ISO" vs "International Standards Organization"
- "RAW" vs "Uncompressed Image Format"
- "HDR" vs "High Dynamic Range"

The rule says domain-specific abbreviations are acceptable "when they are standard terminology." ISO is standard; "Nikon" is standard. The test needs to clarify: do we use full terms for new notes or match existing convention?

**Recommendation:** Match existing convention in vault. If most notes say "ISO", use "ISO". If they say "Aperture", don't mix "Aperture" and "f-stop".

#### 4. Genre vs Technique Naming
Genre notes (Portrait, Landscape) work well with noun phrase rule.
Technique notes (Long Exposure, Bracketing) also work well.
But equipment notes often don't fit.

**Recommendation:** Create sub-conventions:
- **Concepts:** Descriptive noun phrases (Title Case) - "Depth of Field"
- **Equipment:** Model-first (brand + model) - "Nikon Z9"
- **Techniques:** Action + object - "Capturing Motion Blur"

---

## Proposed Seed Rule Update

```markdown
**Rule:** Use consistent note naming — descriptive noun phrases, title case, kebab-case for filenames.

**Edge case (NEW - stress test 2026-03-21):** Photography and equipment-heavy domains need modified conventions:
- **Equipment model numbers** (A7IV, R5, Z6II) are acceptable as-is when they represent standard product identifiers
- **Focal lengths and aperture values** (50mm, f/2.8, 70-200mm) use standard notation rather than full expansion
- **Brand names** use standard spelling (Nikon, Canon, Sony) not manufacturer descriptions
- **Sub-conventions** may exist: concepts use noun phrases, equipment uses model numbers, techniques use action-object pattern
- **Test:** Pick 5 random notes. Do they follow consistent internal convention? Can you predict the next note's naming pattern within its category?
```

---

## Conclusion

The note naming rule is fundamentally sound for photography but needs explicit edge cases for:
1. Equipment model numbers (search precision)
2. Technical notation (focal length, aperture)
3. Brand standardization (Nikon not "Nikon Corporation")
4. Sub-convention support (different patterns for different note types)

The core principle (consistency over chaos) holds - but photographers expect equipment precision that generic noun phrase rules don't capture.

---

## Related Notes

- [[Seed Stress Test - Photography Knowledge Base]] - General photography domain stress test
- [[AI-Assisted Knowledge Management Seed]] - Vault's note naming conventions
- [[Seed Stress Test - Note Naming in Photography]] - Self-reference for completeness- [[_root]]
