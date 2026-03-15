---
last-reviewed: 2026-03-15
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
tags:
  - seed-stress-test
  - craft-domain
  - edge-case
---

# Seed Stress Test: Craft Knowledge Bases

Testing Seed rules against craft domains — cooking and brewing — which combine procedural knowledge, scientific principles, and sensory evaluation.

> "Rules that don't survive contact with reality are bad rules." — [[Seed Rule: Self-Improvement]]

## Domain Overview

Craft knowledge bases (cooking, brewing, woodworking, etc.) face unique challenges:
- Procedural content (recipes, techniques, schedules) legitimately exceeds 300+ words
- Foundational ingredients/materials are referenced by everything but don't naturally link out
- Scientific principles require precise terminology
- Equipment ranges from simple to complex
- Ingredient/material substitutions have implications beyond simple ratios
- Sequential timing is critical
- Sensory evaluation is subjective but has documented descriptors

---

## 1. Word Count Rule (100-300 words)

**Rule:** Notes should be 100-300 words. Notes >300 likely contain multiple ideas.

### Cooking Application

| Note Type | Example | Word Count | Should Flag? |
|-----------|---------|------------|--------------|
| Recipe | "Boeuf Bourguignon" | 800 | No - executable procedure |
| Technique | "Searing Meat" | 250 | No - coherent topic |
| Ingredient | "Salt" | 80 | No - foundational primitive |

**Edge Cases:**

1. **Complete short recipes**: A complete recipe for "Hard Boiled Eggs" can be fully functional in 80 words. This is NOT a stub — it's complete and usable.

2. **The execution test**: Complete procedural content under 100 words is valid when:
   - The procedure can be executed from the note alone
   - All necessary information (ingredients, steps, timing) is present
   - No essential steps are omitted

### Brewing Application

| Note Type | Example | Word Count | Should Flag? |
|-----------|---------|------------|--------------|
| Recipe | "West Coast IPA" | 600+ | No - executable procedure |
| Style Guide | "IPA Characteristics" | 250 | No - coherent topic |
| Mashing Science | "Enzyme Activity Temps" | 180 | No - within range |

**Edge Cases:**

1. **Recipe formats**: A complete recipe with grain bill, hop schedule, yeast, water chemistry, and process notes easily exceeds 600 words. This is procedural content — splitting would make it harder to use.

2. **Troubleshooting guides**: "Why is my beer cloudy?" often has 5+ potential causes with different solutions — this is conditional/troubleshooting knowledge that legitimately bundles multiple branches.

**Gap Found:** The Seed's edge case for procedural content doesn't explicitly address **troubleshooting guides with 3+ branches**.

**Suggested Improvement:**
> For conditional/troubleshooting notes: If 3+ branches exist AND each branch has unique actionable guidance → Keep together as decision-point hub. Split only if branches could stand alone as independent topics.

**Related:** [[Atomic Note Principle]], [[Frontier Exploration - Conditional and Troubleshooting Knowledge]]

---

## 2. "At Least 2 Links" Rule

**Rule:** Every note must link to at least 2 other notes OR be tagged `foundational: true`.

### Cooking Application

Recipes naturally connect to ingredients, techniques, equipment, flavor profiles.

**Edge Cases:**
1. **True foundational primitives**: Salt, oil, water — used everywhere but don't link out
2. **Single-component recipes**: "Boiled egg" only links to "egg" and "boiling"
3. **Historical/period recipes**: Limited to period-accurate ingredients

### Brewing Application

| Note Type | Outgoing Links | Natural? |
|-----------|----------------|----------|
| "Water Chemistry" | pH, alkalinity, sulfates, chlorides | 4+ — yes |
| "Centennial Hops" | aroma, bittering, IPAs | 2+ — yes |
| "Single-Hop Pale Ale" | Cascade, pale ale style | 2 — borderline |

**Edge Cases:**

1. **Single-hop recipes**: Using only one hop variety may only naturally link to that hop and the style. Second link forced?

2. **Equipment-specific notes**: "Brewing in a 5-gallon cooler" only naturally links to cooler mash tun and batch sparging — limited by equipment choice.

3. **Foundational primitives**: Water, salt, and basic sanitizer need `foundational: true` like cooking's salt/oil.

**Problem:** The rule doesn't address **equipment-constrained knowledge** — knowledge only relevant to a specific setup.

**Suggested Improvement:**
> Add edge case: Domain-specific equipment used in exactly one procedure may legitimately have 1 natural link. Tag with `specialized: true` OR link to equipment category note.

---

## 3. Self-Contained Notes Rule

**Rule:** Every note must be self-contained — readable without clicking any links.

### Cooking Application
Most recipes are self-contained with ingredients lists and step-by-step instructions.

### Brewing Application

| Note | Self-Contained? | Issue |
|------|-----------------|-------|
| "Water Chemistry" | Partial | References "pH" without defining |
| "Enzyme Rest Times" | Yes | Tables are complete |
| "Hop Bitterness" | Partial | Links to IBU calculator for math |

**Edge Cases:**

