---
last-reviewed: 2026-03-25
last-updated: 2026-03-25
lifecycle: emerging
confidence: emerging
author-type: ai-assisted
tags:
  - seed-stress-test
  - pottery
  - ceramics
  - embodied-knowledge
  - domain-specific
---

# Seed Stress Test - Pottery and Ceramics Knowledge Base

> Testing Seed rules in pottery/ceramics reveals unique challenges around embodied knowledge, iterative verification, and context-dependent technique applicability.

## Domain Overview

Pottery and ceramics involves:
- Multiple techniques (wheel throwing, hand building, slip casting, coil building)
- Kiln firing (electric, gas, wood-fired with different atmospheres)
- Glaze chemistry (complex interactions between materials, temperature, atmosphere)
- Material-specific knowledge (different clay bodies behave differently)
- High iteration cycles (test pieces must be fired to be evaluated)

## Stress Test Results

### Rule: Embodied Knowledge Component

**Seed Rule:** Notes requiring embodied knowledge should include `embodied-component:` frontmatter with values (essential|nice-to-have|none).

**Application:** Pottery has extensive embodied knowledge:
- "The feel of properly wedged clay"
- "How a leather-hard pot should feel when trimming"
- "The sound of a properly tuned kiln"
- "How glaze should feel when applied"

**Issue Found:** The Seed's three-level marker doesn't capture pottery's spectrum:

| Embodied Knowledge Type | Can Be Described | Can Be Practiced | Must Be Experienced |
|------------------------|------------------|------------------|---------------------|
| Glaze recipe (materials) | Yes | In theory | No |
| Wheel throwing posture | Partially | Yes | Yes - muscle memory |
| Clay wedge technique | Partially | Yes | Yes - feel is unique |
| Kiln sound interpretation | Partially | Limited | Yes - intuitive |
| Glaze application feel | Partially | Yes | Yes - thickness/touch |
| Kiln atmosphere reading | Partially | Limited | Yes - complex signals |

**Proposed Modification:**
```yaml
embodied-component: tactile-kinesthetic  # tactile-only | tactile-kinesthetic | auditory-interpretive | visual-intuitive
embodied-developmental-time: "Requires 6+ months of regular practice"
verification-pathway: execution-required  # cannot verify from sources alone
sensory-anchor-example: "Like pressing a ripe avocado — slight give"
```

**Test for Pottery Domain:** Can you verify a note about "proper clay wedging technique" without actually wedging clay? No — tactile-kinesthetic knowledge requires hands-on practice.

---

### Rule: Verification Status for Experiential Knowledge

**Seed Rule:** Experiential knowledge requires lifecycle tracking (unverified → testing → verified → failed).

**Application:** Pottery verification is inherently iterative:
- Glazes must be fired to be evaluated
- Pottery results depend on kiln atmosphere (reduction vs oxidation)
- Same recipe in different kilns produces different results

**Issue Found:** The Seed's verification timeline assumes days-to-months, but pottery verification requires:
1. **Multi-week cycles** — clay → dry → bisque fire → glaze → glaze fire → final result (2-4 weeks minimum)
2. **Context-dependent results** — same glaze fires differently in electric vs gas vs wood kiln
3. **Iteration required** — single test is insufficient (need multiple firings to confirm)

**Proposed Modification:**
```yaml
verification-iteration-required: true
verification-cycles-completed: 3
verification-contexts-tested:
  - electric-kiln-oxidation
  - gas-kiln-reduction
expected-verify-when: "After next firing cycle (2-3 weeks)"
verification-status: testing
```

**Test for Pottery Domain:** Can a glaze note be considered "verified" after one successful fire? No — need testing across multiple kiln types and atmospheres.

---

### Rule: Atomicity — Distinguish Conceptual from Procedural

**Seed Rule:** Atomicity applies to ideas, not to executable workflows. Recipes, code, and technical specs must stay together.

**Application:** Pottery notes include:
- Conceptual: glaze chemistry principles, kiln thermodynamics
- Procedural: how to throw a cylinder, loading sequence
- Hybrid: a specific pot design with making instructions

