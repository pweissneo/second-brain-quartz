---
last-reviewed: 2026-04-05
last-updated: 2026-04-05
lifecycle: seed-refinement
confidence: emerging
author-type: ai-assisted
knowledge-type: structural
tags:
  - seed-refinement
  - 5-1-ratio
  - context-dependence
  - domain-calibration
---

# Seed Refinement: Context-Dependence Utility Calibration for 5:1 Ratio

## The Discovery

The gardening stress test revealed a pattern worth elevating to Seed-level guidance: **knowledge utility is not uniform across domains** — context-dependence dramatically affects how valuable general knowledge is without personal adaptation.

## Principle

**Rule:** For domains with high context-dependence (gardening, agriculture, home repair, medical, legal), the 5:1 ratio needs calibration because general knowledge WITHOUT personal context adaptation has LIMITED practical utility compared to other domains.

**Why:** In woodworking, general techniques apply broadly across workshops. In gardening, advice from one climate zone often fails in another. The same general knowledge has different utility in different contexts. Without calibration, the 5:1 rule undervalues context-specific adaptations and overvalues general advice that appears in sources but has limited practical applicability.

**Test:** For a domain, ask: (1) Does general advice from one context apply broadly to other contexts? (2) If no, what context factors modify utility (climate zone, soil type, jurisdiction, equipment tier)? (3) Does general advice without adaptation have high or limited practical value? Calibrate ratio accordingly.

## Domain Calibration Framework

| Context-Dependence Level | Example Domains | 5:1 Calibration |
|-------------------------|-----------------|------------------|
| Low | Mathematics, philosophy, programming | Standard 5:1 applies |
| Medium | Cooking, woodworking, photography | Context adaptation adds value, slight calibration |
| High | Gardening, agriculture, home repair | General without adaptation has limited utility |
| Very High | Medical, legal | Domain-specific rules override |

## Modified 5:1 Test for High Context-Dependence Domains

For domains with high context-dependence:

1. **Utility baseline:** Does general advice WITHOUT your specific context have high practical value? If limited → adjust ratio
2. **Context adaptation test:** Does the note include YOUR specific context factors (location, equipment, conditions)?
3. **Experimentation credit:** Personal results in YOUR specific conditions count as high-value personal knowledge
4. **Foundation exemption:** Foundational domain science may be exempt from ratio

## Implementation in Seed

The Seed already has gardening-specific edge cases (line ~1515). This refinement elevates the principle to general domain-calibration guidance that can inform future stress tests.

## Related Notes

- [[Seed Stress Test - 5-1 Ratio in Gardening]]
- [[Seed Stress Test - 5-1 Ratio Across Domains]]
- [[Seed Refinement - Maintenance Burden Rule Cooking Edge Cases]] — similar calibration for cooking
- [[Frontier Exploration - Context-Dependent Knowledge Interaction]]