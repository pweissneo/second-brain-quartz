---
last-reviewed: 2026-03-13
lifecycle: evergreen
confidence: emerging
knowledge-type: analysis
tags:
  - seed-stress-test
  - photography-domain
  - self-contained-notes
---

# Seed Stress Test: Self-Contained Notes Rule in Photography Knowledge Base

Testing the Self-Contained Notes rule: "Every note must be self-contained — readable without clicking any links" against the photography domain.

## Domain Overview

Photography knowledge bases face unique challenges:
- Heavy technical terminology (aperture, ISO, shutter speed, focal length)
- Equipment-specific knowledge (camera bodies, lenses, accessories)
- Artistic judgment mixed with technical facts
- Workflow knowledge (post-processing, editing, file management)
- Context-dependent advice (lighting conditions, subjects, genres)

---

## 1. Technical Terminology Challenge

**The Rule:** Every note must be self-contained — readable without clicking any links.

**Photography Application:**
Photography has dense technical vocabulary where terms build on each other:
- "Aperture" depends on understanding "f-stop," "depth of field," "lens"
- "Shutter speed" depends on "motion blur," "exposure triangle"
- "ISO" depends on "noise," "grain," "exposure triangle"

**Edge Cases Found:**

1. **Single-term definition notes**: "Bokeh" at 80 words
   - Current: Defines bokeh as "the aesthetic quality of blur"
   - Problem: Reader doesn't know what "aesthetic blur" means vs. "bad blur"
   - Verdict: NOT self-contained — needs visual example description or comparison to "depth of field"

2. **Equipment-specific notes**: "Nikon Z-mount" at 120 words
   - Current: Explains flange distance, mount diameter
   - Problem: Assumes reader knows what "flange distance" means
   - Verdict: NOT self-contained for beginners — needs brief explanation or link to foundational lens anatomy

3. **Technique notes**: "Long Exposure Photography" at 350 words
   - Current: Explains technique, gives settings, mentions ND filters
   - Problem: ND filters are explained in another note, reader can't understand why they're needed
   - Verdict: PARTIALLY self-contained — includes what ND filters do inline, good; but "lens compression" is referenced without explanation

**Suggested Improvement:**
> Photography notes should include inline parenthetical definitions for technical terms on first use. Example: "Use a neutral density (ND) filter — a dark glass that reduces light entering the lens — to enable longer exposures."

---

## 2. Equipment Dependencies

**The Problem:** Photography equipment knowledge has layers of dependencies:
- Camera brand → lens mount → specific lenses
- Flash system → trigger → modifiers
- Tripod → head type → mounting plate

**Edge Cases:**

1. **Brand-specific technique**: "Sony Eye-AF" at 150 words
   - Current: Explains Eye-AF finds and tracks eyes
   - Problem: Assumes reader knows what "autofocus" is
   - Verdict: NOT self-contained for beginners — "autofocus" needs inline definition or assumption stated

2. **Legacy equipment**: "Canon FD Mount" at 200 words
   - Current: Explains manual focus, flange distance, discontinued status
   - Problem: References "EOS conversion" without explaining
   - Verdict: NOT self-contained — "EOS conversion" is unexplained jargon

3. **Accessory notes**: "Godox X1T Trigger" at 100 words
   - Current: Explains TTL, HSS, radio triggers
   - Problem: All three are technical terms requiring external knowledge
   - Verdict: NOT self-contained — needs inline definitions

**Proposed Solution:**
Add photography-specific guidance to Seed:
> For technical domains with dense terminology (photography, medicine, engineering), notes may include brief inline definitions (1-2 sentences) for terms that are central to understanding. This does not violate self-containment — the note remains readable.

---

## 3. Artistic Judgment and Context

**The Challenge:** Photography includes subjective, context-dependent advice:
- "Golden hour produces better light" — true in most contexts, not all
- "Use wide apertures for portraits" — not always (group photos need f/8)
- "Higher ISO is always worse" — not true with modern sensors

**Edge Cases:**

1. **Genre-specific advice**: "Portrait Lighting Patterns" at 280 words
   - Current: Explains Rembrandt, loop, split lighting
   - Problem: Doesn't explain WHEN each applies
   - Verdict: PARTIALLY self-contained — gives patterns but not application context

2. **Location-dependent knowledge**: "Beach Photography" at 400 words
   - Current: Covers timing, weather, gear protection
   - Problem: "Salt spray" is mentioned but not explained as a risk
   - Verdict: MOSTLY self-contained — could add "salt spray = corrosive seawater mist that damages equipment"

3. **Equipment recommendation**: "Best Lenses for Weddings" at 320 words
   - Current: Lists specific lenses with reasons
   - Problem: Assumes reader knows what "f/2.8" means
   - Verdict: NOT self-contained for beginners

