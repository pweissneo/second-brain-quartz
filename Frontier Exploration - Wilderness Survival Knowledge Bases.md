---
last-reviewed: 2026-03-17
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
tags:
  - frontier-exploration
  - survival
  - safety-critical
  - environment-specific
  - experiential
---

# Frontier Exploration: Wilderness Survival Knowledge Bases

Testing Seed rules in wilderness survival reveals unique challenges around safety-critical procedural knowledge, environmental specificity, and equipment-dependent techniques.

## Domain Overview

Wilderness survival knowledge bases face unique challenges:
- Safety-critical knowledge where errors can be life-threatening
- Environment-specific knowledge (desert, forest, arctic, mountain, water)
- Equipment-dependent techniques that vary by available gear
- Time-critical decision making under stress
- Experiential knowledge that requires practice to verify
- Conflicting survival philosophies and approaches

---

## 1. Atomicity: Procedural vs. Decision Knowledge

**Seed Rule:** Notes should be 100-300 words; procedural content may exceed if executable.

**Survival Application:**

### Edge Case: Emergency Decision Trees

**Problem:** "What to do when lost" could be:
- A linear procedure (stop, think, observe, plan)
- A decision tree with branches for different scenarios

**Analysis:** Decision trees are inherently branching, not linear. A single note with a decision tree violates atomicity by containing multiple decision paths.

**Solution:** Split decision trees into:
- Hub note: [[Emergency Decision Framework]]
- Leaf notes: [[When to Stay vs. Signal]], [[Water Procurement Priorities]], [[Shelter Type Selection]]

**Test:** For decision-tree notes: (1) Is this one decision node or multiple? (2) Can each branch be a separate actionable note? (3) Are branches linked rather than embedded?

### Edge Case: Environment-Specific Procedures

**Problem:** "How to make fire" has different techniques for:
- Wet conditions (ferro rod, fire plows)
- Dry conditions (bow drill, Flint)
- High altitude (different fuel ignition points)
- Winter (snow insulation techniques)

**Solution:** Create environment-hub notes:
- [[Fire Starting - Forest]]
- [[Fire Starting - Desert]]
- [[Fire Starting - Arctic]]
- Each links to core principle + environment-specific variations

**Test:** Are environment-specific procedures linked from hub notes? Do core principles remain in the main note?

---

## 2. Safety-Critical Threshold

**Seed Rule:** For high-stakes domains, critical knowledge should be exempt from diminishing returns.

**Survival Application:**

### Edge Case: When NOT to Apply Technique

**Problem:** Most survival notes focus on what TO do. But safety-critical knowledge often needs equal emphasis on what NOT to do.

**Example:**
- "Do NOT drink cactus water in desert" (will make dehydration worse)
- "Do NOT build shelter under dead trees in wind" (falling branches)
- "Do NOT eat unknown berries" (poisoning risk)

**Test:** For safety-critical notes: (1) Is there a "what NOT to do" section? (2) Are contra-indications explicit? (3) Is there `safety-warning:` frontmatter?

### Edge Case: Risk Assessment Knowledge

**Problem:** "Cross a river" vs. "Find another way" depends on:
- Water depth and current speed
- Your swimming ability
- Gear availability
- Time of day
- Weather conditions

**Solution:** Add `risk-assessment-required: true` frontmatter for decisions where wrong choice has severe consequences. Include explicit risk factors.

**Test:** For time-critical survival decisions: (1) Is there a risk assessment framework? (2) Are decision thresholds explicit? (3) Is there `decision-urgency:` (critical|important|advisory)?

---

## 3. Equipment Dependency

**Seed Rule:** Notes about tool interactions should track software stack versions.

**Survival Application:**

### Edge Case: Gear-Dependent Techniques

**Problem:** "How to purify water" varies dramatically by available equipment:
- With filter: Use Berkey/Sawyer (follow manufacturer instructions)
- With tablets: Iodine or chlorine dioxide (dose by clarity)
- Boiling: 1 minute rolling boil (3 minutes at altitude)
- UV: SteriPEN (clear vs. turbid water)
- None: Solar disinfection (time-dependent on UV index)

**Solution:** Add `gear-required:` or `gear-optional:` frontmatter. Create gear-specific variant notes linked from general principle.

**Test:** For equipment-dependent procedures: (1) Is gear requirement explicit? (2) Are alternatives linked? (3) Is there `gear-category:` (filter|chemical|heat|uv|none)?

### Edge Case: Improvised Alternatives

**Problem:** "What if you have NO equipment?" is a common survival scenario but is fundamentally different from equipment-based procedures.

**Example:**
- With filter: [[Water Filtration with Commercial Filter]]
- Improvised: [[Water Filtration with Charcoal]], [[Distillation from Container]]

**Solution:** Create separate "improvised" notes for equipment-free alternatives. These are high-value because they apply when all gear is lost.

**Test:** For core survival skills: (1) Is there an improvised alternative note? (2) Are improvised techniques tested separately from equipment techniques? (3) Is there `technique-type: equipment|improvised|both`?

---

