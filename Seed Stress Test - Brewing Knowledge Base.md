---
last-reviewed: 2026-03-14
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
tags:
  - seed-stress-test
  - brewing-domain
  - edge-case
---

# Seed Stress Test: Brewing Knowledge Base

Testing Seed rules against beer brewing — a craft domain combining procedural knowledge, scientific principles, and sensory evaluation.

> "Rules that don't survive contact with reality are bad rules." — [[Seed Rule: Self-Improvement]]

## Domain Overview

Brewing knowledge bases present unique challenges:
- Procedural content (recipes, mashing schedules, hop additions) legitimately exceeds 300+ words
- Scientific concepts (enzyme activity, yeast metabolism, pH chemistry) require precise terminology
- Equipment ranges from simple (pot + bucket) to complex (commercial breweries)
- Ingredient substitutions have chemical implications beyond simple ratios
- Sequential timing is critical (hop stands, fermentation stages)
- Sensory evaluation is subjective but has documented descriptors

---

## 1. Word Count Rule (100-300 words)

**Rule:** Notes should be 100-300 words. Notes >300 likely contain multiple ideas.

**Brewing Application:**

| Note Type | Example | Word Count | Should Flag? |
|-----------|---------|------------|--------------|
| Recipe | "West Coast IPA" | 600+ | No - executable procedure |
| Style Guide | "IPA Characteristics" | 250 | No - coherent topic |
| Mashing Science | "Enzyme Activity Temps" | 180 | Yes - within range |
| Yeast Pitching | "Pitch Rate Calculator" | 400+ | No - technical spec |

**Edge Cases Identified:**

1. **Recipe formats**: A complete recipe with grain bill, hop schedule, yeast, water chemistry, and process notes easily exceeds 600 words. This is procedural content — splitting would make it harder to use.

2. **Style guidelines**: Beer style documents (BJCP guidelines) are comprehensive by nature — a single "Imperial Stout" style entry can be 500+ words covering appearance, aroma, flavor, mouthfeel, and technical parameters.

3. **Troubleshooting guides**: "Why is my beer cloudy?" often has 5+ potential causes with different solutions — this is conditional/troubleshooting knowledge that legitimately bundles multiple branches.

**Gap Found:** The Seed's edge case for procedural content is correct, but doesn't explicitly address **troubleshooting guides with 3+ branches**.

**Suggested Improvement:**
> For conditional/troubleshooting notes: If 3+ branches exist AND each branch has unique actionable guidance → Keep together as decision-point hub. Split only if branches could stand alone as independent topics.

**Related:** [[Atomic Note Principle]], [[Frontier Exploration - Conditional and Troubleshooting Knowledge]]

---

## 2. "At Least 2 Links" Rule

**Rule:** Every note must link to at least 2 other notes OR be tagged `foundational: true`.

**Brewing Application:**

| Note Type | Outgoing Links | Natural? |
|-----------|----------------|----------|
| "Water Chemistry" | pH, alkalinity, sulfates, chlorides | 4+ — yes |
| "Centennial Hops" | aroma, bittering, IPAs | 2+ — yes |
| "Starsan" | sanitizer, preparation, contact time | 3+ — yes |
| "Mash pH" | water chemistry, grist, acid | 3+ — yes |

**Edge Cases:**

1. **Single-hop recipes**: "Single-Hop Pale Ale" using only "Cascade" — may only naturally link to Cascade and the style. Second link forced?

2. **Equipment-specific notes**: "Brewing in a 5-gallon cooler" only naturally links to "cooler mash tun" and maybe "batch sparging" — limited by equipment choice.

3. **Foundational primitives**: Water, salt, and basic sanitizer might need `foundational: true` like cooking's salt/oil.

**Problem:** The rule doesn't address **equipment-constrained knowledge** — knowledge that is only relevant to a specific setup.

**Suggested Improvement:**
> Add edge case: Domain-specific equipment used in exactly one procedure may legitimately have 1 natural link. Tag with `specialized: true` OR link to equipment category note.

**Related:** [[Stress Test - Equipment Dependencies Rule in Music Production]]

---

## 3. Self-Contained Notes Rule

**Rule:** Every note must be self-contained — readable without clicking any links.

**Brewing Application:**

| Note | Self-Contained? | Issue |
|------|-----------------|-------|
| "Water Chemistry" | Partial | References "pH" without defining |
| "Enzyme Rest Times" | Yes | Tables are complete |
| "Hop bitterness" | Partial | Links to IBU calculator for math |

**Edge Cases:**

1. **Technical calculations**: "IBU calculation" requires a formula link to be useful — the formula IS the knowledge. Self-containment would require embedding complex math.

2. **Equipment-specific context**: "Pump priming" in a commercial brewery assumes knowledge of commercial equipment — explaining every term would bloat the note.

**Gap:** The Seed's domain variation note addresses this partially but calculation-heavy domains need explicit guidance.

**Suggested Improvement:**
> For technical calculation notes: Core formula must be self-contained; complex calculations may link to verification tools. Tag with `knowledge-type: procedural` and `calculation: required`.

**Related:** [[Stress Test - Self-Contained Notes Rule Across Domains]]

---

## 4. Experiential Knowledge Rule

**Rule:** For experiential domains, include `experiential-component` frontmatter.

**Brewing Application:**

Brewing is highly experiential — "it looks done" vs. "it reached 152°F" represents knowledge that experienced brewers have but novices lack.

