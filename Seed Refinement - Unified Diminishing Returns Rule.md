---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-03-29
lifecycle: evergreen
confidence: high
tags:
  - seed
  - refinement
  - diminishing-returns
  - stakes
  - override-conditions
  - domain-adaptation
---

# Seed Refinement: Diminishing Returns Rule - Unified Treatment

> Consolidates findings from: Seed Stress Test - Diminishing Returns Rule Across Domains, Edge case stress test 2026-03-25 (personal finance), Edge case stress test 2026-03-16 (experiential domains), Edge case stress test 2026-03-17 (game design), Inverse authority rule (stakes-category).
> Date: 2026-03-29
> Integration target: [[AI-Assisted Knowledge Management Seed]] - Diminishing Returns Rule

## Consolidated Findings

### 1. Stakes-Aware Threshold System

The rule's high/low dichotomy misses "medium-stakes" domains. The inverse authority stress test introduced `stakes-category: high|medium|low` but didn't integrate it into the diminishing returns rule.

**Current gap:** The diminishing returns rule says "High-stakes knowledge with high effort = valuable even if redundant" but doesn't specify how to determine stakes, what "high stakes" means, or how medium stakes fits in.

**Proposed enhanced rule:**

**Stakes-aware diminishing returns test:** Apply different test strictness based on `stakes-category`:
- **High-stakes (medical, legal, safety, financial):** Override test if note is `criticality: high` OR `rare-condition: true` — capture even if failing 2+ tests. Require explicit `stakes-category: high` frontmatter.
- **Medium-stakes (personal finance, career, education):** Require stronger evidence for bypass — must have `expertise-evidence` AND pass at least 2 of 4 tests. Include track record, experience years, or verifiable outcomes.
- **Low-stakes (hobbies, leisure, exploration):** Apply full standard test — fail 2+ = defer.

**Stakes determination criteria:**
```yaml
stakes-category: high|medium|low
stakes-criteria:
  impact-magnitude: "What is the scale of potential harm/gain?"
  reversibility: "Can the outcome be reversed if wrong?"
  time-horizon: "When will consequences manifest?"
  social-consequences: "Are there relationship/reputation impacts?"
```

**Evidence requirements by stakes:**
- **High-stakes override:** Requires `criticality: high` OR `rare-condition: true` only
- **Medium-stakes override:** Requires both evidence AND 2+ test passes
  ```yaml
  expertise-evidence:
    track-record-years: 10
    relevant-outcomes: verified
    domain-credentials: confirmed
  ```
- **Low-stakes:** Full standard test

### 2. Override Conditions Need Expansion

The current override conditions don't cover all critical cases.

**Current overrides:** criticality: high, rare-condition: true, prerequisite: true, design-phase: ideation

**Missing critical overrides:**
- `emergency-protocol: true` — Notes about life-threatening emergencies (cardiac arrest, anaphylaxis, fire evacuation) have high utility but naturally low connection scores
- `asymmetric-consequence: true` — Knowledge where failure is catastrophic but success is unremarkable (powerful but dangerous tools)
- `foundational-prerequisite: true` — Concepts needed to understand multiple other domains (mathematical foundations, language grammar)

**Proposed expanded override conditions:**
```yaml
# Bypass diminishing returns test when ANY of these are true:
override-conditions:
  criticality: high  # safety-critical, life-threatening conditions
  rare-condition: true  # niche knowledge essential for completeness
  emergency-protocol: true  # life-threatening emergency procedures
  prerequisite: true  # foundational for understanding other notes
  foundational-prerequisite: true  # unlocks multiple domains
  asymmetric-consequence: true  # catastrophic failure possible
  design-phase: ideation  # creative exploration needs divergent capture
```

### 3. Temporal Domain Handling Is Fragmented

The stress test found that the "Enhanced test (temporal-aware domains)" section isn't prominently integrated. Notes about deprecated frameworks pass the test in the wrong time period.

**Problem:** The enhanced test is listed as a separate section rather than integrated into the main test. This means AI agents may apply the standard test first and only fall back to temporal checks if they remember to.

**Proposed integration:** Move temporal checks into the main test structure:

**Unified diminishing returns test:**
1. **Utility** — Does this improve vault answers?
   - (For temporal domains) Is this for an ACTIVE version/framework?
   - (For temporal domains) Does it have temporal validity markers?
2. **Connection** — Does it link to 2+ existing notes?
   - (For strong connections) At least 1 link to directly applicable variant/implementation (not just background links)
3. **Uniqueness** — Does it add new knowledge?
   - (For all domains) Is uniqueness assessed against YOUR specific context, not global availability?
   - (For technical domains) If a tutorial exists in 10+ places online and this adds no personal context = low uniqueness
4. **Effort** — Is maintenance worth value?
   - (For temporal domains) Weight effort by maintenance-burden AND utility-expiry

### 4. Experiential Domain Execution Uncertainty

The 2026-03-16 stress test found that experiential domains (cooking, crafts, music) have a fundamental problem: you often cannot assess utility without execution.

**Current gap:** The rule says "skip or defer if note fails 2+ of utility/connection/uniqueness/effort" but for experiential domains, a note can fail utility tests on paper yet be transformative in practice.

**Proposed enhancement for experiential domains:**
```yaml
# For notes in experiential domains (cooking, crafts, music, physical skills)
execution-uncertainty: high|medium|low
```

