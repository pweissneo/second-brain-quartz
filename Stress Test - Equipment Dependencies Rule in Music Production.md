---
last-reviewed: 2026-03-11
lifecycle: draft
confidence: emerging
tags: [stress-test, equipment-dependencies, music-production, domain-agnostic]
domain: music production
---

# Stress Test: Equipment Dependencies Rule in Music Production

## The Rule Under Test

> **Rule:** Document physical equipment dependencies for procedural knowledge — include what tools are required, which are optional, and what alternatives exist.
> 
> **Test:** For procedural notes (recipes, crafts, repairs, techniques): (1) Is there an `equipment:` field in frontmatter? (2) Does it list required vs. optional tools? (3) Are alternatives documented for optional equipment? (4) For safety-critical equipment, is safety guidance included?

## Domain: Music Production

Music production is an excellent stress test because:
- Equipment ranges from free ( GarageBand) to $100k+ studios
- Many techniques have multiple valid approaches at different price points
- Software is integral but different from physical equipment
- "Safety" includes hearing protection, not just physical injury
- Access to shared spaces (studios, rehearsal rooms) is common

---

## Edge Case 1: Software as Equipment

**Issue:** The rule says "physical equipment," but music production relies heavily on software (DAWs, plugins, virtual instruments).

**Question:** Should software be in a separate `software:` field, included in `equipment:`, or treated differently?

**Analysis:**
- DAW (Digital Audio Workstation) is functionally a tool — you can't produce music without one
- Plugins are consumables — you might need specific plugins for techniques
- Virtual instruments require the software to run them

**Proposed refinement:**
- Create separate `software:` and `equipment:` fields
- Or use `equipment:` for all tools (physical AND software) with a `type: physical|software` sub-field

**Test for AI:** Can an AI agent determine whether this note requires software, physical equipment, or both?

---

## Edge Case 2: Spectrum of Quality

**Issue:** "Required" equipment in music often exists on a quality spectrum.

**Examples:**
- "Record vocals" can use: smartphone → USB microphone ($50) → XLR microphone + interface ($500) → professional studio
- "Mix a track" can be done in: GarageBand (free) → Reaper ($60) → Pro Tools ($30/month)
- "Master a song" can use: free online limiters → iZotope Ozone ($250) → analog mastering chain ($50k+)

**Question:** How should the rule handle "required" when there's a valid spectrum from free to expensive?

**Proposed refinement:**
- Add `min-quality:` or `entry-level-alternative:` to each equipment item
- Distinguish "works acceptably" from "optimal" equipment

**Test for AI:** Can a beginner determine what equipment they can START with, not just what professionals use?

---

## Edge Case 3: Hearing Safety — Non-Physical "Safety"

**Issue:** Music production has safety considerations (hearing damage from loud volumes) that aren't "physical injury" in the traditional sense.

**Examples:**
- "Monitor at loud volumes" requires: hearing protection (earplugs, isolators)
- "Use close-mic'd drums" requires: sound isolation or hearing protection
- "Use certain synthesis techniques" involves: ear fatigue from high frequencies

**Question:** Does the rule's "safety-critical equipment" extend to hearing safety?

**Proposed refinement:**
- Expand safety definition to include "sensory safety" (hearing, vision)
- Add `safety-type: physical | hearing | cumulative` for clarity

**Test for AI:** Can the note warn about non-obvious safety risks?

---

## Edge Case 4: Shared/Communal Equipment

**Issue:** Many music techniques assume you own equipment, but access to shared studios, rehearsal rooms, and gear libraries is common.

**Examples:**
- "Record an orchestra" typically requires: studio access (not ownership)
- "Use a drum kit" might mean: rehearsal space with drums, not personal ownership
- "Cut a vinyl record" requires: vinyl cutting service (not personal equipment)

**Question:** How do we handle "required equipment" when it's about access, not ownership?

**Proposed refinement:**
- Add `ownership: required | access-required | service-required`
- Include `where-to-access:` field for communal resources

