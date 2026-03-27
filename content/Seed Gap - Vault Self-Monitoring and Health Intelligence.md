---
last-reviewed: 2026-03-26
last-updated: 2026-03-26
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
gap-status: identified
gap-priority: medium
gap-type: seed-missing
discovered: 2026-03-26
gap-source: frontier-exploration
tags:
  - seed-gap
  - vault-self-monitoring
  - health-metrics
  - self-improvement
---

# Seed Gap - Vault Self-Monitoring and Health Intelligence

## The Gap

The Seed contains scattered health-related concepts but lacks a unified framework for **vault self-monitoring** — the ability for a knowledge base to track, assess, and report on its own health state programmatically. The vault cannot answer questions like "How healthy is my vault right now?" or "What are the top 3 risks to vault quality?"

## Observed Issues

1. **Scattered metrics, no unified system**: The Seed mentions verification ratio, orphan rate, schema stability, recovery effort, but these are individual concepts not organized into a coherent health monitoring system.

2. **No health state classification**: The vault cannot classify itself as "healthy," "at-risk," "degraded," or "critical" based on composite metrics.

3. **No risk identification**: The vault cannot programmatically identify its top risks (e.g., "verification backlog is 45%," "3 notes have been stale >90 days").

4. **No health trend tracking**: No way to answer "is my vault getting healthier or less healthy over time?"

5. **Threshold ambiguity**: When IS orphan rate "too high"? When IS verification ratio "too low"? The Seed provides some thresholds but not a comprehensive system.

## What the Seed Currently Covers

### Health-Related Concepts (Scattered)

1. **Verification Ratio**: "A healthy vault verifies at least 50% of new captures within 30 days"
   - Threshold: ≥0.5 (50%)
   - Edge case for new vaults: ≥0.3 (30%)

2. **Verification Ceiling**: "When unverified notes exceed 40%, pause exploration"
   - Threshold: <40% unverified

3. **Orphan Rate**: From structural health rules
   - Healthy: <10% orphans
   - Critical: >30% orphans

4. **Construction Phase Thresholds**:
   - Skeleton phase: orphan rate tracked
   - Transition criteria: orphan rate <20%, hub coverage ≥80%

5. **Quality Debt Indicators**:
   - Verification ratio <20% for 6+ months
   - Debt score >0.50
   - >50% stale (>90 days since review)

6. **Recovery Effort Calculation**: Sum of 5 symptom categories
   - Structural rot, schema collapse, quality debt, purpose drift, technology lock-in

7. **Schema Stability**: "60+ days" for stable schema

8. **Compliance Score**: ">85%" mentioned for construction completion

## What's Missing

### 1. Unified Health Monitoring Framework

No single source that aggregates all health metrics into an answerable "How healthy is my vault?" question.

### 2. Health State Classification

No explicit states like:
- **Excellent**: All metrics within healthy ranges
- **Healthy**: Minor issues, no critical concerns
- **At-Risk**: Some metrics approaching threshold
- **Degraded**: Multiple metrics below threshold
- **Critical**: Requires immediate intervention

### 3. Risk Prioritization

No system to rank what's most urgent. If orphan rate is 25% AND verification ratio is 35%, which should be addressed first?

### 4. Health Trend Analysis

No tracking of health over time (weekly/monthly snapshots) to detect improvement or degradation.

### 5. Automated Health Reporting

No way to generate a "vault health report" on demand.

### 6. Alert Thresholds

No clear triggers for when the vault should "alert" (similar to how HEARTBEAT.md monitors itself).

## Proposed Seed Rules

### Rule: Implement vault self-monitoring framework

**Why:** Without programmatic health monitoring, vault health is assessed manually and inconsistently. A self-monitoring framework enables automated health checks, trend analysis, and early warning for degradation.

**Test:** Can you answer these questions programmatically?
1. What is my current health state (excellent/healthy/at-risk/degraded/critical)?
2. What are the top 3 risks to vault quality?
3. Has my vault improved, stayed the same, or degraded over the last 30 days?
4. Which metrics are approaching threshold vs. in healthy range?