**Modified test for high execution-uncertainty domains:**
- Apply modified test: (1) Can I actually test this? (execution feasibility), (2) Might the outcome differ despite similar description? (execution uncertainty), (3) Do I need hands-on experience to judge value?
- If yes to 2-3: capture with `verification-status: unverified` AND `verification-modality: practice-required`
- Prioritize testing over passive expansion — the note enters the testing pipeline, not the rejection pile

**Verification pipeline for experiential notes:**
- `verification-status: unverified` → capture, defer judgment
- `verification-status: testing` → actively practicing/ experimenting
- `verification-status: verified` → tested 2+ times with consistent results
- `verification-status: failed` → tested but didn't work (valuable!)

### 5. Version and Framework Dependency

The stress test found that knowledge about deprecated frameworks (Theano, Caffe, TensorFlow 1.x) passes the test at the wrong time.

**Proposed:** Add explicit version-scope and framework-status tracking to the rule:

```yaml
# Required frontmatter for technical/version-sensitive domains
version-scope: "2.0+"  # Version range this note applies to
framework: [pytorch|tensorflow|jax|...]
framework-status: active|deprecated|legacy
utility-expiry: YYYY-MM  # When utility likely expires
```

**Deprecation integration:** Notes with `framework-status: deprecated` should automatically fail the utility test (they improve vault answers only if the user is working with deprecated systems, which should be rare).

### 6. Role-Dependent Utility

The stress test found that utility is often role-dependent. A note about "Ehlers-Danlos Syndrome" has high utility for a rheumatologist, low utility for a GP.

**Proposed enhancement:**
```yaml
applicability-role: [medical-specialist|gamer|craftsman|...]
role-utility:
  medical-specialist: high
  general-practitioner: medium
  patient: low
```

**Rule:** In role-dependent domains, assess utility against the PRIMARY intended audience, not all possible readers.

---

## Proposed Rule Replacement

Replace the current diminishing returns rule section with this unified version:

**Rule:** Use diminishing returns testing before adding notes to existing topics — apply stakes-aware thresholds, use override conditions for critical knowledge, and handle temporal/experiential domains with domain-appropriate tests.

**Why:** Notes that don't improve utility, can't connect naturally, duplicate existing content, or require high maintenance for low value bloat the vault without adding proportional value. But different domains have different stakes, different temporal sensitivity, and different execution uncertainty — a one-size-fits-all test fails across domain boundaries.

**Test:** For the last 5 notes added to a mature topic, do 3+ pass?

**Stakes-aware test:** Apply different threshold strictness based on `stakes-category`:
- **High-stakes:** Override test if any override condition is true; otherwise pass 3+ tests
- **Medium-stakes:** Pass at least 2 tests AND have expertise evidence; override requires both
- **Low-stakes:** Pass 3+ tests (standard threshold)

**Override conditions (bypass test if any true):**
- `criticality: high` — safety-critical, life-threatening conditions
- `rare-condition: true` — niche knowledge essential for completeness
- `emergency-protocol: true` — life-threatening emergency procedures
- `prerequisite: true` — foundational for understanding other notes
- `foundational-prerequisite: true` — unlocks multiple domains
- `asymmetric-consequence: true` — catastrophic failure possible
- `design-phase: ideation` — creative exploration needs divergent capture

**Domain-specific adaptations:**

*Temporal-aware domains (software, rapidly-evolving fields):*
- Check: Is this for an ACTIVE version/framework?
- Check: Does it have temporal validity markers?
- Deprecation auto-fails utility test

*Experiential domains (cooking, crafts, music, physical skills):*
- If execution-uncertainty is high: capture with `verification-status: unverified`, prioritize testing
- Don't reject based on paper assessment when hands-on execution may reveal value

*Role-dependent domains (medical, specialized professions):*
- Assess utility against primary intended audience
- Use `applicability-role:` frontmatter

**Stakes-criteria for classification:**
```yaml
stakes-category: high|medium|low
stakes-criteria:
  impact-magnitude: "Scale of potential harm/gain"
  reversibility: "Can outcome be reversed if wrong?"
  time-horizon: "When will consequences manifest?"
  social-consequences: "Relationship/reputation impacts?"
```

**Evidence requirements:**
- High-stakes override: `criticality: high` OR `rare-condition: true`
- Medium-stakes override: 2+ test passes AND expertise-evidence
- Low-stakes: 3+ test passes (standard)

---

## Implementation Checklist

When capturing a note to an existing topic:
- [ ] Determine `stakes-category: high|medium|low`
- [ ] Check override conditions (any true = bypass test)
- [ ] Apply stakes-appropriate threshold
- [ ] For temporal domains: verify framework-status and version-scope
- [ ] For experiential domains: set verification-modality and enter testing pipeline
- [ ] For role-dependent domains: set applicability-role

---

## Changes to Seed

This refinement would replace/update:
1. The "Enhanced test (temporal-aware domains)" section — integrate into main test
2. The "Override conditions" section — expand with emergency-protocol, foundational-prerequisite, asymmetric-consequence
3. Add stakes-category integration throughout the rule
4. Add execution-uncertainty handling for experiential domains

---
See also:
- [[AI-Assisted Knowledge Management Seed]] (target for integration)
- [[Seed Stress Test - Diminishing Returns Rule Across Domains]] (source document)
- [[Seed Stress Test - Inverse Authority Rule in Personal Finance]] (stakes-category origin)
- [[Edge case stress test 2026-03-16]] (experiential domain findings)
- [[Frontier Exploration - Knowledge Maintenance]] (temporal domain guidance)