**Suggested Improvement:**
> Add explicit "context-dependency" marking for photography advice:
> ```yaml
> context-factors:
>   - lighting-conditions
>   - subject-type
>   - skill-level
> ```

---

## 4. Post-Processing Knowledge

**The Challenge:** Photo editing has its own vocabulary:
- RAW vs JPEG
- Color space (sRGB, Adobe RGB)
- Histogram reading
- Curves, levels, HSL

**Edge Cases:**

1. **Software-specific workflow**: "Lightroom Classic Catalog" at 180 words
   - Current: Explains catalog vs folders, .lrcat data
   - Problem: Assumes reader knows what a "catalog" is in this context
   - Verdict: NOT self-contained — "catalog" here means database, not collection

2. **Technical format note**: "RAW vs JPEG" at 250 words
   - Current: Explains compression, bit depth, workflow
   - Problem: Uses "bit depth" without explanation
   - Verdict: PARTIALLY self-contained — could add "(color information per pixel)"

3. **Color management**: "Wide Gamut Monitors" at 150 words
   - Current: Explains gamut, sRGB, Adobe RGB
   - Problem: "Gamut" is unexplained
   - Verdict: NOT self-contained

---

## 5. The Visual Problem

**Unique to Photography:** Photography is inherently visual, but notes are text.

**Edge Cases:**

1. **Visual technique described textually**: "Panning Shot" at 100 words
   - Current: "Follow subject with camera, use slow shutter"
   - Problem: Impossible to truly understand without video example
   - Verdict: Self-contained BUT incomplete — describes action, not outcome

2. **Composition note**: "Rule of Thirds" at 120 words
   - Current: Explains grid, placing subject at intersections
   - Problem: Works well — visual concept translated to text
   - Verdict: SELF-CONTAINED — good model

3. **Abstract concept**: "Negative Space" at 90 words
   - Current: "Empty area around subject"
   - Problem: "Empty" is misleading — space contributes to composition
   - Verdict: NOT ACCURATE, not self-contained issue but content issue

**Suggested Improvement:**
> For visually-dependent domains like photography: notes should describe what the viewer SEES, not just what the photographer DOES. "Use panning" → "Keep subject sharp while blurring background to show motion."

---

## 6. Test Refinements

**Original Test:** "Read the note in isolation. Does it make sense without following any links?"

**Photography-Refined Test:**
1. Read the note without following links
2. For each technical term: Can you explain it in your own words without looking it up?
3. For each equipment name: Do you understand what it DOES (even if not the specific model)?
4. For each technique: Can you picture what the result looks like?

**Edge Cases That ARE Acceptable:**
- Brief parenthetical definitions (1-2 sentences max)
- Reference to "standard" equipment without full explanation (e.g., "a tripod" — everyone knows what that is)
- Genre conventions that are self-explanatory from context

**Edge Cases That Are NOT Acceptable:**
- Abbreviations without expansion on first use
- Technique names that assume prior domain knowledge
- Equipment terminology without context

---

## 7. Summary of Findings

| Note Type | Self-Contained? | Common Issue |
|----------|-----------------|--------------|
| Single technical term | Sometimes | No visual/definition context |
| Equipment recommendation | Often not | Assumes gear knowledge |
| Technique how-to | Usually | Assumes understanding of parameters |
| Artistic advice | Partially | Context dependencies not stated |
| Post-processing | Often not | Software-specific jargon |

---

## Seed Rule Refinement Suggestion

**Current Rule:**
> Every note must be self-contained — readable without clicking any links.

**Suggested Refinement:**
> Every note must be self-contained — readable without clicking any links. For technically dense domains (photography, medicine, engineering), brief inline definitions (1-2 sentences) for core technical terms are acceptable and do not violate self-containment. Visual knowledge domains should describe observable outcomes, not just actions.

**Why:** Technical domains have legitimate terminology that cannot be eliminated. The test should distinguish between:
1. Terms that NEED explanation (core concepts)
2. Terms that don't (common vocabulary, equipment categories)
3. Terms that need visual description (composition, technique outcomes)

**Photography-Specific Test:**
- Pick 5 random photography notes
- For each: identify all technical terms
- Can you understand the note's meaning without looking up any term?
- If no: flag for inline definition addition

## Related
- [[AI-Assisted Knowledge Management Seed]] — The original Seed rule being tested
- [[Stress Test - Self-Contained Notes Rule Across Domains]] — General domain-agnostic test
- [[Atomic Note Principle]] — One idea per note
- [[Stress Test - Atomicity Rule Across Domains]] — Testing atomicity across domains
- [[Frontier Exploration - Jargon vs Plain Language]] — Handling technical terminology
- [[Frontier Exploration - Tool-Interface Knowledge]] — Technical tool knowledge
- [[Seed Stress Test - Cooking Knowledge Base]] — Another domain stress test