1. **Technical calculations**: "IBU calculation" requires a formula link to be useful — the formula IS the knowledge. Self-containment would require embedding complex math.

2. **Equipment-specific context**: "Pump priming" assumes knowledge of commercial equipment — explaining every term would bloat the note.

**Gap:** Calculation-heavy domains need explicit guidance.

**Suggested Improvement:**
> For technical calculation notes: Core formula must be self-contained; complex calculations may link to verification tools. Tag with `knowledge-type: procedural` and `calculation: required`.

---

## 4. Experiential Knowledge Rule

**Rule:** For experiential domains, include `experiential-component` frontmatter.

### Cooking Application
- "The sauce is ready when it coats the spoon" — requires experience to recognize
- "The meat is done when it springs back" — tactile feedback only learned through practice

### Brewing Application

| Note | Experiential Component |
|------|----------------------|
| "Fermentation is complete" | Essential — racking too early ruins beer |
| "Hot break has formed" | Partial — visible but timing matters |
| "Dry hop aroma assessment" | Essential — requires trained palate |

**Edge Cases:**

1. **Visual cues**: "The hot break looks like egg whites" — experiential proxy for temperature

2. **Sensory calibration**: "This beer has diacetyl" — requires prior exposure to know what diacetyl smells like

**Observation:** The Seed's existing rule covers this well. Both cooking and brewing confirm: experiential-component tagging is necessary.

**Related:** [[Frontier Gap - Embodied Knowledge]]

---

## 5. Confidence Markers Rule

**Rule:** Use confidence markers (high/emerging/disputed/obsolete).

### Cooking Application

| Knowledge | Confidence | Notes |
|-----------|------------|-------|
| "Searing creates fond" | High | Scientific fact |
| "Resting meat improves juiciness" | High | Widely accepted |
| "Marinate for 24 hours maximum" | Emerging | Debated - some say longer is fine |

### Brewing Application

| Knowledge | Confidence | Notes |
|-----------|------------|-------|
| "Boiling kills bacteria" | High | Scientific fact |
| "Lagering improves clarity" | Emerging | Debated in craft community |
| "Decoction mashing necessary for dark beers" | Disputed | Tradition vs. necessity |

**Edge Cases:**

1. **Homebrew vs. commercial practices**: Some advice works in 5-gallon batches but fails commercially and vice versa — scope matters.

2. **Traditional methods**: Contested in both cooking and brewing — tradition vs. necessity.

**Suggested Improvement:**
> Add `scope: homebrew|commercial|both` or `scale: amateur|professional|both` to confidence markers for craft domains where practice differs by scale.

---

## 6. Ingredient/Material Substitution Rule

**Rule:** Substitution knowledge requires ratio, property impact, and contextual applicability.

### Cooking Application

| Substitution | Ratio | Property Impact | Context |
|--------------|-------|-----------------|---------|
| Butter for oil | 1:1 | Different flavor, texture | Baking only |
| Honey for sugar | 1:1 | Caramelization difference | Baking, need to reduce liquid |

### Brewing Application

| Substitution | Ratio | Property Impact | Context |
|--------------|-------|-----------------|---------|
| Munich for Vienna | 1:1 | Adds malt sweetness | Darker lagers |
| Cascade for Centennial | 1:1 | Less citrus, more floral | All IPAs |
| US-05 for Windsor | 1:1 | Cleaner finish | Any ale |

**Edge Cases:**

1. **Directional substitution**: Cascade can sub for Centennial for aroma, but not for bittering — purpose matters, not just variety.

2. **Yeast substitutions**: Affects attenuation and final gravity.

3. **Chemical substitutions**: "Gypsum for chlorides" — changes pH profile differently — not simple 1:1.

**Gap Found:** The Seed's substitution rule doesn't address **directional substitution** (A can sub for B but not vice versa).

**Suggested Improvement:**
> For directional substitutions: Include `substitution-direction: bidirectional|unidirectional` and note which direction works.

---

## 7. Equipment Dependencies Rule

**Rule:** Document equipment requirements with required vs. optional and alternatives.

### Cooking Application

| Process | Required | Optional | Alternatives |
|---------|----------|----------|--------------|
| Sautéing | Pan, heat | Lid | Steam in bag |
| Sous vide | Immersion circulator | Vacuum sealer | Ziploc bags |

**Edge Cases:**
1. **Climate-dependent**: "Proofing dough" — works at room temp in summer, needs oven in winter
2. **Skill-dependent**: "Instant read thermometer" — required for precision, works without for experienced cooks

### Brewing Application

| Process | Required | Optional | Alternatives |
|---------|----------|----------|--------------|
| BIAB | Pot, bag | Thermometer | N/A — minimal |
| HERMS | HLT, coil, pump | RIMS controller | Electric brew |
| Decoction | Pot, mash tun | None | Skip step |

**Edge Cases:**

1. **Scalability**: "Stirplate for starter" — required for 5+ gallon batches, optional for 1-gallon.

2. **Climate-dependent**: "Refrigeration for lagering" — required in warm climates, ambient works in cold.

3. **Skill-dependent**: "Refractometer" — required for precision, hydrometer works for beginners.