## 4. Temporal Knowledge: Seasonal and Weather

**Seed Rule:** Track temporal validity for time-sensitive knowledge.

**Survival Application:**

### Edge Case: Seasonal Technique Changes

**Problem:** The same survival skill changes dramatically by season:
- Shelter: Summer = minimal; Winter = snow cave/insulated
- Water: Summer = evaporation focus; Winter = snow melting
- Fire: Summer = easier; Winter = harder to start, harder to maintain

**Solution:** Add `season:` frontmatter with values: spring|summer|autumn|winter|any. Link seasonal variants from hub.

**Test:** For survival procedures: (1) Is seasonal applicability explicit? (2) Are winter/summer variations documented? (3) Is there `climate-type:` for broader environmental categories?

### Edge Case: Weather-Dependent Decision Making

**Problem:** "Should I stay or move?" depends heavily on:
- Current weather (storm incoming?)
- Time of day (travel in dark?)
- Forecast (will it improve?)

**Solution:** Weather assessment should be explicit decision input. Add `weather-dependent: true` for decisions that change with weather.

**Test:** For movement/decisions: (1) Is weather considered? (2) Are weather assessment procedures linked? (3) Is there `weather-check-required:`?

---

## 5. Experiential Knowledge: "Feel" and Intuition

**Seed Rule:** For experiential domains, include `experiential-component` frontmatter.

**Survival Application:**

### Edge Case: Environmental "Gut Feel"

**Problem:** Experienced survivalists develop intuition:
- "The weather is about to change" (barometric pressure)
- "That water doesn't look right" (contamination intuition)
- "I've been going in circles" (terrain intuition)

**Solution:** Add `experiential-component: intuition` for knowledge that comes from pattern recognition through extensive experience. This differs from kinesthetic (physical) and is more about environmental pattern recognition.

**Test:** For intuition-based knowledge: (1) Is there `experiential-component: intuition`? (2) Are there cues/indicators listed? (3) Is the experience level needed explicit?

### Edge Case: Mental State Under Stress

**Problem:** Survival is 10% physical, 90% mental. Knowledge about managing:
- Panic (breathing techniques, grounding)
- Decision fatigue (prioritization frameworks)
- hopelessness (motivation techniques)

**Solution:** Add psychological survival as a knowledge category. This is experiential because mental techniques require practice.

**Test:** For psychological survival notes: (1) Is there `knowledge-type: psychological`? (2) Are techniques tagged with `experiential-component: mental-practice`? (3) Is there `stress-applicability:` (pre-survival|during|post)?

---

## 6. Conflicting Approaches

**Seed Rule:** When sources contradict, create synthesis notes.

**Survival Application:**

### Edge Case: Competing Survival Philosophies

**Problem:** Different survival schools teach fundamentally different approaches:

| Philosophy | Core Belief | Key Technique |
|------------|-------------|----------------|
| SIT (Survive In Terrain) | Stay put, signal, wait rescue | Fire, shelter, signal |
| F.I.R.S.T. | Find water first | Water procurement priority |
| OW (Outdoor Wilderness) | Travel to civilization | Navigation, movement |
| Primitive | Use only natural materials | Improvised tools only |

**Analysis:** These aren't contradictions (one isn't "wrong") but different philosophies with different assumptions. The Seed rule about competing frameworks applies.

**Solution:** Create philosophy hub notes. Tag knowledge with `survival-philosophy:`. Present alternatives with applicability context.

**Test:** For survival philosophy notes: (1) Are multiple approaches presented? (2) Is there `framework:` tagging? (3) Does each philosophy have explicit assumptions (situation type, available time, goals)?

---

## 7. Source Quality: Credential Verification

**Seed Rule:** Track source quality for knowledge with expertise hierarchies.

**Survival Application:**

| Source Type | Reliability | Example |
|-------------|-------------|---------|
| Military survival training | High | SAS, US Army FM 21-76 |
| Professional guides | High | Wilderness First Responder |
| Published authors | Medium-High | Tom Brown Jr., Mors Kochanski |
| Online content | Variable | YouTube, blogs (variable quality) |
| Forum advice | Low | Reddit, survivalist forums |
| Social media | Very Low | TikTok, Instagram |

**Test:** For survival knowledge: (1) Can you identify source credentials? (2) Is there `source-credentials:` field? (3) Are military/professional sources distinguished from lay sources?

---

## 8. Verification: Testing Dangerous Procedures

**Seed Rule:** For dangerous procedures, use `verification-avoid` frontmatter.

**Survival Application:**

### Edge Case: Verification-Impossible Knowledge

**Problem:** You cannot ethically "test" some survival knowledge:
- Will this shelter actually survive a storm?
- Will this water purification method actually work?
- Will this fire method work in real emergency?

**Solution:** Survival knowledge is primarily source-verified (military manuals, expert authors) rather than execution-verified. Add `verification-type: source-based|execution-impossible` distinction.

**Test:** For safety-critical survival notes: (1) Is verification type explicit? (2) Is it source-based (reputable source) vs. execution-based (tested)? (3) Is there `verification-source-quality:` for source-based verification?

