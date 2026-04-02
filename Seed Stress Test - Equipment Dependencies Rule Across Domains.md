---
last-reviewed: 2026-03-17
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
tags:
  - seed-stress-test
  - equipment-dependencies
  - domain-agnostic
  - cross-domain
domain: multiple
---

# Stress Test: Equipment Dependencies Rule Across Domains

## Seed Rule Being Tested

**Rule:** Document physical equipment dependencies for procedural knowledge — include what tools are required, which are optional, and what alternatives exist.

**Why:** Knowledge that requires specific tools to execute is fundamentally different from knowledge prerequisites. Readers need to know upfront what equipment investment is required before committing to learn.

**Test:** For procedural notes (recipes, crafts, repairs, techniques): (1) Is there an `equipment:` field in frontmatter? (2) Does it list required vs. optional tools? (3) Are alternatives documented for optional equipment? (4) For safety-critical equipment, is safety guidance included?

## Why Multiple Domains?

Testing the same rule across different domains reveals different edge cases:
- **Automotive Repair** — Safety-critical, make/model-specific, consumables vs tools
- **Music Production** — Software as equipment, quality spectrum, hearing safety

## Domain 1: Automotive Repair

### Where the Rule Works Well

Automotive repair has clear equipment dependencies:

- "Change Oil" requires: oil filter wrench, drain pan, socket set, funnel — all specific tools
- "Replace Brake Pads" requires: jack, jack stands, lug wrench, C-clamp (for caliper)
- "Replace Spark Plugs" requires: spark plug socket, torque wrench, gap gauge

The rule captures:
- What's required (cannot do the job without)
- What's optional (nice to have but can substitute)
- Safety equipment (jack stands are NOT optional for any under-car work)

### Edge Case 1: Make/Model/Year Specific Equipment

**Problem:** The same procedure requires different tools for different vehicles:

- Oil filter wrench: cup-type for Toyota, strap-type for Chevrolet, special tool for BMW
- Brake caliper bolts: standard socket on most cars, Torx on Ford, hex on some BMWs
- Spark plug access: easy reach on F-150, requires intake removal on some sports cars

A single "Change Oil" note cannot have one `equipment:` list.

**Current Seed doesn't address this:**

Option A: Separate notes per make — "Change Oil (Toyota)", "Change Oil (Ford)"
Option B: One note with conditional equipment — equipment varies by vehicle
Option C: Equipment lists as procedure part, not frontmatter

The rule says equipment should be in frontmatter, but automotive repair requires conditional/vehicle-specific equipment lists.

### Edge Case 2: Tool Quality/Tier Matters

**Problem:** Equipment alternatives aren't equal:

- "Replace brake pads" can use: cheap brake press ($20), professional tool ($150), dealer tool (~$500)
- Results: all work, but cheap tool risks damage, professional is reliable, dealer tool is OEM-approved
- Safety-critical procedures (brakes, steering) have quality minimums, not just alternatives

The rule says "alternatives documented" but doesn't address quality tiers or safety minimums.

### Edge Case 3: Consumables vs Tools

**Problem:** Automotive repair distinguishes:

- **Tools** (owned, reusable): socket set, jack, multimeter
- **Consumables** (purchased per job): oil, brake fluid, filters, brake pads
- **Wear items** (between consumables and parts): belts, hoses

Does "equipment" include consumables? The Seed says "physical equipment dependencies" but automotive procedures require knowing both tools AND materials.

Recommendation: Expand `equipment:` to include:
```yaml
equipment:
  tools:
    - [reusable tools required]
  consumables:
    - [materials consumed per job]
  safety-equipment:
    - [required safety gear]
```

### Edge Case 4: Specialty Tools That Are Job-Specific

**Problem:** Some tools only exist for one job:

- Harmonic balancer puller: only for timing belt / harmonic balancer jobs
- Fuel line disconnect tool: only for fuel system
- Steering wheel puller: only for steering wheel / ignition

These tools are required for specific jobs but useless elsewhere. The vault could have 100+ specialty tools, each for one procedure.

Does every note need to list these? Or should there be a "specialty tools" category that's linked rather than inlined?

### Edge Case 5: Electric vs ICE Vehicle Differences

**Problem:** Rapidly emerging domain:

- Electric vehicles have: high-voltage gloves, insulated tools, EV-specific lifts
- Hybrid vehicles: both ICE and EV considerations
- Procedures that are routine in ICE (oil change) don't exist in EVs
- New procedures in EVs (battery replacement) require entirely different equipment

The Seed has no guidance for rapidly-evolving equipment ecosystems. An `eol-estimate` field exists for software versions — should there be an equivalent for equipment that's becoming obsolete (e.g., catalytic converter tools as EVs eliminate exhaust)?

### Edge Case 6: Garage Setup as Prerequisite

