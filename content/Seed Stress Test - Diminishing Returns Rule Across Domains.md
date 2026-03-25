---
last-reviewed: 2026-03-20
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
verification-status: verified
tags:
  - seed
  - stress-test
  - diminishing-returns
  - domain-adaptation
---

# Seed Stress Test: Diminishing Returns Rule Across Domains

> Testing the "diminishing returns" rule for note capture across multiple domains.
> Consolidates: Board Game Design, Machine Learning/Data Science, Medical Knowledge Base stress tests.
> Date: 2026-03-20

## Rule Under Test

**Rule:** Use diminishing returns testing before adding notes to existing topics — skip or defer if the note fails 2+ of: utility (improves vault answers), connection (links to 2+ existing naturally), uniqueness (adds new knowledge), effort (maintenance worth value).

**Why:** Notes that don't improve utility, can't connect naturally, duplicate existing content, or require high maintenance for low value bloat the vault without adding proportional value.

**Test:** For the last 5 notes added to a mature topic: Do 3+ pass all four tests?

---

## Domain 1: Medical Knowledge Base

### Analysis

Medical knowledge bases have unique characteristics:
1. **High stakes** - Incorrect knowledge can cause real harm
2. **Rapid evolution** - Guidelines change frequently
3. **Complex dependencies** - Prerequisites matter for understanding
4. **Evidence hierarchy** - Not all knowledge is equal (RCT vs expert opinion)

### Stress Test Questions

#### Does this rule make sense for medicine?

