---
last-reviewed: 2026-03-10
lifecycle: emerging
confidence: emerging
tags:
- seed-stress-test
- probabilistic-knowledge
- cooking-domain
- edge-case
---

# Stress Test: Probabilistic Knowledge Rule in Cooking

## The Rule

**Rule:** Express probabilistic knowledge with explicit probabilities, not vague qualifiers like "usually" or "sometimes".

**Why:** Vague language misleads — "usually works" means different things to different people. Explicit probabilities enable proper weighting and decision-making.

**Test:** Can you assign a numerical probability to the claim? Is it expressed numerically rather than with vague qualifiers?

## Domain: Cooking

### Does the rule make sense?

**Partially.** Cooking does involve probabilistic knowledge:
- "If you overcook steak, it will be tough" — but how overcooked? By how much?
- "Add salt to taste" — what does that mean numerically?
- "The sauce will thicken as it cools" — at what rate?

However, cooking is also an art, and precise probabilities may not always be helpful.

### Is the Test executable?

**Partially.** An AI can:
- Identify vague qualifiers (usually, sometimes, often, rarely)
- Flag notes using these terms
- Suggest numerical alternatives in some cases

**However**, many cooking claims genuinely don't have numerical probabilities:
- "Don't overcook" — the threshold varies by cut and desired doneness
- "Add to taste" — this IS the right answer; numerical would be wrong
- "Let rest" — timing is flexible, not precisely defined

### Edge Cases

1. **Recipe scaling**: "Add 1 tsp salt per pound of meat" is precise but doesn't account for variations in meat saltiness. The rule would require "1 tsp ± 0.5 tsp" which is awkward.

2. **Doneness temperatures**: "Cook to 145°F for medium-rare beef" IS precise. But "sear for 2-3 minutes per side" is imprecise because stove heat varies. Should we require temperature-based instructions instead of time-based?

3. **Food safety vs. quality**: Food safety rules (like "cook chicken to 165°F") are NOT probabilistic — they're binary. This rule shouldn't apply to safety-critical guidance.

4. **Ingredient substitutions**: "You can usually substitute yogurt for cream" — what does "usually" mean here? 80% of the time? What factors affect it?

5. **Cooking methods**: "High heat sears better" — is this 90% true? What about smoke point issues with high heat?

### Refinements Needed

1. **Distinguish safety from quality**: The probabilistic rule should NOT apply to food safety guidance. Those are binary: either safe or not.

2. **Distinguish precision-possible from art-based**: Some cooking knowledge CAN be expressed precisely (temperatures, ratios). Some CANNOT ( "to taste", "until golden"). Apply the rule only where possible.

3. **Consider ranges instead of point estimates**: In cooking, "200-220°C" is often more honest than a single temperature. Use ranges where uncertainty is inherent.

4. **Add confidence for technique advice**: Instead of "usually", use "confidence: high/medium/low" to indicate certainty without false precision.

### Test Refinement

Original test: "Can you assign a numerical probability to the claim? Is it expressed numerically rather than with vague qualifiers?"

Refined test for cooking domain:
1. Identify notes with probabilistic claims about cooking outcomes
2. Check for vague qualifiers (usually, sometimes, often, rarely)
3. For each vague qualifier, determine: (a) Can this be made precise? (b) Is it food safety related? (c) Is it "to taste" / art-based?
4. If precise-able: suggest numerical range or confidence marker
5. If safety-related: mark as binary (no probability needed)
6. If art-based: suggest "confidence: medium" instead of vague qualifier

### Conclusion

The Probabilistic Knowledge rule is partially applicable to cooking. Many cooking claims genuinely lack precise probabilities, and forcing numerical expression would reduce accessibility. However, technique advice (like "searing at high heat produces better browning") could use confidence markers instead of vague qualifiers. The rule should be refined to exclude food safety (binary) and "to taste" (subjective) guidance.

## Related
- [[Frontier Exploration - Probabilistic Knowledge]] — Related frontier exploration
- [[Confidence Markers]] — Alternative way to express uncertainty
- [[Stress Test - Atomicity Rule in Cooking]] — Related cooking stress test
- [[Domain-Specific Knowledge Bases]] — Domain-specific adaptations
