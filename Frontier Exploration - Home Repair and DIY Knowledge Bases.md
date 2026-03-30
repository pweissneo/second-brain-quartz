---
last-reviewed: 2026-03-23
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - home-repair
  - diy
  - domain-specific
---

# Frontier Exploration - Home Repair and DIY Knowledge Bases

> Exploring gaps in the Seed for knowledge bases about home repair, DIY projects, and maintenance.

## The Domain

Home repair and DIY encompasses plumbing, electrical, carpentry, drywall, painting, flooring, roofing, HVAC, and general maintenance. It's a domain that blends technical knowledge with physical execution, has significant safety implications, and varies heavily by housing type, age, and local codes.

## Apply Current Seed Rules

Testing existing rules against home repair knowledge:

### 1. Atomicity (100-300 words)

**Does it apply?** Partially. Technical procedures (how to replace a toilet) should stay together as executable procedures. But principles (types of pipes, types of drills) can be atomic.

**Edge case found:** Knowledge about tools combines:
- Technical specifications (inherently brief)
- Usage techniques (procedural, longer)  
- Safety considerations (must be complete)
A single "How to Use a Circular Saw" note could be 50 words (just safety) or 2000 words (complete tutorial). The Seed's rule about procedural content staying together handles this, but tool-specific knowledge blur the line.

### 2. 2+ Links Rule

**Does it apply?** Moderately. Tool notes naturally link to: (1) the project they enable, (2) safety considerations, (3) alternative tools. Material notes link to: (1) projects using them, (2) suppliers, (3) related materials.

**Gap found:** Code/regulation notes may only have one natural link (to the project requiring permit). Should "code-compliance" notes be exempt or relaxed?

### 3. 3-Hop Navigation

**Does it apply?** Creates artificial friction.Real structure is: Type (Plumbing) → Specific (Pipes) → Project (Replace P-trap). That's 3 hops just to get to actionable. Adding root = 4 hops minimum.

**Gap found:** The Seed allows domain-specific taxonomies to exceed 3 hops, but home repair's natural hierarchy (trade → material → project) may need explicit recognition.

### 4. Verification

**Major gap found:** "Verified" for home repair means differently:
- Source verification: Is this the correct technique? (check authoritative sources)
- Execution verification: Did it actually fix the problem? (requires doing the work)
- Safety verification: Did it pass inspection? (requires professional)

The Seed's verification workflow doesn't distinguish these. A note about "how to wire a circuit" could be source-verified (matched to code) but not execution-verified (installed correctly).

### 5. 5:1 Personal-to-General Ratio

**Gap found:** General knowledge ("how to fix a leaky faucet") is widely available online. Personal knowledge that's valuable:
- Your specific house's quirks (where pipes run, what brand parts needed)
- Your tool collection and what works
- Your local code requirements
- What you tried that didn't work (and WHY for YOUR situation)

The 5:1 ratio applies but with heavy "context-specific" weighting.

## What the Seed MISSES for Home Repair

### 1. Tool Capability Matrices

**Gap:** No rule for knowledge about what tools can/cannot do. A drill vs. impact driver vs. hammer drill have overlapping but distinct uses. The Seed only covers tool-executable knowledge as a type, not "tool capability mapping."

**Recommendation:** Add rule about tool capability documentation:
```yaml
tool-capability: true
capability-type: primary|secondary|alternative
similar-tools: [other tools that overlap]
safety-constraints: [when NOT to use this tool]
```

### 2. Safety-Critical vs. Cosmetic Distinction

**Gap:** Home repair has clear safety hierarchy:
- Critical (electrical, structural, gas): mistakes can kill
- Moderate (plumbing, HVAC): mistakes cause damage
- Cosmetic (painting, flooring): mistakes are ugly but safe

Seed treats all knowledge similarly. Safety-critical knowledge needs:
- Explicit warning markers
- "Get professional help" guidance for novices
- Multiple source verification preference

**Recommendation:** Add frontmatter:
```yaml
safety-critical: true|false
risk-type: electrical|structural|fire|health|water-damage
professional-recommended: before-attempting|after-failure|never
```

### 3. Permits and Code Compliance Knowledge

**Gap:** No Seed rule for regulatory knowledge. When does a project need a permit? What's inspected vs. not? Code variations by jurisdiction?

