---
last-reviewed: 2026-03-21
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
status: probe
tags:
  - frontier-exploration
  - knowledge-quality
  - limitations
  - boundary-knowledge
---

# Frontier Exploration - Known Limitations Documentation

> How should knowledge bases explicitly document the known boundaries, limitations, and applicability constraints of captured knowledge?

## The Problem

The Seed covers confidence levels, verification status, and source quality — but doesn't explicitly address documenting **specific known limitations** of individual notes. An AI building a knowledge base following current rules captures what IS true but rarely documents what might NOT be true, where the knowledge breaks down, or what contextual factors limit applicability.

Example gaps:
- "This technique works but only for wood thicknesses under 1 inch"
- "This formula assumes normal distribution but data is often skewed"
- "This advice applies to US-based companies only"
- "This medication dosage is for adults, not children"

Current Seed rules don't explicitly require capturing these limitations.

## Why This Matters

1. **Prevents misuse**: Knowledge with unstated limitations gets applied in contexts where it fails
2. **Accelerates verification**: Explicit limitations tell you exactly what to test
3. **Improves synthesis**: AI combining notes needs to know constraints
4. **Builds trust**: Users respect explicit acknowledgment of boundaries
5. **Enables refinement**: Known limitations can be tested and narrowed over time

## Current Seed Coverage (Insufficient)

The Seed covers:
- Confidence levels (high/medium/low)
- Verification status
- Applicability scope
- Framework-dependent knowledge
- Context-gated knowledge

But lacks explicit guidance on:
1. When to require limitation documentation
2. What format limitations should take
3. How to balance completeness with acknowledged gaps
4. How limitations interact with confidence levels

## Proposed Rules

### Rule: Document at least one known limitation for every note with actionable knowledge

**Why:** Actionable knowledge (advice, procedures, recommendations) that claims universal applicability when it has boundaries is misleading. Explicit limitation documentation prevents inappropriate application.

**Test:** For notes with prescriptive or procedural content: Can you identify at least one context where this knowledge would NOT apply or would need modification?

**Implementation:**
```yaml
limitations:
  - context: "wood thickness over 1 inch"
    effect: "may cause splitting"
    severity: medium
  - context: "non-US jurisdictions"
    effect: "legal requirements differ"
    severity: high
```

### Rule: Distinguish unknown gaps from known limitations

**Why:** Unknown gaps (things you don't know you don't know) are different from known limitations (things you know but have boundaries). The Seed already addresses unknown unknowns — this rule addresses the known category.

**Test:** Can you separate "we don't know" from "we know this doesn't apply everywhere"?

**Categories:**
- **Known limitations**: Documented boundaries of applicability
- **Hypothesized limitations**: Suspected but unverified boundaries (tag as `confidence: emerging`)
- **Unknown gaps**: Unknown unknowns (covered by existing Seed rules)

### Rule: Use specific boundary values over vague qualifiers

**Why:** "This doesn't work for thick wood" is less useful than "fails for wood over 1 inch thick." Specific boundaries enable testing and precise application.

**Test:** Can limitation contexts be converted to specific thresholds or criteria?

**Example:**
- ✗ "doesn't work for large projects" → vague
- ✓ "fails for projects over 50 hours of work" → specific
- ✗ "not for beginners" → vague  
- ✓ "requires prior experience with compound miter saw" → specific

### Rule: Limitations should be testable when possible

**Why:** The best limitations are those you can verify. "This might not work in humid climates" can be tested by trying in humid climates.

**Test:** Can you design a test to verify whether the limitation holds?

**Tagging:**
```yaml
limitation-status: tested|hypothesized|observed
limitation-evidence: "Description of what observed/expects"
```

### Rule: Update limitations as you learn more

**Why:** Initial limitations may be too broad or too narrow. As you test and learn, refine the boundaries.

**Test:** Do your limitation statements become more specific over time?

**Tracking:**
```yaml
limitation-history:
  - date: 2026-03-21
    scope: "initial"
    limitation: "may not work for hardwoods"
  - date: 2026-04-15
    scope: "refined" 
    limitation: "fails for oak and maple, works for pine"
```

## Edge Cases

### When limitations are unknown
If you genuinely don't know limitations, don't fabricate them. Use `limitations: unknown` and prioritize testing to discover them.

### When limitations are too numerous
Some knowledge has many small limitations. Prioritize the top 3 that are most likely to cause issues or are most frequently asked about.

### When limitations conflict
If one note's limitation contradicts another note's claim, this is a contradiction to resolve, not a limitation to document.

## Test Case: AI Building a Cooking Vault

An AI building a cooking knowledge base with current Seed rules would capture recipes and techniques but might not document:
- "This searing technique creates crust but oils out the fat — not for lean cuts"
- "This fermentation works at room temp but produces different flavors than cold fermentation"
- "This knife skill applies to soft vegetables but risks injury with hard vegetables"

With this rule, the AI would explicitly document these boundaries, making the knowledge more usable and safer.

## Related

- [[AI-Assisted Knowledge Management Seed]] — The Seed this note extends
- [[Confidence Calibration]] — Related to confidence level assignment
- [[Verification Workflow]] — Related to testing knowledge
- [[Context-Gated Knowledge]] — Related to applicability boundaries
- [[Framework-Dependent Knowledge]] — Related to knowing when different approaches apply
