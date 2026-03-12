---
last-reviewed: 2026-03-09
lifecycle: draft
confidence: emerging
tags:
- seed-stress-test
- terminology
- edge-case
---

# Stress Test: Terminology Consistency Rule in Cooking Domain

## Seed Rule Being Tested
**Rule:** Terminology must be consistent across the vault — pick one term per concept and use it everywhere.
**Test:** Search for synonym pairs (e.g., "note"/"node", "link"/"connection"). Does the vault use one term consistently?

## Application to Cooking Knowledge Base

### Where the Rule Works Well
- **Equipment**: Use "skillet" OR "frying pan" consistently, not both
- **Techniques**: Use "simmer" consistently (not sometimes "simmer" and sometimes "low boil")
- **Ingredients**: Use "bell pepper" consistently (not sometimes "bell pepper" and sometimes "capsicum")

### Edge Case 1: Genuinely Different Terms for Different Things

**Problem:** Some terms that seem like synonyms actually refer to different techniques or ingredients:

1. **Sauté vs Pan-fry vs Stir-fry** - All involve cooking in a pan with oil, but:
   - Sauté: small pieces, high heat, quick motion
   - Pan-fry: larger pieces, medium-high heat, less agitation
   - Stir-fry: very small pieces, highest heat, constant agitation (typically Wok)

2. **Broth vs Stock** - Often used interchangeably but:
   - Stock: made with bones, long simmer (4-6 hours)
   - Broth: made with meat, shorter simmer (1-2 hours)
   - Some regions reverse this (in France, "bouillon" = broth, "fond" = stock)

**The Test Fails:** An AI enforcing strict terminology consistency might:
- Force use of one term when distinct terms are actually correct
- Conflate genuinely different concepts

### Edge Case 2: Regional Variations Are Valid

**Problem:** Cooking terms vary by region, and both are correct in their context:

1. **Bell Pepper vs Capsicum** - Same thing, different regions:
   - US/UK: "bell pepper" or "pepper"
   - Australia/NZ: "capsicum"
   
2. **Eggplant vs Aubergine** - Same thing:
   - US: "eggplant"
   - UK: "aubergine"

3. **Cilantro vs Coriander** - Same herb:
   - US: "cilantro" for leaves, "coriander" for seeds
   - UK/AU: "coriander" for everything

**The Test Fails:** A strictly consistent vault might:
- Pick one regional term and exclude the other, losing useful information
- Not recognize that both terms are valid in different contexts

### Edge Case 3: Technical vs Common Terminology

**Problem:** Some notes target beginners (need common terms) while others target experts (need technical terms):

1. **Melting vs Dissolving** - Both involve solids becoming liquids, but:
   - Melting: solid → liquid via heat (butter, chocolate)
   - Dissolving: solid → liquid via solvent (sugar in water)
   
2. **Deglaze vs Reduce** - Both involve liquids in pans, but:
   - Deglaze: add liquid to hot pan to loosen fond
   - Reduce: simmer to evaporate and concentrate

### Edge Case 4: Historical/Classical Terms

**Problem:** Classical cuisine uses French terms that most home cooks don't know:

1. **Fond vs Brown bits** - Same thing, different audiences
2. **Julienne vs Matchstick cut** - Same cut, different terminology
3. **Mise en place vs Prep** - Same concept, formality level

## The Real Issue

The terminology rule assumes there's always a single "correct" term. But in cooking:
- **Technical precision** sometimes requires distinct terms that seem like synonyms
- **Regional variation** means multiple terms are all "correct"
- **Audience adaptation** sometimes requires both common and technical terms

## Recommendation

The rule should be refined to:

**Rule:** Terminology should be consistent UNLESS:
(a) Distinct terms represent genuinely different techniques/ingredients
(b) Regional variations are both valid and useful to document
(c) Both common and technical terms serve different audiences

**Test:** For potential synonym conflicts: (1) Do the terms actually refer to different things? (2) Are both regional variants valid? (3) Do different audiences need different terms? If yes to any, allow both with appropriate context.

**Alternative Test:** Can you explain why each term is distinct? If yes, keep both. If no, pick one and create a redirect.

## Related
- [[Linking Principle]]
- [[Atomic Note Principle]]
- [[Domain-Specific Knowledge Bases]]
- [[Frontier Exploration - Jargon vs Plain Language]]
