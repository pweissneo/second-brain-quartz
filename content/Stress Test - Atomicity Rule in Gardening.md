---
last-reviewed: 2026-03-10
lifecycle: active
confidence: emerging
tags:
- seed-stress-test
- gardening-domain
- edge-case
---

# Stress Test: Atomicity Rule in Gardening Knowledge

## Seed Rule Being Tested
**Rule:** Distinguish conceptual notes from procedural content — atomicity applies to ideas, not to executable workflows.
**Test:** For notes >300 words: (1) Is this an executable procedure? (2) Would splitting make it harder to use? (3) Are parts independently reusable? Keep together if yes to 1-2; split if yes to 3.

## Application to Gardening Knowledge Base

### Where the Rule Works Well

Gardening has clear procedural content that benefits from staying together:

- **Planting a tomato** → Sequential steps: prepare soil, dig hole, remove lower leaves, bury stem, water deeply. Splitting would make it unusable.
- **Building a raised bed** → Materials list, frame assembly, soil filling — must stay together as a workflow.
- **Making compost** → Layering greens/browns, turning schedule, knowing when ready — procedural by nature.

### Edge Case: Seasonal Knowledge Overlap

**Problem:** Gardening procedures span seasons, creating long notes that cover multiple time-based steps:

> **Illustrative example** (hypothetical): "Growing Tomatoes" contains:
> - Spring: planting, hardening off
> - Summer: watering, pruning, pest control
> - Fall: harvesting, end-of-season cleanup
> - Winter: soil preparation for next year

This note is 800+ words but splitting it would destroy the comprehensive "tomato growing" concept that gardeners want in one place.

**Test Question:** Should "Growing Tomatoes" be split into:
- "Planting Tomatoes" (spring)
- "Summer Tomato Care" (summer)
- "Harvesting Tomatoes" (fall)

**Analysis:** The Seed says split if "parts are independently reusable." In gardening:
- A note on "Tomato Pests" IS independently reusable (applies across seasons)
- A note on "Tomato Pruning" IS independently reusable (summer-specific but referenced across seasons)
- But "When to Plant Tomatoes" is NOT independent — it's part of an annual cycle

**Verdict:** The rule works BUT needs refinement for seasonal domains: apply atomicity WITHIN each season, but keep seasonal cycles together as hub notes.

### Edge Case: Plant-Specific vs. Technique-Specific

**Problem:**Gardening knowledge can be organized two ways:

1. **By plant:** "How to grow tomatoes" → contains all techniques for tomatoes
2. **By technique:** "Pruning" → contains pruning for tomatoes, roses, fruit trees, etc.

The Seed prioritizes by idea (technique), but gardeners often think by plant.

> **Illustrative example** (hypothetical):
> - Note A: "Tomato Growing Guide" (800 words, all tomato techniques)
> - Note B: "Pruning Tomatoes" (200 words)
> - Note C: "Pruning Roses" (200 words)
> - Note D: "Pruning" (conceptual, 150 words)

The atomicity rule would say: split "Tomato Growing Guide" into atomic technique notes. But gardeners value the plant-centric view as a quick reference.

**Test Question:** Which approach should the Seed recommend for gardening?

**Analysis:** The Seed's principle (one idea per note) is correct. But in gardening:
- **Reference gardeners** want plant-centric notes (quick lookup)
- **Learning gardeners** want technique-centric notes (build skills)

**Verdict:** Keep the Seed as-is. Create BOTH: technique notes (atomic) and plant hub notes (navigation, linking to techniques). The hub note "Tomato Growing Guide" can be short and link to "Planting Tomatoes," "Watering Tomatoes," "Pruning Tomatoes," etc.

### Edge Case: Climate/Zone Dependency

**Problem:** Same procedure has different parameters across hardiness zones:

> **Illustrative example** (hypothetical): "Planting Tomatoes"
> - Zone 4: plant late May, after last frost
> - Zone 7: plant mid-April
> - Zone 9: plant March, possibly February

The atomic note "Planting Tomatoes" cannot be self-contained without climate context.

**Analysis:** This is exactly what the Seed's scope rules address:
- Knowledge dependent on climate zones needs explicit scope tags
- The atomicity rule applies to the CONCEPT of planting, not the specific dates

**Verdict:** The Seed handles this correctly through `hardiness-zone` scope tags. The atomic note "Planting Tomatoes" describes the technique (the idea), while scope metadata handles the zone-specific variations.

### Edge Case: Tacit Knowledge in Gardening

**Problem:** Much gardening knowledge is experiential/tacit:

- "When soil feels dry" — must touch soil to understand
- "The right amount of pressure" — compaction varies by soil type
- "Signs of under-watering" — visual recognition requires seeing examples

> **Illustrative example** (hypothetical): A note on "Watering Newly Planted Trees" says "water deeply until soil is saturated." What does "saturated" feel like? What does "deeply" mean?

**Test Question:** Can atomic notes capture tacit gardening knowledge?

**Analysis:** The Seed's "Tacit Knowledge" section addresses this. For gardening:
- Core procedural steps CAN be atomic (the sequence)
- Tacit knowledge (feel, visual recognition) should be flagged with "requires-experience" or linked to video examples
- Failure modes are easier to capture than correct states ("over-watered leaves turn yellow" is easier to describe than "correctly watered")

**Verdict:** The Seed handles this. Notes should flag tacit elements explicitly: "This step requires hands-on feel — [description of what to watch for]."

## Recommendations

### For the Seed Rule (Distinguish conceptual vs procedural):

The rule is sound but should clarify:

**Refined Rule:** For domains with strong seasonal cycles (gardening, agriculture, construction seasons), apply atomicity WITHIN each temporal cycle but keep annual/hub notes as navigation. Technique notes should be atomic; plant/animal notes should be hubs.

**Test:** For a gardening note >300 words:
1. Is this a complete procedure WITHIN one season/timeframe? → Keep together
2. Does this span multiple seasons/cycles? → Split into seasonal atomic notes + hub note
3. Is this a reference quick-lookup (by plant/animal)? → Create as hub linking to technique notes

### For Gardening Domain Notes:

1. **Create seasonal hub notes** (Spring Garden Tasks, Summer Garden Tasks, etc.) that link to seasonal atomic notes
2. **Create plant hub notes** (Tomatoes, Roses, etc.) that link to technique notes
3. **Tag all procedures** with `verification-status: unverified|tested|community-validated`
4. **Tag climate-dependent knowledge** with `hardiness-zone: []`
5. **Flag tacit knowledge** with explicit "requires hands-on experience" warnings

## Related
- [[Atomic Note Principle]]
- [[Frontier Exploration - Climate-Zone-Dependent Knowledge]]
- [[Stress Test - Atomicity Rule in Cooking]]
- [[Frontier Exploration - Tacit Knowledge Capture]]