**Implementation:**
Create a Vault Health Dashboard note that tracks:
```yaml
health-metrics:
  verification-ratio:
    current: 0.52
    threshold: 0.50
    status: healthy
  orphan-rate:
    current: 0.08
    threshold: 0.10
    status: healthy
  unverified-backlog:
    current: 0.32
    threshold: 0.40
    status: at-risk
  stale-notes:
    current: 0.15
    threshold: 0.20
    status: healthy
  schema-stability-days: 120
  compliance-score: 0.89

health-state: healthy
risks:
  - metric: unverified-backlog
    severity: medium
    recommendation: "Pause exploration until ratio recovers"
trends:
  last-30-days: stable
  last-90-days: improving
```

### Rule: Define health state thresholds

**Why:** Ambiguous health states lead to inaction. Explicit thresholds enable consistent health classification.

**Test:** For each metric, can you state the threshold values that determine health state?

**Health State Classification:**
- **Excellent**: All critical metrics at optimal range
- **Healthy**: All metrics within acceptable range
- **At-Risk**: 1+ metrics approaching threshold
- **Degraded**: 1+ metrics below threshold
- **Critical**: Multiple critical metrics severely degraded

**Critical Metrics:**
1. Verification ratio (target ≥0.5)
2. Unverified backlog (target <0.4)
3. Orphan rate (target <0.1)
4. Purpose alignment (target >0.8)

### Rule: Track health trends over time

**Why:** Snapshot health is insufficient — trends reveal whether interventions are working.

**Test:** Can you show a health timeline for the last 90 days? Is the vault getting healthier or less healthy?

**Implementation:** Monthly health snapshots stored in a Health History note or dedicated JSON tracking.

### Rule: Generate health alerts when critical thresholds crossed

**Why:** Vault degradation can happen gradually. Alerts ensure timely intervention.

**Test:** When verification ratio drops below 0.4, does the vault generate an alert?

**Alert triggers:**
- Verification ratio <0.4
- Unverified backlog >0.45
- Orphan rate >0.2
- Stale notes >0.3

## Relationship to Existing Seed Rules

- Complements: Verification ratio rules (health indicator)
- Complements: Orphan rate detection (structural health)
- Complements: Schema review quarterly (stability tracking)
- Complements: Self-Improvement Cycle (overall vault improvement)
- Distinct from: Note-level quality metrics (individual note health)

## Edge Cases

### Edge Case: New Vault Health Assessment

Health frameworks assume mature vaults. For vaults <50 notes, thresholds should be adjusted:
- Verification ratio: ≥0.3 (lower during bootstrap)
- Orphan rate: <0.2 (relaxed during construction)
- Use `construction-phase` to determine which thresholds apply

### Edge Case: Domain-Specific Health

High-stakes domains (medical, legal) need stricter health thresholds:
- Verification ratio: ≥0.7 (vs 0.5 standard)
- Unverified backlog: <0.25 (vs 0.4 standard)

### Edge Case: Health vs. Growth Trade-off

Sometimes health metrics suffer because vault is growing fast. Health framework should track:
- Is growth rate causing health degradation?
- Is the trade-off intentional (temporary growth phase)?

### Edge Case: Multiple Vault Health

For multi-vault architectures, need per-vault and aggregate health:
- Each vault has its own health state
- Portfolio-level health aggregates vault health states

## Test for Gap Closure

Can you:
1. Generate a vault health report on demand?
2. Classify vault state as excellent/healthy/at-risk/degraded/critical?
3. Identify top 3 risks to vault quality?
4. Track health trends over time?
5. Receive alerts when critical thresholds crossed?

If yes to all 5, the gap is closed.

## Related Notes

- [[Self-Improvement Cycle]]
- [[Seed Rule - Vault Growth Velocity]]
- [[Seed Rule - Verification Ratio]]
- [[Structural Health]]
- [[Frontier Exploration - Vault-Level Pattern Discovery]]

---

**Note discovered during:** FRONTIER_EXPLORATION heartbeat (2026-03-26)