---
last-reviewed: 2026-03-22
last-updated: 2026-03-22
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
gap-status: analyzed
tags:
  - frontier-exploration
  - cross-domain
  - knowledge-synthesis
  - domain-intersection
---

# Frontier Exploration - Cross-Domain Knowledge Synthesis

> This note explores a gap in the current Seed: how to handle knowledge that exists at the intersection of multiple domains where different Seed rules may apply.

## The Problem

The Seed provides domain-specific adaptations for individual domains (cooking, fitness, music, etc.), but doesn't address knowledge that **inherently spans multiple domains**. Such knowledge faces conflicting requirements:

- **Cooking + Nutrition**: Recipe knowledge (atomic, procedural) intersects with nutritional knowledge (verification depends on source authority)
- **Music + Physics + Emotion**: Musical acoustics (measureable) intersects with emotional response (subjective, individual)
- **Fitness + Nutrition + Medicine**: Exercise programming (equipment-dependent) intersects with nutrition (source-verified) intersect with health (medical evidence)
- **Home Automation + Electrical + Security**: Config-specific knowledge intersects with safety-critical knowledge

## Where Current Seed Falls Short

### 1. Conflicting Atomicity Rules

A recipe is "executable procedure" (keep together >300 words), but nutritional analysis might require splitting into smaller units.

**Current guidance**: None for handling domain-specific atomicity within one note.

### 2. Verification Framework Conflicts

- Fitness verification: 4-8 weeks of personal testing
- Nutrition verification: source authority (peer-reviewed vs. blog)
- Health verification: medical consensus level

A note about "protein supplementation for muscle gain" needs all three, with conflicting verification approaches.

### 3. Contradiction vs. Framework Confusion

Multiple domain perspectives might seem like contradictions but are actually framework-dependent or domain-specific:

- Nutrition says "calories matter most"
- Fitness says "hormonal response matters most"  
- Both can be right within their domain scope

### 4. Metadata Schema Conflicts

Different domains need different frontmatter:
- Fitness: goal-scope, equipment-scope
- Nutrition: source-quality, evidence-level
- Cooking: modal-essentiality, sensory-cues

A cross-domain note needs all of them or a unified schema.

## Current Seed Coverage (Partial)

The Seed handles:
- Framework-dependent knowledge (different frameworks, not contradictions)
- Multi-domain vaults (allows domain-specific fields)
- Individual variation (high-variation domains)

But lacks:
- Explicit cross-domain synthesis rules
- Unified metadata approach for domain intersections
- Verification hybrid approaches
- Priority when domain rules conflict

## Proposed Rules

### Rule: For cross-domain knowledge, use domain compositionseparation with explicit domain tagging

**Why:** Cross-domain knowledge has different characteristics in each domain. Tagging the domains enables appropriate application of domain-specific rules while maintaining unity.

**Test:** For knowledge spanning multiple domains: (1) Can you identify each domain involved? (2) Does the note have domain tags for each? (3) Can domain-specific rules be applied appropriately?

**Implementation:**
```yaml
domains-covered: [cooking, nutrition, health]
primary-domain: cooking  # Which domain is primary for atomicity/structure
domain-notes:
  cooking: "Procedural content, keep together"
  nutrition: "Source verification, evidence level"
  health: "Medical consensus, safety warnings"
```

### Rule: When domain rules conflict, favor the domain with highest stakes

**Why:** Safety-critical domains (health, medical) should override preferences in lower-stakes domains (aesthetics, convenience).

**Test:** For cross-domain notes, can you identify which domain has highest stakes? Do higher-stakes domain rules take precedence?

**Stakes hierarchy:**
1. Safety-critical (health, medical, legal)
2. High-stakes (financial, career)
3. Medium-stakes (fitness, nutrition)
4. Low-stakes (hobbies, aesthetic)

### Rule: Use verification level stacking for cross-domain knowledge

**Why:** If any domain requires strict verification (medical), that becomes the minimum bar, even if other domains allow looser standards.

**Test:** For cross-domain notes: Does the note meet the strictest verification requirement among its domains?

