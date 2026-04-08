---
last-reviewed: 2026-04-04
last-updated: 2026-04-07
lifecycle: frontier
confidence: medium
knowledge-type: meta
verification-status: unverified
access-pattern: decision
author-type: ai-assisted
tags:
  - frontier-exploration
  - safety-critical
  - food-knowledge
  - dietary-restrictions
  - allergens
---

# Frontier Exploration - Dietary Restrictions and Allergen Knowledge Handling

## The Gap

The Seed covers verification, source quality, and confidence markers extensively. However, it lacks explicit guidance for a high-stakes category of knowledge: **dietary restrictions and allergen information** in food knowledge bases.

When building a cooking or food knowledge base, AI agents need rules for handling:
- Food allergies (nuts, dairy, gluten, shellfish, etc.)
- Dietary restrictions (vegetarian, vegan, halal, kosher, medical diets)
- Intolerances (lactose, FODMAPs)
- Cross-contamination risks

Getting this wrong can cause real harm — but the Seed has no explicit guidance for this category.

## Why It Matters

### Safety Implications
- Allergic reactions can be life-threatening
- Dietary restrictions can be religious/ethical requirements
- Medical diets can be life-critical (diabetic,PKU)
- Cross-contamination is a real risk even with "trace" amounts

### Knowledge Quality
- Allergen info must be accurate and current
- Source reliability matters more here (food regulations change)
- "Most recipes work" isn't good enough when someone's health is at stake

### Verification Differences
- Standard verification (source credibility check) is insufficient
- Requires: regulation awareness, brand-specific verification, cross-reference checking
- "I read it somewhere" isn't acceptable for allergen claims

## What the Seed Currently Covers

The Seed has relevant rules but no explicit application to allergens/dietary:

1. **Confidence Markers** — Could apply `confidence: high/medium/low` but doesn't specify allergen-specific thresholds

2. **Verification Priority** — Food knowledge has priority rules, but allergens aren't singled out

3. **Safety-Critical Knowledge** — The Seed mentions safety-critical procedural knowledge but focuses on execution safety, not ingredient safety

4. **Source Quality Hierarchy** — Doesn't address food safety source types (FDA, allergists, brands)

## The Specific Gap

The Seed lacks:

1. **Allergen-first verification** — Rules for treating allergen info as a special verification category requiring higher confidence thresholds

2. **Dietary restriction tagging** — Schema for tracking dietary compatibility (vegan, halal, etc.)

3. **Source requirements for allergen claims** — What sources are acceptable for allergen information

4. **Cross-contamination handling** — How to note and verify "may contain" statements

5. **Temporal sensitivity for allergen rules** — Food regulations change; rules for tracking outdated allergen guidance

## Proposed Framework

### Allergen Information Schema

```yaml
allergens:
  - contains: [peanuts, tree-nuts, dairy, gluten, shellfish, eggs, soy, sesame]
  - may-contain: [peanuts, tree-nuts]  # Cross-contamination risk
  - verified-by: brand-name
  - verification-date: 2026-04-04
  - source-type: manufacturer-website|allergist|regulatory
dietary-compatibility:
  vegan: true|false
  vegetarian: true|false
  halal: true|false|unsure
  kosher: true|false|unsure
  gluten-free: true|false
  dairy-free: true|false
  low-fodmap: true|false
medical-restrictions:
  diabetic-friendly: true|false
  low-sodium: true|false
  pkuhfriendly: true|false
```

### Source Quality for Allergens

| Source Type | Reliability | Notes |
|------------|-------------|-------|
| Manufacturer website (current) | High | Must verify date |
| FDA/regulatory | High | Official guidelines |
| Allergist/medical | High | Professional guidance |
| Cookbook (>1 year) | Low | Regulations change |
| Blog (>6 months) | Low | Check for updates |
| "I think" | Unacceptable | Personal guess insufficient |

### Verification Rules for Allergen Claims

**Rule:** Allergen claims in recipes must have verification date and source type. Claims without recent verification (<6 months) flagged for review.

**Why:** Allergen information can become outdated (formulations change, new regulations). A recipe claiming "nut-free" based on a year-old source may be dangerously wrong.

**Test:** For recipes with allergen claims:
1. Is there a verification date within 6 months?
2. Is the source type acceptable (manufacturer, regulatory)?
3. Are "may contain" statements documented?
4. Can you trace the allergen verification chain?

### Cross-Contamination Handling

**Rule:** Note "may contain" statements separately from primary ingredients. Flag recipes where cross-contamination risk is unknown.

**Why:** "Made in a facility that processes nuts" is different from "contains nuts" — both matter for different audiences.

**Test:** Can you filter recipes by:
- Safe for specific allergies
- Cross-contamination risk level
- Verified free from specific allergens

### Dietary Restriction Compatibility

**Rule:** Tag recipes with explicit dietary compatibility frontmatter. Update compatibility when source recipes change.

**Why:** A recipe that's "vegan by omitting cheese" may not be truly vegan (hidden ingredients, cross-contamination). Explicit tagging prevents dangerous assumptions.

**Test:** Can you find all recipes compatible with:
- Vegan diet
- Halal requirements
- Gluten-free diet

## Edge Cases

- **Restaurant recipes:** Calling a recipe "vegetarian" when it's "vegetarian except for chicken stock" — hidden non-vegetarian ingredients
- **"Vegan" brand changes:** A product labeled vegan last year may have changed formulation
- **Religious certifications:** "Halal-certified" vs. "Halal-style" — meaningful difference
- **Home vs. commercial:** Kitchen cross-contamination vs. commercial facility handling
- **Trace amounts:** "May contain" vs. "contains" — different risk profiles

## Domain-Specific Considerations

### Cooking Knowledge Base
- Every recipe needs allergen tags
- "Substitute" notes must verify substitutes don't introduce new allergens
- Cuisine-specific allergens (fish sauce in Thai, pork in Chinese)

### Restaurant/Professional Knowledge Base
- Supplier verification chains
- Staff training requirements
- Legal liability documentation

### Medical/Clinical Knowledge Base
- Patient-specific restriction tracking
- Drug-food interactions
- Emergency allergen protocols

## Related Seed Rules

- [[Seed Refinement - Verification Priority Adaptations]] — Could extend with allergen priority
- [[Confidence Markers]] — Could extend with allergen-specific confidence levels
- [[Seed Stress Test - Knowledge Source Type Rule in Cooking]] — Source types could include allergen sources

## Questions for the Seed

1. Should allergen info be a separate knowledge type requiring special verification?
2. How should uncertainty about allergen status be communicated (e.g., "probably vegan")?
3. What's the minimum verification standard for "safe for allergies" claims?

## Stress Test Scenarios

- **AI creates a recipe collection:** Does it capture allergen info? Can users safely filter by dietary needs?
- **User asks "what can I cook for my nut-allergic guest":** Can the vault answer this safely?
- **Recipe from 2 years ago:** Has allergen info current? What verification is needed?
- **" Vegan" recipe from blog:** Is the claim verified or assumed?

---

## Related Notes
- [[Frontier Exploration - Ingredient Substitution Knowledge]] — Substitutions must consider allergens
- [[Seed Gap - Analysis-Sensitive Knowledge]] — High-stakes knowledge requiring extra care
- [[Frontier Exploration - Knowledge Sensitivity and Responsible Capture]] — Responsible capture for sensitive topics