**Problem:** Some automotive knowledge assumes:

- Lift availability (2-post, 4-post)
- Concrete floor (not asphalt, not dirt)
- Electrical access (110V for tools, 220V for welders)
- Space for parts laydown

These aren't tools but are equipment prerequisites. The rule focuses on "tools required" but misses infrastructure requirements.

### Edge Case 7: Safety Equipment Cannot Be Optional

**Problem:** The Seed says "optional equipment" but safety equipment is never optional:

- Eye protection: always required
- Jack stands: always required for under-car work  
- Gloves: required for some (oil) but not others (electrical)
- High-voltage gloves: required ONLY for EV battery work

Safety equipment needs explicit `safety-mandatory: true` marker, not just listing.

## Domain 2: Music Production

### Where the Rule Works

Music production has clear equipment dependencies:
- "Record vocals" requires: microphone, audio interface, DAW
- "Mix a track" requires: DAW, monitors or headphones, MIDI controller (optional)
- "Master a song" requires: DAW, mastering plugins or analog chain

### Edge Case 1: Software as Equipment

The Seed rule says "physical equipment," but music production relies heavily on software (DAWs, plugins, virtual instruments).

- DAW (Digital Audio Workstation) is functionally a tool — you can't produce music without one
- Plugins are consumables — you might need specific plugins for techniques
- Virtual instruments require the software to run them

**Proposed Refinement:** Create separate `software:` and `equipment:` fields, or use `equipment:` for all tools (physical AND software) with a `type: physical|software` sub-field.

**Test for AI:** Can an AI agent determine whether this note requires software, physical equipment, or both?

### Edge Case 2: Quality Spectrum

"Required" equipment in music often exists on a quality spectrum:
- "Record vocals" can use: smartphone → USB microphone ($50) → XLR microphone + interface ($500) → professional studio
- "Mix a track" can be done in: GarageBand (free) → Reaper ($60) → Pro Tools ($30/month)
- "Master a song" can use: free online limiters → iZotope Ozone ($250) → analog mastering chain ($50k+)

**Proposed Refinement:** Add `min-quality:` or `entry-level-alternative:` to each equipment item. Distinguish "works acceptably" from "optimal" equipment.

**Test for AI:** Can a beginner determine what equipment they can START with, not just what professionals use?

### Edge Case 3: Hearing Safety

Non-physical "safety" — hearing damage from loud volumes is a real risk in music production. Should this be captured in equipment dependencies?

### Edge Case 4: Shared Equipment

Access vs. ownership — studios, rehearsal rooms. The rule assumes ownership but many music producers share equipment.

### Edge Case 5: Geographic Availability

Equipment varies by region — some equipment is only available in certain markets.

## Cross-Domain Recommendations

Based on testing across both domains, the equipment dependencies rule needs the following refinements:

### 1. Add Quality-Tier to Equipment Dependencies

```yaml
equipment:
  - tool: Brake press
    tier: minimum|recommended|professional|dealer
    reason: "Cheap tools risk calpter damage"
  - tool: Microphone
    tier: entry-level|prosumer|professional
    entry-level-alternative: "USB microphone"
```

### 2. Distinguish Tools from Consumables

```yaml
equipment:
  tools:
    - [reusable tools required]
  consumables:
    - [materials consumed per job]
  safety-equipment:
    - [required safety gear]
```

### 3. Software as Equipment

For domains where software is critical:

```yaml
software:
  - name: DAW
    required: true
    alternatives: "GarageBand (limited)"
  - name: Plugins
    type: optional|required
```

### 4. Safety Equipment as Separate Required Field

```yaml
safety-equipment:
  mandatory:
    - Safety glasses
    - Jack stands (2 minimum)
    - Hearing protection (music production)
  conditional:
    - High-voltage gloves (EV/electrical work only)
```

### 5. Handle Specialty vs General Tools

- General tools: list in frontmatter (socket set, jack)
- Specialty tools: link to "Specialty Tools Required" hub rather than inlining

### 6. Conditional/Variant Equipment

For make/model/year specific equipment:

```yaml
equipment-conditions:
  - condition: "Vehicle: Toyota"
    tools: [cup-type oil filter wrench]
  - condition: "Vehicle: BMW"
    tools: [special tool BMW-001]
```

## Conclusion

The equipment dependencies rule is valuable but needs refinement for:
1. Quality tiers (entry-level to professional)
2. Consumables vs tools distinction
3. Software as equipment in digital domains
4. Safety equipment as explicitly mandatory
5. Specialty vs general tool handling
6. Conditional equipment for variant-specific knowledge

## Related

- [[Frontier Exploration - Equipment and Tool Dependencies]]
- [[AI-Assisted Knowledge Management Seed]]
- [[Types of Applicability Boundaries]]
- [[Frontier Exploration - User Situational Constraints]]