**Observation:** The Seed's existing rule handles this well. Both craft domains confirm: equipment tier tagging helps.

---

## 8. Sequential Knowledge Rule

**Rule:** Distinguish sequential knowledge (where order IS the knowledge) with `temporal-type: sequence`.

### Cooking Application

| Type | Example | temporal-type |
|------|---------|----------------|
| Bread baking | autolyse → bulk → shape → proof → bake | linear |
| Prep ingredients | Chop vegetables, make sauce | parallelizable |
| Reducing sauce | Reduce → taste → adjust → reduce | iterative |
| Searing meat | Depends on outcome of each step | conditional |

**Edge Cases:**

1. **Parallelizable steps**: Mise en place can happen in any order

2. **Interchangeable elements**: "Aromatics" — onions, carrots, celery (order matters slightly but not strictly)

3. **Technique vs. Recipe**: "Sautéing" as technique = static; "Sauté onions" in recipe = sequential

### Brewing Application

| Type | Example | temporal-type |
|------|---------|----------------|
| Mashing | Mash in → rest → sparge → boil | linear |
| Hop additions | Bittering → flavor → aroma | sequential timing |
| Fermentation | Primary → diacetyl rest → lagering | iterative |

---

## 9. Operational vs Synthesized Knowledge

**Rule:** Separate operational knowledge from synthesized knowledge — time-box or mark temporary.

### Cooking Application

| Note Type | Category | Action |
|-----------|----------|--------|
| "How to Roast Chicken" | Permanent | Keep |
| "Thanksgiving 2025 Menu" | Operational | Time-box |
| "Grandma's Chicken Soup" | Permanent | Keep (synthesizes technique + cultural) |
| "Week 10 Meal Plan" | Operational | Delete after week |

### Brewing Application

| Note Type | Category | Action |
|-----------|----------|--------|
| "West Coast IPA Recipe" | Permanent | Keep |
| "March 2026 Brew Log" | Operational | Archive after review |
| "Brewing Water Chemistry Guide" | Permanent | Keep |

**Edge Cases:**
- Personal opinion/review = operational debris
- Research/principle = synthesized
- Time-specific plans = operational
- Transferable techniques = synthesized

---

## 10. Terminology Consistency Rule

**Rule:** Pick one term per concept and use it everywhere.

### Cooking Application

**Edge Cases:**

1. **Genuinely different terms:**
   - Sauté vs pan-fry vs stir-fry (different techniques)
   - Broth vs stock (different preparations)

2. **Regional variations (both valid):**
   - Bell pepper (US/UK) vs capsicum (AU/NZ)
   - Eggplant (US) vs aubergine (UK)

3. **Technical vs common:**
   - "Deglaze" (technical) vs "add liquid to pan" (common)

### Brewing Application

1. **Style terminology**: Different guilds use different names for same styles
2. **Equipment names**: Regional variation in terminology ( conditioning vs. carbonation)

**Recommendation:**
> Terminology consistent UNLESS: (a) distinct terms represent different techniques, (b) regional variations both valid, (c) common + technical serve different audiences.

---

## 11. Temporal Knowledge Rule

**Rule:** Track knowledge validity periods — include `valid-from` and `valid-until`.

### Cooking Application

| Knowledge | Temporal Scope |
|-----------|----------------|
| Food safety temperatures | Stable — decades |
| Cooking technique fundamentals | Stable |
| Trend recipes | 2-5 years |

### Brewing Application

| Knowledge | Temporal Scope |
|-----------|----------------|
| "Water chemistry targets" | Stable — decades |
| "Hop varieties trending" | 5-10 years |
| "Popular style guide" | Annual (BJCP updates) |

**Edge Cases:**

1. **Style evolution**: "New England IPA" — emerged 2015, still evolving — current but not stable.

2. **Equipment models**: Specific to model — valid until discontinued.

**Suggested Improvement:**
> For trend knowledge: Use `validity-trend: emerging|stable|declining` in addition to dates.

---

## Summary: Rule Refinements Needed

1. **Word count**: Add explicit guidance for troubleshooting notes with 3+ branches; refine execution test for short procedural content
2. **Linking**: Add edge case for equipment-constrained knowledge and specialized tools
3. **Self-containment**: Add guidance for calculation-heavy domains
4. **Substitution**: Add directional substitution tracking
5. **Confidence**: Add scale scope (amateur/professional/both)
6. **Sequential knowledge**: Add `temporal-type: parallelizable` for craft domains

---

## Related

- [[Seed Stress Test - Chess Knowledge Base]] — Strategy game domain
- [[Seed Stress Test - Woodworking Knowledge Base]] — Craft domain comparison
- [[Seed Stress Test - Gardening Knowledge Base]] — Agricultural domain
- [[Domain-Specific Knowledge Bases]]
- [[Atomic Note Principle]]
- [[Linking Principle]]
- [[Stress Test - Atomicity Rule Across Domains]]
- [[Frontier Exploration - Conditional and Troubleshooting Knowledge]]
- [[Frontier Exploration - Jargon vs Plain Language]]
- [[Frontier Gap - Embodied Knowledge]]