**Issue Found:** Pottery creates tension:
- A "pottery wheel basics" note could grow very large (centering, pulling, shaping, trimming)
- But splitting removes context (you need centering to pull; they're linked)
- A glaze recipe is conceptual (materials) but also procedural (application, firing)
- Specific project tutorials are hybrid by nature

**Proposed Modification:**
```yaml
knowledge-type: conceptual|procedural|hybrid
hybrid-components:
  - conceptual: glaze-chemistry-principles
  - procedural: application-technique
atomicity-decision: "Keep together — context is essential for usability"
size-justification: "Executable workflow — splitting would break usability"
```

**Test for Pottery Domain:** Should "how to make a bowl" be one note or split? Split if principles can transfer (centering applies to all vessels). Keep together if the specific form matters (specific design decisions).

---

### Rule: Diminishing Returns — Skip if Low Utility

**Seed Rule:** Skip if note fails 2+ of: utility, connection, uniqueness, effort.

**Application:** Pottery has many similar techniques:
- Throwing bowls, cups, plates, vases (similar motions, different forms)
- Various trimming techniques
- Different glaze application methods

**Issue Found:** The test assumes knowledge can be evaluated without execution — but in pottery:
- Two similar-looking techniques may produce different results
- Subtle variations matter (pressure, speed, tool angle)
- You often can't assess utility without trying

**Proposed Modification:**
```yaml
execution-uncertainty: high  # similar description, different results possible
test-feasibility: high  # can execute with accessible workspace
verification-requires: kiln-firing  # must fire to evaluate
```

**Test for Pottery Domain:** Capture with `verification-status: unverified` and prioritize testing over passive evaluation. Two bowl-throwing notes might look redundant but produce different results in practice.

---

### Rule: Knowledge Debt — Track Maintenance Burden

**Seed Rule:** Evaluate maintenance burden before capturing volatile knowledge.

**Application:** Pottery knowledge varies in volatility:
- Glaze recipes: stable (formulations don't change often)
- Kiln firing schedules: somewhat stable (but evolve with experience)
- Equipment-specific knowledge: very specific (kiln model, wheel type)
- Trend-based information: volatile (current trends)

**Issue Found:** Pottery has unique debt patterns:
- **Equipment-specific debt** — knowledge tied to specific kiln/wheel models
- **Material-specific debt** — clay bodies from specific manufacturers
- **Context debt** — wood-fired knowledge doesn't apply to electric kilns

**Proposed Modification:**
```yaml
maintenance-burden: low  # stable knowledge
context-dependency: high  # depends on equipment/material type
transferability: "Low — equipment-specific knowledge doesn't transfer"
applicability-scope: "Electric kiln vs gas kiln vs wood-fired are different domains"
```

**Test for Pottery Domain:** A note about "loading a specific model of kiln" has high context debt. Should it be captured? Yes if personalized (your specific setup), no if generic (available in manual).

---

### Rule: Contradiction Handling

**Seed Rule:** Detect and resolve simultaneous contradictions between verified notes.

**Application:** Pottery has many apparent contradictions:
- "Always score and slip when joining clay" vs "Score and slip is optional for hand building"
- "Mid-fire glaze application is best" vs "Apply glaze to bisque for better adhesion"
- "Kiln should be opened when cool" vs "Open kiln slightly while still warm to prevent moisture issues"

**Issue Found:** Many pottery "contradictions" are actually:
1. **Technique-dependent** — what works for wheel doesn't apply to hand building
2. **Material-dependent** — clay body A behaves differently than clay body B
3. **Context-dependent** — electric kiln vs gas kiln vs wood-fired
4. **Style-dependent** — functional pottery vs decorative

**Proposed Modification:**
```yaml
contradiction-status: contextual  # not a real contradiction — different contexts
context-variables:
  - technique: wheel-throwing vs hand-building
  - kiln-type: electric vs gas vs wood-fired
  - clay-body: stoneware vs porcelain vs earthenware
resolution: "Both valid — apply context-specific rule"
```

**Test for Pottery Domain:** Before marking as contradiction, identify context variables. What works in one context may not apply in another.

---

## Rule Refinements for Pottery Domain

### Modified Embodied Knowledge Test

Original test: "Could an AI verify this without physical access?"

Modified for pottery:
```yaml
embodied-component: tactile-kinesthetic
sensory-modes: [tactile, kinesthetic, auditory]
verification-pathway: execution-required
verification-requires: kiln-firing
sensory-anchors: 
  - "Like pressing a ripe avocado — slight give when clay is ready"
  - "Like stretching dough — even resistance, no lumps"
test-question: "Can you learn to wedge clay from text alone?"
```

### Modified Verification Timeline

Original: 30-day verification window

Modified for pottery:
```yaml
verification-cycle: iterative  # requires multiple firings
verification-timeline: 8-weeks  # minimum for one complete cycle
verification-iteration-required: true
minimum-tests-for-verified: 3  # 3+ firings to confirm
```

### Modified Atomicity Guidance

Original: Split if >300 words AND parts are independently reusable

Modified for pottery:
```yaml
split-criteria:
  - "Do principles transfer to other forms? (Yes → split)"
  - "Is specific form/design integral to the knowledge? (Yes → keep)"
  - "Are there reusable techniques vs project-specific steps? (Separate)"
```

---

## Domain-Specific Gap: Sensory Anchors for Pottery

The Seed's embodied knowledge rule asks for sensory anchors but provides limited examples. Pottery needs domain-specific anchors:

**Clay Preparation:**
- "Wedged correctly: no air bubbles, consistent color, smooth texture"
- "Testing readiness: ball springs back slowly when pressed"
- "Leather-hard: retains fingerprint impressions"

**Wheel Throwing:**
- "Centered: clay doesn't wobble when touched"
- "Opening: bottom still at least 1/4 inch thick"
- "Pulling walls: even pressure, no thin spots"

**Glaze Application:**
- "Heavy application: drips form and fall slowly"
- "Light application: looks chalky after drying"
- "Proper consistency: like heavy cream, coats spoon"

**Kiln Firing:**
- "Cone 04 reached: post bends to ~8 o'clock"
- "Kiln ready to open: no red visible, under 200F"
- "Proper cooling: no rapid temperature drops"

---

## Conclusion

Pottery exposes gaps in the Seed's embodied knowledge handling:

1. **Verification timeline** — pottery requires 2-4 week cycles, not days
2. **Context dependency** — knowledge doesn't transfer between kiln types
3. **Sensory anchors** — domain-specific examples needed for tactile knowledge
4. **Contradiction detection** — must account for technique/material/context variables
5. **Atomicity** — hybrid notes (concept+procedure) are common and valid

**Recommended Seed Updates:**
1. Add pottery-specific embodied knowledge examples to sensory anchors
2. Create `verification-iteration-required` field for multi-cycle verification
3. Add `context-variables` field for contradiction detection
4. Update atomicity guidance for craft domains with hybrid notes

## See Also

- [[AI-Assisted Knowledge Management Seed]] — The Seed rules being tested
- [[Frontier Exploration Hub]] — Domain-specific exploration index
- [[Seed Stress Test - Embodied Knowledge Rule]] — Related stress test
- [[Seed Stress Test - Craft Knowledge Bases]] — Cross-domain craft testing
- [[Frontier Exploration - Embodied Knowledge]] — Embodied knowledge handling