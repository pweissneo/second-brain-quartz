---
last-reviewed: 2026-04-02
last-updated: 2026-04-02
lifecycle: seed-gap
confidence: high
author-type: ai-assisted
knowledge-type: structural
verification-status: verified
gap-status: analyzed
gap-priority: medium
gap-type: seed-missing
discovered: 2026-03-27
gap-source: frontier-exploration
analyzed: 2026-04-02
resolution-approach: automated-monitoring-with-threshold-alerting
tags:
  - seed-gap
  - automation
  - health-monitoring
  - vault-maintenance
---

# Seed Gap - Automated Vault Health Monitoring

## Status: IDENTIFIED (2026-03-27)

## The Gap

The Seed includes rules for:
- Quarterly consistency scans (manual)
- Debt score calculation (formula provided)
- Verification backlog tracking
- Construction phase completion criteria

However, the Seed lacks explicit guidance on **automated health monitoring and alerting** — the ability to run checks automatically, track metrics over time, and alert when thresholds are breached.

## Why This Matters

Manual health checks work for small vaults but fail at scale:
1. **Inconsistent timing** — "quarterly" means different things to different agents
2. **No trend detection** — single snapshots don't show degradation patterns
3. **No alerting** — problems aren't discovered until someone explicitly checks
4. **No baseline** — can't compare health across time periods

The Seed's current approach assumes human-initiated review on regular intervals. For AI-assisted vaults that receive continuous updates, this creates blind spots between manual reviews.

## What's Missing

### Automated Metric Collection
- Orphan rate tracking over time
- Link reciprocity monitoring (incoming vs outgoing links)
- Verification backlog trends
- Debt score history

### Threshold-Based Alerting
- Alert when orphan rate exceeds threshold
- Alert when verification debt crosses limit
- Alert when broken link count spikes
- Alert when average note age exceeds freshness threshold

### Health Dashboard Approach
- Consolidated view of all health metrics
- Historical trend visualization
- Threshold configuration
- Alert history

## Related Existing Notes

- [[Seed Gap - Vault Self-Monitoring and Health Intelligence]] — covers health monitoring but not automated alerting
- [[AI-Assisted Knowledge Management Seed]] — debt score formula (manual calculation)
- [[Graph Maintenance]] — mentions scans but not automation
- [[Best Practice - Regular Review]] — manual review cadence that automation complements
- [[Exportable Rules]] — rules that could be encoded for automated execution
- [[Advanced Pattern Matching]] — pattern detection useful for health anomaly identification

## Proposed Seed Extension

**Rule:** Implement automated vault health monitoring with threshold-based alerting — track key metrics continuously, store historical values, and alert when thresholds are breached.

**Why:** AI-assisted vaults receive continuous updates, making manual periodic checks insufficient. Automated monitoring catches degradation early, enables trend detection, and ensures consistent attention to health metrics regardless of human availability.

**Test:** (1) Can you run health checks on demand? (2) Are metrics stored historically? (3) Do thresholds trigger alerts? (4) Can you configure sensitivity per metric?

**Implementation:**
```yaml
# Health monitoring config
health-metrics:
  orphan-rate:
    threshold: 0.10  # alert when >10%
    check-frequency: weekly
    alert-on-breach: true
  verification-debt:
    threshold: 0.30  # alert when >30%
    check-frequency: daily
    alert-on-breach: true
  broken-links:
    threshold: 5  # alert when >5 broken links
    check-frequency: daily
    alert-on-breach: true
  average-note-age:
    threshold: 90  # days, alert when avg >90
    check-frequency: weekly
    alert-on-breach: false  # warning only

# Health snapshot format
health-snapshot:
  timestamp: 2026-03-27T14:40:00Z
  orphan-rate: 0.08
  verification-debt: 0.22
  broken-links: 2
  average-note-age: 67
  debt-score: 0.18  # calculated per Seed formula
  notes-count: 247
  links-count: 892
```

**Alert channels:**
- Console output for AI agents
- Log entries for audit trails
- Optional: external webhook for critical alerts

**Trend detection:**
- Store weekly snapshots
- Detect degradation: metric worsens 20%+ over 30 days
- Detect improvement: metric improves 20%+ over 30 days

## Integration Point

Add to Seed section on "Graph Maintenance" or create new "Vault Health Automation" section. This extends the manual "run consistency scans quarterly" rule to include automated monitoring between scans.

## Test for Gap Closure

- [ ] Seed includes automated health monitoring guidance
- [ ] Threshold configuration is documented
- [ ] Alert behavior is specified
- [ ] Historical tracking approach is defined
- [ ] Integration with existing debt score formula is clear