**Test for AI:** Can a reader determine whether they need to BUY equipment or just HAVE ACCESS?

---

## Edge Case 5: Skill Level Affects "Required" Equipment

**Issue:** Equipment requirements vary by expertise level.

**Examples:**
- Beginner: "Record guitar" might require: audio interface + microphone + cable
- Intermediate: Same technique might work with: USB microphone only
- Advanced: Might use: high-end mic + preamp + amp modeling software

**Question:** Should equipment requirements be tiered by skill level?

**Proposed refinement:**
- Add `expertise-level: beginner | intermediate | advanced` per equipment item
- Or create separate notes for different skill levels

**Test for AI:** Can a beginner find equipment recommendations appropriate for their level?

---

## Edge Case 6: Geographic Availability

**Issue:** Music equipment availability varies by country/region.

**Examples:**
- "Buy studio gear" — US has Guitar Center, Europe has different chains, developing countries may have limited access
- "Rent professional mics" — availability varies wildly
- "Get equipment repaired" — warranty and service varies by jurisdiction

**Question:** Should equipment notes include geographic availability context?

**Proposed refinement:**
- Add `availability: global | region-specific` 
- Include `regions:` list when known

**Test for AI:** Can a reader in a different region determine if equipment is available to them?

---

## Edge Case 7: Budget Alternatives as Core Knowledge

**Issue:** In some knowledge bases, budget alternatives ARE the main content, not an afterthought.

**Examples:**
- "Home studio on $500" — budget IS the constraint driving all choices
- "Budget microphone techniques" — making cheap equipment sound good is the skill
- "Free DAW workflows" — working with zero budget is a legitimate approach

**Question:** Should budget-focused notes invert the hierarchy, making alternatives the primary focus?

**Proposed refinement:**
- Add `approach: budget-optimized | quality-optimized` as a primary tag
- For budget-focused notes, lead with free/cheap options

**Test for AI:** Can a reader quickly identify whether this note is for budget or quality optimization?

---

## Proposed Rule Refinements

### Revised Test (More Executable by AI)

1. **For any procedural note, can the AI extract:**
   - What physical tools are needed?
   - What software/tools are needed?
   - Which are required vs. optional?
   - What alternatives exist at different price points?
   
2. **For safety-related procedures, can the AI extract:**
   - Physical safety risks
   - Hearing/sensory safety risks
   - Cumulative exposure risks
   
3. **Can the AI determine:**
   - Entry-level alternatives for beginners?
   - Whether ownership or access is required?
   - Geographic applicability?

### Proposed Frontmatter Schema

```yaml
equipment:
  - name: "XLR microphone"
    required: true
    min-quality: "USB microphone (limited)"
    alternatives:
      - "USB microphone (beginner, $50+)"
      - "Rental ($50/day)"
    ownership: required  # or: access-required, service-required
    safety: "None for static recording"
    
software:
  - name: "DAW"
    required: true
    alternatives:
      - "GarageBand (free, Mac only)"
      - "Reaper ($60)"
      - "Audacity (free)"
    expertise-level: beginner
      
availability:
  regions: [global]
  notes: "Most equipment available globally; specific brands may vary"
```

---

## Conclusion

The equipment dependencies rule is valuable but needs refinement for domains like music production where:

1. Software is as critical as hardware
2. Quality spectrum is enormous (free to $100k+)
3. Safety includes hearing (not just physical injury)
4. Access/ownership distinction matters
5. Skill level dramatically changes requirements
6. Geographic availability varies

**Recommendation:** Add sub-fields to the equipment test that address software, quality tiers, safety types, and ownership models. The rule should remain domain-agnostic but the test should prompt for these edge cases.

---

## Related Notes

- [[Frontier Exploration - Equipment and Tool Dependencies]]
- [[AI-Assisted Knowledge Management Seed]] — Original rule
- [[Stress Test - Equipment Dependencies in Woodworking]] — (future, for comparison)
- [[Stress Test - Equipment Dependencies in Auto Repair]] — (future, for safety focus)
