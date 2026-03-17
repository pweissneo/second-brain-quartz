---
last-reviewed: 2026-03-17
lifecycle: active
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - seed-rules
  - conflict-resolution
  - decision-making
---

# Frontier Exploration - Seed Rule Conflict Resolution

## The Gap

The Seed contains 100+ rules covering foundation, atomicity, linking, navigation, quality maintenance, and knowledge processing. However, **there's no explicit guidance on what to do when two Seed rules conflict**. An AI agent following the Seed might encounter situations where:

- Following one rule violates another
- Two rules produce opposite recommendations
- A rule's edge case contradicts a general rule
- Domain-specific needs clash with general guidance

## Real Conflict Examples

### Example 1: Atomicity vs. Completeness
The atomicity rule says "one idea per note, summarizable in one sentence." But the Seed also says procedural content (recipes, code) should stay together if splitting makes it harder to use. A 400-word recipe that is atomic in procedure but violates word count limits creates conflict.

### Example 2: Verification vs. Exploration
The verification ratio rule requires 50% verification within 30 days. But exploration ratio suggests 70% capture for new vaults. In practice, these can conflict when the vault grows faster than verification capacity.

### Example 3: Link Density vs. Quality  
The minimum links rule requires 2+ links OR `foundational: true` OR `specialized: true`. But the "every link explainable" rule says to remove decorative links. A note that barely qualifies with 2 forced links violates the quality rule.

### Example 4: Construction Phase vs. Quality Standards
Relaxed standards during skeleton phase vs. the transition rule requiring orphan rate <20% at 50 notes. What if structural decisions made early compound into violations later?

### Example 5: Confidence vs. Action
The calibration status rule says to verify before high-stakes decisions. But there's no guidance on what confidence level is "good enough" for everyday use.

### Example 6: Diminishing Returns vs. Foundation Building
The diminishing returns test says skip notes with low utility. But foundation building requires capturing prerequisites that have no existing connections (thus low utility by the test).

### Example 7: Tag Limits vs. Rich Metadata
The tag limit (5 tags max) conflicts with rich metadata needs (verification-status, confidence, expertise-level, domain-familiarity, etc.).

### Example 8: Staging vs. Processing Speed
Staging rules allow 48-hour processing. But domain-specific content complexity rule allows 7-14 days for academic papers. What if inbox overflows?

## Proposed Seed Rule

### Rule: Resolve Seed Rule Conflicts Using Explicit Priority Hierarchy

**Why:** Without explicit conflict resolution, AI agents either arbitrarily choose one rule over another or freeze in analysis paralysis. Explicit priority enables consistent decision-making.

**Priority Order (highest to lowest):**

1. **Safety first**: Any rule about harm prevention, liability, or ethical boundaries takes precedence
2. **Verification and accuracy**: Rules about truth, verification, and confidence override speed/convenience
3. **User safety**: Rules protecting users from harmful advice take priority
4. **Domain-specific adaptation**: Edge cases documented in the Seed take precedence over general rules
5. **Construction-phase rules**: During bootstrap, relaxed standards override mature-vault requirements
6. **Quality over quantity**: Rules preventing harm from bad knowledge outweigh rules about vault growth
7. **Consistency**: When in doubt, follow the most recently updated Seed rule (check `last-updated`)

**Test:** For any decision that could follow two Seed rules differently:
1. Can you identify which rules are in tension?
2. Does one rule clearly fall in a higher-priority category?
3. Is there a documented edge case that applies?
4. Can you document your resolution reasoning?

**Implementation:**
```yaml
# When documenting conflict resolution:
conflict-resolution:
  rules-in_tension: ["rule A", "rule B"]
  resolution: "Which won and why"
  priority_applied: "Which priority level ruled"
  reasoning: "Your specific justification"
  seed_reference: "If edge case, cite Seed section"
```

### Rule: Document Unresolvable Conflicts for Seed Improvement

**Why:** Some conflicts may not have clear resolution in the current Seed. These should be documented to improve future Seed versions.

**Test:** 
1. Can you find conflicts you've encountered multiple times?
2. Are they documented with your workaround?
3. Could the Seed be improved to address this?

**Resolution Strategies When Priority Doesn't Help:**

1. **Choose the rule with more specific scope**: A rule mentioning "for vaults >50 notes" beats a general "all vaults" rule
2. **Choose the rule with more recent edge cases**: Recent edge cases indicate active refinement
3. **Default to the safer option**: When in doubt, choose the option that causes less harm if wrong
4. **Escalate to human**: If truly unresolvable, flag for human review
5. **Document and proceed**: Make a reasonable choice, document reasoning, move on

## Edge Cases

### Edge Case: Conflicts Between Domain-Specific Edge Cases
When two edge cases in different domains conflict (e.g., medical knowledge requires higher verification, but experiential knowledge requires testing). Default to: domain with higher stakes > domain with lower stakes.

### Edge Case: Conflict Within the Same Priority Level
When two "safety first" rules conflict (e.g., "include disclaimers" vs. "don't overwhelm with warnings"). Rule: prioritize user comprehension over coverage.

### Edge Case: Conflicts with Human Preferences
When Seed rules conflict with explicit human instructions. Rule: human instructions > Seed rules, but document the deviation.

### Edge Case: Conflicts in New Situations
When a situation has no precedent in the Seed. Rule: apply priority hierarchy to analogous situations, document reasoning, propose Seed improvement.

## Priority Hierarchy Summary

| Priority | Category | Examples |
|----------|----------|----------|
| 1 | Safety/Harm Prevention | `verification-avoid`, disclaimer requirements |
| 2 | Truth/Accuracy | verification-status, confidence markers |
| 3 | User Protection | professional scope, credential requirements |
| 4 | Domain Adaptation | edge cases, construction-phase rules |
| 5 | Bootstrap Flexibility | relaxed standards during construction |
| 6 | Quality Over Growth | link quality > link quantity |
| 7 | Recency | newer Seed rule beats older |

## Test for AI Agents

```
Encountering a Seed rule conflict:
1. Identify the rules in tension
2. Check if one falls in a higher priority category
3. Look for applicable edge cases in the Seed
4. Apply resolution strategy
5. Document your reasoning with frontmatter
6. If truly unresolvable, flag for human review
```

## Related

- [[AI-Assisted Knowledge Management Seed]] - The foundation this builds on
- [[Frontier Exploration - Seed Stress Testing]] - Testing individual rules
- [[Frontier Exploration - Domain-Specific Knowledge Bases]] - Domain adaptation
- [[Frontier Exploration - Construction Phase Knowledge]] - Bootstrap flexibility
