---
last-reviewed: 2026-04-01
last-updated: 2026-04-01
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - knowledge-decision
  - utility
  - verification
  - context-change
protected: false
---

# Frontier Exploration: Knowledge Decision Framework

> Unifying three related gaps into one framework: option value (future utility), context triggers (life changes), and verification priority.

## The Problem

The Seed covers gap identification, verification cycles, and knowledge deprecation, but lacks unified guidance on three related decisions:

1. **Option Value**: "Should I capture this that might matter someday?"
2. **Context Validity**: "Does this still apply after my life changed?"
3. **Verification Priority**: "What should I verify first?"

These are distinct but share a common theme: **temporal and priority decisions about knowledge quality**.

## Unified Framework

### 1. Option Value (Future Utility)

**Question**: Is this knowledge potentially valuable under uncertain future conditions?

| Type | Description | Test |
|------|-------------|------|
| Immediate | Solves current needs | Passes standard utility test |
| Potential | Might matter someday | High cost of missing OR (multiple future paths AND cheap capture) |
| Deferred | Will capture later | Note gap, capture when context arrives |

**Frontmatter**:
```yaml
utility-type: immediate|potential|deferred
potential-utility_scenarios:
  - scenario: "Future domain X"
    likelihood: low|medium|high
    timeframe: near|medium|long
potential_cost_of_missing: low|medium|high
capture_urgency: now|when_convenient|defer
```

**Capture rule**: Apply standard diminishing returns to immediate utility; modified test for potential (capture if cost_of_missing = high OR (future_paths >= 2 AND capture_cost = low)).

### 2. Context Validity (Life Changes)

**Question**: Does this knowledge still apply given my current context?

| Context Type | Trigger Examples |
|--------------|------------------|
| Geographic | Move to new city/region/country |
| Professional | Career change, new industry |
| Equipment | New tools acquired, infrastructure upgrade |
| Personal | Relationship status, family, health |
| Temporal | Age milestones, annual reviews |

**Frontmatter**:
```yaml
context-dependent: true
context-type: geographic|professional|equipment|personal|temporal
context-validity:
  previous-context: "description of old context"
  current-context: "description of new context"
  applicability-changed: true|false
context-change-trigger: "What change prompted review"
last-context-audit: 2026-04-01
```

**Audit rule**: Conduct context-change audit within 30 days of major life changes. Tag affected notes with `applicability-changed: true`.

### 3. Verification Priority (Limited Resources)

**Question**: Given finite verification effort, what should I verify first?

**Priority Hierarchy**:

| Level | Type | Description | Examples |
|-------|------|-------------|----------|
| 1 | Safety-Critical | Could cause harm if wrong | Medical, safety, legal, financial |
| 2 | Decision-Critical | Errors propagate widely | Hub notes, core principles |
| 3 | Frequently-Referenced | High traffic, outsized impact | Entry points, common searches |
| 4 | Expensive-to-Verify | Cost exceeds value | Long-horizon, specific conditions |

**Frontmatter**:
```yaml
verification-priority: critical|high|medium|low
criticality: high  # for safety-critical
```

**ROI Calculation**:
```
ROI = (impact × confidence_change) / verification_cost
impact = backlinks + search_frequency + criticality_weight
```

## How They Interrelate

```
┌─────────────────────────────────────┐
│         Knowledge Decision         │
├─────────────────────────────────────┤
│  Option Value ──► Capture Priority │
│  Context Validity ──► Review Timing│
│  Verification Priority ──► Verify   │
└─────────────────────────────────────┘
```

- **Option value** determines capture urgency
- **Context validity** determines when to re-assess
- **Verification priority** determines which to verify

All three use similar metadata structure and could be evaluated together in audits.

## Unified Test

For any note, can you answer all three?
1. **Utility**: Is this immediate, potential, or deferred utility?
2. **Context**: Does it depend on specific context that could change?
3. **Priority**: What's its verification priority level?

## Proposed Seed Rules

### Rule: Tag knowledge with decision metadata

Apply frontmatter from all three dimensions to enable AI decision-making:

```yaml
utility-type: immediate|potential|deferred
context-dependent: true|false
context-type: geographic|professional|equipment|personal|temporal
verification-priority: critical|high|medium|low
criticality: high  # if safety-critical
```

**Test**: Can you categorize any note by all three dimensions?

### Rule: Apply tiered capture strategy

- **Immediate utility**: Apply standard diminishing returns
- **Potential utility**: Modified test (high cost of missing OR multi-path)
- **Deferred utility**: Create gap note, defer capture

### Rule: Conduct context-change audits

When major life changes occur, audit vault within 30 days:
1. Identify affected context-type
2. Re-assess applicability
3. Archive obsolete, create new

### Rule: Prioritize verification by ROI

Verify in priority order (1→4), calculate ROI to optimize finite effort.

## Related

- [[Frontier Exploration - Knowledge Option Value]] (original)
- [[Frontier Exploration - Knowledge Re-Evaluation Triggers]] (original)
- [[Frontier Exploration - Verification Hierarchy]] (original)
- [[AI-Assisted Knowledge Management Seed]] — integration target

---

*Merged from three related frontier explorations during 2026-04-01 heartbeat*