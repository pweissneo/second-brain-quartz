---
last-reviewed: 2026-03-27
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
tags:
  - seed-stress-test
  - 5-1-ratio
  - sewing-domain
  - edge-case
---

# Seed Stress Test: 5:1 Ratio in Sewing Knowledge Base

Testing the 5:1 personal-to-general knowledge ratio rule in the sewing domain reveals unique challenges around technique specificity, pattern fitting, material knowledge, and the relationship between published patterns and personal alterations.

## Domain Overview

Sewing knowledge spans multiple categories:
- Techniques (hand stitches, machine operations, construction methods)
- Pattern reading and fitting
- Material/fabric knowledge
- Tool expertise
- Design and construction decisions

---

## Does This Rule Make Sense for Sewing?

**Analysis:** Yes, with significant modifications.

The fundamental principle — capture original insights over restatable facts — applies. A sewing vault full of patterns from books provides less value than one capturing what actually worked for YOUR body, YOUR fabric choices, YOUR style preferences.

However, sewing has unique dynamics:
- Commercial patterns are widely available but require significant personal adaptation
- Fitting knowledge is highly personal and body-specific
- Fabric behavior varies dramatically based on type, weight, drape
- Technique application depends on fabric, project, and skill level

The rule makes sense, but the test needs calibration for sewing's specific knowledge dynamics.

---

## Edge Cases Identified

### Edge Case 1: Pattern Fitting Notes

**Problem:** A note about "Full Bust Adjustment (FBA)" is general knowledge available in many fitting books. Does this count against the 5:1 ratio?

**Analysis:** The technique itself is general (widely documented), but the SPECIFIC alterations for YOUR body are personal. A note documenting "my FBA for Simplicity 8877 required adding 2" at the bust line" is personal because no one else has your exact proportions.

**Modified test for sewing:** Distinguish between:
- General fitting techniques (count as general)
- Body-specific pattern alterations (count as personal)
- Fit adjustments that worked/didn't for specific projects (count as personal)

**Recommendation:** Add `fitting-status: technique | body-specific | project-verified` frontmatter to distinguish between general and personal fitting knowledge.

---

### Edge Case 2: Fabric-Specific Knowledge

**Problem:** Notes about "silk charmeuse behavior" or "cotton twill properties" seem general, but how a specific fabric behaves in YOUR conditions (humidity, washing, wearing) is personal.

**Analysis:** General fabric properties are widely documented. Personal knowledge about how a fabric behaves in your specific use case (does this silk snag in your climate? does this cotton shrink unexpectedly?) provides unique value.

**Modified test:** For fabric notes: Does this document YOUR specific experience with this fabric, not just general properties? If yes, count as personal even if the base knowledge is general.

**Recommendation:** Add `fabric-knowledge-type: general-property | personal-experience` frontmatter.

---

### Edge Case 3: Tool-Specific Settings

**Problem:** Notes about "thread tension settings" or "stitch length for quilting cotton" could be general (machine manuals), but YOUR specific machine's behavior is unique.

**Analysis:** Each sewing machine has its own personality. Notes about your specific machine's quirks, optimal settings for your common projects, and troubleshooting solutions are personal knowledge that cannot be found in any manual.

**Modified test:** Does this document YOUR specific machine's behavior, not general machine capabilities? If yes, count as personal.

**Recommendation:** Add `equipment-specific: true` frontmatter for notes documenting machine-specific knowledge.

---

### Edge Case 4: Project Documentation

**Problem:** Notes about specific projects (making a specific dress from a specific pattern) blend general pattern instructions with personal construction choices.

**Analysis:** The pattern is general (purchasable by anyone). Your modifications, fit adjustments, fabric choices, and construction decisions are personal. A note documenting your version of a commercial pattern is personal even though the base pattern is general.

**Modified test:** For project notes: Does this include YOUR modifications, choices, and lessons learned? If yes, count as personal. Pure pattern instructions (not your version) count as general.

