---
last-reviewed: 2026-04-03
last-updated: 2026-04-03
lifecycle: staging
confidence: emerging
verification-status: unverified
gap-type: seed-missing
gap-source: frontier-exploration
author-type: ai-assisted
tags:
  - seed-gap
  - interaction-mode
  - knowledge-presentation
  - context-dependent
---

# Seed Gap - Interaction Mode Specification

## Gap Description

The Seed has rules for **context frames** (purpose/audience: patient-education, clinical, tutorial, reference) but lacks explicit rules for **interaction modes** — how knowledge is consumed and what structural format it needs for effective use.

**Context Frame** answers: "For whom is this intended?" (audience, purpose)
**Interaction Mode** answers: "How will this be consumed?" (executed, browsed, compressed, learned)

These are orthogonal dimensions. A recipe in "tutorial" context-frame still needs different structure when being actively cooked vs. when being browsed for inspiration.

## Why This Matters

Knowledge fundamentally changes based on how it's being used:

| Same Knowledge | Different Context Needs... |
|---------------|---------------------------|
| Recipe (cooking) | Step-by-step in kitchen vs. overview for planning vs. shopping list |
| First aid | Bold critical steps under stress vs. explanatory background |
| Troubleshooting | Broad diagnosis vs. specific test-driven vs. verification |
| Concepts | Sequential learning vs. quick reference vs. deep exploration |

Without interaction-mode rules, AI agents create one representation that fails across different use contexts.

## Examples of the Gap

### Current Seed Coverage
- Context-frame field exists: `context-frame: tutorial|reference|patient-education`
- Covers "who is this for" and "what purpose"
- Rules for hub+variants when multiple presentations needed

### What's Missing
- No rule for "how will this be consumed" (execution vs. browsing vs. under stress)
- No rule for mode-specific compression/formatting
- No rule for handling knowledge that needs multiple interaction modes

### Concrete Failure Mode
A cooking knowledge base built with current Seed rules:
- ✓ Creates atomic notes on techniques, ingredients
- ✓ Has context-frame for beginner vs. expert
- ✗ Recipes fail when actually cooking (needs performative mode)
- ✗ No "quick reference" vs. "full detail" distinction
- ✗ Emergency knowledge (choking response) fails under stress

## Proposed Rule

**Rule:** Identify knowledge interaction modes at capture time — determine whether knowledge is primarily performative (executed step-by-step), exploratory (browsed and discovered), compressed (quick recall under stress), progressive (designed for learning), or comparative (decision-making between options).

**Why:** Different consumption contexts require different structures. A recipe as an exploratory concept graph fails in the kitchen; emergency steps as exploratory prose fails in crisis. Mode identification ensures knowledge serves its primary use.

**Test:** For any note, can you identify its primary interaction mode? Could someone in that use context use it effectively without manual restructuring?

**Implementation:**
```yaml
interaction-mode: performative|exploratory|compressed|progressive|comparative
mode-specific-optimization:
  - context: kitchen-use
    format: step-by-step, measurements-inline
  - context: planning-use
    format: overview, ingredients-list
```

**Rule:** For high-frequency use contexts (kitchen, emergency, quick reference), maintain mode-optimized representations alongside reference versions.

**Why:** One-size-fits-all representation loses the specific benefits of each mode. The Seed should support, not prevent, context-specific optimization.

**Test:** For knowledge frequently used in distinct contexts, is there a mode-optimized version? Or does the user manually restructure?

**Rule:** Tag knowledge with interaction-mode dependencies — note where the knowledge was captured (situation, environment, emotional state) to help future agents understand the context.

**Why:** Knowledge captured in one context may not transfer to another. A troubleshooting note written while frustrated may miss steps obvious to a calm expert. Mode tagging helps match knowledge to use context.

**Test:** Can you identify what interaction mode the knowledge was originally captured in? Does that match your current use case?

## Gap Severity

**Severity:** medium — Affects utility but doesn't break vault functionality
**Blocking:** No — vaults function but with suboptimal representations
**Priority:** Should address within 30 days for vaults with procedural, emergency, or learning content

## Related Notes

- [[Types of Applicability Boundaries]] — Related: covers when knowledge applies, not how it's consumed
- [[Frontier Exploration - Context-Dependent Knowledge Interaction]] — This gap was discovered during frontier exploration
- [[Frontier Exploration - Emergency and First-Aid Knowledge in Knowledge Bases]] — Related: compressed mode critical for emergencies
- [[AI-Assisted Knowledge Management Seed]] — See existing `context-frame` rule (~lines 1559-1570) which covers audience/purpose but not interaction mode

## Gap Status

**Status:** identified (not yet resolved)
**Discovered:** 2026-03-30
**Last reviewed:** 2026-03-30
**Next review:** 2026-04-30

This gap needs:
- [ ] Domain stress test in one procedural domain
- [ ] Refined rules with clearer test criteria
- [ ] Integration pathway with existing context-frame rules

## Concrete Example: First Aid Choking Response

| Aspect | Current Seed Coverage | Gap |
|--------|----------------------|-----|
| Context Frame | Can tag `context-frame: emergency` | ✓ Covered |
| Knowledge Type | Can tag `knowledge-type: procedural` | ✓ Covered |
| Interaction Mode | No equivalent field | ✗ Missing |

When a user is actually choking, they cannot:
- Follow wikilinks to explore "airway obstruction" concepts
- Read explanatory paragraphs about why Heimlich works
- Browse multiple notes to find the right technique

They need: **compressed performative mode** — single step, bold action, no links.

Current Seed produces:
```markdown
## Choking Response
1. Stand behind the person [[Heimlich Maneuver]]
2. Make a fist at [[Abdomen Location]]
3. Press inward and upward
```

Missing the compressed version:
```markdown
**CHOKING: DO THIS NOW**
Stand behind → Fist above navel → Press up and in → Repeat
```

This note demonstrates the gap: the Seed enables correct tagging but doesn't guide creating mode-specific representations.