**Yes, with modifications.** The concept is valid, but the threshold should be HIGHER for medical domains:
- Utility is harder to measure (patient outcomes aren't immediately visible)
- Connection is essential (prerequisite chains must be preserved)
- Uniqueness is nuanced (rare conditions matter even if "redundant")
- Effort is high (medical knowledge requires careful verification)

#### Edge Cases in Medical

1. **Rare disease exception:** A note about "Ehlers-Danlos Syndrome" might have low utility (few patients), few connections (niche), low uniqueness (textbook definition available), and high effort (verification). But it's critical for differential diagnosis.

2. **Emergency knowledge:** Notes about emergency protocols (cardiac arrest, anaphylaxis) have low "connection" utility but extremely high actual utility.

3. **Differential diagnosis chains:** Medical knowledge builds in diagnostic sequences. A note about a rare symptom might fail connection tests but be essential for ruling out conditions.

4. **Evidence tier mismatch:** A note citing expert opinion might pass tests but should have lower confidence than one citing RCTs.

5. **Temporal decay:** Medical guidelines expire. A 2015 note might pass tests but be outdated.

---

## Domain 2: Machine Learning / Data Science

### Analysis

ML/DS has unique characteristics:
1. **Temporal utility** - A tutorial on "TensorFlow 1.x" was high utility in 2018, zero utility in 2026
2. **Noisy connections** - ML topics are interconnected but relationships are often weak
3. **Tutorial saturation** - Most concepts have thousands of tutorials online
4. **Framework churn** - ML frameworks appear and disappear rapidly

### Edge Cases in ML/DS

1. **Version-Scoped Knowledge:** A note about "TensorFlow Keras API" passes utility test in 2020, fails in 2024 (PyTorch dominates). The test doesn't account for temporal utility.

2. **The "Universal" Knowledge Trap:** Notes like "Gradient Descent" seem universally useful, but there are 10+ variants. Users usually need ONE specific variant.

3. **Tutorial Saturation:** How many tutorials do you need for "Linear Regression"? At some point, adding another fails the uniqueness test.

4. **Framework Churn:** Theano (deprecated), Caffe (deprecated), CNTK (deprecated), PyTorch (dominant), JAX (growing). Utility is framework-dependent AND time-dependent.

5. **High-stakes domains (Healthcare ML):** Utility is regulated — some knowledge can cause harm if applied incorrectly.

---

## Domain 3: Board Game Design

### Analysis

Board game design is a hybrid domain combining:
1. **Technical mechanics** (probability, game theory) — objectively testable
2. **Creative design** (theme, narrative) — subjective, execution-dependent
3. **Experiential playtesting** — requires actually playing to verify

### Edge Cases in Board Game Design

1. **Mechanic Inspiration Notes:** Notes about "mechanics to explore" may fail all four tests but be essential for creative ideation.

2. **Playtest Feedback Notes:** Highly contextual and often contradictory. A note capturing "Player A loved the combat system, Player B hated it" fails uniqueness but has high value.

3. **Genre-Specific Knowledge:** Strategy advice that works in one genre may be harmful in another.

4. **Player Count Dependency:** "Rush strategies work well" is true in 2-player abstracts but FALSE in 4+ player games.

5. **Skill Tier Dependency:** Strategy that works for beginners often contradicts expert strategy.

---

## Cross-Domain Modifications

### Modified Test for All Domains

1. **Utility Test (modified):**
   - Does this improve vault answers for CURRENT context?
   - Add: Is this for an ACTIVE version/framework (not deprecated)?
   - Add: Does it have `stakes:` (none/low/medium/high)?

2. **Connection Test (modified):**
   - At least 1 link to a directly applicable variant/implementation
   - Distinguish strong connections from weak ones

3. **Uniqueness Test (modified):**
   - Does this add YOUR specific context/perspective/version?
   - General tutorials that exist online = low uniqueness
   - Personal implementation notes = high uniqueness

4. **Effort Test (modified):**
   - Weight by stakes: High-effort + low-stakes = marginal value
   - High-effort + high-stakes = likely valuable

### Override Conditions

Override diminishing returns test if:
- `criticality: high` (life-threatening conditions, safety-critical)
- `rare-condition: true` (even if fail tests, capture for completeness)
- `emergency-protocol: true` (essential for emergency reference)
- `prerequisite: true` (foundational for understanding other notes)
- `design-phase: ideation` (for creative exploration domains)

### Additional Frontmatter Requirements

```yaml
# For temporal/technical domains
version-scope: "2.0+"
framework: [pytorch|tensorflow|jax|...]
framework-status: active|deprecated|legacy
utility-expiry: YYYY-MM  # when utility likely expires
stakes: none|low|medium|high

# For medical/health domains
diagnostic-utility: high|medium|low
rare-condition: true|false
evidence-tier: systematic-review|rct|observational|case-study|expert-opinion
guideline-valid-until: YYYY-MM

# For creative/experiential domains
design-phase: ideation|exploration|development|refinement
knowledge-type: experiential|technical|creative

# For game design
genre-scope: [strategy|party|cooperative|...]
player-count: 2-player|3-4-player|5+-player|any
skill-tier: beginner|intermediate|expert|universal
```

---

## Summary: Domain-Specific Adaptations

| Domain | Key Modification | Override Conditions |
|--------|------------------|---------------------|
| Medical | Higher threshold, evidence tiers | criticality: high, rare-condition: true |
| ML/DS | Version-scope, temporal utility | framework: active, stakes: high |
| Board Games | Phase-aware testing | design-phase: ideation, genre-scope defined |
| General | Context-specific uniqueness | Prerequisites, critical knowledge |

## Conclusion

The diminishing returns rule needs modification across domains:
1. Add temporal dimension to utility (version-scope, utility-expiry)
2. Distinguish strong vs. weak connections
3. Reframe uniqueness as "contextual uniqueness" not "global uniqueness"
4. Weight effort by stakes
5. Handle domain-specific overrides (criticality, rare conditions, design phase)

The core insight remains valid — don't add marginal notes that bloat the vault — but implementation needs domain-specific adaptations.

---
See also:
- [[AI-Assisted Knowledge Management Seed]] (original rule)
- [[Stress Test - Version Scope Rule in Data Science ML]]
- [[Frontier Exploration - AI Model Version Dependencies in Knowledge Bases]]
- [[Frontier Exploration - Knowledge Maintenance]]
- [[Frontier Exploration - Board Game Knowledge Bases]]
