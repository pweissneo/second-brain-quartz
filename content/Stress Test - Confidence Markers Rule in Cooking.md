---
last-reviewed: 2026-03-11
lifecycle: draft
confidence: emerging
tags:
  - seed-stress-test
  - cooking-domain
  - edge-case
  - confidence-markers
---

# Stress Test: Confidence Markers Rule in Cooking

## Seed Rule Being Tested
**Rule:** Use confidence markers (high/emerging/disputed/obsolete) to signal reliability of knowledge.
**Test:** Do notes with contested claims include confidence metadata?

## Application to Cooking Knowledge Base

### Where the Rule Works Well

- **Scientific cooking**: "Maillard reaction occurs at 280°F+" — high confidence, based on chemistry
- **Food safety**: "Chicken must reach 165°F" — high confidence, based on USDA guidelines
- **Classic techniques**: "Deglaze with wine after searing" — high confidence, well-established

### Edge Case 1: Traditional Wisdom

**Problem:** Many cooking techniques are "traditional" without scientific validation:

> "Always salt pasta water until it tastes like the sea"
> "Let meat rest for half the cooking time"

Are these "high" confidence (proven over generations) or "emerging" (folk wisdom without rigorous testing)?

**The Test Fails:** Traditional wisdom doesn't fit neatly into confidence categories. It's not "disputed" (nobody argues against it), but it's not "scientifically validated" either.

### Edge Case 2: Taste Preferences

**Problem:** Claims about taste are inherently subjective:

> "Dark chocolate pairs well with Cabernet Sauvignon"
> "Thai food is best with jasmine rice"

These aren't "disputed" — they're subjective. The rule assumes knowledge can be objectively rated.

### Edge Case 3: Recipe Success Rates

**Problem:** Is a recipe "high confidence" if it works 90% of the time? What about 70%?

> "This cake recipe never fails me"
> "This bread is foolproof"

These are confidence claims about reproducibility, not factual accuracy.

### Edge Case 4: Cultural Authenticity Claims

**Problem:** "Authentic" is a confidence claim about tradition:

> "This is the authentic way to make sushi"
> "Traditional Neapolitan pizza must have..."

These claim truth about historical practice, which may or may not be accurate.

### Edge Case 5: Dietary/Nutritional Claims

**Problem:** Nutrition advice changes frequently:

> "Eggs are good for you" vs "Eggs are bad for you"
> "Butter is better than margarine"

These flip between "high" and "disputed" as science evolves.

### Edge Case 6: Technique Variations

**Problem:** Different experts give conflicting advice:

> Gordon Ramsay: "Rest meat for half the cooking time"
> America's Test Kitchen: "Rest meat for 10-20 minutes regardless of size"

Who is "high confidence"? Both are experts.

## Recommendation

The rule should be refined to include:

1. **Source tier** (not just confidence): "scientific" vs "traditional" vs "expert opinion" vs "personal experience"
2. **Subjectivity markers**: "objective" vs "subjective" vs "preference-dependent"
3. **Scope tags**: When the claim applies (e.g., "authentic in Italy" vs "authentic in America")

**Alternative Test:**
1. Can you verify this claim with a source? → confidence: high
2. Is this based on tradition without scientific validation? → confidence: traditional
3. Is this a matter of personal preference? → claim-type: subjective
4. Do experts disagree? → confidence: disputed

## Related
- [[Confidence Markers]]
- [[Stress Test - Confidence Markers Rule Across Domains]]
- [[Frontier Exploration - Jargon vs Plain Language]]