**Implementation:**
```yaml
verification-approach: stacked
domain-verification:
  fitness:
    method: personal-testing
    timeline: 8-weeks
  nutrition:
    method: source-authority
    required-sources: peer-reviewed
  health:
    method: consensus-level
    minimum: moderate-evidence
effective-verification: source-authority  # strictest applies
```

### Rule: Create domain-bridge notes for frequently intersecting domains

**Why:** When domains frequently intersect (cooking+nutrition, fitness+health), explicit bridge notes help navigate between domain-specific rules.

**Test:** For common domain pairs: Is there a bridge note explaining how to handle their intersection?

**Bridge note structure:**
```yaml
domains-bridged: [cooking, nutrition]
bridge-type: common-intersection
guidance:
  - When: "Capturing recipe with nutritional focus"
    do: "Apply nutrition verification to nutritional claims, cooking atomicity to procedure"
  - When: "Capturing nutritional guidance with recipe examples"
    do: "Apply nutrition verification structure, cooking examples optional"
```

### Rule: Resolve cross-domain linking by tagging each link with domain context

**Why:** A link meaningful in one domain may not apply in another. Domain-tagging links clarifies applicability.

**Test:** For cross-domain notes with multiple links: Can you determine which domain each link serves?

**Implementation:**
```yaml
links:
  - target: "[[Protein Sources]]"
    domain-context: nutrition
    purpose: "Nutritional completeness"
  - target: "[[Meal Prep Strategies]]"
    domain-context: cooking
    purpose: "Practical execution"
  - target: "[[Training Nutrition]]"
    domain-context: fitness
    purpose: "Performance optimization"
```

## Common Domain Intersections to Map

| Intersection | Primary Challenges | Bridge Note Needs |
|--------------|---------------------|-------------------|
| Cooking + Nutrition | Atomicity vs. splitting, source vs. sensory verification | Recipe nutrition guidance |
| Fitness + Nutrition | Long-horizon vs. source verification | Supplement timing, macro calculation |
| Fitness + Health | Equipment-scope vs. safety-critical | Exercise selection for health conditions |
| Music + Physics + Emotion | Measurable vs. subjective verification | Acousticproperties |
| Home Automation + Electrical | Config-specific vs. safety-critical | Safety prioritization |
| Investing + Tax + Estate | Temporal vs. jurisdiction-specific | Multi-domain financial planning |

## Test Scenarios

### Test 1: Recipe with Nutritional Claims

Input: A recipe note that includes macronutrient calculations
Expected: Tags both cooking and nutrition domains, applies cooking atomicity rule to procedure, nutrition source verification to nutritional claims

### Test 2: Fitness Nutrition for Health Goals

Input: A note about nutrient timing for athletic performance with health implications
Expected: Tags fitness + nutrition + health, applies highest-stakes (health) rules, verification stacks to strictest level

### Test 3: Musical Audio Engineering

Input: A note about room acoustics for home studio
Expected: Tags music + physics, applies physics measurement standards to acoustic claims, music context to application guidance

## Related Seed Rules

- [[AI-Assisted Knowledge Management Seed#Edge case (stress test 2026-03-16): In hybrid technical-aesthetic domains]]
- [[AI-Assisted Knowledge Management Seed#Edge case: Multi-domain vaults need schema that accommodates domain-specific fields]]
- [[AI-Assisted Knowledge Management Seed#Rule: Distinguish knowledge base purpose — learning vs reference]]
- [[Frontier Exploration - Compound Context Knowledge]]
- [[Frontier Exploration - System Interactions and Cross-Domain Knowledge]]
- [[Frontier Exploration - AI-Synthesized Knowledge]] — AI-created synthesized insights as a distinct knowledge type

## Open Questions

1. Should cross-domain notes have a separate lifecycle stage (e.g., "synthesizing")?
2. How do you handle when domains have mutually exclusive recommendations?
3. Should cross-domain notes have multiple authors (one per domain)?
4. How does version control work when domains evolve at different rates?

---

**Next Steps:** This exploration reveals the Seed needs explicit handling for cross-domain synthesis. Consider which proposed rules should become Seed rules, especially the "domain composition" approach for metadata and verification stacking.