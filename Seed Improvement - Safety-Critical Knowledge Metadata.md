---
last-reviewed: 2026-03-14
lifecycle: active
confidence: emerging
author-type: ai-assisted
tags:
  - seed-improvement
  - safety
  - domain-gaps
---

# Seed Improvement - Safety-Critical Knowledge Metadata

> Adding safety metadata to Seed for domains where missing safety information could cause harm

## Problem

The Seed doesn't distinguish safety-critical knowledge from regular knowledge. In domains like:
- Woodworking (power tools)
- Automotive repair
- Home repair
- Cooking (knife skills, hot oil)
- Chemistry (hazardous materials)
- Medical procedures
- Electrical work

Missing a safety link could cause injury. The current "at least 2 links" rule doesn't capture this urgency.

## Why This Matters

1. **Different urgency level**: Safety knowledge needs explicit linking, not optional discovery
2. **Liability concerns**: In professional domains, missing safety info could create legal exposure
3. **Entry point problem**: Users might enter a topic from any atomic note, missing safety gateway

## Proposed Seed Addition

### Safety Metadata

Add `safety: critical` frontmatter field for notes containing safety-critical information:

```yaml
safety: critical
safety-type: physical|chemical|electrical|biological|radiation
severity: critical|high|medium
mandatory-links:
  - Personal Protective Equipment
  - Emergency Procedures
  - Warning Notes
```

### Link Requirements

**Rule:** Safety-critical notes must have ≥2 incoming links from related tool/technique notes.
- Why: Redundant safety links ensure coverage; users may enter from multiple paths
- Test: For each tool note, does it link to ≥1 safety note? For each safety note, does it have ≥2 incoming links from related tools?

### Gateway Requirements

**Rule:** Create safety gateway notes for each tool category.
- Example: "Table Saw Safety Gateway" → links to all table saw safety notes
- Why: Provides explicit entry point for safety information
- Template:
```yaml
---
safety: gateway
category: woodworking
links-to:
  - Table Saw Safety
  - Sawblade Safety
  - Dust Collection Safety
---
```

## Implementation

1. Add `safety: critical` field to Seed
2. Add link audit rule for safety notes
3. Create safety gateway template
4. Test in high-risk domains (woodworking, automotive, home repair)
5. Add `safety-type` enumeration: physical, chemical, electrical, biological, radiation

## Test Criteria

- [ ] Can you identify all safety-critical notes in a woodworking domain?
- [ ] Does each safety note have ≥2 incoming links from related tools?
- [ ] Is there a safety gateway note for each major tool category?
- [ ] Can an AI agent prioritize safety warnings for new users?

## Related

- [[Seed Stress Test - Woodworking Knowledge Base]]
- [[Seed Stress Test - Craft Knowledge Bases]]
- [[Seed Stress Test - Equipment Dependencies Rule in Automotive Repair]]
- [[Stress Test - Verification Status Rule in Home Repair]]
- [[Frontier Exploration - Equipment and Tool Dependencies]]