---

## Summary of Edge Cases

| Seed Rule | Edge Case | Solution |
|-----------|-----------|----------|
| Atomicity | Decision trees | Split into hub + leaf notes |
| Atomicity | Environment-specific | Hub + variant pattern |
| Safety-Critical | What NOT to do | Add contra-indication sections |
| Safety-Critical | Risk assessment | Add risk-assessment-required tagging |
| Equipment Dependency | Gear-dependent techniques | Add gear-required frontmatter |
| Equipment Dependency | Improvised alternatives | Create separate improvised notes |
| Temporal | Seasonal changes | Add season frontmatter |
| Temporal | Weather-dependent | Add weather-dependent frontmatter |
| Experiential | Intuition development | Add experiential-component: intuition |
| Experiential | Mental state | Add psychological survival category |
| Competing Frameworks | Survival philosophies | Framework-hub pattern |
| Source Quality | Credentials | Add source-credentials field |
| Verification | Testing dangerous procedures | Source-based verification distinction |

---

## Proposed Seed Refinements

### 1. Safety Warning Section Standard

> **Rule:** For safety-critical procedural knowledge, include an explicit "What NOT to Do" or contra-indications section.
> **Why:** Safety-critical knowledge where errors cause harm needs explicit warnings alongside positive instructions.
> **Test:** For notes tagged safety-critical: (1) Is there a contra-indications section? (2) Are warnings prominent (not buried)? (3) Is there `safety-warning:` frontmatter?

### 2. Risk Assessment Framework

> **Rule:** For decisions with severe consequences, add `risk-assessment-required: true` frontmatter with explicit risk factors.
> **Why:** Some decisions have high stakes where wrong choice has severe consequences. Explicit risk factors enable better decision-making.
> **Test:** For high-stakes decisions: (1) Is risk-assessment-required explicit? (2) Are risk factors enumerated? (3) Is there `decision-urgency:`?

### 3. Equipment Type Tagging

> **Rule:** For technique notes that depend on equipment, add `gear-required:` or `gear-optional:` frontmatter with category.
> **Why:** Same core technique (water purification) has different procedures depending on available gear. Equipment tagging enables relevant retrieval.
> **Test:** For technique notes: (1) Is gear requirement explicit? (2) Are alternatives linked? (3) Is there `gear-category:`?

### 4. Improvised Alternative Pattern

> **Rule:** For core survival/emergency skills, create separate "improvised" notes for equipment-free alternatives.
> **Why:** Improvised techniques are fundamentally different (no equipment = different procedure). They apply when all gear is lost.
> **Test:** For core skills: (1) Is there an improvised variant? (2) Is it clearly distinguished from equipment-based? (3) Is there `technique-type:`?

### 5. Seasonal Applicability

> **Rule:** For procedures that change by season, add `season:` frontmatter with values spring|summer|autumn|winter|any.
> **Why:** Survival techniques vary dramatically by season. Seasonal tagging enables relevant retrieval.
> **Test:** For seasonal procedures: (1) Is season explicit? (2) Are variants linked? (3) Is there `seasonal-variation:`?

### 6. Intuition Knowledge Type

> **Rule:** For knowledge based on pattern recognition through extensive experience (not physical skill), add `experiential-component: intuition`.
> **Why:** Intuition-based knowledge differs from kinesthetic (physical feel) - it's environmental pattern recognition. Different teaching approaches needed.
> **Test:** For intuition notes: (1) Is experiential-component explicit? (2) Are cues/indicators listed? (3) Is experience level needed documented?

### 7. Source-Based Verification Distinction

> **Rule:** For knowledge that cannot be execution-tested, add `verification-type: source-based` with source quality tracking.
> **Why:** Some knowledge (safety-critical, emergency) cannot be ethically tested. Source quality becomes the verification method.
> **Test:** For untestable knowledge: (1) Is verification-type explicit? (2) Is source quality tracked? (3) Is there `source-credentials:`?

### 8. Survival Philosophy Framework

> **Rule:** For domains with competing methodological approaches, apply framework-hub pattern with explicit assumptions documentation.
> **Why:** Survival philosophies (SIT vs. travel, primitive vs. modern) represent different assumptions, not right/wrong. Framework tagging enables appropriate application.
> **Test:** For methodology notes: (1) Is framework explicit? (2) Are assumptions documented? (3) Is applicability context provided?

---

## Related

- [[AI-Assisted Knowledge Management Seed]]
- [[Seed Stress Test - Home Repair Knowledge Base]] — Similar safety-critical knowledge challenges
- [[Seed Stress Test - Sports Coaching Knowledge Base]] — Similar experiential knowledge
- [[Frontier Exploration - Equipment and Tool Dependencies]]
- [[Seed Gap - Recurring and Periodic Knowledge]] — consolidated cyclical knowledge guidance
- [[Frontier Exploration - Expert Heuristics and Rules of Thumb]]
- [[Frontier Exploration - Competing Organizational Structures]]
- [[Stress Test - Verification Status Rule in Home Repair]]
