---
last-reviewed: 2026-04-03
last-updated: 2026-04-03
lifecycle: proposed
confidence: high
author-type: ai-assisted
gap-status: integrated
verification-status: pending
tags:
  - seed-refinement
  - thinking-tools
  - metacognition
  - knowledge-type
---

# Seed Refinement - Thinking Tool Framework Expansion

**Source:** Seed stress test — applying the thinking tool rules to a cooking knowledge base
**Date:** 2026-04-03
**Method:** SEED_STRESS_TEST — pick a random Seed rule and stress test it across domains

## What Was Tested

**Rule under test (line 1418-1422):**
> **Rule:** Distinguish thinking tools from domain knowledge — tag notes containing metacognitive strategies, reasoning frameworks, or cognitive patterns with `thinking-tool: true`.
> **Test:** Can you apply this knowledge to a completely different domain? If yes, tag as thinking tool with `thinking-tool-type:` (cognitive-strategy|self-regulation|reasoning-framework|bias-awareness).

## Domain Applied: Cooking Knowledge Base

Applied this rule to a hypothetical cooking knowledge base:

1. **Cognitive strategies** — "Taste as you go" applies across cooking, chemistry, and DIY projects
2. **Self-regulation** — "Cook when fresh, prep when tired" is highly personal to cooking context
3. **Reasoning frameworks** — "First principles" in cooking = understanding heat, fat, acid, salt as fundamental elements
4. **Bias awareness** — "I over-rely on familiar cuisines" is personal but the framework transfers

## What the Stress Test Revealed

### The Gap

The current Seed rule is minimal:
- It mentions tagging with `thinking-tool: true`
- It references `thinking-tool-type:` but doesn't define the types
- It mentions personalization fields but doesn't specify them
- It doesn't address verification methods for thinking tools
- It doesn't mention the personalization spectrum or review cycles

The [[Frontier Exploration - Metacognitive Knowledge and Thinking Tools]] note has a more comprehensive framework that's NOT in the Seed.

### What Was Missing

1. **Type taxonomy** — The Seed says use `thinking-tool-type:` but doesn't define acceptable values. The frontier note defines: cognitive-strategy, self-regulation, reasoning-framework, bias-awareness

2. **Verification approach** — How do you verify a thinking tool works? The frontier note proposes:
   - outcome-tracking
   - process-reflection  
   - comparative analysis
   - With evidence-strength levels (strong|moderate|anecdotal)

3. **Personalization spectrum** — The frontier note has a useful table showing:
   - Reasoning frameworks: universal, no personalization needed
   - Cognitive strategies: sometimes universal, moderate personalization
   - Self-regulation: not universal, high personalization
   - Bias awareness: sometimes universal, high personalization

4. **Annual review rule** — The frontier note proposes reviewing thinking tools annually because "what works for you may change as your context, goals, and cognitive state evolve"

5. **Link requirements** — Every thinking tool should link to 2+ domain examples showing application

## Proposed Seed Update

**Add after line 1422:**

> **Rule (expanded):** Apply comprehensive thinking tool framework — use explicit typing, verification methods, and review cycles.
> 
> **Why:** The current rule mentions thinking tools but doesn't provide the structure needed for AI agents to manage them consistently. Without explicit type taxonomy, verification approaches, and review schedules, thinking tools degrade silently.
> 
> **Test:** (1) Does every thinking tool note have `thinking-tool-type:` defined? (2) Does each have a verification-method and evidence-strength? (3) Is last-reviewed within 12 months? (4) Does it link to 2+ domain application examples?

**Implementation details to add to Seed:**

```yaml
thinking-tool-type: cognitive-strategy|self-regulation|reasoning-framework|bias-awareness
verification-method: outcome-tracking|process-reflection|comparative
evidence-strength: strong|moderate|anecdotal
personalization: none|moderate|required
```

**Personalization spectrum to document:**
| Type | Universal? | Personalization | Verification |
|------|------------|-----------------|--------------|
| Reasoning framework | Yes | None | Comparative analysis |
| Cognitive strategy | Sometimes | Moderate | Process reflection |
| Self-regulation | No | Required | Outcome tracking |
| Bias awareness | Sometimes | Required | Self-awareness reflection |

**Annual review requirement:** Thinking tool notes must have `last-reviewed` no older than 12 months.

**Link requirement:** Every thinking tool must link to at least 2 domain notes showing application.

## What I Learned

1. **The Seed is a living document** — A frontier exploration note from March exists with better thinking tool guidance, but it wasn't integrated into the Seed

2. **Stress testing reveals integration gaps** — The rule exists in Seed but isn't fully developed; stress testing against domains surfaces what should be there

3. **Knowledge type taxonomy is foundational** — Thinking tools are a distinct knowledge type that needs its own rules, similar to how procedural vs conceptual knowledge have different handling

4. **Verification is domain-dependent** — Factual knowledge verification differs from thinking tool verification; Seed needs explicit guidance for this

5. **Self-knowledge is hard to capture** — Thinking tools include tacit knowledge that's often invisible to the holder; explicit structure helps surface it

---
**See also:**
- [[AI-Assisted Knowledge Management Seed]] (lines 1418-1422, 1422)
- [[Frontier Exploration - Metacognitive Knowledge and Thinking Tools]] (the comprehensive framework source)
- [[Seed Stress Test - Atomicity Rule Across Domains]] (similar pattern of domain stress testing)
- [[Knowledge Type Taxonomy]] (knowledge-type field that should include thinking-tools as a type)