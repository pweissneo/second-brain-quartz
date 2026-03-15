---
last-reviewed: 2026-03-14
lifecycle: active
confidence: emerging
author-type: ai-assisted
tags:
- seed-stress-test
- automotive-domain
- equipment-dependencies
level: pattern
---

# Stress Test: Equipment Dependencies Rule in Automotive Repair

## Seed Rule Being Tested

**Rule:** Document physical equipment dependencies for procedural knowledge — include what tools are required, which are optional, and what alternatives exist.

**Why:** Knowledge that requires specific tools to execute is fundamentally different from knowledge prerequisites. Readers need to know upfront what equipment investment is required before committing to learn.

**Test:** For procedural notes (recipes, crafts, repairs, techniques): (1) Is there an `equipment:` field in frontmatter? (2) Does it list required vs. optional tools? (3) Are alternatives documented for optional equipment? (4) For safety-critical equipment, is safety guidance included?

## Application to Automotive Repair Knowledge Base

### Where the Rule Works Well

Automotive repair has clear equipment dependencies:

- "Change Oil" requires: oil filter wrench, drain pan, socket set, funnel — all specific tools
- "Replace Brake Pairs" requires: jack, jack stands, lug wrench, C-clamp (for caliper)
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
- gloves: required for some (oil) but not others (electrical)
- High-voltage gloves: required ONLY for EV battery work

Safety equipment needs explicit `safety-mandatory: true` marker, not just listing.

### Recommendations for Seed Refinement

1. **Add quality-tier to equipment dependencies:**
   ```yaml
   equipment:
     - tool: Brake press
       tier: minimum|recommended|professional|dealer
       reason: "Cheap tools risk caliper damage"
   ```

2. **Add vehicle-scope for automotive:**
   ```yaml
   vehicle-scope:
     make: [Toyota, Honda]
     year: [2015-2022]
     model: [Camry, Accord]
   ```

3. **Distinguish tools from consumables:**
   ```yaml
   consumables:
     - Oil (5W-30, 5 quarts)
     - Oil filter (Toyota 15670-37010)
   ```

4. **Add safety-equipment as separate required field:**
   ```yaml
   safety-equipment:
     mandatory:
       - Safety glasses
       - Jack stands (2 minimum)
     conditional:
       - High-voltage gloves (EV work only)
   ```

5. **Address specialty vs general tools:**
   - General tools: list in frontmatter (socket set, jack)
   - Specialty tools: link to "Specialty Tools Required" hub rather than inlining 50+ items

## Related

- [[Frontier Exploration - Equipment and Tool Dependencies]]
- [[Stress Test - Equipment Dependencies Rule in Music Production]]
- [[Types of Applicability Boundaries]]
- [[Frontier Exploration - User Situational Constraints]]
- [[Seed Stress Test - Experiential Knowledge Rule (Cross-Domain Analysis)]]
