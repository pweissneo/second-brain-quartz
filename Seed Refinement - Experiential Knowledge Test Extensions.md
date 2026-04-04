---
last-reviewed: 2026-04-04
lifecycle: seed-refinement
confidence: emerging
author-type: ai-assisted
knowledge-type: meta
tags:
  - seed-refinement
  - diminishing-returns
  - experiential-domains
  - domain-agnostic
gap-status: resolved
resolved: 2026-04-04
see-also:
  - Seed Stress Test - Photography Knowledge Base
  - Seed Stress Test - Cooking Knowledge Base
  - Seed Stress Test - Woodworking Knowledge Base
---

# Seed Refinement: Experiential Knowledge Test Extensions

> Refining the diminishing returns test for experiential domains where knowledge cannot be evaluated without execution.

## The Problem

The Seed's diminishing returns test assumes knowledge utility can be evaluated without execution:

**Rule:** Use diminishing returns testing before adding notes to existing topics — skip or defer if the note fails 2+ of: utility, connection, uniqueness, effort.

**Test:** Does the note pass 2+ of: utility, connection, uniqueness, effort?

This works for technical/factual domains but fails for experiential domains:
- Photography: "Backlighting techniques" may fail utility/connection tests but be essential in specific conditions
- Cooking: "Searing" may seem obvious but timing varies by equipment
- Woodworking: "Sanding technique" sounds simple but results vary by wood species
- Fitness: "Progressive overload" is widely known but application varies by individual

## Root Cause

The diminishing returns test assumes:
- Utility can be assessed without execution
- Similar descriptions produce similar outcomes
- "Good enough" knowledge is not worth capturing

In experiential domains, none of these assumptions hold:
- You often cannot assess utility without actually trying
- Similar descriptions produce dramatically different results
- Context-dependent knowledge has high value despite being "obvious"

## Proposed Refinement

For experiential domains, apply modified diminishing returns test:

**Rule:** For knowledge in experiential domains (photography, cooking, woodworking, fitness, crafts), apply modified test:

**Modified Test (execute if domain = experiential):**
1. **Can I test this?** (execution feasibility) — Some techniques require specific equipment, conditions, or time investment
2. **Might the outcome differ despite similar description?** (execution uncertainty) — Context (lighting, ingredients, materials) affects results
3. **Do I need hands-on experience to judge value?** — Theoretical knowledge vs. practical skill

**If yes to 2-3:**
- Capture with `knowledge-type: experiential`
- Include `verification-status: unverified` with explicit testing context needed
- Add execution uncertainty notes to the note

**Domain Classification:**

```yaml
domain-type: technical|experiential|mixed
execution-dependency: none|low|medium|high
testing-context-required: "specific conditions, equipment, or time needed"
```

## Community Validated Threshold

The Seed's confidence marker "community-validated" lacks a threshold:

> Photography techniques often become "standard" through widespread use rather than formal testing.

**Refinement:** Specify threshold for "community-validated":

**Rule:** Use `community-validated` when:
- Minimum 3 independent sources cite the technique
- Technique appears in 2+ instructional resources
- No conflicting community guidance exists

**Alternative:** Track explicitly:
```yaml
verification-status: community-validated
community-references: 5
community-sources: ["source-1", "source-2"]
```

## Equipment-Specific Knowledge Exemption

The Seed says equipment-specific notes fail diminishing returns (utility is low for non-owners), but practical utility suggests otherwise.

**Refinement:** Equipment-specific notes should:
- Pass diminishing returns for personal utility (not general utility)
- Include `equipment-scope:` frontmatter listing applicable gear
- Work within existing structure - no exemption needed

```yaml
utility-scope: personal|general
equipment-scope: ["Canon EOS R5", "Sony A7IV"]
```

## Implementation Notes

Apply experiential test when:
1. Note is in a domain commonly considered experiential
2. Note involves physical execution or technique application
3. Note includes "may vary" or "depends on" language

Track execution context needed:
```yaml
execution-context: "specific equipment, lighting conditions, ingredient freshness"
```

## Related Seed Rules

- [[Seed Stress Test - Photography Knowledge Base]] - documents photography edge cases
- [[Seed Stress Test - Cooking Knowledge Base]] - documents cooking edge cases
- [[Seed Stress Test - Woodworking Knowledge Base]] - documents woodworking edge cases
- Edge case for experiential: Line 1826 in Seed (technique definitions)