This is HIGH-MAINTENANCE knowledge (codes change) + LOW-UTILITY (you look up YOUR jurisdiction, not general rules). The Seed's maintenance burden rule applies but no explicit handling.

**Recommendation:** Add guidance:
- Separate "general code principles" from "specific jurisdiction rules"
- Tag jurisdiction-specific notes with short expiration
- Deduce: "What code says in YOUR area" is personal knowledge worth capturing

### 4. Skill Level Progression

**Gap:** No rule for mapping knowledge by difficulty. Beginner (replace light switch) vs. intermediate (replace outlet) vs. advanced (add circuits) vs. expert (panel work).

This is framework-dependent (one person's "easy" is another's "impossible"), but home repair specifically has defined skill progressions in trade education.

**Recommendation:** Add `difficulty-trades:` field:
- Level 1: Basic tools, simple fixes
- Level 2: Moderate skill, some specialized tools
- Level 3: Advanced skill, specialized tools required
- Level 4: Licensed trades only

### 5. Project Scope Estimation

**Gap:** No rule for knowledge about time/cost estimation. "How long does this take?" "How much does this cost?" is integral to home repair decisions but rarely captured accurately.

Personal experimentation here has high value: YOUR actual time vs. estimated time, YOUR actual cost vs. quoted cost.

**Recommendation:** Add project scope tracking:
```yaml
scope-estimation: true
estimated-hours: number
actual-hours: number
estimated-cost: number
actual-cost: number
```
"Actual vs. estimated" comparison is personalized knowledge worth capturing.

### 6. Material Specifications and Compatibility

**Gap:** No rule for knowledge about what materials work with what. Pipe types (PVC, CPVC, PEX, copper) are not interchangeable. Adhesives, fasteners, sealants all have compatibility matrices.

This is relational knowledge that crosses multiple entities. The Seed's "relational knowledge as first-class content" rule applies but home repair makes heavy use of it.

**Recommendation:** Ensure all material notes include:
```yaml
compatible-materials: [what this connects to]
incompatible-materials: [what to NOT use]
required-connections: [adhesives, fasteners needed]
```

### 7. House-Specific Context Capture

**Gap:** The Seed covers "context-specific knowledge" but home repair has unique context: YOUR house's:
- Age and construction type
- Existing infrastructure (brand, model, condition)
- Previous repairs (what was done before, by whom)
- Known issues (recurring problems, patches)

This is HIGHLY personal, HIGH value knowledge that shouldn't be filtered by the 5:1 rule.

**Recommendation:** Explicitly address "house-specific context" as a category where the ratio inverts - capture aggressively because it's unique to you.

## Test Scenarios for Home Repair Knowledge

### Test 1: "How to Fix a Running Toilet"

Can an AI find this if the vault only has: "Toilet Anatomy", "Common Toilet Problems", "Plumbing Tools"?
- Issue: The actual FIX procedure is procedural and project-specific
- Would need: "Toilet Repair Projects" hub linking to specific fixes
- Gap: No Seed rule explicitly handling "project hub" organization

### Test 2: "Can I do this myself or hire a pro?"

Knowledge needed: skill level + safety criticality + code requirements + legal restrictions
- Current Seed: No rule for decision framework based on these factors
- Gap: No guidance on capturing "when to DIY vs. hire" knowledge

### Test 3: "What do I need for this project?"

Project scope estimation + materials list + tool list + time estimate
- Current:分散 across multiple notes
- Gap: No "project scope note" pattern for aggregating these

## Conclusions

The Seed handles home repair moderately well with existing rules about:
- Infrastructure-dependent domains
- Tool-executable knowledge  
- Experiential verification
- Context-specific knowledge

**Critical additions needed:**
1. Safety-critical classification (not binary, but gradated)
2. Skill level mapping for trades
3. Project scope estimation patterns
4. Permit/code compliance handling (high-maintenance, jurisdiction-specific)
5. Tool capability matrices
6. Explicit "house-specific context" as high-value personal knowledge

This domain would benefit from a Seed Stress Test specifically focused on safety-critical knowledge handling.

---

**See also:**
- [[Seed Stress Test - Safety-Critical Knowledge in Home Repair]]
- [[Frontier Exploration - Trade Skill Knowledge Organization]]
- [[Seed Gap - Project Scope Estimation Knowledge]]
- [[Frontier Exploration Hub]]