**Recommendation:** Add `project-status: pattern-instructions | personal-version | lesson-learned` to track note type.

---

### Edge Case 5: Technique Application Context

**Problem:** "How to sew a French seam" is a technique available in any sewing book. Does this violate the 5:1 rule?

**Analysis:** The technique is general, but NOTES ABOUT WHEN TO USE A SPECIFIC TECHNIQUE in your specific context are personal. A note about "I use French seams for lightweight fabrics but flat-felled seams for denim" combines general technique knowledge with personal application.

**Modified test:** Distinguish between:
- Technique tutorials (general, count against ratio)
- Technique selection rationale (personal, applies to ratio)
- Technique adaptation for specific fabrics/projects (personal, applies to ratio)

**Recommendation:** Add `technique-status: tutorial | selection-rationale | adaptation` frontmatter.

---

### Edge Case 6: Traditional/Heirloom Knowledge

**Problem:** Some sewing knowledge comes from family traditions (grandmother's techniques, ethnic stitching methods). Is this personal or general?

**Analysis:** Traditional techniques passed down through family are neither purely personal nor general — they're cultural knowledge with personal transmission. They provide unique value because they often aren't documented in published sources.

**Modified test:** For notes about traditional techniques: Does this document a technique learned through personal transmission? If yes, this is a third category — traditional knowledge that counts as personal-equivalent because it's not widely available.

**Recommendation:** Add `knowledge-origin: family-tradition | cultural | self-taught | published` to track source.

---

### Edge Case 7: The "Pattern Stash" Problem

**Problem:** Sewing enthusiasts often accumulate patterns (both purchased and downloaded). Notes about pattern collections could bloat the vault with "general" content.

**Analysis:** A list of owned patterns is meta-information, not knowledge. But notes about which patterns you've made, modifications you made, and which you'd recommend are personal.

**Modified test:** Pattern inventory lists count as operational data, not knowledge notes. Only notes that include personal experience with patterns count toward the vault.

**Recommendation:** Use `contains-knowledge: true | false` frontmatter. Only knowledge-containing notes count toward ratio calculations.

---

## Modified Test for Sewing Domain

For sewing knowledge bases, modify the 5:1 test:

1. **Identify the note category:**
   - Technique tutorial (general)
   - Fitting adjustment (technique = general; body-specific = personal)
   - Fabric knowledge (general property = general; personal experience = personal)
   - Project documentation (your version = personal; pure instructions = general)
   - Tool/machine settings (general = general; your machine = personal)
   - Traditional knowledge (personal-equivalent if family/cultural transmission)

2. **Apply modified ratio:**
   - For technique vaults (learning many techniques): 3:1 may be appropriate
   - For fitting-specialist vaults: 5:1 appropriate
   - For project-focused vaults: 7:1 appropriate (personal modifications dominate)

3. **Track categories with frontmatter:**
   ```yaml
   sewing-knowledge-type: technique | fitting | fabric | project | tool | tradition
   personal-content: true | false
   ```

---

## Seed Rule Refinement Recommendation

**Rule:** Apply the 5:1 personal-to-general knowledge ratio with domain-specific calibration for highly contextual knowledge domains.

**Why:** Domains like sewing where personal adaptation is central (body-specific fitting, machine-specific settings, fabric-specific behavior) need modified ratios that reflect the actual personal content ratio achievable.

**Test:** For knowledge domains with high context-dependence (fitting, tailoring, crafts with equipment variation): (1) Can you distinguish general technique from personal application? (2) Is the ratio calibrated to what's actually achievable in this domain? (3) Does frontmatter track personal vs. general content?

**See also:** 
- [[Seed Stress Test - 5-1 Ratio Across Domains]]
- [[Seed Stress Test - Craft Knowledge Bases]]
- [[Seed Stress Test - Photography Knowledge Base]] (similar equipment-specific issues)
