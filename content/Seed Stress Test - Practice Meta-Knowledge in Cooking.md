---
last-reviewed: 2026-03-24
last-updated: 2026-03-24
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
tags:
  - seed-stress-test
  - cooking
  - practice
  - domain-specific
---

# Seed Stress Test - Practice Meta-Knowledge in Cooking

> Stress testing the "separate practice meta-knowledge" rule against a cooking knowledge base.
> Related: [[AI-Assisted Knowledge Management Seed]], [[Frontier Exploration - Knowledge That Requires Active Practice to Validate]], [[Seed Gap - Practice Routine Structure]]

## Domain Context

Cooking involves multiple types of knowledge:
- Recipe knowledge (what to cook, how to make specific dishes)
- Technique knowledge (methods like sautéing, braising, emulsification)
- Ingredient knowledge (properties of specific ingredients)
- **Practice knowledge** (how to improve cooking skills, practice routines, skill development)
- Judgment knowledge (when food is done, flavor balancing, timing)

This stress test focuses on whether practice meta-knowledge should be separated from skill domain knowledge in cooking.

---

## Rule Under Test

**Rule (NEW - 2026-03-24):** Separate practice meta-knowledge from skill domain knowledge using dedicated practice notes.

**Why:** Daily practice knowledge (how to maintain consistent practice in skill-building domains) is fundamentally different from skill knowledge (the content of the skill itself). Mixing practice management with skill knowledge creates bloat and makes it hard to find either.

**Test:** Can you find your practice routine without navigating through skill notes? Do practice notes contain primarily HOW TO PRACTICE, not WHAT THE SKILL IS?

---

## Stress Test Results

### Does this rule make sense for cooking?

**Yes, with significant adaptation needed.**

In cooking, "practice" is messier than in other domains:
- Some cooking is "practice" (deliberate skill development)
- Some cooking is "meal preparation" (making food to eat)
- Some cooking is "experimentation" (trying new recipes/techniques)
- Some cooking is "performance" (cooking for others)

The rule assumes a clear distinction between "practicing a skill" and "using a skill" - but cooking blurs these lines constantly.

**Edge case - Meal prep as practice:**
- Meal prepping for the week involves repetition that builds skill
- Is meal prep documentation practice knowledge or skill knowledge?
- Recommendation: Distinguish by intent - if goal is skill improvement, it's practice; if goal is nutrition/efficiency, it's operational

**Edge case - Cooking for others as practice:**
- Cooking for family dinner vs cooking for a dinner party
- Both involve performance but have different practice value
- Recommendation: Add `practice-type: deliberate | incidental` to distinguish intentional skill work from routine cooking

### Is the Test executable?

**Partially.** 

The test asks: "Can you find your practice routine without navigating through skill notes?"

In cooking, this is complicated because:
- Practice often happens IN the context of recipes/techniques
- "Practice sautéing" means doing the technique, which requires linking to technique notes
- Practice notes that don't link to skill notes may be useless

**Modified test for cooking:**
- Can you find your practice routine documentation?
- Does it separate "what to practice" (skill references) from "how to practice" (the meta-structure)?
- Can you execute a practice session using only practice notes, or do you need skill notes?

**Recommendation:** The test needs modification for cooking - it should allow practice notes to reference skill notes while keeping the meta-structure (schedules, goals, progress tracking) separate.

### Edge Cases

**Edge case 1: Technique drilling vs cooking meals**

In music, you practice scales separately from performing pieces. In cooking:
- Do you separate "technique drills" (practice making emulsions) from "cooking meals"?
- Some techniques only improve through actual cooking (timing, plating, flavor building)
- This creates tension: should practice notes link to recipes that use techniques, or only to technique notes?

**Resolution:** Distinguish by repetition type - repetitive drill (same technique many times) goes in practice notes; integrated cooking (technique in context) stays in skill notes.

**Edge case 2: Practice feedback loops**

In cooking, you often learn from eating what you cook. The practice note might include:
- What you cooked (recipe/technique)
- What you learned (taste, timing, technique)
- What to improve (next practice)

This creates a note that IS both practice (meta) AND skill (content).

**Resolution:** Use `contains-feedback: true` in frontmatter to indicate notes that include both practice and skill content, but keep the PRIMARY purpose (tracking progress vs capturing knowledge) clear.

**Edge case 3: Seasonal practice opportunities**

Cooking practice opportunities vary by season:
- Summer: grilling, fresh ingredients
- Winter: braising, preservation
- This affects what can be practiced when

**Resolution:** Add `practice-season: spring|summer|fall|winter|any` to practice notes. Some practice goals only apply seasonally.

**Edge case 4: Ingredient availability affecting practice**

You can't practice certain techniques without specific ingredients:
- Lobster cooking requires lobsters
- Certain fish are seasonal
- This means practice goals may need to wait

**Resolution:** Add `ingredient-dependent: true` and `required-ingredients:` fields to practice notes for technique-dependent practice.

---

## Modified Rule for Cooking

For cooking knowledge bases, apply this modified rule:

**Rule:** Separate practice meta-knowledge from skill domain knowledge, BUT allow practice notes to reference skill notes when the reference is necessary to define WHAT to practice. Keep the practice meta-structure (schedules, goals, progress tracking, feedback) in dedicated practice notes.

**Test:** 
1. Can you find your practice routine without navigating through skill notes? (Primary test)
2. Do practice notes contain primarily HOW TO PRACTICE, not WHAT THE SKILL IS? (Content test)
3. If practice notes reference skill notes, is the reference minimal (just defining "what") rather than substantive (the practice IS the skill)? (Structure test)

**Frontmatter for cooking practice notes:**
```yaml
type: practice-routine
skill-domain: cooking
practice-type: deliberate|incidental|experimental
practice-season: spring|summer|fall|winter|any
ingredient-dependent: true|false
required-ingredients: [list]
contains-feedback: true|false
```

---

## Comparison to Other Domains

| Domain | Practice Separation Clarity | Challenge |
|--------|---------------------------|-----------|
| Music | High (practice vs performance clear) | Instrument-specific variations |
| Sports | High (training vs competition) | Physical recovery cycles |
| Coding | High (deliberate practice vs shipping) | Context switching overhead |
| Cooking | Medium | Meal prep vs practice vs experimentation blur |
| Writing | Low | "Practice writing" is often just writing |

Cooking has the most ambiguity between "practice" and "doing" because cooking serves multiple purposes simultaneously (nutrition, pleasure, skill development, social).

---

## Recommendation

Keep the rule but add the cooking-specific edge cases to the Seed. The separation is valuable even if the boundary is fuzzier in cooking than in other domains.

Add to Seed as edge case under the main rule.