| Note | Experiential Component |
|------|----------------------|
| "Fermentation is complete" | Essential — racking too early ruins beer |
| "Hot break has formed" | Partial — visible but timing matters |
| "Water chemistry numbers" | None — purely analytical |
| "Dry hop aroma assessment" | Essential — requires trained palate |

**Edge Cases:**

1. **Visual cues**: "The hot break looks like egg whites" — experiential proxy for temperature

2. **Sensory calibration**: "This beer has diacetyl" — requires prior exposure to know what diacetyl smells like

3. **Process intuition**: Knowing when to knock out — temperature + visual + experience combination

**Observation:** The Seed's existing rule covers this well. Brewing confirms: experiential-component tagging is necessary.

**Related:** [[Frontier Gap - Embodied Knowledge]]

---

## 5. Confidence Markers Rule

**Rule:** Use confidence markers (high/emerging/disputed/obsolete).

**Brewing Application:**

| Knowledge | Confidence | Notes |
|-----------|------------|-------|
| "Boiling kills bacteria" | High | Scientific fact |
| "Lagering improves clarity" | Emerging | Debated in craft community |
| "Oregon ale yeast strain" | Domain-specific | Specific to region |
| "Carapils adds head retention" | High | Widely accepted |

**Edge Cases:**

1. **Homebrew vs. commercial practices**: Some advice that works in 5-gallon batches fails commercially and vice versa — scope matters.

2. **Traditional methods**: " decoction mashing is necessary for dark beers" — contested; some brewers say it's tradition, not necessity.

3. **New hop varieties**: "Hop X has notes of grapefruit" — emerging, may evolve as hop becomes established.

**Suggested Improvement:**
> Add `scope: homebrew|commercial|both` to confidence markers for craft domains where practice differs by scale.

See [[Seed Improvement - Scale Scope Metadata]] for a detailed proposal.

---

## 6. Ingredient Substitution Rule

**Rule:** Substitution knowledge requires ratio, property impact, and contextual applicability.

**Brewing Application:**

| Substitution | Ratio | Property Impact | Context |
|--------------|-------|-----------------|---------|
| Munich for Vienna | 1:1 | Adds malt sweetness | Darker lagers |
| Cascade for Centennial | 1:1 | Less citrus, more floral | All IPAs |
| US-05 for Windsor | 1:1 | Cleaner finish | Any ale |

**Edge Cases:**

1. **Hop substitutions by purpose**: Cascade can sub for Centennial for aroma, but not for bittering — purpose matters, not just variety.

2. **Yeast substitutions**: "Nottingham for US-05" — works but attenuates differently — affects final gravity.

3. **Water chemistry**: "Gypsum for chlorides" — changes pH profile differently — not simple 1:1.

**Gap Found:** The Seed's substitution rule is adequate but doesn't address **directional substitution** (A can sub for B but not vice versa).

**Suggested Improvement:**
> For directional substitutions: Include `substitution-direction: bidirectional|unidirectional` and note which direction works.

---

## 7. Equipment Dependencies Rule

**Rule:** Document equipment requirements with required vs. optional and alternatives.

**Brewing Application:**

| Process | Required | Optional | Alternatives |
|---------|----------|----------|--------------|
| BIAB | Pot, bag | Thermometer | N/A — minimal |
| HERMS | HLT, coil, pump | RIMS controller | Electric brew |
| Decoction | Pot, mash tun | None | Skip step |

**Edge Cases:**

1. **Scalability**: "Stirplate for starter" — required for 5+ gallon batches, optional for 1-gallon.

2. **Climate-dependent**: "Refrigeration for lagering" — required in warm climates, ambient works in cold.

3. **Skill-dependent**: "Refractometer" — required for precision, hydrometer works for beginners.

**Observation:** The Seed's existing rule handles this well. Brewing confirms: equipment tier tagging helps.

---

## 8. Temporal Knowledge Rule

**Rule:** Track knowledge validity periods — include `valid-from` and `valid-until`.

**Brewing Application:**

| Knowledge | Temporal Scope |
|-----------|----------------|
| "Water chemistry targets" | Stable — decades |
| "Hop varieties trending" | 5-10 years |
| "Popular style guide" | Annual (BJCP updates) |
| "Recipe trends" | 2-5 years |

**Edge Cases:**

1. **Style evolution**: "New England IPA" — emerged 2015, still evolving — current but not stable.

2. **Equipment models**: "Anvil foundry notes" — specific to model — valid until model discontinued.

3. **Yeast strains**: "English strain availability" — fluctuates with strain popularity.

**Suggested Improvement:**
> For trend knowledge: Use `validity-trend: emerging|stable|declining` in addition to dates.

---

## Summary: Rule Refinements Needed

1. **Word count**: Add explicit guidance for troubleshooting notes with 3+ branches
2. **Linking**: Add edge case for equipment-constrained knowledge
3. **Self-containment**: Add guidance for calculation-heavy domains
4. **Substitution**: Add directional substitution tracking
5. **Confidence**: Add scale scope (homebrew/commercial/both)

---

## Related

- [[Seed Stress Test - Cooking Knowledge Base]] — Similar craft domain with procedural content
- [[Stress Test - Equipment Dependencies Rule in Music Production]] — Equipment-intensive domain comparison
- [[Atomic Note Principle]] — Foundation rule
- [[Frontier Exploration - Experiential Knowledge Capture]] — Tacit knowledge in craft domains
